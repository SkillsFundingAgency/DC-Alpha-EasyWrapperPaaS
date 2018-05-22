using NLog;
using System;
using System.Data.SqlClient;
using System.IO;

namespace EasyWrapper.Executor.Service
{
    public class IntraCreatorExternalData : ICreateIntraExternalData
    {
        private string _intraCon;
        private string _externalDatabase;
        private string _year;
        private string _identity;
        private string _password;
        private Action<string> _logger;
        private Action<string> _handler;
        private static Logger _nLogger = LogManager.GetCurrentClassLogger();

        private void log(string message)
        {
            _nLogger.Info(message);
            _logger?.Invoke(message);
        }

        private void error(Exception exc)
        {
            _handler?.Invoke($"Source: {exc.Source}; Target: {exc.TargetSite}; Message: {exc.Message}");
            _nLogger.Error($"Source: {exc.Source}; Target: {exc.TargetSite}; Message: {exc.Message}");
            _nLogger.Error($"Stack Trace: {exc.StackTrace}");
        }

        private void intraCreateExternalDataTables()
        {
            using (var con = new SqlConnection(_intraCon))
            {
                con.Open();

                SqlCommand command = new SqlCommand();
                command.CommandTimeout = 600;
                command.Connection = con;

                log("creating external tables / linkage");
                try
                {
                    string file = File.ReadAllText(
                        Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", _year, "99 ILR External Data Tables.sql" }));
                    file = file
                        .Replace("$(FromILRDatabase)", _externalDatabase)
                        .Replace("$(Identity)", _identity)
                        .Replace("$(Password)", _password);
                    file = RulebaseRunner.detokenise(file);
                    
                    var batches = file.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var batch in batches)
                    {
                        command.CommandText = batch;
                        command.ExecuteNonQuery();
                    }

                    log("created external tables / linkage");
                }
                catch (Exception ex)
                {
                    log("Error creatingexternal tables");
                    error(ex);
                }
            }
        }
        
        public void Create(string year, string instanceName, string externalDatabase, string security, Action<string> logger, Action<string> errorHandler)
        {
            _intraCon = $"Data Source={instanceName};Initial Catalog=Intrajob;{security};";
            _externalDatabase = externalDatabase;
            _year = year;
            _logger = logger;
            _handler = errorHandler;
            string[] secSubStrings = security.Split(';');
            foreach(var s in secSubStrings)
            {
                var s2 = s.ToLower();
                if (s2.StartsWith("user id"))
                    _identity = s.Substring(8);
                else if( s2.StartsWith("password"))
                    _password = s.Substring(9);
            }

            log("setting up the Intrajob external data tables database");
            intraCreateExternalDataTables();
            log("Intrajob external db setup complete");
        }
    }
}
