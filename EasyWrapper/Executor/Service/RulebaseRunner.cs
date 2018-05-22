using NLog;
using OPAWrapperLIB;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Xml;
using System.Xml.Linq;

namespace EasyWrapper.Executor.Service
{
    public class RulebaseRunner : IRunRulebases
    {
        private string _yearPath;
        private string _versionPath;
        private string _intraCon;
        private string _loggingCon;
        private string _rulebaseName;
        private XDocument _rulebaseXml;
        private Action<string> _log;
        private Action<string> _handler;
        private static Logger _logger = LogManager.GetCurrentClassLogger();
        private int _commandTimeout;

        private void log(string msg)
        {
            _log?.Invoke(msg);
            _logger.Info(msg);
        }

        private void handleError(Exception ex, string command)
        {
            var msg = $"Source: {ex.Source}; Target: {ex.TargetSite}; Message: {ex.Message}; Command: {command}";
            _handler?.Invoke(msg);
            _logger.Error(msg);
            _logger.Error($"Stack Trace: {ex.StackTrace}");
        }

        public static string detokenise(string tokenString)
        {
            var settings = XDocument.Load(Path.Combine(AppContext.BaseDirectory, "config.xml"));
            string detoken = tokenString
                .Replace("$(IntrajobDatabase)", "Intrajob")
                .Replace("${dcft.runmode}", "false")
                .Replace("$(FromILRSchema)", "dbo");

            foreach (var token in settings.Descendants("databaseAlias"))
            {
                detoken = detoken.Replace(token.Attribute("alias").Value, token.Attribute("name").Value);
                detoken = detoken.Replace(token.Attribute("schemaAlias").Value, token.Attribute("schemaName").Value);
            }

            return detoken;
        }

        private void preRun()
        {
            log($"creating {_rulebaseName} specific stored procs");
            var thisBatch = string.Empty;
            try
            {
                var procsFile = detokenise(File.ReadAllText(Path.Combine(_versionPath, _rulebaseXml.Root.Attribute("createProcedures").Value)));
                var procBatches = procsFile.Split(new string[] { "\r\ngo", "\r\nGO", "go\r\n", "GO\r\n" }, StringSplitOptions.RemoveEmptyEntries)
                    .ToList();

                using (var conn = new SqlConnection(_intraCon))
                {
                    conn.Open();

                    using (var cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;

                        procBatches
                            .ForEach(x =>
                            {
                                thisBatch = x;
                                log($" executing {thisBatch}");
                                cmd.CommandText = thisBatch;
                                cmd.CommandTimeout = _commandTimeout;
                                cmd.ExecuteNonQuery();
                            });
                    }

                    log($"{_rulebaseName} specific stored procs created");
                }
            }
            catch (Exception e)
            {
                log($"error creating the {_rulebaseName} specific stored procs");
                handleError(e, thisBatch);
            }

            log($"Executing pre {_rulebaseName} stored procs");
            try
            {
                using (var connection = new SqlConnection(_intraCon))
                {
                    connection.Open();

                    var runners = _rulebaseXml.Root.Descendants("preRunSP").ToList();
                    runners
                        .ForEach(x =>
                        {
                            thisBatch = $"exec {x.Attribute("name").Value}";
                            using (var cmd = new SqlCommand(thisBatch, connection))
                            {
                                cmd.CommandTimeout = _commandTimeout;
                                cmd.ExecuteNonQuery();
                            }
                        });
                }

                log("pre rulebase exec procs executed");
            }
            catch (Exception e)
            {
                log("Error executing the pre rulebase stored procs");
                handleError(e, thisBatch);
            }
        }

        private void postRun()
        {
            log($"running the post {_rulebaseName} stored procs");
            var thisBatch = string.Empty;

            try
            {
                using (var connection = new SqlConnection(_intraCon))
                {
                    connection.Open();

                    var runners = _rulebaseXml.Root.Descendants("postRunSP").ToList();
                    runners
                        .ForEach(x =>
                        {
                            thisBatch = $"exec {x.Attribute("name").Value}";
                            using (var cmd = new SqlCommand(thisBatch, connection))
                            {
                                cmd.CommandTimeout = _commandTimeout;
                                cmd.ExecuteNonQuery();
                            }
                        });
                }

                log($"successfully ran the post {_rulebaseName} procs");
            }
            catch (Exception e)
            {
                log($"post {_rulebaseName} store procs failed to run succesfully");
                handleError(e, thisBatch);
            }
        }

