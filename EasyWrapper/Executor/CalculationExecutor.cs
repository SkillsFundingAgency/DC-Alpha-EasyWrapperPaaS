using NLog;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Threading.Tasks;

namespace EasyWrapper.Executor
{
    public class CalculationExecutor : IExecuteCalculation
    {
        private string _year;
        private string _con;
        private string _loggingConn;
        private string _instance;
        private string _source;
        private string _security;
        private Action<string> _log;
        private Action<string> _handler;
        private static Logger _logger = LogManager.GetCurrentClassLogger();
        private Service.ICreateIntra _intra = new Service.IntraCreator();
        private Service.ICopyData _copy = new Service.DataCopy();
        private Service.IRunRulebases _runner = new Service.RulebaseRunner();
        private Service.IGetRulebases _rulebases = new Service.GetRulebases();
        private Reporting.IReport _report = new Reporting.Reporter();
        private Service.ITransform _transform = new Service.Transformer();
        private Service.ICopyResults _results = new Service.ResultsCopier();
        private int _commandTimeout;

        private void log(string msg)
        {
            _log?.Invoke(msg);
            _logger.Info(msg);
        }

        private void handleError(Exception ex)
        {
            _handler?.Invoke($"Source: {ex.Source}; Target: {ex.TargetSite}; Message: {ex.Message}");
            _logger.Error($"Source: {ex.Source}; Target: {ex.TargetSite}; Message: {ex.Message}");
            _logger.Error($"Stack Trace: {ex.StackTrace}");
        }

        private void createIntrajob()
        {
            _intra.Create(_year, _instance, _security, _log, _handler);
        }

        private void copyData()
        {
            _copy.Copy(_source, _con, _year, _log, _handler);
        }

        private void runRulebase()
        {
            _runner.Run("FD", _year, _con, _loggingConn, _log, _handler, _commandTimeout);
            _results.CopyResultsOld(_instance, _source, _year, "FD", _log, _handler, true);
            _runner.Run("VAL", _year, _con, _loggingConn, _log, _handler, _commandTimeout);
            _results.CopyResultsOld(_instance, _source, _year, "VAL", _log, _handler);

            _transform.Transform(_con);

            foreach (var calc in _rulebases.Calculations)
            {
                _runner.Run(calc, _year, _con, _loggingConn, _log, _handler,_commandTimeout);
                _results.CopyResultsOld(_instance, _source, _year, calc, _log, _handler);
            }
        }

        private static string[] _columns = {
            "AimSeqNumber",
            "ErrorString",
            "Severity",
            "FieldValues",
            "LearnRefNumber",
            "RuleId"
        };

        private static string reportCommand = "select * from [Report].[ValidationError] where Severity {0} 'E'";

        private void report()
        {
            var sqlConn = new SqlConnection(_con);

            var errorReport = _report.Create(_columns, new SqlCommand(string.Format(reportCommand, "="), sqlConn));
            var warningReport = _report.Create(_columns, new SqlCommand(string.Format(reportCommand, "<>"), sqlConn));

            if (!Directory.Exists(Path.Combine(AppContext.BaseDirectory, "Reports")))
            {
                Directory.CreateDirectory(Path.Combine(AppContext.BaseDirectory, "Reports"));
            }

            log("creating the validation reports");

            Parallel.Invoke(
                () => {
                    File.WriteAllText(Path.Combine(AppContext.BaseDirectory, "Reports", "Errors.csv"), errorReport);
                },
                () => {
                    File.WriteAllText(Path.Combine(AppContext.BaseDirectory, "Reports", "Warnings.csv"), warningReport);
                });

            log("reports created");
        }

        public void Execute(string year, string instanceName, string sourceDB, string security, Action<string> updater, Action<string> errorHandler, int commandTimeout)
        {
            _year = year;
            _instance = instanceName;
            _con = $"Data Source={instanceName};Initial Catalog=Intrajob;{security};";
            _loggingConn = $"Data Source={instanceName};Initial Catalog=loggingDB;{security};";
            _source = sourceDB;
            _security = security;
            _log = updater;
            _handler = errorHandler;
            _commandTimeout = commandTimeout;

            _log("Executing the Calc rulebases");
            createIntrajob();
            copyData();
            runRulebase();
            //report();
            _log("Execution Complete");
        }
    }
}
