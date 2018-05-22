using System;
using System.Data.SqlClient;
using System.IO;
using System.Threading.Tasks;

namespace EasyWrapper.Executor
{
    public class SingleExecutor : IExecuteSingleRulebase
    {
        private Service.IRunRulebases _runner = new Service.RulebaseRunner();
        private Service.ICreateIntra _create = new Service.IntraCreator();
        private Service.ICopyData _copy = new Service.DataCopy();
        private Service.ITransform _transform = new Service.Transformer();
        private Reporting.IReport _report = new Reporting.Reporter();
        private Service.ICopyResults _results = new Service.ResultsCopier();
        private int _commandTimeout;

        private void report(string intra)
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
                    Connection = new SqlConnection(intra),
                    CommandText = "select AimSeqNumber, ErrorString, Severity, FieldValues, LearnRefNumber, RuleId from [Report].[ValidationError] where Severity = 'E'"
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
                        Connection = new SqlConnection(intra),
                        CommandText = "select AimSeqNumber, ErrorString, Severity, FieldValues, LearnRefNumber, RuleId from [Report].[ValidationError] where Severity <> 'E'"
                    });

            if (!Directory.Exists(Path.Combine(AppContext.BaseDirectory, "Reports")))
            {
                Directory.CreateDirectory(Path.Combine(AppContext.BaseDirectory, "Reports"));
            }

            Parallel.Invoke(
                () => {
                    File.WriteAllText(Path.Combine(AppContext.BaseDirectory, "Reports", "Errors.csv"), errorReport);
                },
                () => {
                    File.WriteAllText(Path.Combine(AppContext.BaseDirectory, "Reports", "Warnings.csv"), warningReport);
                });
        }

        public void Execute(string rulebase, string interfaceVersion, string year, string sourceDb, string instanceName, string security, Action<string> logger, Action<string> handler, int commandTimeout)
        {
            var intraCon = $"Data Source={instanceName};Initial Catalog=Intrajob;Integrated Security=SSPI;";
            var loggingCon = $"Data Source={instanceName};Initial Catalog=Logging;Integrated Security=SSPI;";
            _commandTimeout = commandTimeout;

            _create.Create(year, instanceName, security, logger, handler);
            _copy.Copy(sourceDb, intraCon, year, logger, handler);

            _runner.Run(rulebase, year, intraCon, loggingCon, logger, handler, _commandTimeout);
            _results.CopyResultsOld(instanceName, sourceDb, year, rulebase, logger, handler, true);

            logger?.Invoke("Execution Complete");
        }
    }
}
