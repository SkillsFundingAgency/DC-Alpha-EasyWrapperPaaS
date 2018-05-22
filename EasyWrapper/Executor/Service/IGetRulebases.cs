using System.Collections.Generic;

namespace EasyWrapper.Executor.Service
{
    public interface IGetRulebases
    {
        IEnumerable<string> Validations { get; }

        IEnumerable<string> Calculations { get; }
    }
}
