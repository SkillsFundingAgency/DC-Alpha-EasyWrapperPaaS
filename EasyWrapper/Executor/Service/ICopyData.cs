using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyWrapper.Executor.Service
{
    public interface ICopyData
    {
        void Copy(string sourceDB, string conString, string year, Action<string> logger, Action<string> errorHandler);
    }
}
