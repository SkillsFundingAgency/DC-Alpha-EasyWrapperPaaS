using System;
using System.Data.SqlClient;

namespace EasyWrapper.Executor.Service
{
    public interface ICopyResults
    {
        void CopyResults(string instanceName, string year, Action<string> logger, Action<string> handler);

        void CopyResultsOld(string instance, string db, string year, string rulebaseName, Action<string> logger, Action<string> handler, bool create = false);
        void CopyResultsOld(SqlConnection connection, string year, string rulebaseName, Action<string> logger, Action<string> handler, bool create = false);
    }
}
