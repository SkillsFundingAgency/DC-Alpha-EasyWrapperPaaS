using System;

namespace EasyWrapper.Executor.Service
{
    public interface IRunRulebases
    {
        void Run(string rulebaseName, string year, string connection, string loggingConnection, Action<string> logger, Action<string> handler, int commandTimeout);

        void Run(string year, string rulebaseName, string interfaceVersion, string connection, string loggingConnection, Action<string> logger, Action<string> handler, int commandTimeout);
    }
}
