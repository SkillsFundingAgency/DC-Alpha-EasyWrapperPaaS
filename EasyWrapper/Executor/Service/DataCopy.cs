using NLog;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;

namespace EasyWrapper.Executor.Service
{
    public class DataCopy : ICopyData
    {
        private string _sourceDb;
        private string _connection;
        private Action<string> _log;
        private Action<string> _handler;
        private Logger _logger = LogManager.GetCurrentClassLogger();

        private void log(string msg)
        {
            _logger.Info(msg);
            _log?.Invoke(msg);
        }

        private void error(Exception ex, string batch)
        {
            var msg = $"Source: {ex.Source}; Target: {ex.TargetSite}; Message: {ex.Message}; Batch: {batch}";
            _handler?.Invoke(msg);
            _logger.Error(msg);
            _logger.Error($"Stack Trace: {ex.StackTrace}");
        }

        public void Copy(string sourceDB, string conString, string year, Action<string> logger, Action<string> errorHandler)
        {
            _sourceDb = sourceDB;
            _connection = conString;
            _log = logger;
            _handler = errorHandler;

            var copy = File.ReadAllText(Path.Combine(AppContext.BaseDirectory, "Assets", "ILR", year, "CopyScriptPaaS.sql")).Replace("$(FromILRDatabase)", _sourceDb);
            var copyBatches = copy.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);
            var thisbatch = string.Empty;

            using (SqlConnection con = new SqlConnection(_connection))
            {
                con.Open();

                log("coping data from source Database to processing database");

                try
                {
                    copyBatches.ToList().ForEach(x =>
                    {
                        thisbatch = x;
                        using (var cmd = new SqlCommand(thisbatch, con))
                        {
                            // log($" copying command: {x}");
                            cmd.CommandTimeout = 600;
                            cmd.ExecuteNonQuery();
                        }
                    });

                    log("successfully copied data to intrajob");
                }
                catch (Exception ex)
                {
                    log("Error copying ilr data to intrajob");
                    
                    error(ex, thisbatch);
                }
            }
        }
    }
}
