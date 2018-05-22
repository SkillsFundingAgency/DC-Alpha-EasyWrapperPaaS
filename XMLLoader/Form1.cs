using SqlXmlLoad;
using System;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Linq;
using XML2SQL;

namespace XMLLoader
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            LoadSettings();
        }

        private void BrowseToFile(TextBox TextBoxForFilename, string FileType, bool MustExist = true)
        {
            OpenFileDialog openFile = new OpenFileDialog();
            openFile.Filter = FileType.ToUpper() + " files (*." + FileType.ToLower() + ")|*." + FileType.ToLower() + "|All files (*.*)|*.*";
            openFile.FilterIndex = 1;
            openFile.CheckFileExists = MustExist;
            openFile.Multiselect = false;
            if (TextBoxForFilename.Text.Length > 0)
            {
                if (TextBoxForFilename.Text.ToLower().EndsWith("." + FileType.ToLower()) && TextBoxForFilename.Text.Contains("\\"))
                    openFile.InitialDirectory = TextBoxForFilename.Text.Substring(0, TextBoxForFilename.Text.LastIndexOf("\\"));
                else
                    openFile.InitialDirectory = TextBoxForFilename.Text;
            }

            if (openFile.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    TextBoxForFilename.Text = openFile.FileName;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: Could not read file from disk. Original error: " + ex.Message);
                }
            }
        }

        #region Settings
        private void SaveSettings()
        {
            XDocument settingsDoc = XDocument.Load(Path.Combine(AppContext.BaseDirectory, "config.xml"));
            settingsDoc.Root.SetAttributeValue("ilrFile", textILRFile.Text);
            settingsDoc.Root.SetAttributeValue("ilrSchema", textILRSchema.Text);
            settingsDoc.Root.SetAttributeValue("server", textServer.Text);
            settingsDoc.Root.SetAttributeValue("ilrDB", textDatabase.Text);
            settingsDoc.Root.SetAttributeValue("bulkLoadSchema", textBulkLoadSchema.Text);
            settingsDoc.Root.SetAttributeValue("uploadCreateTables", checkCreateTables.Checked ? "true" : "false");
            settingsDoc.Root.SetAttributeValue("uploadAddIdentity", checkCreateTables.Checked ? "true" : "false");
            settingsDoc.Root.SetAttributeValue("uploadUseFileName", checkCreateTables.Checked ? "true" : "false");

            settingsDoc.Save(Path.Combine(AppContext.BaseDirectory, "config.xml"));
        }
        private void LoadSettings()
        {
            var settingsDoc = XDocument.Load(Path.Combine(AppContext.BaseDirectory, "config.xml"));

            this.textILRFile.Text = settingsDoc.Root.Attribute("ilrFile").Value;
            textServer.Text = settingsDoc.Root.Attribute("server").Value;
            textDatabase.Text = settingsDoc.Root.Attribute("ilrDB").Value;
            textILRSchema.Text = settingsDoc.Root.Attribute("ilrSchema").Value;
            textBulkLoadSchema.Text = settingsDoc.Root.Attribute("bulkLoadSchema").Value;
            checkAddIdentity.Checked = settingsDoc.Root.Attribute("uploadAddIdentity").Value == "true";
            checkCreateTables.Checked = settingsDoc.Root.Attribute("uploadCreateTables").Value == "true";
            checkUseFileName.Checked = settingsDoc.Root.Attribute("uploadUseFileName").Value == "true";
        }
        #endregion

        #region Export XML
        private void ExportXMLMulti(string exportFile, string xsd, string UKPRN)
        {
            var ilrSchema = XDocument.Load(xsd);
            var result = ilrSchema.Root.Attributes()
                .Where(a => a.IsNamespaceDeclaration)
                .GroupBy(a => a.Name.Namespace == XNamespace.None ? String.Empty : a.Name.LocalName, a => XNamespace.Get(a.Value))
                .ToDictionary(g => g.Key, g => g.First());
            string ilrNS = result.First(x => string.IsNullOrEmpty(x.Key)).Value.NamespaceName;

            string lpCont, headCont, sfCont, ldpCont, learnCont;

            //string conString = System.Configuration.ConfigurationManager.ConnectionStrings["mainConnection"].ConnectionString;
            //conString = conString.Replace("$(db)", textDatabase.Text);
            //conString = conString.Replace("$(server)", textServer.Text);
            string conString = $"Data Source={textServer.Text};Initial Catalog={textDatabase.Text};Integrated Security=SSPI;";

            using (SQLDatabase db = new SQLDatabase(conString))
            {
                db.Open();

                lpCont = db.ExecuteScalar<string>(GetLearningProviderSQLEFA(ilrNS).Replace("${ukprn}", UKPRN));
                headCont = db.ExecuteScalar<string>(GetHeaderSQLEFA(ilrNS).Replace("${ukprn}", UKPRN));
                sfCont = db.ExecuteScalar<string>(GetSourceFilesSQLEFA(ilrNS).Replace("${ukprn}", UKPRN));
                ldpCont = db.ExecuteScalar<string>(GetLearnerDestinationandProgressionSQLEFA(ilrNS).Replace("${ukprn}", UKPRN));
                learnCont = db.ExecuteScalar<string>(GetLearnerSQLEFA(ilrNS).Replace("${ukprn}", UKPRN));
            }

            string xmlContent = File.ReadAllText(Path.Combine(AppContext.BaseDirectory, "Export", "Templates", "ILRXmlTemplate.txt"))
                .Replace("$(NameSpace)", ilrNS)
                .Replace("$(LearningProviderContent)", lpCont)
                .Replace("$(HeaderContent)", headCont)
                .Replace("$(SourceFilesContent)", sfCont)
                .Replace("$(LearnerDestinationandProgressionContent)", ldpCont)
                .Replace("$(LearnerContent)", learnCont);

            File.WriteAllText(Path.Combine(AppContext.BaseDirectory, exportFile), xmlContent);
        }

        private void ExportXMLQuickly(string ExportFile, string xsdPath = "")
        {
            var ilrSchema = XDocument.Load(xsdPath);
            var result = ilrSchema.Root.Attributes()
                .Where(a => a.IsNamespaceDeclaration)
                .GroupBy(a => a.Name.Namespace == XNamespace.None ? String.Empty : a.Name.LocalName, a => XNamespace.Get(a.Value))
                .ToDictionary(g => g.Key, g => g.First());
            string ilrNS = result.First(x => string.IsNullOrEmpty(x.Key)).Value.NamespaceName;

            string lpCont, headCont, sfCont, ldpCont, learnCont;

            //string conString = System.Configuration.ConfigurationManager.ConnectionStrings["mainConnection"].ConnectionString;
            //conString = conString.Replace("$(db)", textDatabase.Text);
            //conString = conString.Replace("$(server)", textServer.Text);
            string conString = $"Data Source={textServer.Text};Initial Catalog={textDatabase.Text};Integrated Security=SSPI;";

            using (SQLDatabase db = new SQLDatabase(conString))
            {
                db.Open();

                lpCont = db.ExecuteScalar<string>(GetLearningProviderSQL(ilrNS));
                headCont = db.ExecuteScalar<string>(GetHeaderSQL(ilrNS));
                sfCont = db.ExecuteScalar<string>(GetSourceFilesSQL(ilrNS));
                ldpCont = db.ExecuteScalar<string>(GetLearnerDestinationandProgressionSQL(ilrNS));
                learnCont = db.ExecuteScalar<string>(GetLearnerSQL(ilrNS));
            }

            string xmlContent = File.ReadAllText(Path.Combine(AppContext.BaseDirectory, "Export", "Templates", "ILRXmlTemplate.txt"))
                .Replace("$(NameSpace)", ilrNS)
                .Replace("$(LearningProviderContent)", lpCont)
                .Replace("$(HeaderContent)", headCont)
                .Replace("$(SourceFilesContent)", sfCont)
                .Replace("$(LearnerDestinationandProgressionContent)", ldpCont)
                .Replace("$(LearnerContent)", learnCont);

            File.WriteAllText($"{Path.Combine(AppContext.BaseDirectory, "ILR_Export.xml")}", xmlContent);

            System.Diagnostics.Process.Start(Path.Combine(AppContext.BaseDirectory, "ILR_Export.xml"));
        }

        /// <summary>
        /// Gets the identity requirement.
        /// </summary>
        /// <returns>a file name element</returns>
        private string GetIdentityRequirement(bool isChecked)
        {
            return isChecked ? "_WithIdentity" : string.Empty;
        }

        /// <summary>
        /// Gets the version requirement.
        /// </summary>
        /// <param name="candidate">The candidate.</param>
        /// <returns>the transformed name space</returns>
        private string GetVersionRequirement(string candidate)
        {
            return candidate.Replace("/", "_").Replace("-", "_");
        }

        /// <summary>
        /// Gets the file contents.
        /// </summary>
        /// <param name="candidate">for the candidate.</param>
        /// <returns>the string content of the file</returns>
        /// <exception cref="ApplicationException">$"couldn't find the get learner sql fallback file here ({fullPath})"</exception>
        private string GetFileContents(string candidate, string fallback)
        {
            const string resourcesFolder = "Assets";
            const string exportFolder = "Loader";

            var fullPath = Path.Combine(AppContext.BaseDirectory, exportFolder, candidate);
            if (!File.Exists(fullPath))
            {
                fullPath = Path.Combine(AppContext.BaseDirectory, resourcesFolder, exportFolder, fallback);
                listBox1.Items.Add("having to use the get learner sql fallback file");

                if (!File.Exists(fullPath))
                {
                    MessageBox.Show("couldn't locate the get learner sql fallback file, the program is now going to stop.. sorry :(");
                    throw new ApplicationException($"couldn't find the get learner sql fallback file here ({fullPath})");
                }
            }

            using (var file = File.OpenText(fullPath))
            {
                return file.ReadToEnd();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="name"></param>
        /// <param name="documentNamespace"></param>
        /// <returns></returns>
        private string GetFilenameFormat(string fileFormat, string documentNamespace, bool hasIdentity = true)
        {
            return string.Format(
                CultureInfo.InvariantCulture,
                fileFormat,
                hasIdentity ? GetIdentityRequirement(checkAddIdentity.Checked) : "",
                GetVersionRequirement(documentNamespace));
        }

        /// <summary>
        /// Gets the learner SQL.
        /// </summary>
        /// <param name="documentNS">The document ns.</param>
        /// <returns>the file string contents</returns>
        private string GetLearnerSQL(string documentNS)
        {
            return GetFileContents(GetFilenameFormat("GetLearnerSQL_{0}_{1}.sql", documentNS).Replace("__", "_"), "GetLearnerSQL_Fallback.sql");

            #region old removed crap
            /*
            bool useIdentity = checkAddIdentity.Checked;

            string sql;

            switch (Namespace)
            {
                case "SFA/ILR/2015-16":
                    sql = "select coalesce(cast((select";
                    sql += " Learner.LearnRefNumber,";
                    sql += " Learner.PrevLearnRefNumber,";
                    sql += " Learner.PrevUKPRN,";
                    sql += " Learner.ULN,";
                    sql += " Learner.FamilyName,";
                    sql += " Learner.GivenNames,";
                    sql += " cast(Learner.DateOfBirth as date) DateOfBirth,";
                    sql += " Learner.Ethnicity,";
                    sql += " Learner.Sex,";
                    sql += " Learner.LLDDHealthProb,";
                    sql += " Learner.NINumber,";
                    sql += " Learner.PriorAttain,";
                    sql += " Learner.Accom,";
                    sql += " Learner.ALSCost,";
                    sql += " Learner.PlanLearnHours,";
                    sql += " Learner.PlanEEPHours,";
                    sql += " Learner.MathGrade ,";
                    sql += " Learner.EngGrade ,";
                    sql += " (select LearnerContact.LocType,LearnerContact.ContType,LearnerContact.Email,LearnerContact.TelNumber,LearnerContact.PostCode,(select PostAdd.AddLine1,PostAdd.AddLine2,PostAdd.AddLine3,PostAdd.AddLine4 from PostAdd PostAdd";
                    if (useIdentity)
                        sql += " where PostAdd.FK_LearnerContact=LearnerContact.PK_LearnerContact for xml auto, type, elements) from LearnerContact LearnerContact where LearnerContact.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where PostAdd.LearnRefNumber=LearnerContact.LearnRefNumber and LearnerContact.LocType=1 for xml auto, type, elements) from LearnerContact LearnerContact where LearnerContact.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select ContactPreference.ContPrefType,ContactPreference.ContPrefCode from ContactPreference ContactPreference";
                    if (useIdentity)
                        sql += " where ContactPreference.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where ContactPreference.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LLDDandHealthProblem.LLDDCat,LLDDandHealthProblem.PrimaryLLDD from LLDDandHealthProblem LLDDandHealthProblem";
                    if (useIdentity)
                        sql += " where LLDDandHealthProblem.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where LLDDandHealthProblem.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LearnerFAM.LearnFAMType,LearnerFAM.LearnFAMCode from LearnerFAM LearnerFAM";
                    if (useIdentity)
                        sql += " where LearnerFAM.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where LearnerFAM.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select ProviderSpecLearnerMonitoring.ProvSpecLearnMonOccur,ProviderSpecLearnerMonitoring.ProvSpecLearnMon from ProviderSpecLearnerMonitoring ProviderSpecLearnerMonitoring";
                    if (useIdentity)
                        sql += " where ProviderSpecLearnerMonitoring.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where ProviderSpecLearnerMonitoring.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LearnerEmploymentStatus.EmpStat,cast(LearnerEmploymentStatus.DateEmpStatApp as date) DateEmpStatApp,LearnerEmploymentStatus.EmpId,(select EmploymentStatusMonitoring.ESMType,EmploymentStatusMonitoring.ESMCode from EmploymentStatusMonitoring EmploymentStatusMonitoring";
                    if (useIdentity)
                        sql += " where EmploymentStatusMonitoring.FK_LearnerEmploymentStatus=LearnerEmploymentStatus.PK_LearnerEmploymentStatus for xml auto, type, elements) from LearnerEmploymentStatus LearnerEmploymentStatus where LearnerEmploymentStatus.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where EmploymentStatusMonitoring.LearnRefNumber=LearnerEmploymentStatus.LearnRefNumber and EmploymentStatusMonitoring.DateEmpStatApp=LearnerEmploymentStatus.DateEmpStatApp for xml auto, type, elements) from LearnerEmploymentStatus LearnerEmploymentStatus where LearnerEmploymentStatus.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LearnerHE.UCASPERID,LearnerHE.TTACCOM,(select LearnerHEFinancialSupport.FINTYPE,LearnerHEFinancialSupport.FINAMOUNT from LearnerHEFinancialSupport LearnerHEFinancialSupport";
                    if (useIdentity)
                        sql += " where LearnerHEFinancialSupport.FK_LearnerHE=LearnerHE.PK_LearnerHE for xml auto, type, elements) from LearnerHE LearnerHE where LearnerHE.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where LearnerHEFinancialSupport.LearnRefNumber=LearnerHE.LearnRefNumber for xml auto, type, elements) from LearnerHE LearnerHE where LearnerHE.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (";
                    sql += " select ";
                    sql += " LearningDelivery.LearnAimRef,";
                    sql += " LearningDelivery.AimType,";
                    sql += " LearningDelivery.AimSeqNumber,";
                    sql += " cast(LearningDelivery.LearnStartDate as date) LearnStartDate,";
                    sql += " cast(LearningDelivery.OrigLearnStartDate as date) OrigLearnStartDate,";
                    sql += " cast(LearningDelivery.LearnPlanEndDate as date) LearnPlanEndDate,";
                    sql += " LearningDelivery.FundModel,";
                    sql += " LearningDelivery.ProgType,";
                    sql += " LearningDelivery.FworkCode,";
                    sql += " LearningDelivery.PwayCode,";
                    sql += " LearningDelivery.PartnerUKPRN,";
                    sql += " LearningDelivery.DelLocPostCode,";
                    sql += " LearningDelivery.AddHours,";
                    sql += " LearningDelivery.PriorLearnFundAdj,";
                    sql += " LearningDelivery.OtherFundAdj,";
                    sql += " LearningDelivery.ConRefNumber,";
                    sql += " LearningDelivery.EmpOutcome,";
                    sql += " LearningDelivery.CompStatus,";
                    sql += " cast(LearningDelivery.LearnActEndDate as date) LearnActEndDate,";
                    sql += " LearningDelivery.WithdrawReason,";
                    sql += " LearningDelivery.Outcome,";
                    sql += " cast(LearningDelivery.AchDate as date) AchDate,";
                    sql += " LearningDelivery.OutGrade,";
                    sql += " LearningDelivery.SWSupAimId,";
                    sql += " (select LearningDeliveryFAM.LearnDelFAMType,LearningDeliveryFAM.LearnDelFAMCode,cast(LearningDeliveryFAM.LearnDelFAMDateFrom as date) LearnDelFAMDateFrom,cast(LearningDeliveryFAM.LearnDelFAMDateTo as date) LearnDelFAMDateTo from LearningDeliveryFAM LearningDeliveryFAM";
                    if (useIdentity)
                        sql += " where LearningDeliveryFAM.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements),";
                    else
                        sql += " where LearningDeliveryFAM.LearnRefNumber=LearningDelivery.LearnRefNumber and LearningDeliveryFAM.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select cast(LearningDeliveryWorkPlacement.WorkPlaceStartDate as date) WorkPlaceStartDate, cast(LearningDeliveryWorkPlacement.WorkPlaceEndDate as date) WorkPlaceEndDate, LearningDeliveryWorkPlacement.WorkPlaceMode, LearningDeliveryWorkPlacement.WorkPlaceEmpId from LearningDeliveryWorkPlacement LearningDeliveryWorkPlacement";
                    if (useIdentity)
                        sql += " where LearningDeliveryWorkPlacement.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements),";
                    else
                        sql += " where LearningDeliveryWorkPlacement.LearnRefNumber=LearningDelivery.LearnRefNumber and LearningDeliveryWorkPlacement.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select TrailblazerApprenticeshipFinancialRecord.TBFinType,TrailblazerApprenticeshipFinancialRecord.TBFinCode,cast(TrailblazerApprenticeshipFinancialRecord.TBFinDate as date) TBFinDate,TrailblazerApprenticeshipFinancialRecord.TBFinAmount from TrailblazerApprenticeshipFinancialRecord TrailblazerApprenticeshipFinancialRecord";
                    if (useIdentity)
                        sql += " where TrailblazerApprenticeshipFinancialRecord.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements),";
                    else
                        sql += " where TrailblazerApprenticeshipFinancialRecord.LearnRefNumber=LearningDelivery.LearnRefNumber and TrailblazerApprenticeshipFinancialRecord.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select ProviderSpecDeliveryMonitoring.ProvSpecDelMonOccur,ProviderSpecDeliveryMonitoring.ProvSpecDelMon from ProviderSpecDeliveryMonitoring ProviderSpecDeliveryMonitoring";
                    if (useIdentity)
                        sql += " where ProviderSpecDeliveryMonitoring.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements),";
                    else
                        sql += " where ProviderSpecDeliveryMonitoring.LearnRefNumber=LearningDelivery.LearnRefNumber and ProviderSpecDeliveryMonitoring.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select LearningDeliveryHE.NUMHUS,LearningDeliveryHE.SSN,LearningDeliveryHE.QUALENT3,LearningDeliveryHE.SOC2000,LearningDeliveryHE.SEC,LearningDeliveryHE.UCASAPPID,LearningDeliveryHE.TYPEYR,LearningDeliveryHE.MODESTUD,LearningDeliveryHE.FUNDLEV,LearningDeliveryHE.FUNDCOMP,cast(LearningDeliveryHE.STULOAD as varchar) STULOAD,LearningDeliveryHE.YEARSTU,LearningDeliveryHE.MSTUFEE,cast(LearningDeliveryHE.PCOLAB as varchar) PCOLAB,cast(LearningDeliveryHE.PCFLDCS as varchar) PCFLDCS,cast(LearningDeliveryHE.PCSLDCS as varchar) PCSLDCS,cast(LearningDeliveryHE.PCTLDCS as varchar) PCTLDCS,LearningDeliveryHE.SPECFEE,LearningDeliveryHE.NETFEE,LearningDeliveryHE.GROSSFEE,LearningDeliveryHE.DOMICILE,LearningDeliveryHE.ELQ,LearningDeliveryHE.HEPostCode from LearningDeliveryHE LearningDeliveryHE";
                    if (useIdentity)
                        sql += " where LearningDeliveryHE.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements)";
                    else
                        sql += " where LearningDeliveryHE.LearnRefNumber=LearningDelivery.LearnRefNumber and LearningDeliveryHE.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements)";
                    sql += " from ";
                    sql += " LearningDelivery LearningDelivery";
                    sql += " where";
                    if (useIdentity)
                        sql += " LearningDelivery.FK_Learner=Learner.PK_Learner";
                    else
                        sql += " LearningDelivery.LearnRefNumber=Learner.LearnRefNumber";
                    sql += " for xml auto, type, elements";
                    sql += " )";
                    sql += " from";
                    sql += " Learner Learner";
                    sql += " for xml path ('Learner')";
                    sql += " ) as varchar(max)),'')";
                    break;
                case "SFA/ILR/2016-17":
                    sql = "select coalesce(cast((select";
                    sql += " Learner.LearnRefNumber,";
                    sql += " Learner.PrevLearnRefNumber,";
                    sql += " Learner.PrevUKPRN,";
                    sql += " Learner.ULN,";
                    sql += " Learner.FamilyName,";
                    sql += " Learner.GivenNames,";
                    sql += " cast(Learner.DateOfBirth as date) DateOfBirth,";
                    sql += " Learner.Ethnicity,";
                    sql += " Learner.Sex,";
                    sql += " Learner.LLDDHealthProb,";
                    sql += " Learner.NINumber,";
                    sql += " Learner.PriorAttain,";
                    sql += " Learner.Accom,";
                    sql += " Learner.ALSCost,";
                    sql += " Learner.PlanLearnHours,";
                    sql += " Learner.PlanEEPHours,";
                    sql += " Learner.MathGrade ,";
                    sql += " Learner.EngGrade ,";
                    sql += " (select LearnerContact.LocType,LearnerContact.ContType,LearnerContact.Email,LearnerContact.TelNumber,LearnerContact.PostCode,(select PostAdd.AddLine1,PostAdd.AddLine2,PostAdd.AddLine3,PostAdd.AddLine4 from PostAdd PostAdd";
                    if (useIdentity)
                        sql += " where PostAdd.FK_LearnerContact=LearnerContact.PK_LearnerContact for xml auto, type, elements) from LearnerContact LearnerContact where LearnerContact.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where PostAdd.LearnRefNumber=LearnerContact.LearnRefNumber and LearnerContact.LocType=1 for xml auto, type, elements) from LearnerContact LearnerContact where LearnerContact.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select ContactPreference.ContPrefType,ContactPreference.ContPrefCode from ContactPreference ContactPreference";
                    if (useIdentity)
                        sql += " where ContactPreference.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where ContactPreference.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LLDDandHealthProblem.LLDDCat,LLDDandHealthProblem.PrimaryLLDD from LLDDandHealthProblem LLDDandHealthProblem";
                    if (useIdentity)
                        sql += " where LLDDandHealthProblem.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where LLDDandHealthProblem.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LearnerFAM.LearnFAMType,LearnerFAM.LearnFAMCode from LearnerFAM LearnerFAM";
                    if (useIdentity)
                        sql += " where LearnerFAM.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where LearnerFAM.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select ProviderSpecLearnerMonitoring.ProvSpecLearnMonOccur,ProviderSpecLearnerMonitoring.ProvSpecLearnMon from ProviderSpecLearnerMonitoring ProviderSpecLearnerMonitoring";
                    if (useIdentity)
                        sql += " where ProviderSpecLearnerMonitoring.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where ProviderSpecLearnerMonitoring.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LearnerEmploymentStatus.EmpStat,cast(LearnerEmploymentStatus.DateEmpStatApp as date) DateEmpStatApp,LearnerEmploymentStatus.EmpId,(select EmploymentStatusMonitoring.ESMType,EmploymentStatusMonitoring.ESMCode from EmploymentStatusMonitoring EmploymentStatusMonitoring";
                    if (useIdentity)
                        sql += " where EmploymentStatusMonitoring.FK_LearnerEmploymentStatus=LearnerEmploymentStatus.PK_LearnerEmploymentStatus for xml auto, type, elements) from LearnerEmploymentStatus LearnerEmploymentStatus where LearnerEmploymentStatus.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where EmploymentStatusMonitoring.LearnRefNumber=LearnerEmploymentStatus.LearnRefNumber and EmploymentStatusMonitoring.DateEmpStatApp=LearnerEmploymentStatus.DateEmpStatApp for xml auto, type, elements) from LearnerEmploymentStatus LearnerEmploymentStatus where LearnerEmploymentStatus.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LearnerHE.UCASPERID,LearnerHE.TTACCOM,(select LearnerHEFinancialSupport.FINTYPE,LearnerHEFinancialSupport.FINAMOUNT from LearnerHEFinancialSupport LearnerHEFinancialSupport";
                    if (useIdentity)
                        sql += " where LearnerHEFinancialSupport.FK_LearnerHE=LearnerHE.PK_LearnerHE for xml auto, type, elements) from LearnerHE LearnerHE where LearnerHE.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where LearnerHEFinancialSupport.LearnRefNumber=LearnerHE.LearnRefNumber for xml auto, type, elements) from LearnerHE LearnerHE where LearnerHE.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (";
                    sql += " select ";
                    sql += " LearningDelivery.LearnAimRef,";
                    sql += " LearningDelivery.AimType,";
                    sql += " LearningDelivery.AimSeqNumber,";
                    sql += " cast(LearningDelivery.LearnStartDate as date) LearnStartDate,";
                    sql += " cast(LearningDelivery.OrigLearnStartDate as date) OrigLearnStartDate,";
                    sql += " cast(LearningDelivery.LearnPlanEndDate as date) LearnPlanEndDate,";
                    sql += " LearningDelivery.FundModel,";
                    sql += " LearningDelivery.ProgType,";
                    sql += " LearningDelivery.FworkCode,";
                    sql += " LearningDelivery.PwayCode,";
                    sql += " LearningDelivery.StdCode,";
                    sql += " LearningDelivery.PartnerUKPRN,";
                    sql += " LearningDelivery.DelLocPostCode,";
                    sql += " LearningDelivery.AddHours,";
                    sql += " LearningDelivery.PriorLearnFundAdj,";
                    sql += " LearningDelivery.OtherFundAdj,";
                    sql += " LearningDelivery.ConRefNumber,";
                    sql += " LearningDelivery.EmpOutcome,";
                    sql += " LearningDelivery.CompStatus,";
                    sql += " cast(LearningDelivery.LearnActEndDate as date) LearnActEndDate,";
                    sql += " LearningDelivery.WithdrawReason,";
                    sql += " LearningDelivery.Outcome,";
                    sql += " cast(LearningDelivery.AchDate as date) AchDate,";
                    sql += " LearningDelivery.OutGrade,";
                    sql += " LearningDelivery.SWSupAimId,";
                    sql += " (select LearningDeliveryFAM.LearnDelFAMType,LearningDeliveryFAM.LearnDelFAMCode,cast(LearningDeliveryFAM.LearnDelFAMDateFrom as date) LearnDelFAMDateFrom,cast(LearningDeliveryFAM.LearnDelFAMDateTo as date) LearnDelFAMDateTo from LearningDeliveryFAM LearningDeliveryFAM";
                    if (useIdentity)
                        sql += " where LearningDeliveryFAM.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements),";
                    else
                        sql += " where LearningDeliveryFAM.LearnRefNumber=LearningDelivery.LearnRefNumber and LearningDeliveryFAM.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select cast(LearningDeliveryWorkPlacement.WorkPlaceStartDate as date) WorkPlaceStartDate, cast(LearningDeliveryWorkPlacement.WorkPlaceEndDate as date) WorkPlaceEndDate, LearningDeliveryWorkPlacement.WorkPlaceMode, LearningDeliveryWorkPlacement.WorkPlaceEmpId from LearningDeliveryWorkPlacement LearningDeliveryWorkPlacement";
                    if (useIdentity)
                        sql += " where LearningDeliveryWorkPlacement.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements),";
                    else
                        sql += " where LearningDeliveryWorkPlacement.LearnRefNumber=LearningDelivery.LearnRefNumber and LearningDeliveryWorkPlacement.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select TrailblazerApprenticeshipFinancialRecord.TBFinType,TrailblazerApprenticeshipFinancialRecord.TBFinCode,cast(TrailblazerApprenticeshipFinancialRecord.TBFinDate as date) TBFinDate,TrailblazerApprenticeshipFinancialRecord.TBFinAmount from TrailblazerApprenticeshipFinancialRecord TrailblazerApprenticeshipFinancialRecord";
                    if (useIdentity)
                        sql += " where TrailblazerApprenticeshipFinancialRecord.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements),";
                    else
                        sql += " where TrailblazerApprenticeshipFinancialRecord.LearnRefNumber=LearningDelivery.LearnRefNumber and TrailblazerApprenticeshipFinancialRecord.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select ProviderSpecDeliveryMonitoring.ProvSpecDelMonOccur,ProviderSpecDeliveryMonitoring.ProvSpecDelMon from ProviderSpecDeliveryMonitoring ProviderSpecDeliveryMonitoring";
                    if (useIdentity)
                        sql += " where ProviderSpecDeliveryMonitoring.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements),";
                    else
                        sql += " where ProviderSpecDeliveryMonitoring.LearnRefNumber=LearningDelivery.LearnRefNumber and ProviderSpecDeliveryMonitoring.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select LearningDeliveryHE.NUMHUS,LearningDeliveryHE.SSN,LearningDeliveryHE.QUALENT3,LearningDeliveryHE.SOC2000,LearningDeliveryHE.SEC,LearningDeliveryHE.UCASAPPID,LearningDeliveryHE.TYPEYR,LearningDeliveryHE.MODESTUD,LearningDeliveryHE.FUNDLEV,LearningDeliveryHE.FUNDCOMP,cast(LearningDeliveryHE.STULOAD as varchar) STULOAD,LearningDeliveryHE.YEARSTU,LearningDeliveryHE.MSTUFEE,cast(LearningDeliveryHE.PCOLAB as varchar) PCOLAB,cast(LearningDeliveryHE.PCFLDCS as varchar) PCFLDCS,cast(LearningDeliveryHE.PCSLDCS as varchar) PCSLDCS,cast(LearningDeliveryHE.PCTLDCS as varchar) PCTLDCS,LearningDeliveryHE.SPECFEE,LearningDeliveryHE.NETFEE,LearningDeliveryHE.GROSSFEE,LearningDeliveryHE.DOMICILE,LearningDeliveryHE.ELQ,LearningDeliveryHE.HEPostCode from LearningDeliveryHE LearningDeliveryHE";
                    if (useIdentity)
                        sql += " where LearningDeliveryHE.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements)";
                    else
                        sql += " where LearningDeliveryHE.LearnRefNumber=LearningDelivery.LearnRefNumber and LearningDeliveryHE.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements)";
                    sql += " from ";
                    sql += " LearningDelivery LearningDelivery";
                    sql += " where";
                    if (useIdentity)
                        sql += " LearningDelivery.FK_Learner=Learner.PK_Learner";
                    else
                        sql += " LearningDelivery.LearnRefNumber=Learner.LearnRefNumber";
                    sql += " for xml auto, type, elements";
                    sql += " )";
                    sql += " from";
                    sql += " Learner Learner";
                    sql += " for xml path ('Learner')";
                    sql += " ) as varchar(max)),'')";
                    break;
                case "SFA/ILR/2017-18":
                    sql = "select coalesce(cast((select";
                    sql += " Learner.LearnRefNumber,";
                    sql += " Learner.PrevLearnRefNumber,";
                    sql += " Learner.PrevUKPRN,";
                    sql += " Learner.PMUKPRN,";
                    sql += " Learner.ULN,";
                    sql += " Learner.FamilyName,";
                    sql += " Learner.GivenNames,";
                    sql += " cast(Learner.DateOfBirth as date) DateOfBirth,";
                    sql += " Learner.Ethnicity,";
                    sql += " Learner.Sex,";
                    sql += " Learner.LLDDHealthProb,";
                    sql += " Learner.NINumber,";
                    sql += " Learner.PriorAttain,";
                    sql += " Learner.Accom,";
                    sql += " Learner.ALSCost,";
                    sql += " Learner.PlanLearnHours,";
                    sql += " Learner.PlanEEPHours,";
                    sql += " Learner.MathGrade ,";
                    sql += " Learner.EngGrade ,";
                    sql += " Learner.PostcodePrior,";
                    sql += " Learner.Postcode,";
                    sql += " Learner.AddLine1,";
                    sql += " Learner.AddLine2,";
                    sql += " Learner.AddLine3,";
                    sql += " Learner.AddLine4,";
                    sql += " Learner.TelNo,";
                    sql += " Learner.Email,";

                    //NOTE: learner contact details flattened to learner in 17/18 spec
                    //sql += " (select LearnerContact.LocType,LearnerContact.ContType,LearnerContact.Email,LearnerContact.TelNumber,LearnerContact.PostCode,(select PostAdd.AddLine1,PostAdd.AddLine2,PostAdd.AddLine3,PostAdd.AddLine4 from PostAdd PostAdd";
                    //if (useIdentity)
                    //    sql += " where PostAdd.FK_LearnerContact=LearnerContact.PK_LearnerContact for xml auto, type, elements) from LearnerContact LearnerContact where LearnerContact.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    //else
                    //    sql += " where PostAdd.LearnRefNumber=LearnerContact.LearnRefNumber and LearnerContact.LocType=1 for xml auto, type, elements) from LearnerContact LearnerContact where LearnerContact.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";

                    sql += " (select ContactPreference.ContPrefType,ContactPreference.ContPrefCode from ContactPreference ContactPreference";
                    if (useIdentity)
                        sql += " where ContactPreference.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where ContactPreference.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LLDDandHealthProblem.LLDDCat,LLDDandHealthProblem.PrimaryLLDD from LLDDandHealthProblem LLDDandHealthProblem";
                    if (useIdentity)
                        sql += " where LLDDandHealthProblem.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where LLDDandHealthProblem.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LearnerFAM.LearnFAMType,LearnerFAM.LearnFAMCode from LearnerFAM LearnerFAM";
                    if (useIdentity)
                        sql += " where LearnerFAM.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where LearnerFAM.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select ProviderSpecLearnerMonitoring.ProvSpecLearnMonOccur,ProviderSpecLearnerMonitoring.ProvSpecLearnMon from ProviderSpecLearnerMonitoring ProviderSpecLearnerMonitoring";
                    if (useIdentity)
                        sql += " where ProviderSpecLearnerMonitoring.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where ProviderSpecLearnerMonitoring.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LearnerEmploymentStatus.EmpStat,cast(LearnerEmploymentStatus.DateEmpStatApp as date) DateEmpStatApp,LearnerEmploymentStatus.EmpId,(select EmploymentStatusMonitoring.ESMType,EmploymentStatusMonitoring.ESMCode from EmploymentStatusMonitoring EmploymentStatusMonitoring";
                    if (useIdentity)
                        sql += " where EmploymentStatusMonitoring.FK_LearnerEmploymentStatus=LearnerEmploymentStatus.PK_LearnerEmploymentStatus for xml auto, type, elements) from LearnerEmploymentStatus LearnerEmploymentStatus where LearnerEmploymentStatus.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where EmploymentStatusMonitoring.LearnRefNumber=LearnerEmploymentStatus.LearnRefNumber and EmploymentStatusMonitoring.DateEmpStatApp=LearnerEmploymentStatus.DateEmpStatApp for xml auto, type, elements) from LearnerEmploymentStatus LearnerEmploymentStatus where LearnerEmploymentStatus.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LearnerHE.UCASPERID,LearnerHE.TTACCOM,(select LearnerHEFinancialSupport.FINTYPE,LearnerHEFinancialSupport.FINAMOUNT from LearnerHEFinancialSupport LearnerHEFinancialSupport";
                    if (useIdentity)
                        sql += " where LearnerHEFinancialSupport.FK_LearnerHE=LearnerHE.PK_LearnerHE for xml auto, type, elements) from LearnerHE LearnerHE where LearnerHE.FK_Learner=Learner.PK_Learner for xml auto, type, elements),";
                    else
                        sql += " where LearnerHEFinancialSupport.LearnRefNumber=LearnerHE.LearnRefNumber for xml auto, type, elements) from LearnerHE LearnerHE where LearnerHE.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (";
                    sql += " select ";
                    sql += " LearningDelivery.LearnAimRef,";
                    sql += " LearningDelivery.AimType,";
                    sql += " LearningDelivery.AimSeqNumber,";
                    sql += " cast(LearningDelivery.LearnStartDate as date) LearnStartDate,";
                    sql += " cast(LearningDelivery.OrigLearnStartDate as date) OrigLearnStartDate,";
                    sql += " cast(LearningDelivery.LearnPlanEndDate as date) LearnPlanEndDate,";
                    sql += " LearningDelivery.FundModel,";
                    sql += " LearningDelivery.ProgType,";
                    sql += " LearningDelivery.FworkCode,";
                    sql += " LearningDelivery.PwayCode,";
                    sql += " LearningDelivery.StdCode,";
                    sql += " LearningDelivery.PartnerUKPRN,";
                    sql += " LearningDelivery.DelLocPostCode,";
                    sql += " LearningDelivery.AddHours,";
                    sql += " LearningDelivery.PriorLearnFundAdj,";
                    sql += " LearningDelivery.OtherFundAdj,";
                    sql += " LearningDelivery.ConRefNumber,";
                    sql += " LearningDelivery.ConRefNumber,";
                    sql += " LearningDelivery.EPAOrgID,";
                    sql += " LearningDelivery.CompStatus,";
                    sql += " cast(LearningDelivery.LearnActEndDate as date) LearnActEndDate,";
                    sql += " LearningDelivery.WithdrawReason,";
                    sql += " LearningDelivery.Outcome,";
                    sql += " cast(LearningDelivery.AchDate as date) AchDate,";
                    sql += " LearningDelivery.OutGrade,";
                    sql += " LearningDelivery.SWSupAimId,";
                    sql += " (select LearningDeliveryFAM.LearnDelFAMType,LearningDeliveryFAM.LearnDelFAMCode,cast(LearningDeliveryFAM.LearnDelFAMDateFrom as date) LearnDelFAMDateFrom,cast(LearningDeliveryFAM.LearnDelFAMDateTo as date) LearnDelFAMDateTo from LearningDeliveryFAM LearningDeliveryFAM";
                    if (useIdentity)
                        sql += " where LearningDeliveryFAM.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements),";
                    else
                        sql += " where LearningDeliveryFAM.LearnRefNumber=LearningDelivery.LearnRefNumber and LearningDeliveryFAM.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select cast(LearningDeliveryWorkPlacement.WorkPlaceStartDate as date) WorkPlaceStartDate, cast(LearningDeliveryWorkPlacement.WorkPlaceEndDate as date) WorkPlaceEndDate, LearningDeliveryWorkPlacement.WorkPlaceHours, LearningDeliveryWorkPlacement.WorkPlaceMode, LearningDeliveryWorkPlacement.WorkPlaceEmpId from LearningDeliveryWorkPlacement LearningDeliveryWorkPlacement";
                    if (useIdentity)
                        sql += " where LearningDeliveryWorkPlacement.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements),";
                    else
                        sql += " where LearningDeliveryWorkPlacement.LearnRefNumber=LearningDelivery.LearnRefNumber and LearningDeliveryWorkPlacement.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select AppFinRecord.AFinType,AppFinRecord.AFinCode,cast(AppFinRecord.AFinDate as date) AFinDate,AppFinRecord.AFinAmount from AppFinRecord AppFinRecord";
                    if (useIdentity)
                        sql += " where AppFinRecord.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements),";
                    else
                        sql += " where AppFinRecord.LearnRefNumber=LearningDelivery.LearnRefNumber and ApprenticeshipFinancialRecord.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select ProviderSpecDeliveryMonitoring.ProvSpecDelMonOccur,ProviderSpecDeliveryMonitoring.ProvSpecDelMon from ProviderSpecDeliveryMonitoring ProviderSpecDeliveryMonitoring";
                    if (useIdentity)
                        sql += " where ProviderSpecDeliveryMonitoring.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements),";
                    else
                        sql += " where ProviderSpecDeliveryMonitoring.LearnRefNumber=LearningDelivery.LearnRefNumber and ProviderSpecDeliveryMonitoring.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select LearningDeliveryHE.NUMHUS,LearningDeliveryHE.SSN,LearningDeliveryHE.QUALENT3,LearningDeliveryHE.SOC2000,LearningDeliveryHE.SEC,LearningDeliveryHE.UCASAPPID,LearningDeliveryHE.TYPEYR,LearningDeliveryHE.MODESTUD,LearningDeliveryHE.FUNDLEV,LearningDeliveryHE.FUNDCOMP,cast(LearningDeliveryHE.STULOAD as varchar) STULOAD,LearningDeliveryHE.YEARSTU,LearningDeliveryHE.MSTUFEE,cast(LearningDeliveryHE.PCOLAB as varchar) PCOLAB,cast(LearningDeliveryHE.PCFLDCS as varchar) PCFLDCS,cast(LearningDeliveryHE.PCSLDCS as varchar) PCSLDCS,cast(LearningDeliveryHE.PCTLDCS as varchar) PCTLDCS,LearningDeliveryHE.SPECFEE,LearningDeliveryHE.NETFEE,LearningDeliveryHE.GROSSFEE,LearningDeliveryHE.DOMICILE,LearningDeliveryHE.ELQ,LearningDeliveryHE.HEPostCode from LearningDeliveryHE LearningDeliveryHE";
                    if (useIdentity)
                        sql += " where LearningDeliveryHE.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery for xml auto, type, elements)";
                    else
                        sql += " where LearningDeliveryHE.LearnRefNumber=LearningDelivery.LearnRefNumber and LearningDeliveryHE.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements)";
                    sql += " from ";
                    sql += " LearningDelivery LearningDelivery";
                    sql += " where";
                    if (useIdentity)
                        sql += " LearningDelivery.FK_Learner=Learner.PK_Learner";
                    else
                        sql += " LearningDelivery.LearnRefNumber=Learner.LearnRefNumber";
                    sql += " for xml auto, type, elements";
                    sql += " )";
                    sql += " from";
                    sql += " Learner Learner";
                    sql += " for xml path ('Learner')";
                    sql += " ) as varchar(max)),'')";
                    break;
                default:
                    sql = "select coalesce(cast((select";
                    sql += " Learner.LearnRefNumber,";
                    sql += " Learner.PrevLearnRefNumber,";
                    sql += " Learner.PrevUKPRN,";
                    sql += " Learner.ULN,";
                    sql += " Learner.FamilyName,";
                    sql += " Learner.GivenNames,";
                    sql += " cast(Learner.DateOfBirth as date) DateOfBirth,";
                    sql += " Learner.Ethnicity,";
                    sql += " Learner.Sex,";
                    sql += " Learner.LLDDHealthProb,";
                    sql += " Learner.NINumber,";
                    sql += " Learner.PriorAttain,";
                    sql += " Learner.Accom,";
                    sql += " Learner.ALSCost,";
                    sql += " Learner.PlanLearnHours,";
                    sql += " Learner.PlanEEPHours,";
                    sql += " Learner.Dest,";
                    sql += " (select LearnerContact.LocType,LearnerContact.ContType,LearnerContact.Email,LearnerContact.TelNumber,LearnerContact.PostCode,(select PostAdd.AddLine1,PostAdd.AddLine2,PostAdd.AddLine3,PostAdd.AddLine4 from PostAdd PostAdd where PostAdd.LearnRefNumber=LearnerContact.LearnRefNumber and LearnerContact.LocType=1 for xml auto, type, elements) from LearnerContact LearnerContact where LearnerContact.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select ContactPreference.ContPrefType,ContactPreference.ContPrefCode from ContactPreference ContactPreference where ContactPreference.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LLDDandHealthProblem.LLDDType,LLDDandHealthProblem.LLDDCode from LLDDandHealthProblem LLDDandHealthProblem where LLDDandHealthProblem.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LearnerFAM.LearnFAMType,LearnerFAM.LearnFAMCode from LearnerFAM LearnerFAM where LearnerFAM.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select ProviderSpecLearnerMonitoring.ProvSpecLearnMonOccur,ProviderSpecLearnerMonitoring.ProvSpecLearnMon from ProviderSpecLearnerMonitoring ProviderSpecLearnerMonitoring where ProviderSpecLearnerMonitoring.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LearnerEmploymentStatus.EmpStat,cast(LearnerEmploymentStatus.DateEmpStatApp as date) DateEmpStatApp,LearnerEmploymentStatus.EmpId,(select EmploymentStatusMonitoring.ESMType,EmploymentStatusMonitoring.ESMCode from EmploymentStatusMonitoring EmploymentStatusMonitoring where EmploymentStatusMonitoring.LearnRefNumber=LearnerEmploymentStatus.LearnRefNumber and EmploymentStatusMonitoring.DateEmpStatApp=LearnerEmploymentStatus.DateEmpStatApp for xml auto, type, elements) from LearnerEmploymentStatus LearnerEmploymentStatus where LearnerEmploymentStatus.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (select LearnerHE.UCASPERID,LearnerHE.TTACCOM,(select LearnerHEFinancialSupport.FINTYPE,LearnerHEFinancialSupport.FINAMOUNT from LearnerHEFinancialSupport LearnerHEFinancialSupport where LearnerHEFinancialSupport.LearnRefNumber=LearnerHE.LearnRefNumber for xml auto, type, elements) from LearnerHE LearnerHE where LearnerHE.LearnRefNumber=Learner.LearnRefNumber for xml auto, type, elements),";
                    sql += " (";
                    sql += " select ";
                    sql += " LearningDelivery.LearnAimRef,";
                    sql += " LearningDelivery.AimType,";
                    sql += " LearningDelivery.AimSeqNumber,";
                    sql += " cast(LearningDelivery.LearnStartDate as date) LearnStartDate,";
                    sql += " cast(LearningDelivery.OrigLearnStartDate as date) OrigLearnStartDate,";
                    sql += " cast(LearningDelivery.LearnPlanEndDate as date) LearnPlanEndDate,";
                    sql += " LearningDelivery.FundModel,";
                    sql += " LearningDelivery.ProgType,";
                    sql += " LearningDelivery.FworkCode,";
                    sql += " LearningDelivery.PwayCode,";
                    sql += " LearningDelivery.PartnerUKPRN,";
                    sql += " LearningDelivery.DelLocPostCode,";
                    sql += " LearningDelivery.PriorLearnFundAdj,";
                    sql += " LearningDelivery.OtherFundAdj,";
                    sql += " LearningDelivery.ESFProjDosNumber,";
                    sql += " LearningDelivery.ESFLocProjNumber,";
                    sql += " LearningDelivery.EmpOutcome,";
                    sql += " LearningDelivery.CompStatus,";
                    sql += " cast(LearningDelivery.LearnActEndDate as date) LearnActEndDate,";
                    sql += " LearningDelivery.WithdrawReason,";
                    sql += " LearningDelivery.Outcome,";
                    sql += " cast(LearningDelivery.AchDate as date) AchDate,";
                    sql += " LearningDelivery.OutGrade,";
                    sql += " LearningDelivery.SWSupAimId,";
                    sql += " (select LearningDeliveryFAM.LearnDelFAMType,LearningDeliveryFAM.LearnDelFAMCode,cast(LearningDeliveryFAM.LearnDelFAMDateFrom as date) LearnDelFAMDateFrom,cast(LearningDeliveryFAM.LearnDelFAMDateTo as date) LearnDelFAMDateTo from LearningDeliveryFAM LearningDeliveryFAM where LearningDeliveryFAM.LearnRefNumber=LearningDelivery.LearnRefNumber and LearningDeliveryFAM.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select cast(LearningDeliveryWorkPlacement.WorkPlaceStartDate as date) WorkPlaceStartDate, cast(LearningDeliveryWorkPlacement.WorkPlaceEndDate as date) WorkPlaceEndDate, LearningDeliveryWorkPlacement.WorkPlaceMode, LearningDeliveryWorkPlacement.WorkPlaceEmpId from LearningDeliveryWorkPlacement LearningDeliveryWorkPlacement where LearningDeliveryWorkPlacement.LearnRefNumber=LearningDelivery.LearnRefNumber and LearningDeliveryWorkPlacement.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select ApprenticeshipTrailblazerFinancialDetails.TBFinType,ApprenticeshipTrailblazerFinancialDetails.TBFinCode,cast(ApprenticeshipTrailblazerFinancialDetails.TBFinDate as date) TBFinDate,ApprenticeshipTrailblazerFinancialDetails.TBFinAmount from ApprenticeshipTrailblazerFinancialDetails ApprenticeshipTrailblazerFinancialDetails where ApprenticeshipTrailblazerFinancialDetails.LearnRefNumber=LearningDelivery.LearnRefNumber and ApprenticeshipTrailblazerFinancialDetails.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select ProviderSpecDeliveryMonitoring.ProvSpecDelMonOccur,ProviderSpecDeliveryMonitoring.ProvSpecDelMon from ProviderSpecDeliveryMonitoring ProviderSpecDeliveryMonitoring where ProviderSpecDeliveryMonitoring.LearnRefNumber=LearningDelivery.LearnRefNumber and ProviderSpecDeliveryMonitoring.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements),";
                    sql += " (select LearningDeliveryHE.NUMHUS,LearningDeliveryHE.SSN,LearningDeliveryHE.QUALENT3,LearningDeliveryHE.SOC2000,LearningDeliveryHE.SEC,LearningDeliveryHE.TOTALTS,LearningDeliveryHE.UCASAPPID,LearningDeliveryHE.TYPEYR,LearningDeliveryHE.MODESTUD,LearningDeliveryHE.FUNDLEV,LearningDeliveryHE.FUNDCOMP,cast(LearningDeliveryHE.STULOAD as varchar) STULOAD,LearningDeliveryHE.YEARSTU,LearningDeliveryHE.MSTUFEE,cast(LearningDeliveryHE.PCOLAB as varchar) PCOLAB,cast(LearningDeliveryHE.PCFLDCS as varchar) PCFLDCS,cast(LearningDeliveryHE.PCSLDCS as varchar) PCSLDCS,cast(LearningDeliveryHE.PCTLDCS as varchar) PCTLDCS,LearningDeliveryHE.SPECFEE,LearningDeliveryHE.NETFEE,LearningDeliveryHE.DOMICILE,LearningDeliveryHE.ELQ from LearningDeliveryHE LearningDeliveryHE where LearningDeliveryHE.LearnRefNumber=LearningDelivery.LearnRefNumber and LearningDeliveryHE.AimSeqNumber=LearningDelivery.AimSeqNumber for xml auto, type, elements)";
                    sql += " from ";
                    sql += " LearningDelivery LearningDelivery";
                    sql += " where";
                    sql += " LearningDelivery.LearnRefNumber=Learner.LearnRefNumber";
                    sql += " for xml auto, type, elements";
                    sql += " )";
                    sql += " from";
                    sql += " Learner Learner";
                    sql += " for xml path ('Learner')";
                    sql += " ) as varchar(max)),'')";
                    break;
            }

            return sql;
            */
            #endregion
        }

        private string GetLearnerSQLEFA(string documentNS)
        {
            return GetFileContents(GetFilenameFormat("GetLearnerSQL_{0}_{1}_EFA.sql", documentNS).Replace("__", "_"), "GetLearnerSQL_Fallback.sql");
        }

        /// <summary>
        /// Gets the SQL for LearningProvider xml
        /// </summary>
        /// <param name="documentNameSpace"></param>
        /// <returns></returns>
        private string GetLearningProviderSQL(string documentNameSpace)
        {
            return GetFileContents(GetFilenameFormat("GetLearningProviderSQL{0}_{1}.sql", documentNameSpace, false).Replace("__", "_"), "GetLearningProvider_Fallback.sql");
        }

        private string GetLearningProviderSQLEFA(string documentNameSpace)
        {
            return GetFileContents(GetFilenameFormat("GetLearningProviderSQL{0}_{1}_EFA.sql", documentNameSpace, false).Replace("__", "_"), "GetLearningProvider_Fallback.sql");
        }

        /// <summary>
        /// gets the SQL to create the header xml
        /// </summary>
        /// <param name="documentNamespace"></param>
        /// <returns></returns>
        private string GetHeaderSQL(string documentNamespace)
        {
            return GetFileContents(GetFilenameFormat("GetHeaderSQL{0}_{1}.sql", documentNamespace, false).Replace("__", "_"), "GetHeaderSQL_Fallback.sql");
        }

        private string GetHeaderSQLEFA(string documentNamespace)
        {
            return GetFileContents(GetFilenameFormat("GetHeaderSQL{0}_{1}_EFA.sql", documentNamespace, false).Replace("__", "_"), "GetHeaderSQL_Fallback.sql");
        }

        private string GetLearnerDestinationandProgressionSQL(string documentNamespace)
        {
            return GetFileContents(GetFilenameFormat("GetLearnerDestinationandProgressionSQL{0}_{1}.sql", documentNamespace).Replace("__", "_"),
                "GetLearnerDestinationandProgression_Fallback.sql");
        }

        private string GetLearnerDestinationandProgressionSQLEFA(string documentNamespace)
        {
            return GetFileContents(GetFilenameFormat("GetLearnerDestinationandProgressionSQL{0}_{1}_EFA.sql", documentNamespace).Replace("__", "_"),
                "GetLearnerDestinationandProgression_Fallback.sql");
        }

        private string GetSourceFilesSQL(string documentNamespace)
        {
            return GetFileContents(GetFilenameFormat("GetSourceFilesSQL_{0}_{1}.sql", documentNamespace, false).Replace("__", "_"), "GetSourceFiles_Fallback.sql");
        }

        private string GetSourceFilesSQLEFA(string documentNamespace)
        {
            return GetFileContents(GetFilenameFormat("GetSourceFilesSQL_{0}_{1}_EFA.sql", documentNamespace, false).Replace("__", "_"), "GetSourceFiles_Fallback.sql");
        }

        private void ExportXML(string ExportFile)
        {
            //Open the database
            SQLDatabase.Open("Server=" + textServer.Text + ";Database=" + textDatabase.Text + ";Trusted_Connection=True;MultipleActiveResultSets=True;");

            //Open the writer
            TextWriter writer = File.CreateText(ExportFile);

            //Get the UKPRN
            var ukprn = SQLDatabase.ExecuteScalarStatic<int>("select top 1 ukprn from LearningProvider");

            //Write the header
            WriteHeader(writer, ukprn);

            //Write the header
            WriteSourceFiles(writer);

            //Write the learning provider element
            WriteLearningProvider(ukprn, writer);

            //Write out the learner data
            WriteLearners(writer);

            //Close the message tag
            writer.WriteLine("</Message>");

            //Close the writer
            writer.Flush();
            writer.Close();

            //Close the database
            SQLDatabase.Close();
        }

        private void WriteHeader(TextWriter Writer, int UKPRN)
        {
            var year = SQLDatabase.ExecuteScalarStatic<string>("select top 1 year from CollectionDetails");
            var filePrepDate = SQLDatabase.ExecuteScalarStatic<DateTime>("select top 1 filePreparationDate from CollectionDetails");
            Writer.WriteLine("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
            Writer.WriteLine("<Message xmlns=\"http://www.theia.org.uk/ILR/2012-13/1\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">");
            Writer.WriteLine("\t<Header>");
            Writer.WriteLine("\t\t<CollectionDetails>");
            Writer.WriteLine("\t\t\t<Collection>ILR</Collection>");
            Writer.WriteLine("\t\t\t<Year>" + year + "</Year>");
            Writer.WriteLine("\t\t\t<FilePreparationDate>" + filePrepDate.ToString("yyyy-MM-dd") + "</FilePreparationDate>");
            Writer.WriteLine("\t\t</CollectionDetails>");
            var reader = SQLDatabase.ExecuteReader("select top 1 * from Source");
            if (reader.Read())
                WriteElement("Source", 2, reader, Writer, true);
            Writer.WriteLine("\t</Header>");
        }

        private void WriteSourceFiles(TextWriter Writer)
        {
            //Count how many sourcefiles we have
            var sourcefileCount = SQLDatabase.ExecuteScalarStatic<int>("select count(*) from SourceFile");

            if (sourcefileCount > 0)
            {
                Writer.WriteLine("\t<SourceFiles>");

                var reader = SQLDatabase.ExecuteReader("select * from SourceFile");
                while (reader.Read())
                    WriteElement("SourceFile", 2, reader, Writer, true);

                Writer.WriteLine("\t</SourceFiles>");
            }
        }

        private void WriteLearningProvider(int UKPRN, TextWriter Writer)
        {
            Writer.WriteLine("\t<LearningProvider>");
            Writer.WriteLine("\t\t<UKPRN>" + UKPRN.ToString() + "</UKPRN>");
            Writer.WriteLine("\t</LearningProvider>");
        }

        private void WriteLearners(TextWriter Writer)
        {
            string sql = "select * from	dbo.Learner";

            SQLDatabase.ExecuteReaderAction(
                sql,
                x =>
                {
                    WriteElement("Learner", 1, x, Writer, false);
                    WriteLearnerContacts(x.GetString(x.GetOrdinal("LearnRefNumber")), Writer);
                    WriteContactPreferences(x.GetString(x.GetOrdinal("LearnRefNumber")), Writer);
                    WriteLLDDandHealthProblems(x.GetString(x.GetOrdinal("LearnRefNumber")), Writer);
                    WriteLearnerFAMs(x.GetString(x.GetOrdinal("LearnRefNumber")), Writer);
                    WriteProviderSpecLearnerMonitorings(x.GetString(x.GetOrdinal("LearnRefNumber")), Writer);
                    WriteLearnerEmploymentStatuses(x.GetString(x.GetOrdinal("LearnRefNumber")), Writer);
                    WriteLearnerHEs(x.GetString(x.GetOrdinal("LearnRefNumber")), Writer);
                    WriteLearningDeliveries(x.GetString(x.GetOrdinal("LearnRefNumber")), Writer);
                    Writer.WriteLine("\t</Learner>");
                });
        }

        private void WriteLearnerContacts(string LearnRefNumber, TextWriter Writer)
        {
            string sql = "select * from	dbo.LearnerContact where LearnRefNumber='" + LearnRefNumber + "'";
            SQLDatabase.ExecuteReaderAction(
                sql,
                x =>
                {
                    WriteElement("LearnerContact", 2, x, Writer, false);
                    int locType = x.GetInt32(x.GetOrdinal("LocType"));
                    if (locType == 1)
                        WritePostAdds(LearnRefNumber, locType, x.GetInt32(x.GetOrdinal("ContType")), Writer);
                    Writer.WriteLine("\t</LearnerContact>");
                });
        }

        private void WritePostAdds(string LearnRefNumber, int LocType, int ContType, TextWriter Writer)
        {
            string sql = "select * from	dbo.PostAdd where LearnRefNumber='" + LearnRefNumber + "' and LocType=" + LocType.ToString() + " and ContType=" + ContType.ToString();
            SQLDatabase.ExecuteReaderAction(
                sql,
                x => WriteElement("PostAdd", 3, x, Writer, true));
        }

        private void WriteContactPreferences(string LearnRefNumber, TextWriter Writer)
        {
            string sql = "select * from	dbo.ContactPreference where LearnRefNumber='" + LearnRefNumber + "'";
            SQLDatabase.ExecuteReaderAction(
                sql,
                x => WriteElement("ContactPreference", 2, x, Writer, true));
        }

        private void WriteLLDDandHealthProblems(string LearnRefNumber, TextWriter Writer)
        {
            string sql = "select * from	dbo.LLDDandHealthProblem where LearnRefNumber='" + LearnRefNumber + "'";
            SQLDatabase.ExecuteReaderAction(
                sql,
                x => WriteElement("LLDDandHealthProblem", 2, x, Writer, true));
        }

        private void WriteLearnerFAMs(string LearnRefNumber, TextWriter Writer)
        {
            string sql = "select * from	dbo.LearnerFAM where LearnRefNumber='" + LearnRefNumber + "'";
            SQLDatabase.ExecuteReaderAction(
                sql,
                x => WriteElement("LearnerFAM", 2, x, Writer, true));
        }

        private void WriteProviderSpecLearnerMonitorings(string LearnRefNumber, TextWriter Writer)
        {
            string sql = "select * from	dbo.ProviderSpecLearnerMonitoring where LearnRefNumber='" + LearnRefNumber + "'";
            SQLDatabase.ExecuteReaderAction(
                sql,
                x => WriteElement("ProviderSpecLearnerMonitoring", 2, x, Writer, true));
        }

        private void WriteLearnerEmploymentStatuses(string LearnRefNumber, TextWriter Writer)
        {
            string sql = "select * from	dbo.LearnerEmploymentStatus where LearnRefNumber='" + LearnRefNumber + "'";
            SQLDatabase.ExecuteReaderAction(
                sql,
                x =>
                {
                    WriteElement("LearnerEmploymentStatus", 2, x, Writer, false);
                    WriteEmploymentStatusMonitorings(LearnRefNumber, x.GetDateTime(x.GetOrdinal("DateEmpStatApp")), Writer);
                    Writer.WriteLine("\t</LearnerEmploymentStatus>");
                });
        }

        private void WriteEmploymentStatusMonitorings(string LearnRefNumber, DateTime DateEmpStatApp, TextWriter Writer)
        {
            string sql = "select * from	dbo.EmploymentStatusMonitoring where LearnRefNumber='" + LearnRefNumber + "' and DateEmpStatApp='" + DateEmpStatApp.ToString("dd-MMM-yyyy") + "'";
            SQLDatabase.ExecuteReaderAction(
                sql,
                x => WriteElement("EmploymentStatusMonitoring", 3, x, Writer, true));
        }

        private void WriteLearnerHEs(string LearnRefNumber, TextWriter Writer)
        {
            string sql = "select * from	dbo.LearnerHE where LearnRefNumber='" + LearnRefNumber + "'";
            SQLDatabase.ExecuteReaderAction(
                sql,
                x => WriteElement("LearnerHE", 2, x, Writer, true));
        }

        private void WriteLearningDeliveries(string LearnRefNumber, TextWriter Writer)
        {
            string sql = "select * from	dbo.LearningDelivery where LearnRefNumber='" + LearnRefNumber + "'";
            SQLDatabase.ExecuteReaderAction(
                sql,
                x =>
                {
                    WriteElement("LearningDelivery", 2, x, Writer, false);
                    int aimSeqNumber = x.GetInt32(x.GetOrdinal("AimSeqNumber"));

                    WriteLearningDeliveryFAMs(LearnRefNumber, aimSeqNumber, Writer);
                    WriteLearningDeliveryWorkPlacement(LearnRefNumber, aimSeqNumber, Writer);
                    WriteProviderSpecDeliveryMonitorings(LearnRefNumber, aimSeqNumber, Writer);
                    WriteLearningDeliveryHEs(LearnRefNumber, aimSeqNumber, Writer);
                    Writer.WriteLine("\t</LearningDelivery>");
                });
        }

        private void WriteLearningDeliveryFAMs(string LearnRefNumber, int AimSeqNumber, TextWriter Writer)
        {
            string sql = "select * from	dbo.LearningDeliveryFAM where LearnRefNumber='" + LearnRefNumber + "' and AimSeqNumber=" + AimSeqNumber.ToString();
            SQLDatabase.ExecuteReaderAction(
                sql,
                x => WriteElement("LearningDeliveryFAM", 3, x, Writer, true));
        }

        private void WriteLearningDeliveryWorkPlacement(string LearnRefNumber, int AimSeqNumber, TextWriter Writer)
        {
            string sql = "select * from	dbo.LearningDeliveryWorkPlacement where LearnRefNumber='" + LearnRefNumber + "' and AimSeqNumber=" + AimSeqNumber.ToString();
            SQLDatabase.ExecuteReaderAction(
                sql,
                x => WriteElement("LearningDeliveryWorkPlacement", 3, x, Writer, true));
        }

        private void WriteProviderSpecDeliveryMonitorings(string LearnRefNumber, int AimSeqNumber, TextWriter Writer)
        {
            string sql = "select * from	dbo.ProviderSpecDeliveryMonitoring where LearnRefNumber='" + LearnRefNumber + "' and AimSeqNumber=" + AimSeqNumber.ToString();
            SQLDatabase.ExecuteReaderAction(
                sql,
                x => WriteElement("ProviderSpecDeliveryMonitoring", 3, x, Writer, true));
        }

        private void WriteLearningDeliveryHEs(string LearnRefNumber, int AimSeqNumber, TextWriter Writer)
        {
            string sql = "select * from	dbo.LearningDeliveryHE where LearnRefNumber='" + LearnRefNumber + "' and AimSeqNumber=" + AimSeqNumber.ToString();
            SQLDatabase.ExecuteReaderAction(
                sql,
                x => WriteElement("LearningDeliveryHE", 3, x, Writer, true));
        }

        private void WriteElement(String ElementName, int Indent, IDataReader Reader, TextWriter Writer, bool Close)
        {
            string tabs = "";
            for (int i = 0; i < Indent; i++)
                tabs += "\t";
            Writer.WriteLine(tabs + "<" + ElementName + ">");

            for (int col = 0; col < Reader.FieldCount; col++)
            {
                if (NotInheritedKey(ElementName, Reader.GetName(col)) && !Reader.IsDBNull(col))
                {
                    string line = "<" + Reader.GetName(col) + ">";

                    switch (Reader.GetDataTypeName(col))
                    {
                        case "varchar":
                            line += Reader.GetString(col).Replace("&", "&amp;");
                            break;
                        case "datetime":
                            if (ElementName.StartsWith("Source") && Reader.GetName(col) == "DateTime")
                                line += Reader.GetDateTime(col).ToString("yyyy-MM-dd") + "T" + Reader.GetDateTime(col).ToString("HH:mm:ss");
                            else
                                line += Reader.GetDateTime(col).ToString("yyyy-MM-dd");
                            break;
                        default:
                            line += Reader[col].ToString();
                            break;
                    }

                    line += "</" + Reader.GetName(col) + ">";
                    Writer.WriteLine(tabs + "\t" + line);
                }
            }
            if (Close)
                Writer.WriteLine(tabs + "</" + ElementName + ">");
        }

        private bool NotInheritedKey(string ElementName, string AttributeName)
        {
            if (AttributeName == "LearnRefNumber" && ElementName != "Learner")
                return false;
            if (AttributeName == "AimSeqNumber" && ElementName != "LearningDelivery")
                return false;
            if ((AttributeName == "LocType" || AttributeName == "ContType") && ElementName != "LearnerContact")
                return false;
            if (AttributeName == "DateEmpStatApp" && ElementName != "LearnerEmploymentStatus")
                return false;

            return true;
        }
        #endregion

        private void LoadBtn_Click(object sender, EventArgs e)
        {
            button1.Enabled = false;
            ErrorBtn.Enabled = false;
            ExportBtn.Enabled = false;

            if (checkUseFileName.Checked)
                textDatabase.Text = textILRFile.Text.Substring(textILRFile.Text.LastIndexOf("\\") + 1).Replace(".xml", "").Replace(".XML", "");

            SaveSettings();
            listBox1.Items.Clear();
            DateTime started = DateTime.Now;
            listBox1.Items.Add("Started: " + started.ToLongTimeString());

            //Data Source = dcfsbatchjobtest.database.windows.net; Initial Catalog = batchjobtest; Integrated Security = False; User ID = hal; Password = ********; Connect Timeout = 15; Encrypt = False; TrustServerCertificate = True; ApplicationIntent = ReadWrite; MultiSubnetFailover = False
            string sqlConnMaster = "server=" + textServer.Text + $";Database=master;{textSQLSecurity.Text};TrustServerCertificate = True;MultipleActiveResultSets=True;";

            SQLDatabase.Open(sqlConnMaster);
            if (!SQLDatabase.Exists(textDatabase.Text, SQLDatabase.ObjectType.DATABASE))
                SQLDatabase.CreateDatabase(textDatabase.Text);
            SQLDatabase.Close();

            string sqlConn = $"server={textServer.Text};Database={textDatabase.Text};{textSQLSecurity.Text};TrustServerCertificate = True;MultipleActiveResultSets=True;";

            SQLDatabase.Open(sqlConn);
            SQLSchema sqlSchema = new SQLSchema(textILRSchema.Text, true);
            XmlDocument relations = new XmlDocument();
            relations.Load("Relationships.xml");

            XmlNode yearSchemaNode = relations.SelectSingleNode("Schemas/Schema[@ns='" + SQLSchema.NameSpace + "']");
            XmlDocument relationsForSchema = new XmlDocument();
            relationsForSchema.AppendChild(relationsForSchema.ImportNode(yearSchemaNode, true));
            sqlSchema.Relationships = relationsForSchema;
            if (checkAddIdentity.Checked)
                sqlSchema.GenerateBulkLoadSchemaWithIdentity().Save("generatedSchema.xml");
            else
                sqlSchema.GenerateBulkLoadSchema().Save("generatedSchema.xml");

            bool createTables = false;
            if (checkCreateTables.Checked)
                if (checkAddIdentity.Checked)
                    sqlSchema.CreateTables(false, false, checkAddIdentity.Checked, "");
                else
                    createTables = true;

            string bulkLoadSchema;
            if (textBulkLoadSchema.Text.Trim().Length > 0)
                bulkLoadSchema = textBulkLoadSchema.Text;
            else
                bulkLoadSchema = "generatedSchema.xml";

            string server = textServer.Text;
            if (server == "(local)")
                server = Environment.MachineName;

            BulkLoad.Load(textILRFile.Text, bulkLoadSchema, server, textDatabase.Text, textSQLSecurity.Text, createTables);

            if (createTables)
                sqlSchema.CreateIndices();

            SQLDatabase.Close();
            DateTime ended = DateTime.Now;
            listBox1.Items.Add("Ended: " + ended.ToLongTimeString());
            listBox1.Items.Add("Took: " + ended.Subtract(started).TotalSeconds.ToString() + " seconds");
            if (File.Exists("error.xml"))
            {
                listBox1.Items.Add("ERRORS!");
                ErrorBtn.Enabled = true;
            }
            button1.Enabled = true;
            ExportBtn.Enabled = true;
        }

        private void ErrorBtn_Click(object sender, EventArgs e)
        {
            Process.Start("error.xml");
        }

        private void ExportBtn_Click(object sender, EventArgs e)
        {
            Cursor.Current = Cursors.WaitCursor;

            button1.Enabled = false;
            ErrorBtn.Enabled = false;
            ExportBtn.Enabled = false;

            ExportXMLQuickly("ilr_export.xml", this.textILRSchema.Text);
            {
                button1.Enabled = true;
                //button2.Enabled = true; <= this is the error button
                ExportBtn.Enabled = true;

                Cursor.Current = Cursors.Default;
            }

            listBox1.Items.Add("Export Successful");
        }

        private void ConnectionTestBtn_Click(object sender, EventArgs e)
        {
            var builder = new SqlConnectionStringBuilder();
            builder.DataSource = textServer.Text;
            // builder.InitialCatalog = textDatabase.Text <= not required for a connection test
            var connectionString = builder.ConnectionString;
            connectionString += $";{textSQLSecurity.Text};";

            var conn = new SqlConnection(connectionString);

            conn.Open();
            conn.Close();

            MessageBox.Show("ADO Connection OK");

            string server = textServer.Text;
            if (server == "(local)")
            {
                server = Environment.MachineName;
            }

            // var oleConnString = $"Provider=sqloledb;server={server};database={textDatabase.Text};integrated security=SSPI";
            var oleConnString = $"Provider=sqloledb;server={server};integrated security=SSPI";

            var oleConn = new OleDbConnection(oleConnString);
            oleConn.Open();
            oleConn.Close();

            MessageBox.Show("OLEDB Connection OK");
        }

        private void IlrFileBrowseBtn_Click(object sender, EventArgs e)
        {
            BrowseToFile(textILRFile, "xml", true);
        }

        private void IlrXsdBrowseBtn_Click(object sender, EventArgs e)
        {
            BrowseToFile(textILRSchema, "xsd", true);
        }

        private void XDSExportBtn_Click(object sender, EventArgs e)
        {
            XDS xds = new XDS();
            xds.ShowDialog();
        }

        private void efaExportBtn_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(textILRSchema.Text))
            {
                MessageBox.Show("you need to load the target ILR xsd");
            }
            if (string.IsNullOrEmpty(textServer.Text))
            {
                MessageBox.Show("The sql server instance name needs to be present");
            }
            if (string.IsNullOrEmpty(textDatabase.Text))
            {
                MessageBox.Show("The ilr database needs to be present");
            }
            if (string.IsNullOrEmpty(textUKPRN.Text))
            {
                MessageBox.Show("The UKPRN to export is required");
            }
            if ((!string.IsNullOrEmpty(textDatabase.Text)) && (!string.IsNullOrEmpty(textServer.Text)) && (!string.IsNullOrEmpty(textUKPRN.Text)) && (!string.IsNullOrEmpty(textILRSchema.Text)))
            {
                ExportXMLMulti($"{textUKPRN.Text}_Export.xml", textILRSchema.Text, textUKPRN.Text);
            }
        }
    }
}