        private OPAWrapperLib configure()
        {
            log($"configuring the {_rulebaseName} rulebase");
            string xmlContent = File.ReadAllText(Path.Combine(_versionPath, _rulebaseXml.Root.Attribute("configFile").Value)).Replace("$(WorkingFolder)", _versionPath);
            XmlDocument config = new XmlDocument();
            config.LoadXml(xmlContent);
            var wrapper = new OPAWrapperLib(config);

            wrapper.XslFile = Path.Combine(_versionPath, _rulebaseXml.Root.Attribute("xslFile").Value);
            wrapper.SetLoggingLevel(LoggingType.Error);
            wrapper.EnableTiming = false;
            wrapper.Log2Console = false;
            if (!Directory.Exists(Path.Combine(AppContext.BaseDirectory, "XDS")))
            {
                Directory.CreateDirectory(Path.Combine(AppContext.BaseDirectory, "XDS"));
            }
            if (!Directory.Exists(Path.Combine(AppContext.BaseDirectory, "XDS", _rulebaseXml.Root.Attribute("shortName").Value)))
            {
                Directory.CreateDirectory(Path.Combine(AppContext.BaseDirectory, "XDS", _rulebaseXml.Root.Attribute("shortName").Value));
            }
            wrapper.DumpXdsFileName = "UKPRN@global,LearnRefNumber@Learner";
            wrapper.DumpXdsPath = Path.Combine(AppContext.BaseDirectory, "XDS", _rulebaseXml.Root.Attribute("shortName").Value);
            wrapper.AddConString("LoggingDB", _loggingCon);
            wrapper.AddConString("ILR", _intraCon);
            wrapper.NumberOfThreads = 8;

            log($"{_rulebaseName} rulebase configured");
            return wrapper;
        }

        private void runFD()
        {
            log("Executing FD Validation");
            var thisBatch = "exec Rulebase.FD_Validation_Execute";
            try
            {
                using (var con = new SqlConnection(_intraCon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand(thisBatch, con))
                    {
                        cmd.CommandTimeout = _commandTimeout;
                        cmd.ExecuteNonQuery();
                    }
                }

                log("FD Validation executed");
            }
            catch (Exception e)
            {
                log("FD Validation execution failed");
                handleError(e, thisBatch);
            }
        }

        private void run()
        {
            preRun();
            //var wrapper = configure();

            //log($"running {_rulebaseName} rulebase");
            //try
            //{
            //    wrapper.Run();
            //    log($"{_rulebaseName} rulebase executed");
            //}
            //catch (Exception e)
            //{
            //    log($"Error executing the {_rulebaseName} rulebase");
            //    handleError(e, "Running wrapper");
            //}

            //postRun();
        }

        public void Run(string rulebaseName, string year, string connection, string loggingConnection, Action<string> logger, Action<string> handler, int commandTimeout)
        {
            _intraCon = connection;
            _loggingCon = loggingConnection;
            _commandTimeout = commandTimeout;

            log($"{rulebaseName} execution starting");
            if (rulebaseName == "FD")
            {
                runFD();
            }
            else
            {
                _yearPath = Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", $"{year}", $"{rulebaseName}" });
                _versionPath = Path.Combine(new string[] { _yearPath, new DirectoryInfo(_yearPath).GetDirectories().Last().Name });
                _rulebaseXml = XDocument.Load(Path.Combine(_versionPath, "Rulebase.xml"));
                _log = logger;
                _handler = handler;
                _rulebaseName = rulebaseName;

                run();
            }

            log($"{rulebaseName} execution finished");
        }

        public void Run(string year, string rulebaseName, string interfaceVersion, string connection, string loggingConnection, Action<string> logger, Action<string> handler, int commandTimeout)
        {
            _versionPath = Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", $"{year}", $"{rulebaseName}", interfaceVersion });
            _intraCon = connection;
            _loggingCon = loggingConnection;
            _log = logger;
            _handler = handler;
            _rulebaseName = rulebaseName;
            _commandTimeout = commandTimeout;

            run();
        }
    }
}
