using NLog;
using System;
using System.Data.SqlClient;
using System.IO;

namespace EasyWrapper.Executor.Service
{
    public class IntraCreator : ICreateIntra
    {
        private string _con;
        private string _intraCon;
        private string _year;
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

        private void intraDbCheck()
        {
            using (var con = new SqlConnection(_con))
            {
                con.Open();

                log("dropping intrajob if exists");
                try
                {
                    var cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandTimeout = 600;

                    cmd.CommandText = "if exists (select * from sys.databases where name = 'Intrajob') begin begin try exec('drop database Intrajob'); end try begin catch alter database [Intrajob] set single_user with rollback immediate; exec('drop database Intrajob'); end catch  end";

                    cmd.ExecuteNonQuery();
                    log("Intrajob db check and drop successful");

                    log("creating intrajob");
                    cmd.CommandText = "exec ('create database Intrajob (EDITION = ''standard'', SERVICE_OBJECTIVE = ''S7'', MAXSIZE = 250 GB);')";
                    cmd.ExecuteNonQuery();
                    log("Intrajob created");
                }
                catch (SqlException se)
                {
                    error(se);
                }
            }
        }

        private void intraSchemaCreate()
        {
            using (var con = new SqlConnection(_intraCon))
            {
                con.Open();

                SqlCommand command = new SqlCommand();
                command.CommandTimeout = 600;
                command.Connection = con;

                log("creating Input schema");
                try
                {
                    string file = File.ReadAllText(Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", _year, "01 ILR_Input_Tables.sql" }));
                    var batches = file.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var batch in batches)
                    {
                        command.CommandText = batch;
                        command.ExecuteNonQuery();
                    }

                    log("Input Schema Created");
                }
                catch (Exception ex)
                {
                    log("Error creating Input Schema");
                    error(ex);
                }

                log("Creating valid schema");
                try
                {
                    var file = File.ReadAllText(Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", _year, "02 ILR_Valid_Tables.sql" }));
                    var batches = file.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var batch in batches)
                    {
                        command.CommandText = batch;
                        command.ExecuteNonQuery();
                    }

                    log("Valid schema created");
                }
                catch (Exception e)
                {
                    log("Error creating valid schema");
                    error(e);
                }

                log("Creating Rulebase schema");
                try
                {
                    var file = File.ReadAllText(Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", _year, "02 ILR_Rulebase_Tables.sql" }));
                    var batches = file.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var batch in batches)
                    {
                        command.CommandText = batch;
                        command.ExecuteNonQuery();
                    }

                    log("created Rulebase Schema");
                }
                catch (Exception ex)
                {
                    log("Error creating the Rulebase schema");
                    error(ex);
                }

                log("Creating the Invalid schema");
                try
                {
                    var file = File.ReadAllText(Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", _year, "ILR_Invalid_Tables.sql" }));
                    var batches = file.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var batch in batches)
                    {
                        command.CommandText = batch;
                        command.ExecuteNonQuery();
                    }

                    log("created Invalid Schema");
                }
                catch (Exception ex)
                {
                    log("Error creating the Invalid schema");
                    error(ex);
                }
                
                log("Creating the FD Tables");
                try
                {
                    var file = File.ReadAllText(Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", _year, "02 FD Table.sql" }));
                    var batches = file.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var batch in batches)
                    {
                        command.CommandText = batch;
                        command.ExecuteNonQuery();
                    }

                    log("FD Tables created");
                }
                catch (Exception e)
                {
                    log("Error creating the FD tables");
                    error(e);
                }

                log("creating the Error Message Lookup table");
                try
                {
                    var file = File.ReadAllText(Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", _year, "03 ErrorMessageLookUpTable.sql" }));
                    var batches = file.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var batch in batches)
                    {
                        command.CommandText = batch;
                        command.ExecuteNonQuery();
                    }

                    log("Error Message LookUp Table created");
                }
                catch (Exception ex)
                {
                    log("Error creating the error message lookup table");
                    error(ex);
                }
            }
        }

