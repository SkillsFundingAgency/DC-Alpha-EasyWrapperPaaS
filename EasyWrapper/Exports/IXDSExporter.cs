using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace EasyWrapper.Exports
{
    public interface IXDSExporter
    {
        string ValidPath
        {
            get;
        }

        string InvalidPath
        {
            get;
        }

        string XslPath
        {
            get;
            set;
        }

        SqlConnection IntrajobCon
        {
            get;
            set;
        }

        string RulebasePrefix
        {
            get;
            set;
        }

        void Export();        
    }
}
