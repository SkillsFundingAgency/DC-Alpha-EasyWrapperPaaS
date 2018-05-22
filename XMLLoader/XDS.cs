using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Xsl;

namespace XMLLoader
{
    public partial class XDS : Form
    {
        private string _selectedRulebase;
        private string _selectedYear;
        private DirectoryInfo _rulebaseLocation = new DirectoryInfo(Path.Combine(AppContext.BaseDirectory, "Export", "XDS", "Rulebases"));
        private string _writeDir = Path.Combine(AppContext.BaseDirectory, "Export", "XDS", "Files");

        public XDS()
        {
            InitializeComponent();
            setRulebaseYears();
            setServer();
            setRulebases(yearCombo.Items[0].ToString());
        }

        private void setServer()
        {
            XDocument xd = XDocument.Load(new FileStream(Path.Combine(AppContext.BaseDirectory, "config.xml"), FileMode.Open));
            ServerTB.Text = xd.Descendants("Settings").First().Attribute("server").Value;
            ServerTB.Refresh();
        }

        private void setRulebaseYears()
        {
            List<string> yrs = new List<string>();
            var fldrs = _rulebaseLocation.GetDirectories();
            foreach (var folder in fldrs.Where(x => x.Parent.Name == "Rulebases"))
            {
                yrs.Add(folder.Name);
            }

            yearCombo.DataSource = yrs;
            yearCombo.Refresh();
        }

        private void setRulebases(string year)
        {
            List<string> rbs = new List<string>();

            foreach (var fldr in new DirectoryInfo(_rulebaseLocation.FullName + "\\" + year).GetDirectories())
            {
                rbs.Add(fldr.Name);
            }

            rulebaseCombo.DataSource = rbs;
            rulebaseCombo.Refresh();
        }

        private void ExportBtn_Click(object sender, EventArgs e)
        {
            string caseQuery = $"select {(multiProviderCB.Checked ? "UKPRN, " : "")}LearnRefNumber, CaseData from Rulebase.{_selectedRulebase}_Cases";
            if (!Directory.Exists(_writeDir))
            {
                Directory.CreateDirectory(_writeDir);
            }
            var dirInfo = new DirectoryInfo(_writeDir);
            foreach (var file in dirInfo.GetFiles())
            {
                file.Delete();
            }

            string rbPath = _rulebaseLocation.FullName;
            DirectoryInfo xslFolder = new DirectoryInfo(Path.Combine(rbPath, _selectedYear, _selectedRulebase));
            XslCompiledTransform xsl = new XslCompiledTransform();
            var xslFile = xslFolder.GetFiles().First();
            xsl.Load(xslFile.FullName);

            using (SqlConnection con = new SqlConnection($"Data Source={ServerTB.Text};Initial Catalog=intrajob;Integrated Security=SSPI;"))
            {
                try
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand(caseQuery, con))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    int ukprn = multiProviderCB.Checked ? reader.GetInt32(0) : 0;
                                    string lrn = reader.GetString(multiProviderCB.Checked ? 1 : 0);
                                    XmlDocument xml = new XmlDocument();
                                    string invalXML = reader.GetSqlXml(multiProviderCB.Checked ? 2 : 1).Value.ToString();
                                    xml.LoadXml(invalXML);
                                    var ms = new MemoryStream();
                                    xsl.Transform(xml, null, ms);
                                    ms.Position = 0;
                                    File.WriteAllText(Path.Combine(_writeDir, $"{(multiProviderCB.Checked ? ukprn.ToString() + "_" : "")}{lrn}_XDS.xds"), new StreamReader(ms).ReadToEnd());
                                }
                            }
                        }
                    }

                    System.Diagnostics.Process.Start(_writeDir);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void rulebaseCombo_SelectedValueChanged(object sender, EventArgs e)
        {
            _selectedRulebase = rulebaseCombo.SelectedValue.ToString();
        }

        private void yearCombo_SelectedValueChanged(object sender, EventArgs e)
        {
            _selectedYear = yearCombo.SelectedValue.ToString();
            setRulebases(yearCombo.SelectedValue.ToString());
        }
    }
}
