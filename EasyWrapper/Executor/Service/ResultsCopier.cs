using NLog;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;

namespace EasyWrapper.Executor.Service
{
    public class ResultsCopier : ICopyResults
    {
        private string _year;
        private string _instance;
        private string _source;
        private string _rulebasename;
        private string _connection;
        private Action<string> _logger;
        private Action<string> _handler;
        private static Logger _nLogger = LogManager.GetCurrentClassLogger();

        private void log(string msg)
        {
            _logger?.Invoke(msg);
            _nLogger.Info(msg);
        }

        private void handleError(Exception e, string copy)
        {
            var msg = $"Source: {e.Source}; Target: {e.TargetSite}; Message: {e.Message}; Copy: {copy}";
            _handler?.Invoke(msg);
            _nLogger.Error(msg);
            _nLogger.Error($"Stack Trace: {e.StackTrace}");
        }

        private bool dedsCheck()
        {
            bool result = false;
            using (SqlConnection con = new SqlConnection($"Data Source={_instance};Initial Catalog=master;Integrated Security=SSPI;"))
            {
                using (SqlCommand cmd = new SqlCommand($"if exists (select * from sys.databases where name = 'DS_SILR_${_year}') select 1 else select 0", con))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        result = reader.GetBoolean(0);
                    }
                }
            }

            return result;
        }

        private void dedsCreate()
        {
            string schema = File.ReadAllText(Path.Combine(AppContext.BaseDirectory, "Assets", "ILR", _year, "ILR_DedsSchema.sql"));
            string[] batches = schema.Split(new string[] { "go\r\n", "\r\ngo", "GO\r\n", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

            log("Creating the local DEDS");
            try
            {
                foreach (var batch in batches)
                {
                    using (var con = new SqlConnection($"Data Source={_instance};Initial Catalog=DS_SILR_{_year};Integrated Security=SSPI;"))
                    {
                        con.Open();

                        using (SqlCommand cmd = new SqlCommand(batch, con))
                        {
                            cmd.ExecuteNonQuery();
                        }

                        con.Close();
                    }
                }

                log("DEDS Created");
            }
            catch (Exception ex)
            {
                handleError(ex, string.Empty);
                log("error creating local DEDS");
            }
        }

        private void dedsCopy()
        {

        }

        private void createResultsTables()
        {
            log("checking results tables exist");
            string rulebaseSchema = File.ReadAllText(Path.Combine(AppContext.BaseDirectory, "Assets", "ILR", _year, "02 ILR_Rulebase_Tables.sql"));
            string[] batches = rulebaseSchema.Split(new string[] { "\r\ngo", "go\r\n", "\r\nGO", "GO\r\n" }, StringSplitOptions.RemoveEmptyEntries);

            try
            {
                using (var con = new SqlConnection(_connection))
                {
                    con.Open();

                    foreach (var batch in batches)
                    {
                        using (var cmd = new SqlCommand(batch, con))
                        {
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                log("error creating results tables");
                handleError(ex, string.Empty);
            }
        }

        private void copyToResultTables()
        {
            log("copying results");

            string copyFile = File.ReadAllText(Path.Combine(AppContext.BaseDirectory, "Assets", "ILR", _year, $"{_rulebasename}_Results_Copy.sql"))
                .Replace("$(FromILRDatabase)", _source)
                .Replace("${year}", _year)
                .Replace("$(FromILRDatabase)", _source);

            var copies = copyFile.Split(new string[] { "\r\ngo", "go\r\n", "\r\nGO", "GO\r\n" }, StringSplitOptions.RemoveEmptyEntries);
            var thisCopy = string.Empty;

            try
            {
                using (var con = new SqlConnection(_connection))
                {
                    con.Open();

                    copies.ToList().ForEach(x =>
                    {
                        thisCopy = x;
                        using (var cmd = new SqlCommand(thisCopy, con))
                        {
                            cmd.ExecuteNonQuery();
                        }
                    });
                }

                log("results copied");
            }
            catch (Exception ex)
            {
                log($"Error copying results for {_rulebasename}");
                handleError(ex, thisCopy);
            }
        }

        public void CopyResults(string instanceName, string year, Action<string> logger, Action<string> handler)
        {

        }

        public void CopyResultsOld(string instance, string db, string year, string rulebaseName, Action<string> logger, Action<string> handler, bool create = false)
        {
            _instance = instance;
            _source = db;
            _connection = $"Data Source={_instance};Initial Catalog={_source};Integrated Security=SSPI;";

            _logger = logger;
            _handler = handler;
            _rulebasename = rulebaseName;
            _year = year;

            if (create)
            {
                createResultsTables();
            }

            copyToResultTables();
        }
        public void CopyResultsOld(SqlConnection connection, string year, string rulebaseName, Action<string> logger, Action<string> handler, bool create = false)
        {
            _connection = connection.ConnectionString;
            _instance = connection.DataSource;
            _source = connection.Database;
            _logger = logger;
            _handler = handler;
            _rulebasename = rulebaseName;
            _year = year;

            if (create)
            {
                createResultsTables();
            }

            copyToResultTables();
        }
    }
}
