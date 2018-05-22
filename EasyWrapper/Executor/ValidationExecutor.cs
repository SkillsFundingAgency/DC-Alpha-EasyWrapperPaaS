using NLog;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace EasyWrapper.Executor
{
    public class ValidationExecutor : IExecuteValidation
    {
        private SqlConnection _mainCon;
        private string _year;
        private string _security;
        private SqlConnection _intraCon;
        private SqlConnection _loggingCon;
        private static Logger _logger = LogManager.GetCurrentClassLogger();
        private Action<string> _updater;
        private Action<string> _errorHandler;
        private string _sourceDB;
        private string _instance;
        private Service.ICreateIntra _intraCreate = new Service.IntraCreator();
        private Service.ICreateIntraExternalData _intraCreateExternalData = new Service.IntraCreatorExternalData();
        private Service.ICopyData _copy = new Service.DataCopy();
        private Service.IRunRulebases _runner = new Service.RulebaseRunner();
        private Service.IGetRulebases _rulebases = new Service.GetRulebases();
        private Reporting.IReport _report = new Reporting.Reporter();
        private Service.ICopyResults _results = new Service.ResultsCopier();
        private int _commandTimeout;

        public void Execute(string year, string instanceName, string sourceDB, string security, Action<string> updater, Action<string> errorHandler, int commandTimeout)
        {
            _year = year;
            _mainCon = new SqlConnection($"Data Source={instanceName};Initial Catalog=master;{security};");
            _intraCon = new SqlConnection($"Data Source={instanceName};Initial Catalog=Intrajob;{security};");
            _loggingCon = new SqlConnection($"Data Source={instanceName};Initial Catalog=Logging;{security};");
            _updater = updater;
            _errorHandler = errorHandler;
            _sourceDB = sourceDB;
            _instance = instanceName;
            _commandTimeout = commandTimeout;
            _security = security;

            uiUpdateLog("Begining execution");

            intraSetup();
            copyData();
            runRulebases();
            ////report();

            uiUpdateLog("Execution complete");
        }

        private void handleError(Exception e)
        {
            _errorHandler?.Invoke($"Source: {e.Source}; Target: {e.TargetSite}; Message: {e.Message}");
            _logger.Error($"Source: {e.Source}; Target: {e.TargetSite}; Message: {e.Message}");
            _logger.Error($"Stack Trace: {e.StackTrace}");
        }

        private void uiUpdateLog(string message)
        {
            _updater?.Invoke(message);
            _logger.Info(message);
        }

        private void intraSetup()
        {
            _intraCreate.Create(_year, _instance, _security, _updater, _errorHandler);
            _intraCreateExternalData.Create(_year, _instance, _sourceDB, _security, _updater, _errorHandler);
        }

        private void copyData()
        {
            _copy.Copy(_sourceDB, _intraCon.ConnectionString, _year, _updater, _errorHandler);
        }

        private void runRulebases()
        {
            uiUpdateLog("executing rulebases");

            foreach (string rb in _rulebases.Validations)
            {
                try
                {
                    _runner.Run(rb, _year, _intraCon.ConnectionString, _loggingCon.ConnectionString, _updater, _errorHandler, _commandTimeout);
                    if (rb == _rulebases.Validations.First())
                    {
                        _results.CopyResultsOld(_intraCon, _year, rb, _updater, _errorHandler, true);
                    }
                    else
                    {
                        _results.CopyResultsOld(_instance, _sourceDB, _year, rb, _updater, _errorHandler);
                    }
                }
                catch (Exception e)
                {
                    uiUpdateLog($"Error running the {rb} rulebase");
                    handleError(e);
                }
            }

            uiUpdateLog("Rulebase execution complete");
        }

        private void report()
        {
            string errorReport = _report.Create(new string[]
                {
                    "AimSeqNumber",
                    "ErrorString",
                    "Severity",
                    "FiledValues",
                    "LearnRefNumber",
                    "RuleId"
                },
                new SqlCommand
                {
                    Connection = _intraCon,
                    CommandText = "select * from [Report].[ValidationError] where Severity = 'E'"
                });
            string warningReport = _report.Create(new string[]
                    {
                        "AimSeqNumber",
                        "ErrorString",
                        "Severity",
                        "FiledValues",
                        "LearnRefNumber",
                        "RuleId"
                    },
                    new SqlCommand
                    {
                        Connection = _intraCon,
                        CommandText = "select * from [Report].[ValidationError] where Severity <> 'W'"
                    });

            if (!Directory.Exists(Path.Combine(AppContext.BaseDirectory, "Reports")))
            {
                Directory.CreateDirectory(Path.Combine(AppContext.BaseDirectory, "Reports"));
            }

            uiUpdateLog("creating the validation reports");

            Parallel.Invoke(
                () => {
                    File.WriteAllText(Path.Combine(AppContext.BaseDirectory, "Reports", "Errors.csv"), errorReport);
                },
                () => {
                    File.WriteAllText(Path.Combine(AppContext.BaseDirectory, "Reports", "Warnings.csv"), warningReport);
                });

            uiUpdateLog("reports created");
        }
    }
}
