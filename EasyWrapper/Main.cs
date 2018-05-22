using EasyWrapper.Executor;
using EasyWrapper.Exports;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;

namespace EasyWrapper
{
    public partial class Main : Form
    {
        private const string assetsFolder = "Assets";
        private const string ILRFolder = "ILR";

        private List<string> databases;
        private Dictionary<string, string> configuredDatabases;

        private IExecuteSingleRulebase _singleExecutor = new SingleExecutor();
        private IExecuteValidation _valExecutor = new ValidationExecutor();
        private IExecuteCalculation _calcExecutor = new CalculationExecutor();

        private int defaultTimeout = 30;

        private Dictionary<string, string> aliases;

        public Main()
        {
            InitializeComponent();

            try
            {
                LoadSettings();
                if (textBoxSQLInstance.Text.Length > 0)
                {
                    try
                    {
                        RefreshDatbaseCombo(this.comboBoxILRDatabase);
                    }
                    catch (Exception ex)
                    {
                        if (ex.Message.StartsWith("A network-related or instance-specific error occurred while establishing a connection to SQL Server."))
                            MessageBox.Show("Specified SQL Server not found!");
                        else
                            MessageBox.Show("Bad things happened when trying to list the databases on the specified SQL Server! I got this exception:" + ex.Message);
                    }
                }
                else
                    MessageBox.Show("Please specify a SQL Server instance to use.");
                RefreshYearCombo(this.comboBoxYear);
                RefreshRulbaseCombo(this.comboBoxYear, this.comboBoxRulebase);
                RefreshVersionCombo(this.comboBoxYear, this.comboBoxRulebase, this.comboBoxVersion);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Bad things happened during initialisation! I got this exception:" + ex.Message);
            }
        }

        private string GetILRAssetFolder()
        {
            return Path.Combine(AppContext.BaseDirectory, assetsFolder, ILRFolder);
        }

        private void RefreshYearCombo(ComboBox YearCombo)
        {
            string selectedValue = null;
            if (configuredDatabases.ContainsKey(YearCombo.Name))
                selectedValue = configuredDatabases[YearCombo.Name];
            YearCombo.Items.Clear();

            var folder = new DirectoryInfo(GetILRAssetFolder());

            foreach (DirectoryInfo subfolder in folder.GetDirectories())
                YearCombo.Items.Add(subfolder.Name);

            for (int i = 0; i < YearCombo.Items.Count; i++)
                if ((string)YearCombo.Items[i] == selectedValue)
                {
                    YearCombo.SelectedIndex = i;
                    break;
                }
            if (YearCombo.SelectedIndex == -1 && YearCombo.Items.Count > 0)
                YearCombo.SelectedIndex = 0;
        }

        private void RefreshRulbaseCombo(ComboBox YearCombo, ComboBox RulebaseCombo)
        {
            string selectedValue = null;
            if (configuredDatabases.ContainsKey(RulebaseCombo.Name))
                selectedValue = configuredDatabases[RulebaseCombo.Name];
            RulebaseCombo.Items.Clear();

            var folder = new DirectoryInfo(Path.Combine(GetILRAssetFolder(), YearCombo.Text));

            foreach (DirectoryInfo subfolder in folder.GetDirectories().Where(f => f.Name != "Export"))
                RulebaseCombo.Items.Add(subfolder.Name);

            for (int i = 0; i < RulebaseCombo.Items.Count; i++)
                if ((string)RulebaseCombo.Items[i] == selectedValue)
                {
                    RulebaseCombo.SelectedIndex = i;
                    break;
                }
        }

        private void RefreshVersionCombo(ComboBox YearCombo, ComboBox RulebaseCombo, ComboBox VersionCombo)
        {
            string selectedValue = null;
            if (configuredDatabases.ContainsKey(VersionCombo.Name))
                selectedValue = configuredDatabases[VersionCombo.Name];
            VersionCombo.Items.Clear();

            var folder = new DirectoryInfo(Path.Combine(GetILRAssetFolder(), YearCombo.Text, RulebaseCombo.Text));

            foreach (DirectoryInfo subfolder in folder.GetDirectories().OrderByDescending(f => f.Name))
                VersionCombo.Items.Add(subfolder.Name);

            if (VersionCombo.Items.Count > 0)
                VersionCombo.SelectedIndex = 0;

            for (int i = 0; i < VersionCombo.Items.Count; i++)
                if ((string)VersionCombo.Items[i] == selectedValue)
                {
                    VersionCombo.SelectedIndex = i;
                    break;
                }
        }

