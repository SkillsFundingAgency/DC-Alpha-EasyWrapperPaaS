namespace XMLLoader
{
    partial class XDS
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
            this.ServerTB = new System.Windows.Forms.TextBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.yearCombo = new System.Windows.Forms.ComboBox();
            this.rulebaseCombo = new System.Windows.Forms.ComboBox();
            this.ExportBtn = new System.Windows.Forms.Button();
            this.multiProviderCB = new System.Windows.Forms.CheckBox();
            this.serverLabel = new System.Windows.Forms.Label();
            this.yearLabel = new System.Windows.Forms.Label();
            this.rulebaseLabel = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // ServerTB
            // 
            this.ServerTB.Location = new System.Drawing.Point(23, 41);
            this.ServerTB.Name = "ServerTB";
            this.ServerTB.Size = new System.Drawing.Size(225, 20);
            this.ServerTB.TabIndex = 0;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.yearCombo);
            this.panel1.Controls.Add(this.rulebaseCombo);
            this.panel1.Controls.Add(this.ExportBtn);
            this.panel1.Controls.Add(this.multiProviderCB);
            this.panel1.Controls.Add(this.ServerTB);
            this.panel1.Location = new System.Drawing.Point(123, 1);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(259, 329);
            this.panel1.TabIndex = 1;
            // 
            // yearCombo
            // 
            this.yearCombo.FormattingEnabled = true;
            this.yearCombo.Location = new System.Drawing.Point(23, 111);
            this.yearCombo.Name = "yearCombo";
            this.yearCombo.Size = new System.Drawing.Size(225, 21);
            this.yearCombo.TabIndex = 6;
            this.yearCombo.SelectedValueChanged += new System.EventHandler(this.yearCombo_SelectedValueChanged);
            // 
            // rulebaseCombo
            // 
            this.rulebaseCombo.FormattingEnabled = true;
            this.rulebaseCombo.Location = new System.Drawing.Point(23, 173);
            this.rulebaseCombo.Name = "rulebaseCombo";
            this.rulebaseCombo.Size = new System.Drawing.Size(225, 21);
            this.rulebaseCombo.TabIndex = 5;
            this.rulebaseCombo.SelectedValueChanged += new System.EventHandler(this.rulebaseCombo_SelectedValueChanged);
            // 
            // ExportBtn
            // 
            this.ExportBtn.Location = new System.Drawing.Point(173, 278);
            this.ExportBtn.Name = "ExportBtn";
            this.ExportBtn.Size = new System.Drawing.Size(75, 23);
            this.ExportBtn.TabIndex = 3;
            this.ExportBtn.Text = "Export";
            this.ExportBtn.UseVisualStyleBackColor = true;
            this.ExportBtn.Click += new System.EventHandler(this.ExportBtn_Click);
            // 
            // multiProviderCB
            // 
            this.multiProviderCB.AutoSize = true;
            this.multiProviderCB.Location = new System.Drawing.Point(23, 232);
            this.multiProviderCB.Name = "multiProviderCB";
            this.multiProviderCB.Size = new System.Drawing.Size(153, 17);
            this.multiProviderCB.TabIndex = 2;
            this.multiProviderCB.Text = "Multiple Learning Providers";
            this.multiProviderCB.UseVisualStyleBackColor = true;
            // 
            // serverLabel
            // 
            this.serverLabel.AutoSize = true;
            this.serverLabel.Location = new System.Drawing.Point(12, 45);
            this.serverLabel.Name = "serverLabel";
            this.serverLabel.Size = new System.Drawing.Size(106, 13);
            this.serverLabel.TabIndex = 2;
            this.serverLabel.Text = "SQL Server Instance";
            // 
            // yearLabel
            // 
            this.yearLabel.AutoSize = true;
            this.yearLabel.Location = new System.Drawing.Point(12, 115);
            this.yearLabel.Name = "yearLabel";
            this.yearLabel.Size = new System.Drawing.Size(79, 13);
            this.yearLabel.TabIndex = 3;
            this.yearLabel.Text = "Academic Year";
            // 
            // rulebaseLabel
            // 
            this.rulebaseLabel.AutoSize = true;
            this.rulebaseLabel.Location = new System.Drawing.Point(12, 177);
            this.rulebaseLabel.Name = "rulebaseLabel";
            this.rulebaseLabel.Size = new System.Drawing.Size(52, 13);
            this.rulebaseLabel.TabIndex = 4;
            this.rulebaseLabel.Text = "Rulebase";
            // 
            // XDS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(383, 329);
            this.Controls.Add(this.rulebaseLabel);
            this.Controls.Add(this.yearLabel);
            this.Controls.Add(this.serverLabel);
            this.Controls.Add(this.panel1);
            this.Name = "XDS";
            this.Text = "XDS";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox ServerTB;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button ExportBtn;
        private System.Windows.Forms.CheckBox multiProviderCB;
        private System.Windows.Forms.Label serverLabel;
        private System.Windows.Forms.Label yearLabel;
        private System.Windows.Forms.ComboBox rulebaseCombo;
        private System.Windows.Forms.Label rulebaseLabel;
        private System.Windows.Forms.ComboBox yearCombo;
    }
}