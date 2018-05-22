using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;
using System.Xml;

namespace EasyWrapper
{
    public partial class ReferenceData : Form
    {
        private Dictionary<string,List<string>> databases;
        private string server;
        private XmlDocument settingsXML;

        public ReferenceData(string Server)
        {
            InitializeComponent();

            this.server = Server;
            databases = GetDatabaseList(this.server);

            settingsXML = new XmlDocument();
            settingsXML.Load(Application.StartupPath + @"\config.xml");

            BuildForm();
        }

        private Dictionary<string, List<string>> GetDatabaseList(string Server)
        {
            List<string> databaseNames = new List<string>();

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            builder.DataSource = Server;
            builder.InitialCatalog = "master";
            builder.IntegratedSecurity = true;

            SqlConnection master = new SqlConnection(builder.ConnectionString);
            master.Open();

            SqlCommand cmd = new SqlCommand("select name from sys.databases where owner_sid<>1 and state_desc='ONLINE' order by name", master);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                databaseNames.Add(reader.GetString(0));
            reader.Close();

            Dictionary<string, List<string>> databaseSchemas = new Dictionary<string, List<string>>();

            foreach (string databaseName in databaseNames)
            {
                List<string> schemaNames = new List<string>();
                cmd.CommandText = "select name from [" + databaseName + "].sys.schemas where name not in ('sys','INFORMATION_SCHEMA') and name not like 'db__%' order by name";
                reader = cmd.ExecuteReader();
                while (reader.Read())
                    schemaNames.Add(reader.GetString(0));
                reader.Close();
                databaseSchemas.Add(databaseName, schemaNames);
            }

            master.Close();

            return databaseSchemas;
        }

        private void BuildForm()
        {
            int spacing = 5;
            int row = 0;
            int rowHeight = 23;
            int comboWidth = 300;
            int databaseComboLeft = 120;
            int schemaComboLeft = 425;

            XmlNodeList databaseAliasNodes = settingsXML.SelectNodes("Settings/databaseAlias");
            foreach (XmlNode databaseAliasNode in databaseAliasNodes)
            {
                row++;

                Label databaseLabel = new Label();
                databaseLabel.Text = databaseAliasNode.Attributes["alias"].Value.Replace("$(", "").Replace(")", "");
                databaseLabel.Top = (row * (rowHeight + spacing)) - rowHeight;
                databaseLabel.Left = spacing;
                this.Controls.Add(databaseLabel);

                ComboBox databaseCombo = new ComboBox();
                databaseCombo.Name = databaseAliasNode.Attributes["alias"].Value;
                databaseCombo.Top = (row * (rowHeight + spacing)) - rowHeight;
                databaseCombo.Left = databaseComboLeft;
                databaseCombo.Width = comboWidth;
                databaseCombo.Items.AddRange(databases.Keys.ToArray());

                ComboBox schemaCombo = new ComboBox();
                schemaCombo.Name = databaseAliasNode.Attributes["schemaAlias"].Value;
                schemaCombo.Top = (row * (rowHeight + spacing)) - rowHeight;
                schemaCombo.Left = schemaComboLeft;
                schemaCombo.Width = comboWidth;
                EventArgs e = new EventArgs();

                for (int i = 0; i < databaseCombo.Items.Count; i++)
                    if ((string)databaseCombo.Items[i] == databaseAliasNode.Attributes["name"].Value)
                    {
                        databaseCombo.SelectedIndex = i;
                        schemaCombo.Items.AddRange(databases[databaseAliasNode.Attributes["name"].Value].ToArray());
                        for (int j = 0; j < schemaCombo.Items.Count; j++)
                            if ((string)schemaCombo.Items[j] == databaseAliasNode.Attributes["schemaName"].Value)
                            {
                                schemaCombo.SelectedIndex = j;
                                break;
                            } 
                        break;
                    }
                this.Controls.Add(databaseCombo);
                this.Controls.Add(schemaCombo);
                databaseCombo.SelectedIndexChanged += new EventHandler(databaseCombo_SelectedIndexChanged);         
            }
            row++;
            buttonSave.Top = (row * (rowHeight + spacing)) - rowHeight;
            buttonSave.Left = (schemaComboLeft + comboWidth) - buttonSave.Width;
            buttonCancel.Top = (row * (rowHeight + spacing)) - rowHeight;
            buttonCancel.Left = buttonSave.Left - (buttonCancel.Width + spacing);
            this.Width = schemaComboLeft + comboWidth + spacing + 22;
            this.Height = buttonSave.Top + buttonSave.Height + spacing + 42;
        }

        private void databaseCombo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ComboBox databaseCombo = (ComboBox)sender;
            ComboBox schemaCombo = (ComboBox)this.Controls[databaseCombo.Name.Replace(")", "_Schema)")];
            string currentSchema = schemaCombo.Text;
            schemaCombo.Items.Clear();
            schemaCombo.Items.AddRange(databases[databaseCombo.Text].ToArray());
            if (schemaCombo.Items.Contains(currentSchema))
                schemaCombo.Text = currentSchema;
            else
                schemaCombo.SelectedIndex = 0;

        }

        private void buttonSave_Click(object sender, EventArgs e)
        {
            XmlNodeList databaseAliasNodes = settingsXML.SelectNodes("Settings/databaseAlias");
            foreach (XmlNode databaseAliasNode in databaseAliasNodes)
            {
                databaseAliasNode.Attributes["name"].Value = this.Controls[databaseAliasNode.Attributes["alias"].Value].Text;
                databaseAliasNode.Attributes["schemaName"].Value = this.Controls[databaseAliasNode.Attributes["schemaAlias"].Value].Text;
            }
            settingsXML.Save(Application.StartupPath + @"\config.xml");
            this.Close();
        }
    }
}
