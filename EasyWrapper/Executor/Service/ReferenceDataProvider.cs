using NLog;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace EasyWrapper.Executor.Service
{
    public class ReferenceDataProvider : IProvideReferenceData
    {
        private string _instance;
        private string _year;
        private Action<string> _logger;
        private Action<string> _handler;
        private static Logger _nLogger = LogManager.GetCurrentClassLogger();

        private void log(string msg)
        {
            _logger?.Invoke(msg);
            _nLogger.Info(msg);
        }

        private void handleError(Exception ex)
        {
            _handler?.Invoke($"Source: {ex.Source}; Target: {ex.TargetSite}; Message: {ex.Message}");
            _nLogger.Error($"Source: {ex.Source}; Target: {ex.TargetSite}; Message: {ex.Message}");
            _nLogger.Error($"Stack Trace: {ex.StackTrace}");
        }

        private string detokenise(string tokenString)
        {
            var settings = XDocument.Load(Path.Combine(AppContext.BaseDirectory, "config.xml"));
            string detoken = tokenString.Replace("$(IntrajobDatabase)", "Intrajob")
                        .Replace("${dcft.runmode}", "false")
                        .Replace("$(FromILRSchema)", "dbo");

            foreach (var token in settings.Descendants("databaseAlias"))
            {
                detoken = detoken.Replace(token.Attribute("alias").Value, token.Attribute("name").Value);
                detoken = detoken.Replace(token.Attribute("schemaAlias").Value, token.Attribute("schemaName").Value);
            }

            return detoken;
        }

        private void createReferenceSchema()
        {
            log("Creating the reference data schema");
            string file = File.ReadAllText(detokenise(Path.Combine(AppContext.BaseDirectory, "Resources", _year, "Schema", "CreateReferenceDataTables.sql")));
            var batches = file.Split(new string[] { "\r\ngo", "go\r\n", "\r\nGO", "GO\r\n" }, StringSplitOptions.RemoveEmptyEntries);

            try
            {
                using (var con = new SqlConnection($"Data Source={_instance};Initial Catalog=Intrajob;Integrated Security=SSPI;"))
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
                log("Reference data schema created");
            }
            catch (Exception ex)
            {
                log("Error creating the reference data schema");
                handleError(ex);
            }
        }

        private void insertReferenceData()
        {
            log("inserting the reference data into the reference schema");
            var file = File.ReadAllText(detokenise(Path.Combine(AppContext.BaseDirectory, "Resources", _year, "Inserts", "Reference_Inserts.sql")));
            var batches = file.Split(new string[] { "\r\ngo", "go\r\n", "\r\nGO", "GO\r\n" }, StringSplitOptions.RemoveEmptyEntries);

            try
            {
                using (var con = new SqlConnection($"Data Source={_instance};Initial Catalog=Intrajob;Integrated Security=SSPI;"))
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
                log("Reference data inserted");
            }
            catch (Exception ex)
            {
                log("Error inserting reference data into reference schema");
                handleError(ex);
            }
        }

        public void Provide(string instance, string year, Action<string> logger, Action<string> handler)
        {
            _handler = handler;
            _logger = logger;
            _instance = instance;
            _year = year;

            createReferenceSchema();
            insertReferenceData();
        }
    }
}