        private void RefreshDatbaseCombo(ComboBox DatabaseCombo)
        {
            databases = GetDatabaseList(this.textBoxSQLInstance.Text, this.textSQLSecurity.Text);
            string selectedValue = null;
            if (configuredDatabases.ContainsKey(DatabaseCombo.Name))
                selectedValue = configuredDatabases[DatabaseCombo.Name];
            DatabaseCombo.Items.Clear();
            DatabaseCombo.Items.AddRange(databases.ToArray());

            for (int i = 0; i < DatabaseCombo.Items.Count; i++)
                if ((string)DatabaseCombo.Items[i] == selectedValue)
                {
                    DatabaseCombo.SelectedIndex = i;
                    break;
                }
        }

        #region Event Handlers

        private void buttonRefreshILRDatabase_Click(object sender, EventArgs e)
        {
            if (this.textBoxSQLInstance.Text.Length > 0)
            {
                try
                {
                    RefreshDatbaseCombo(this.comboBoxILRDatabase);
                }
                catch (Exception ex)
                {
                    if (ex.Message.StartsWith("A network-related or instance-specific error occurred while establishing a connection to SQL Server."))
                        MessageBox.Show("Specified SQL Server not found!");
                    else
                        MessageBox.Show("Bad things happened when trying to list the databases on the specified SQL Server! I got this exception:" + ex.Message);
                }
            }
            else
                MessageBox.Show("Please specify a SQL Server instance to use.");
        }

        private void buttonRefreshRulebase_Click(object sender, EventArgs e)
        {
            RefreshYearCombo(this.comboBoxYear);
            RefreshRulbaseCombo(this.comboBoxYear, this.comboBoxRulebase);
        }

        private void RefDataFormClosedHandler(object sender, EventArgs e)
        {
            LoadSettings();
        }

