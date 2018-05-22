namespace XMLLoader
{
    partial class Form1
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
            this.button1 = new System.Windows.Forms.Button();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.ErrorBtn = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.textILRFile = new System.Windows.Forms.TextBox();
            this.IlrFileBrowseBtn = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.textServer = new System.Windows.Forms.TextBox();
            this.textDatabase = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.IlrXsdBrowseBtn = new System.Windows.Forms.Button();
            this.textILRSchema = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.checkAddIdentity = new System.Windows.Forms.CheckBox();
            this.checkCreateTables = new System.Windows.Forms.CheckBox();
            this.label5 = new System.Windows.Forms.Label();
            this.textBulkLoadSchema = new System.Windows.Forms.TextBox();
            this.ExportBtn = new System.Windows.Forms.Button();
            this.ConnectionTestBtn = new System.Windows.Forms.Button();
            this.checkUseFileName = new System.Windows.Forms.CheckBox();
            this.XDSExportBtn = new System.Windows.Forms.Button();
            this.efaExportBtn = new System.Windows.Forms.Button();
            this.ukprnLabel = new System.Windows.Forms.Label();
            this.textUKPRN = new System.Windows.Forms.TextBox();
            this.textSQLSecurity = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(334, 348);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 0;
            this.button1.Text = "&Load";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.LoadBtn_Click);
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(16, 276);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(670, 69);
            this.listBox1.TabIndex = 1;
            // 
            // ErrorBtn
            // 
            this.ErrorBtn.Enabled = false;
            this.ErrorBtn.Location = new System.Drawing.Point(16, 351);
            this.ErrorBtn.Name = "ErrorBtn";
            this.ErrorBtn.Size = new System.Drawing.Size(75, 23);
            this.ErrorBtn.TabIndex = 2;
            this.ErrorBtn.Text = "&Error";
            this.ErrorBtn.UseVisualStyleBackColor = true;
            this.ErrorBtn.Click += new System.EventHandler(this.ErrorBtn_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(43, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "ILR File";
            // 
            // textILRFile
            // 
            this.textILRFile.Location = new System.Drawing.Point(123, 12);
            this.textILRFile.Name = "textILRFile";
            this.textILRFile.Size = new System.Drawing.Size(528, 20);
            this.textILRFile.TabIndex = 5;
            // 
            // IlrFileBrowseBtn
            // 
            this.IlrFileBrowseBtn.Location = new System.Drawing.Point(657, 12);
            this.IlrFileBrowseBtn.Name = "IlrFileBrowseBtn";
            this.IlrFileBrowseBtn.Size = new System.Drawing.Size(29, 23);
            this.IlrFileBrowseBtn.TabIndex = 6;
            this.IlrFileBrowseBtn.Text = "...";
            this.IlrFileBrowseBtn.UseVisualStyleBackColor = true;
            this.IlrFileBrowseBtn.Click += new System.EventHandler(this.IlrFileBrowseBtn_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 68);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(62, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "SQL Server";
            // 
            // textServer
            // 
            this.textServer.Location = new System.Drawing.Point(123, 64);
            this.textServer.Name = "textServer";
            this.textServer.Size = new System.Drawing.Size(192, 20);
            this.textServer.TabIndex = 8;
            // 
            // textDatabase
            // 
            this.textDatabase.Location = new System.Drawing.Point(417, 64);
            this.textDatabase.Name = "textDatabase";
            this.textDatabase.Size = new System.Drawing.Size(202, 20);
            this.textDatabase.TabIndex = 10;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(358, 67);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(53, 13);
            this.label3.TabIndex = 9;
            this.label3.Text = "Database";
            // 
            // IlrXsdBrowseBtn
            // 
            this.IlrXsdBrowseBtn.Location = new System.Drawing.Point(657, 38);
            this.IlrXsdBrowseBtn.Name = "IlrXsdBrowseBtn";
            this.IlrXsdBrowseBtn.Size = new System.Drawing.Size(29, 23);
            this.IlrXsdBrowseBtn.TabIndex = 13;
            this.IlrXsdBrowseBtn.Text = "...";
            this.IlrXsdBrowseBtn.UseVisualStyleBackColor = true;
            this.IlrXsdBrowseBtn.Click += new System.EventHandler(this.IlrXsdBrowseBtn_Click);
            // 
            // textILRSchema
            // 
            this.textILRSchema.Location = new System.Drawing.Point(123, 38);
            this.textILRSchema.Name = "textILRSchema";
            this.textILRSchema.Size = new System.Drawing.Size(528, 20);
            this.textILRSchema.TabIndex = 12;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(13, 41);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(66, 13);
            this.label4.TabIndex = 11;
            this.label4.Text = "ILR Schema";
            // 
            // checkAddIdentity
            // 
            this.checkAddIdentity.AutoSize = true;
            this.checkAddIdentity.Location = new System.Drawing.Point(123, 219);
            this.checkAddIdentity.Name = "checkAddIdentity";
            this.checkAddIdentity.Size = new System.Drawing.Size(82, 17);
            this.checkAddIdentity.TabIndex = 14;
            this.checkAddIdentity.Text = "Add Identity";
            this.checkAddIdentity.UseVisualStyleBackColor = true;
            // 
            // checkCreateTables
            // 
            this.checkCreateTables.AutoSize = true;
            this.checkCreateTables.Location = new System.Drawing.Point(123, 196);
            this.checkCreateTables.Name = "checkCreateTables";
            this.checkCreateTables.Size = new System.Drawing.Size(92, 17);
            this.checkCreateTables.TabIndex = 15;
            this.checkCreateTables.Text = "Create Tables";
            this.checkCreateTables.UseVisualStyleBackColor = true;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(13, 248);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(97, 13);
            this.label5.TabIndex = 16;
            this.label5.Text = "Bulk Load Schema";
            // 
            // textBulkLoadSchema
            // 
            this.textBulkLoadSchema.Location = new System.Drawing.Point(123, 245);
            this.textBulkLoadSchema.Name = "textBulkLoadSchema";
            this.textBulkLoadSchema.Size = new System.Drawing.Size(563, 20);
            this.textBulkLoadSchema.TabIndex = 17;
            // 
            // ExportBtn
            // 
            this.ExportBtn.Location = new System.Drawing.Point(417, 348);
            this.ExportBtn.Name = "ExportBtn";
            this.ExportBtn.Size = new System.Drawing.Size(75, 23);
            this.ExportBtn.TabIndex = 18;
            this.ExportBtn.Text = "E&xport";
            this.ExportBtn.UseVisualStyleBackColor = true;
            this.ExportBtn.Click += new System.EventHandler(this.ExportBtn_Click);
            // 
            // ConnectionTestBtn
            // 
            this.ConnectionTestBtn.Location = new System.Drawing.Point(641, 64);
            this.ConnectionTestBtn.Name = "ConnectionTestBtn";
            this.ConnectionTestBtn.Size = new System.Drawing.Size(45, 20);
            this.ConnectionTestBtn.TabIndex = 19;
            this.ConnectionTestBtn.Text = "Test";
            this.ConnectionTestBtn.UseVisualStyleBackColor = true;
            this.ConnectionTestBtn.Click += new System.EventHandler(this.ConnectionTestBtn_Click);
            // 
            // checkUseFileName
            // 
            this.checkUseFileName.AutoSize = true;
            this.checkUseFileName.Location = new System.Drawing.Point(417, 196);
            this.checkUseFileName.Name = "checkUseFileName";
            this.checkUseFileName.Size = new System.Drawing.Size(95, 17);
            this.checkUseFileName.TabIndex = 20;
            this.checkUseFileName.Text = "Use File Name";
            this.checkUseFileName.UseVisualStyleBackColor = true;
            // 
            // XDSExportBtn
            // 
            this.XDSExportBtn.Location = new System.Drawing.Point(595, 348);
            this.XDSExportBtn.Name = "XDSExportBtn";
            this.XDSExportBtn.Size = new System.Drawing.Size(75, 23);
            this.XDSExportBtn.TabIndex = 21;
            this.XDSExportBtn.Text = "Export XDS";
            this.XDSExportBtn.UseVisualStyleBackColor = true;
            this.XDSExportBtn.Click += new System.EventHandler(this.XDSExportBtn_Click);
            // 
            // efaExportBtn
            // 
            this.efaExportBtn.Location = new System.Drawing.Point(497, 348);
            this.efaExportBtn.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.efaExportBtn.Name = "efaExportBtn";
            this.efaExportBtn.Size = new System.Drawing.Size(92, 24);
            this.efaExportBtn.TabIndex = 22;
            this.efaExportBtn.Text = "EFA ILR Export";
            this.efaExportBtn.UseVisualStyleBackColor = true;
            this.efaExportBtn.Click += new System.EventHandler(this.efaExportBtn_Click);
            // 
            // ukprnLabel
            // 
            this.ukprnLabel.AutoSize = true;
            this.ukprnLabel.Location = new System.Drawing.Point(358, 219);
            this.ukprnLabel.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.ukprnLabel.Name = "ukprnLabel";
            this.ukprnLabel.Size = new System.Drawing.Size(45, 13);
            this.ukprnLabel.TabIndex = 23;
            this.ukprnLabel.Text = "UKPRN";
            // 
            // textUKPRN
            // 
            this.textUKPRN.Location = new System.Drawing.Point(417, 219);
            this.textUKPRN.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textUKPRN.Name = "textUKPRN";
            this.textUKPRN.Size = new System.Drawing.Size(202, 20);
            this.textUKPRN.TabIndex = 24;
            // 
            // textSQLSecurity
            // 
            this.textSQLSecurity.Location = new System.Drawing.Point(123, 90);
            this.textSQLSecurity.Name = "textSQLSecurity";
            this.textSQLSecurity.Size = new System.Drawing.Size(496, 20);
            this.textSQLSecurity.TabIndex = 26;
            this.textSQLSecurity.Text = "Integrated Security=false;User Id=<<userid>>;password=<<password>>";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(13, 94);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(69, 13);
            this.label6.TabIndex = 25;
            this.label6.Text = "SQL Security";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(698, 385);
            this.Controls.Add(this.textSQLSecurity);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.textUKPRN);
            this.Controls.Add(this.ukprnLabel);
            this.Controls.Add(this.efaExportBtn);
            this.Controls.Add(this.XDSExportBtn);
            this.Controls.Add(this.checkUseFileName);
            this.Controls.Add(this.ConnectionTestBtn);
            this.Controls.Add(this.ExportBtn);
            this.Controls.Add(this.textBulkLoadSchema);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.checkCreateTables);
            this.Controls.Add(this.checkAddIdentity);
            this.Controls.Add(this.IlrXsdBrowseBtn);
            this.Controls.Add(this.textILRSchema);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.textDatabase);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.textServer);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.IlrFileBrowseBtn);
            this.Controls.Add(this.textILRFile);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.ErrorBtn);
            this.Controls.Add(this.listBox1);
            this.Controls.Add(this.button1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "XML Loader";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.Button ErrorBtn;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textILRFile;
        private System.Windows.Forms.Button IlrFileBrowseBtn;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textServer;
        private System.Windows.Forms.TextBox textDatabase;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button IlrXsdBrowseBtn;
        private System.Windows.Forms.TextBox textILRSchema;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.CheckBox checkAddIdentity;
        private System.Windows.Forms.CheckBox checkCreateTables;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox textBulkLoadSchema;
        private System.Windows.Forms.Button ExportBtn;
        private System.Windows.Forms.Button ConnectionTestBtn;
        private System.Windows.Forms.CheckBox checkUseFileName;
        private System.Windows.Forms.Button XDSExportBtn;
        private System.Windows.Forms.Button efaExportBtn;
        private System.Windows.Forms.Label ukprnLabel;
        private System.Windows.Forms.TextBox textUKPRN;
        private System.Windows.Forms.TextBox textSQLSecurity;
        private System.Windows.Forms.Label label6;
    }
}

