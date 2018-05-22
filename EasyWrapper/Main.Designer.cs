namespace EasyWrapper
{
    partial class Main
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Main));
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.comboBoxVersion = new System.Windows.Forms.ComboBox();
            this.comboBoxYear = new System.Windows.Forms.ComboBox();
            this.buttonRefreshRulebase = new System.Windows.Forms.Button();
            this.buttonRefreshILRDatabase = new System.Windows.Forms.Button();
            this.comboBoxRulebase = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.textBoxSQLInstance = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.comboBoxILRDatabase = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.listBoxLog = new System.Windows.Forms.ListBox();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.runRulebaseToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.rulebaseToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.validationToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.calculationToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.fullSubmissionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exportILRXMLToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.xDSToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.optionsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItemDumpXDS = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItemDebugMode = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItemVerbose = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripComboBoxThreads = new System.Windows.Forms.ToolStripComboBox();
            this.referenceDataToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.xMLManagerToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.textSQLSecurity = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.FixedPanel = System.Windows.Forms.FixedPanel.Panel1;
            this.splitContainer1.Location = new System.Drawing.Point(0, 24);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.textSQLSecurity);
            this.splitContainer1.Panel1.Controls.Add(this.label4);
            this.splitContainer1.Panel1.Controls.Add(this.comboBoxVersion);
            this.splitContainer1.Panel1.Controls.Add(this.comboBoxYear);
            this.splitContainer1.Panel1.Controls.Add(this.buttonRefreshRulebase);
            this.splitContainer1.Panel1.Controls.Add(this.buttonRefreshILRDatabase);
            this.splitContainer1.Panel1.Controls.Add(this.comboBoxRulebase);
            this.splitContainer1.Panel1.Controls.Add(this.label3);
            this.splitContainer1.Panel1.Controls.Add(this.textBoxSQLInstance);
            this.splitContainer1.Panel1.Controls.Add(this.label2);
            this.splitContainer1.Panel1.Controls.Add(this.comboBoxILRDatabase);
            this.splitContainer1.Panel1.Controls.Add(this.label1);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.listBoxLog);
            this.splitContainer1.Size = new System.Drawing.Size(665, 589);
            this.splitContainer1.SplitterDistance = 125;
            this.splitContainer1.TabIndex = 9;
            // 
            // comboBoxVersion
            // 
            this.comboBoxVersion.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxVersion.FormattingEnabled = true;
            this.comboBoxVersion.Location = new System.Drawing.Point(591, 86);
            this.comboBoxVersion.Name = "comboBoxVersion";
            this.comboBoxVersion.Size = new System.Drawing.Size(39, 21);
            this.comboBoxVersion.TabIndex = 26;
            // 
            // comboBoxYear
            // 
            this.comboBoxYear.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxYear.FormattingEnabled = true;
            this.comboBoxYear.Location = new System.Drawing.Point(121, 86);
            this.comboBoxYear.Name = "comboBoxYear";
            this.comboBoxYear.Size = new System.Drawing.Size(55, 21);
            this.comboBoxYear.TabIndex = 25;
            this.comboBoxYear.SelectedIndexChanged += new System.EventHandler(this.comboBoxYear_SelectedIndexChanged);
            // 
            // buttonRefreshRulebase
            // 
            this.buttonRefreshRulebase.Image = ((System.Drawing.Image)(resources.GetObject("buttonRefreshRulebase.Image")));
            this.buttonRefreshRulebase.Location = new System.Drawing.Point(635, 85);
            this.buttonRefreshRulebase.Name = "buttonRefreshRulebase";
            this.buttonRefreshRulebase.Size = new System.Drawing.Size(23, 23);
            this.buttonRefreshRulebase.TabIndex = 16;
            this.buttonRefreshRulebase.UseVisualStyleBackColor = true;
            this.buttonRefreshRulebase.Click += new System.EventHandler(this.buttonRefreshRulebase_Click);
            // 
            // buttonRefreshILRDatabase
            // 
            this.buttonRefreshILRDatabase.Image = ((System.Drawing.Image)(resources.GetObject("buttonRefreshILRDatabase.Image")));
            this.buttonRefreshILRDatabase.Location = new System.Drawing.Point(636, 58);
            this.buttonRefreshILRDatabase.Name = "buttonRefreshILRDatabase";
            this.buttonRefreshILRDatabase.Size = new System.Drawing.Size(23, 23);
            this.buttonRefreshILRDatabase.TabIndex = 15;
            this.buttonRefreshILRDatabase.UseVisualStyleBackColor = true;
            this.buttonRefreshILRDatabase.Click += new System.EventHandler(this.buttonRefreshILRDatabase_Click);
            // 
            // comboBoxRulebase
            // 
            this.comboBoxRulebase.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxRulebase.FormattingEnabled = true;
            this.comboBoxRulebase.Location = new System.Drawing.Point(180, 86);
            this.comboBoxRulebase.Name = "comboBoxRulebase";
            this.comboBoxRulebase.Size = new System.Drawing.Size(407, 21);
            this.comboBoxRulebase.TabIndex = 14;
            this.comboBoxRulebase.SelectedIndexChanged += new System.EventHandler(this.comboBoxRulebase_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 86);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(52, 13);
            this.label3.TabIndex = 13;
            this.label3.Text = "Rulebase";
            // 
            // textBoxSQLInstance
            // 
            this.textBoxSQLInstance.Location = new System.Drawing.Point(121, 7);
            this.textBoxSQLInstance.Name = "textBoxSQLInstance";
            this.textBoxSQLInstance.Size = new System.Drawing.Size(509, 20);
            this.textBoxSQLInstance.TabIndex = 12;
            this.textBoxSQLInstance.Text = "(local)";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 10);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(72, 13);
            this.label2.TabIndex = 11;
            this.label2.Text = "SQL Instance";
            // 
            // comboBoxILRDatabase
            // 
            this.comboBoxILRDatabase.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxILRDatabase.FormattingEnabled = true;
            this.comboBoxILRDatabase.Location = new System.Drawing.Point(121, 59);
            this.comboBoxILRDatabase.Name = "comboBoxILRDatabase";
            this.comboBoxILRDatabase.Size = new System.Drawing.Size(509, 21);
            this.comboBoxILRDatabase.TabIndex = 10;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 60);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(73, 13);
            this.label1.TabIndex = 9;
            this.label1.Text = "ILR Database";
            // 
            // listBoxLog
            // 
            this.listBoxLog.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listBoxLog.FormattingEnabled = true;
            this.listBoxLog.Location = new System.Drawing.Point(0, 0);
            this.listBoxLog.Name = "listBoxLog";
            this.listBoxLog.Size = new System.Drawing.Size(665, 460);
            this.listBoxLog.TabIndex = 0;
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.runRulebaseToolStripMenuItem,
            this.exportILRXMLToolStripMenuItem,
            this.optionsToolStripMenuItem,
            this.exitToolStripMenuItem,
            this.xMLManagerToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(665, 24);
            this.menuStrip1.TabIndex = 10;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // runRulebaseToolStripMenuItem
            // 
            this.runRulebaseToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.rulebaseToolStripMenuItem,
            this.validationToolStripMenuItem,
            this.calculationToolStripMenuItem,
            this.fullSubmissionToolStripMenuItem});
            this.runRulebaseToolStripMenuItem.Name = "runRulebaseToolStripMenuItem";
            this.runRulebaseToolStripMenuItem.Size = new System.Drawing.Size(40, 20);
            this.runRulebaseToolStripMenuItem.Text = "&Run";
            // 
            // rulebaseToolStripMenuItem
            // 
            this.rulebaseToolStripMenuItem.Name = "rulebaseToolStripMenuItem";
            this.rulebaseToolStripMenuItem.Size = new System.Drawing.Size(157, 22);
            this.rulebaseToolStripMenuItem.Text = "Rulebase";
            this.rulebaseToolStripMenuItem.Click += new System.EventHandler(this.rulebaseToolStripMenuItem_Click);
            // 
            // validationToolStripMenuItem
            // 
            this.validationToolStripMenuItem.Name = "validationToolStripMenuItem";
            this.validationToolStripMenuItem.Size = new System.Drawing.Size(157, 22);
            this.validationToolStripMenuItem.Text = "Validation";
            this.validationToolStripMenuItem.Click += new System.EventHandler(this.validationToolStripMenuItem_Click);
            // 
            // calculationToolStripMenuItem
            // 
            this.calculationToolStripMenuItem.Name = "calculationToolStripMenuItem";
            this.calculationToolStripMenuItem.Size = new System.Drawing.Size(157, 22);
            this.calculationToolStripMenuItem.Text = "Calculation";
            this.calculationToolStripMenuItem.Click += new System.EventHandler(this.calculationToolStripMenuItem_Click);
            // 
            // fullSubmissionToolStripMenuItem
            // 
            this.fullSubmissionToolStripMenuItem.Name = "fullSubmissionToolStripMenuItem";
            this.fullSubmissionToolStripMenuItem.Size = new System.Drawing.Size(157, 22);
            this.fullSubmissionToolStripMenuItem.Text = "Full Submission";
            this.fullSubmissionToolStripMenuItem.Click += new System.EventHandler(this.fullSubmissionToolStripMenuItem_Click);
            // 
            // exportILRXMLToolStripMenuItem
            // 
            this.exportILRXMLToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.xDSToolStripMenuItem});
            this.exportILRXMLToolStripMenuItem.Name = "exportILRXMLToolStripMenuItem";
            this.exportILRXMLToolStripMenuItem.Size = new System.Drawing.Size(52, 20);
            this.exportILRXMLToolStripMenuItem.Text = "&Export";
            // 
            // xDSToolStripMenuItem
            // 
            this.xDSToolStripMenuItem.Name = "xDSToolStripMenuItem";
            this.xDSToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.xDSToolStripMenuItem.Text = "XDS";
            this.xDSToolStripMenuItem.Click += new System.EventHandler(this.xdsToolStripMenuItem_Click);
            // 
            // optionsToolStripMenuItem
            // 
            this.optionsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItemDumpXDS,
            this.toolStripMenuItemDebugMode,
            this.toolStripMenuItemVerbose,
            this.toolStripComboBoxThreads,
            this.referenceDataToolStripMenuItem});
            this.optionsToolStripMenuItem.Name = "optionsToolStripMenuItem";
            this.optionsToolStripMenuItem.Size = new System.Drawing.Size(61, 20);
            this.optionsToolStripMenuItem.Text = "Options";
            // 
            // toolStripMenuItemDumpXDS
            // 
            this.toolStripMenuItemDumpXDS.CheckOnClick = true;
            this.toolStripMenuItemDumpXDS.Name = "toolStripMenuItemDumpXDS";
            this.toolStripMenuItemDumpXDS.Size = new System.Drawing.Size(181, 22);
            this.toolStripMenuItemDumpXDS.Text = "Dump &XDS";
            // 
            // toolStripMenuItemDebugMode
            // 
            this.toolStripMenuItemDebugMode.CheckOnClick = true;
            this.toolStripMenuItemDebugMode.Name = "toolStripMenuItemDebugMode";
            this.toolStripMenuItemDebugMode.Size = new System.Drawing.Size(181, 22);
            this.toolStripMenuItemDebugMode.Text = "&Debug Mode";
            // 
            // toolStripMenuItemVerbose
            // 
            this.toolStripMenuItemVerbose.CheckOnClick = true;
            this.toolStripMenuItemVerbose.Name = "toolStripMenuItemVerbose";
            this.toolStripMenuItemVerbose.Size = new System.Drawing.Size(181, 22);
            this.toolStripMenuItemVerbose.Text = "&Verbose";
            // 
            // toolStripComboBoxThreads
            // 
            this.toolStripComboBoxThreads.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.toolStripComboBoxThreads.Items.AddRange(new object[] {
            "1 thread",
            "2 threads",
            "4 threads",
            "8 threads",
            "12 threads",
            "16 threads"});
            this.toolStripComboBoxThreads.Name = "toolStripComboBoxThreads";
            this.toolStripComboBoxThreads.Size = new System.Drawing.Size(121, 23);
            // 
            // referenceDataToolStripMenuItem
            // 
            this.referenceDataToolStripMenuItem.Name = "referenceDataToolStripMenuItem";
            this.referenceDataToolStripMenuItem.Size = new System.Drawing.Size(181, 22);
            this.referenceDataToolStripMenuItem.Text = "Reference &Data";
            this.referenceDataToolStripMenuItem.Click += new System.EventHandler(this.referenceDataToolStripMenuItem_Click);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(37, 20);
            this.exitToolStripMenuItem.Text = "E&xit";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // xMLManagerToolStripMenuItem
            // 
            this.xMLManagerToolStripMenuItem.Name = "xMLManagerToolStripMenuItem";
            this.xMLManagerToolStripMenuItem.Size = new System.Drawing.Size(93, 20);
            this.xMLManagerToolStripMenuItem.Text = "XML Manager";
            this.xMLManagerToolStripMenuItem.Click += new System.EventHandler(this.xMLManagerToolStripMenuItem_Click);
            // 
            // textSQLSecurity
            // 
            this.textSQLSecurity.Location = new System.Drawing.Point(121, 33);
            this.textSQLSecurity.Name = "textSQLSecurity";
            this.textSQLSecurity.Size = new System.Drawing.Size(509, 20);
            this.textSQLSecurity.TabIndex = 28;
            this.textSQLSecurity.Text = "Integrated Security=false;User Id=<<userid>>;password=<<password>>";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(13, 36);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(45, 13);
            this.label4.TabIndex = 27;
            this.label4.Text = "Security";
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(665, 613);
            this.Controls.Add(this.splitContainer1);
            this.Controls.Add(this.menuStrip1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Main";
            this.Text = "Easy OPA Wrapper";
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel1.PerformLayout();
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.Button buttonRefreshRulebase;
        private System.Windows.Forms.Button buttonRefreshILRDatabase;
        private System.Windows.Forms.ComboBox comboBoxRulebase;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBoxSQLInstance;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox comboBoxILRDatabase;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ListBox listBoxLog;
        private System.Windows.Forms.ComboBox comboBoxYear;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem runRulebaseToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exportILRXMLToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem optionsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItemDumpXDS;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItemDebugMode;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItemVerbose;
        private System.Windows.Forms.ToolStripComboBox toolStripComboBoxThreads;
        private System.Windows.Forms.ToolStripMenuItem referenceDataToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem xDSToolStripMenuItem;
        private System.Windows.Forms.ComboBox comboBoxVersion;
        private System.Windows.Forms.ToolStripMenuItem xMLManagerToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem rulebaseToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem validationToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem calculationToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem fullSubmissionToolStripMenuItem;
        private System.Windows.Forms.TextBox textSQLSecurity;
        private System.Windows.Forms.Label label4;
    }
}