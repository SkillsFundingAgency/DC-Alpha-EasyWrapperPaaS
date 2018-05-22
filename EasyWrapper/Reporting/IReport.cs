using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyWrapper.Reporting
{
    public interface IReport
    {
        string Create(IEnumerable<string> columns, IEnumerable<string> rows);

        string Create(IEnumerable<string> columns, SqlCommand query);
    }
}
