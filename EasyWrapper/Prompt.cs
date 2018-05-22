using System.Windows.Forms;

namespace EasyWrapper
{
    public static class Prompt
    {
        public static string ShowDialog(string Title, string LabelText)
        {
            Form prompt = new Form();
            prompt.Width = 280;
            prompt.Text = Title;
            prompt.FormBorderStyle = FormBorderStyle.FixedDialog;
            prompt.StartPosition = FormStartPosition.CenterScreen;
            int spacing = 10;

            Label textLabel = new Label() { Left = 16, Top = 20, MaximumSize = new System.Drawing.Size(240, 0), AutoSize = true, Text = LabelText };
            TextBox textBox = new TextBox() { Left = 16, Top = textLabel.Top + textLabel.GetPreferredSize(textLabel.MaximumSize).Height + spacing, Width = 240, TabStop = true, TabIndex = 1 };
            Button confirmation = new Button() { Text = "OK", Left = 16, Width = 80, Top = textBox.Top + textBox.Height + spacing, TabIndex = 2, TabStop = true };
            confirmation.Click += (sender, e) => { prompt.DialogResult = DialogResult.OK; prompt.Close(); };
            prompt.Controls.Add(confirmation);
            prompt.Controls.Add(textLabel);
            prompt.Controls.Add(textBox);
            prompt.Height = confirmation.Top + confirmation.Height + spacing + 45;

            DialogResult result = prompt.ShowDialog();

            return result == DialogResult.OK ? textBox.Text : "";
        }
    }
}