        private void comboBoxYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                RefreshRulbaseCombo(this.comboBoxYear, this.comboBoxRulebase);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Bad things happened looking for rulebases! I got this exception:" + ex.Message);
            }
        }

        private void comboBoxRulebase_SelectedIndexChanged(object sender, EventArgs e)
        {
            RefreshVersionCombo(this.comboBoxYear, this.comboBoxRulebase, this.comboBoxVersion);
        }

        #endregion

        #region Menu handlers       
        private void referenceDataToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SaveSettings();
            var refDataForm = new ReferenceData(this.textBoxSQLInstance.Text);
            refDataForm.FormClosed += new FormClosedEventHandler(RefDataFormClosedHandler);
            refDataForm.ShowDialog();
        }
        private void ilrFileToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Cursor.Current = Cursors.WaitCursor;


            Cursor.Current = Cursors.Default;
        }
        private void xdsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Cursor.Current = Cursors.WaitCursor;
            //Export_XDS();
            //Cursor.Current = Cursors.Default;
            MessageBox.Show("No longer supported please use the xml manager");
        }
        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        #endregion

        #region Export ILR
        private void Export_ILR()
        {
            //Save settings
            SaveSettings();

            Log("Starting export....");

            //Open the database
            SqlConnection conn = GetConnection(this.comboBoxILRDatabase.Text);
            conn.Open();

            //Get source ILR data schema name
            string ilrSchemaName = GetSourceILRSchemaName(conn);
            string exportResourcesFolder = Path.Combine(GetILRAssetFolder(), this.comboBoxYear.Text, "Export");
            string ukprn = null;

            //Make sure the output folder exists
            if (!Directory.Exists("ILR Exports"))
                Directory.CreateDirectory("ILR Exports");

            //Check if we're dealing with a DB that contains multiple providers
            bool multipleProviders = SeeIfILRDataHasMultipleProviders(conn, ilrSchemaName);

            if (multipleProviders)
                ukprn = Prompt.ShowDialog("Enter UKPRN", "UKPRN");
            else
                ukprn = ExecuteScalar(conn, "select UKPRN from LearningProvider").ToString();

            //Calculate the output file name
            string outfile = @"ILR Exports\ILR-" + ukprn + "-1617-" + DateTime.Now.ToString("yyyyMMdd-hhmmss") + "-01.xml";

            //Open the writer
            TextWriter writer = File.CreateText(outfile);

            //Get the template
            foreach (string line in File.ReadLines(exportResourcesFolder + "Template.txt"))
            {
                if (line.StartsWith("$(XMLScript:"))
                {
                    string scriptName = line.Substring(12, line.LastIndexOf(')') - 12);
                    object output;
                    if (multipleProviders)
                        output = ExecuteScalar(conn, File.ReadAllText(exportResourcesFolder + @"Multiple\" + scriptName).Replace("$(UKPRN)", ukprn));
                    else
                        output = ExecuteScalar(conn, File.ReadAllText(exportResourcesFolder + @"Single\" + scriptName));
                    if (output != null && output is string && ((string)output).Length > 0)
                        writer.WriteLine(output);
                }
                else
                    writer.WriteLine(line.Replace("$(UKPRN)", ukprn));
            }

            Log("....export complete");

            //Tidy up
            writer.Close();
            conn.Close();

        }
        #endregion

        #region Export XDS
        private void Export_XDS()
        {
            string xslPath = Directory.GetFiles($"/Resources/ILR/{comboBoxYear.Text}/{comboBoxRulebase.Text}/{comboBoxVersion.Text}", "*.xsl").FirstOrDefault();
            XDSExporter xe = new XDSExporter(Regex.Matches(comboBoxRulebase.Text, "[A-Z]{3}")[0].Value, GetConnection("Intrajob"), xslPath);
            xe.Export();
        }
        #endregion

        #region Utility methods

        private List<string> GetDatabaseList(string Server, string security)
        {
            List<string> dbList = new List<string>();

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            builder.DataSource = Server;
            builder.InitialCatalog = "master";

            var connectionString = builder.ConnectionString;
            connectionString += $";{security}";

            // Data Source = dcfsbatchjobtest.database.windows.net; Initial Catalog = batchjobtest; Integrated Security = False; User ID = hal; Password = ********; Connect Timeout = 15; Encrypt = False; TrustServerCertificate = True; ApplicationIntent = ReadWrite; MultiSubnetFailover = False

            SqlConnection master = new SqlConnection(connectionString);
            master.Open();

            SqlCommand cmd = new SqlCommand("select name from sys.databases where owner_sid<>1 order by name", master);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                dbList.Add(reader.GetString(0));

            reader.Close();
            master.Close();

            return dbList;
        }

        private string GetSourceILRSchemaName(SqlConnection IntrajobConnection)
        {
            var cmd = new SqlCommand()
            {
                Connection = IntrajobConnection,
                CommandText = string.Format("select s.Name from [{0}].sys.tables as t join [{0}].sys.schemas as s on t.schema_id = s.schema_id where t.Name = 'LearningProvider'", this.comboBoxILRDatabase.Text)
            };
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                string val = dt.Rows[0].ItemArray[0].ToString();
                return val;
            }
        }

        private bool SeeIfILRDataHasMultipleProviders(SqlConnection IntrajobConnection, string ILRSchemaName)
        {
            SqlCommand cmd = new SqlCommand("select case when count(*)>1 then cast(1 as bit) else cast (0 as bit) end IsMultiple from [" + this.comboBoxILRDatabase.Text + "].[" + ILRSchemaName + "].LearningProvider", IntrajobConnection);
            return (bool)cmd.ExecuteScalar();
        }

        private List<string> SplitScriptGo(string script)
        {
            var result = new List<string>();
            int pos1 = 0;
            int pos2 = 0;
            bool whiteSpace = true;
            bool emptyLine = true;
            bool inStr = false;
            bool inComment1 = false;
            bool inComment2 = false;

            while (true)
            {
                while (pos2 < script.Length && Char.IsWhiteSpace(script[pos2]))
                {
                    if (script[pos2] == '\r' || script[pos2] == '\n')
                    {
                        emptyLine = true;
                        inComment1 = false;
                    }

                    pos2++;
                }

                if (pos2 == script.Length)
                    break;

                bool min2 = (pos2 + 1) < script.Length;
                bool min3 = (pos2 + 2) < script.Length;

                if (!inStr && !inComment2 && min2 && script.Substring(pos2, 2) == "--")
                    inComment1 = true;

                if (!inStr && !inComment1 && min2 && script.Substring(pos2, 2) == "/*")
                    inComment2 = true;

                if (!inComment1 && !inComment2 && script[pos2] == '\'')
                    inStr = !inStr;

                if (!inStr && !inComment1 && !inComment2 && emptyLine
                    && (min2 && script.Substring(pos2, 2).ToLower() == "go")
                    && (!min3 || char.IsWhiteSpace(script[pos2 + 2]) || script.Substring(pos2 + 2, 2) == "--" || script.Substring(pos2 + 2, 2) == "/*"))
                {
                    if (!whiteSpace)
                        result.Add(script.Substring(pos1, pos2 - pos1));

                    whiteSpace = true;
                    emptyLine = false;
                    pos2 += 2;
                    pos1 = pos2;
                }
                else
                {
                    pos2++;
                    whiteSpace = false;

                    if (!inComment2)
                        emptyLine = false;
                }

                if (!inStr && inComment2 && pos2 > 1 && script.Substring(pos2 - 2, 2) == "*/")
                    inComment2 = false;
            }

            if (!whiteSpace)
                result.Add(script.Substring(pos1));

            return result;
        }

        private static object ExecuteScalar(SqlConnection Connection, string SQL)
        {
            SqlCommand command = new SqlCommand(SQL);
            command.CommandType = CommandType.Text;
            command.Connection = Connection;
            command.CommandTimeout = 900;
            return command.ExecuteScalar();
        }

        private SqlConnection GetConnection(string DatabaseName)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            builder.DataSource = this.textBoxSQLInstance.Text;
            builder.InitialCatalog = DatabaseName;
            builder.IntegratedSecurity = true;
            builder.MultipleActiveResultSets = true;
            Log("Opening SQL server connection to " + DatabaseName);
            return new SqlConnection(builder.ConnectionString);
        }

        #endregion

        #region Logging
        private void ClearLoggingDB(string ConnectionString)
        {
            //SqlConnection conn = new SqlConnection(ConnectionString);
            //conn.Open();

            //StringBuilder logQ = new StringBuilder();


            //SqlCommand cmd = new SqlCommand("exec ClearLogs", conn);
            //cmd.ExecuteNonQuery();

            //conn.Close();
        }

        public void updateConsole(string msg)
        {
            Invoke(new Action(() => Log(msg)));
        }

        public void HandleError(string msg)
        {
            Invoke(new Action(() => MessageBox.Show(msg, "Execution Error", MessageBoxButtons.OK, MessageBoxIcon.Error)));
        }

        private DateTime _lastLoggedTime = DateTime.Now;
        private void Log(string Message)
        {
            DateTime now = DateTime.Now;
            TimeSpan invocationTime = this.listBoxLog.Items.Count == 0 ? TimeSpan.Zero : now - _lastLoggedTime;
            _lastLoggedTime = now;


            string item = now.ToLongTimeString() + " " + Message + $" (previous step {invocationTime.TotalSeconds})";
            this.listBoxLog.Items.Insert(0, item);
            this.listBoxLog.Refresh();
        }
        #endregion

        #region Settings

        private void SaveSettings()
        {
            Log("Saving settings");
            XmlDocument settingsXML = new XmlDocument();
            XmlElement activeConfigNode;

            if (File.Exists(Application.StartupPath + @"\config.xml"))
            {
                settingsXML.Load(Application.StartupPath + @"\config.xml");
                activeConfigNode = settingsXML.DocumentElement;
            }
            else
            {
                activeConfigNode = settingsXML.CreateElement("Settings");
                settingsXML.AppendChild(activeConfigNode);
            }

            activeConfigNode.SetAttribute("server", this.textBoxSQLInstance.Text);
            activeConfigNode.SetAttribute("security", this.textSQLSecurity.Text);
            if (this.comboBoxILRDatabase.SelectedIndex != -1)
                activeConfigNode.SetAttribute("ilrDB", this.comboBoxILRDatabase.Text);
            if (this.comboBoxYear.SelectedIndex != -1)
                activeConfigNode.SetAttribute("year", this.comboBoxYear.Text);
            if (this.comboBoxRulebase.SelectedIndex != -1)
                activeConfigNode.SetAttribute("rulebase", this.comboBoxRulebase.Text);
            if (this.comboBoxVersion.SelectedIndex != -1)
                activeConfigNode.SetAttribute("version", this.comboBoxVersion.Text);
            activeConfigNode.SetAttribute("verbose", (toolStripMenuItemVerbose.Checked ? "true" : "false"));
            activeConfigNode.SetAttribute("threads", toolStripComboBoxThreads.Text.Substring(0, 2).TrimEnd());

            settingsXML.Save(Application.StartupPath + @"\config.xml");
            Log("Settings saved");
        }

        private void LoadSettings()
        {
            Log("Loading settings");

            configuredDatabases = new Dictionary<string, string>();
            this.aliases = new Dictionary<string, string>();

            if (File.Exists(Application.StartupPath + @"\config.xml"))
            {
                XmlDocument settingsXML = new XmlDocument();
                settingsXML.Load(Application.StartupPath + @"\config.xml");

                XmlElement configNode = settingsXML.DocumentElement;

                if (configNode.Attributes["server"] != null)
                    this.textBoxSQLInstance.Text = configNode.Attributes["server"].Value;

                if (configNode.Attributes["security"] != null)
                    this.textSQLSecurity.Text = configNode.Attributes["security"].Value;

                if (configNode.Attributes["ilrDB"] != null)
                    configuredDatabases.Add("comboBoxILRDatabase", configNode.Attributes["ilrDB"].Value);

                if (configNode.Attributes["year"] != null)
                    configuredDatabases.Add("comboBoxYear", configNode.Attributes["year"].Value);

                if (configNode.Attributes["rulebase"] != null)
                    configuredDatabases.Add("comboBoxRulebase", configNode.Attributes["rulebase"].Value);

                if (configNode.Attributes["version"] != null)
                    configuredDatabases.Add("comboBoxVersion", configNode.Attributes["version"].Value);

                if (configNode.Attributes["verbose"] != null && configNode.Attributes["verbose"].Value.ToLower() == "true")
                    toolStripMenuItemVerbose.Checked = true;

                if (configNode.Attributes["threads"] != null)
                    toolStripComboBoxThreads.Text = configNode.Attributes["threads"].Value + " thread" + (configNode.Attributes["threads"].Value != "1" ? "s" : "");
                else
                    toolStripComboBoxThreads.Text = "8 threads";

                if (configNode.Attributes["commandTimeout"] != null)
                {
                    defaultTimeout = Int32.Parse(configNode.Attributes["commandTimeout"].Value);
                    Log("....default command timeout configured to " + defaultTimeout.ToString());
                }

                XmlNodeList databaseAliasNodes = configNode.SelectNodes("databaseAlias");
                foreach (XmlNode databaseAliasNode in databaseAliasNodes)
                {
                    aliases.Add(databaseAliasNode.Attributes["alias"].Value, databaseAliasNode.Attributes["name"].Value);
                    aliases.Add(databaseAliasNode.Attributes["schemaAlias"].Value, databaseAliasNode.Attributes["schemaName"].Value);
                }
                Log("...." + aliases.Count.ToString() + " database aliases found");

            }

            Log("Settings loaded");
        }

        #endregion

        private void xMLManagerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Process.Start("xmlLoader");
            //    var xmlTool = new Form1();
            //    xmlTool.ShowDialog();
        }

        private void rulebaseToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SaveSettings();

            var rulebase = comboBoxRulebase.Text;
            var version = comboBoxVersion.Text;
            var year = comboBoxYear.Text;
            var instance = textBoxSQLInstance.Text;
            var database = comboBoxILRDatabase.Text;
            var security = textSQLSecurity.Text;

            Task.Run(() => _singleExecutor.Execute(rulebase, version, year, instance, database, security, updateConsole, HandleError, defaultTimeout));
        }

        private void validationToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SaveSettings();

            var year = comboBoxYear.Text;
            var instance = textBoxSQLInstance.Text;
            var database = comboBoxILRDatabase.Text;
            var security = textSQLSecurity.Text;

            Task.Run(() => _valExecutor.Execute(year, instance, database, security, updateConsole, HandleError, defaultTimeout));
        }

        private void calculationToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SaveSettings();

            var year = comboBoxYear.Text;
            var instance = textBoxSQLInstance.Text;
            var database = comboBoxILRDatabase.Text;
            var security = textSQLSecurity.Text;

            Task.Run(() => _calcExecutor.Execute(year, instance, database, security, updateConsole, HandleError, defaultTimeout));
        }

        private void fullSubmissionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Sorry not implemented yet.");
        }
    }
}