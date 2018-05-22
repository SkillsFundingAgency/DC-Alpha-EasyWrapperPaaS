using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyWrapper.Executor
{
    public interface IExecute
    {
        void Execute(string year, string instanceName, string sourceDB, string security, Action<string> updater, Action<string> errorHandler, int defaultTimeout);
    }
}
