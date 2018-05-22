using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace EasyWrapper.Exports
{
    public class AbstractExporter : IExporter
    {
        public virtual SqlConnection IntrajobCon
        {
            get;
            set;
        }

        public virtual void Export(string RulebasePrefix)
        {
            string path = $"~/Exports/caseData-{DateTime.UtcNow.ToString("dd-MM-yyyy hh:mm:ss")}.xml";
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            XDocument caseData = getCaseData(RulebasePrefix);

            if (caseData != null)
            {
                caseData.Save(path);
            }
            else
            {
                //log that no case data returned
            }
        }

        private XDocument getCaseData(string prefix)
        {
            using (SqlConnection con = IntrajobCon)
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand($"select top 1 CaseData from Rulebase.{prefix}_Cases", con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            return XDocument.Load(reader.GetSqlXml(0).ToString());
                        }
                        else
                        {
                            return null;
                        }
                    }
                }
            }
        }
    }
}
