using System;

namespace EasyWrapper.Executor
{
    public interface IExecuteSingleRulebase
    {
        void Execute(string rulebase, string interfaceVersion, string year, string sourceDb, string instanceName, string security, Action<string> logger, Action<string> handler, int commandTimeout);
    }
}
