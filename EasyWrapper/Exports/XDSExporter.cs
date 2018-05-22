using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Schema;
using System.Xml.Xsl;
using NLog;

namespace EasyWrapper.Exports
{
    public class XDSExporter : AbstractExporter, IXDSExporter
    {
        private static Logger _logger = LogManager.GetCurrentClassLogger();

        public XDSExporter(string RulebasePrefix, SqlConnection connection, string xslPath)
        {
            this.IntrajobCon = connection;
            this.RulebasePrefix = RulebasePrefix;
            this.XslPath = xslPath;
        }

        public string XslPath
        {
            get;
            set;
        }

        public string RulebasePrefix
        {
            get;
            set;
        }

        public string ValidPath => $"~/Exports/XDS/Valid/{RulebasePrefix}_XDS_";

        public string InvalidPath => $"~/Exports/XDS/Invalid/{RulebasePrefix}_XDS_";
        
        public IEnumerable<string> ValidationErrors
        {
            get;
            protected set;
        }

        public void Export()
        {
            _logger.Info("Beginning XDS Export");
            handleExport();
            _logger.Info("XDS Export Complete");
        }

        private void handleExport()
        {
            string cmdText = $"select LearnRefNumber, CaseData from Rulebase.{RulebasePrefix}_Cases";

            using (SqlConnection con = IntrajobCon)
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand(cmdText, con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                string lrn = reader.GetString(0);
                                XDocument cd = XDocument.Load(reader.GetSqlXml(1).ToString());
                                handleTranslationValidation(cd, lrn);
                            }
                        }
                        else
                        {
                            _logger.Info("No case data, ensure that rulebase execution has been previously completed.");
                        }
                    }
                }
            }
        }

        private void handleTranslationValidation(XDocument caseData, string learnRefNum)
        {
            Task.Run(
                () =>
                {
                    XDocument xds = translate(caseData);
                    writeToFolder(xds, learnRefNum, validate(xds));
                });
        }

        private XDocument translate(XDocument xd)
        {
            XDocument xds = new XDocument();
            using (XmlWriter xw = xds.CreateWriter())
            {
                _logger.Info("Translating case data into XDS");
                XslCompiledTransform xsl = new XslCompiledTransform();
                xsl.Load(XmlReader.Create(this.XslPath));

                xsl.Transform(xds.CreateReader(), xw);
            }
            _logger.Info("case data translated");
            return xds;
        }

        private async void writeToFolder(XDocument xd, string lrn, bool valid)
        {
            _logger.Info("Writing to XDS folder");
            try
            {
                using (FileStream fs = new FileStream($"{(valid ? ValidPath : InvalidPath)}{lrn}.xds", FileMode.CreateNew))
                {
                    byte[] xdsBytes = new UnicodeEncoding().GetBytes(xd.Root.ToString());
                    await fs.WriteAsync(xdsBytes, 0, xdsBytes.Length);
                }
                _logger.Info("Write to XDS folder success.");
            }
            catch (Exception e)
            {
                _logger.Error(e.Message);
            }
        }

        private bool validate(XDocument xd)
        {
            XmlSchemaSet xss = new XmlSchemaSet();
            xss.Add("xsi:noNamespaceSchemaLocation", "~/InternalResources/SessionData/sessiondata.xsd");
            _logger.Info("Validating XDS");
            bool result = true;
            xd.Validate(xss, (sender, e) =>
            {
                result = false;
            });

            if (!result)
            {
                _logger.Error("XDS is not valid.");
            }
            else
            {
                _logger.Info("XDS is Valid.");
            }

            return result;
        }        
    }
}
