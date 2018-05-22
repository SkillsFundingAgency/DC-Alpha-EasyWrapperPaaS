using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyWrapper.Executor.Service
{
    public interface IProvideReferenceData
    {
        void Provide(string instance, string year, Action<string> logger, Action<string> handler);
    }
}
