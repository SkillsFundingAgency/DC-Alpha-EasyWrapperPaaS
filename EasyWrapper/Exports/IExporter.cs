using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyWrapper.Exports
{
    public interface IExporter
    {
        SqlConnection IntrajobCon
        {
            get;
            set;
        }

        void Export(string RulebasePrefix);
    }
}