        private void intraInserts()
        {
            using (var con = new SqlConnection(_intraCon))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandTimeout = 600;
                cmd.Connection = con;

                log("Inserting error messages in error message lookup table");
                try
                {
                    var file = File.ReadAllText(Path.Combine(AppContext.BaseDirectory, "Assets", "ILR", _year, "04 ErrorMessageLookUpInserts.sql"));
                    var inserts = file.Split(new string[] { "go\r\n", "\r\ngo" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var insert in inserts)
                    {
                        var sql = insert.Replace("\t", "");
                        cmd.CommandText = sql;
                        cmd.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    log("Error inserting values into the error message lookup table");
                    error(ex);
                }
            }
        }

        private void intraViews()
        {
            using (var con = new SqlConnection(_intraCon))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandTimeout = 600;
                cmd.Connection = con;

                log("creating the valid views");
                try
                {
                    var file = File.ReadAllText(Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", _year, "05 Valid views.sql" }));
                    var batches = file.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var batch in batches)
                    {
                        cmd.CommandText = batch;
                        cmd.ExecuteNonQuery();
                    }

                    log("Valid views created");
                }
                catch (Exception ex)
                {
                    log("Error creating valid views");
                    error(ex);
                }

                log("creating DEDS_Invalid view");
                try
                {
                    var file = File.ReadAllText(Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", _year, "DEDS_Invalid.sql" }));
                    var batches = file.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var batch in batches)
                    {
                        cmd.CommandText = batch;
                        cmd.ExecuteNonQuery();
                    }

                    log("Created the DEDS_Invalid views");
                }
                catch (Exception ex)
                {
                    log("error creating the DEDS_Invalid view");
                    error(ex);
                }

                log("creating DEDS_Valid view");
                try
                {
                    var file = File.ReadAllText(Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", _year, "DEDS_Valid.sql" }));
                    var batches = file.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var batch in batches)
                    {
                        cmd.CommandText = batch;
                        cmd.ExecuteNonQuery();
                    }

                    log("Created the DEDS_Valid views");
                }
                catch (Exception ex)
                {
                    log("error creating the DEDS_Valid view");
                    error(ex);
                }

                log("creating DEDS_Rulebase view");
                try
                {
                    var file = File.ReadAllText(Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", _year, "DEDS_Rulebase.sql" }));
                    var batches = file.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var batch in batches)
                    {
                        cmd.CommandText = batch;
                        cmd.ExecuteNonQuery();
                    }

                    log("Created the DEDS_Rulebase views");
                }
                catch (Exception ex)
                {
                    log("error creating the DEDS_Rulebase view");
                    error(ex);
                }
            }
        }

        private void intraProcs()
        {
            using (var con = new SqlConnection(_intraCon))
            {
                con.Open();

                var cmd = new SqlCommand();
                cmd.CommandTimeout = 600;
                cmd.Connection = con;

                log("Creating Transform input to valid stored procs");
                try
                {
                    var file = File.ReadAllText(Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", _year, "03 Transform_Input_To_Valid.sql" }));
                    var batches = file.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var batch in batches)
                    {
                        cmd.CommandText = batch;
                        cmd.ExecuteNonQuery();
                    }

                    log("Transform input to valid stored procs created successfully");
                }
                catch (Exception ex)
                {
                    log("error creating the transform input to valid stored procs");
                    error(ex);
                }

                log("creating the FD ILR Stored Procs");
                try
                {
                    var file = File.ReadAllText(Path.Combine(new string[] { AppContext.BaseDirectory, "Assets", "ILR", _year, "FD_ILR_StoredProcs.sql" }));
                    var batches = file.Split(new string[] { "go\r\n", "GO\r\n", "\r\ngo", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (var batch in batches)
                    {
                        cmd.CommandText = batch;
                        cmd.ExecuteNonQuery();
                    }

                    log("created the FD ILR procs");
                }
                catch (Exception ex)
                {
                    log("error creating the FD Stored Procedures");
                    error(ex);
                }
            }
        }
        
        public void Create(string year, string instanceName, string security, Action<string> logger, Action<string> errorHandler)
        {
            _con = $"Data Source={instanceName};Initial Catalog=master;{security};";
            _intraCon = $"Data Source={instanceName};Initial Catalog=Intrajob;{security};";
            _year = year;
            _logger = logger;
            _handler = errorHandler;

            log("setting up the Intrajob database");
            intraDbCheck();
            intraSchemaCreate();
            intraInserts();
            intraViews();
            intraProcs();
            log("Intrajob db setup complete");
        }
    }
}
