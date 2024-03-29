-- create a master key encryption so that we can create credentials
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '$(Password)';

CREATE DATABASE SCOPED CREDENTIAL ILR_Credential
WITH IDENTITY='$(Identity)',
SECRET ='$(Password)';

-- https://docs.microsoft.com/en-us/azure/sql-database/sql-database-elastic-query-vertical-partitioning

-- link the databases
CREATE EXTERNAL DATA SOURCE RemoteILRData
WITH
(
	TYPE=RDBMS,
	LOCATION='<<database>>.database.windows.net',
	DATABASE_NAME='$(FromILRDatabase)',
	CREDENTIAL=ILR_Credential
);
GO

CREATE EXTERNAL DATA SOURCE RemoteLARSData
WITH
(
	TYPE=RDBMS,
	LOCATION='<<database>>.database.windows.net',
	DATABASE_NAME='$(LARS)',
	CREDENTIAL=ILR_Credential
);
GO

CREATE EXTERNAL DATA SOURCE RemoteOrganisationData
WITH
(
	TYPE=RDBMS,
	LOCATION='<<database>>.database.windows.net',
	DATABASE_NAME='$(Org)',
	CREDENTIAL=ILR_Credential
);
GO

CREATE EXTERNAL DATA SOURCE RemotePostcodeData
WITH
(
	TYPE=RDBMS,
	LOCATION='<<database>>.database.windows.net',
	DATABASE_NAME='$(Postcodes)',
	CREDENTIAL=ILR_Credential
);
GO

CREATE EXTERNAL DATA SOURCE RemoteEmployerData
WITH
(
	TYPE=RDBMS,
	LOCATION='<<database>>.database.windows.net',
	DATABASE_NAME='$(EDRS)',
	CREDENTIAL=ILR_Credential
);
GO

CREATE EXTERNAL DATA SOURCE RemoteULNData
WITH
(
	TYPE=RDBMS,
	LOCATION='<<database>>.database.windows.net',
	DATABASE_NAME='$(ULN)',
	CREDENTIAL=ILR_Credential
);
GO

CREATE EXTERNAL DATA SOURCE RemoteFCTData
WITH
(
	TYPE=RDBMS,
	LOCATION='<<database>>.database.windows.net',
	DATABASE_NAME='$(FCT)',
	CREDENTIAL=ILR_Credential
);
GO

if not exists(select schema_id from sys.schemas where name='$(LARS_Schema)')
	exec('create schema $(LARS_Schema)')
GO
if not exists(select schema_id from sys.schemas where name='$(Postcodes_Schema)')
	exec('create schema $(Postcodes_Schema)')
GO
if not exists(select schema_id from sys.schemas where name='$(FCT_Schema)')
	exec('create schema $(FCT_Schema)')
GO
if not exists(select schema_id from sys.schemas where name='$(EDRS_Schema)')
	exec('create schema $(EDRS_Schema)')
GO
if not exists(select schema_id from sys.schemas where name='$(Org_Schema)')
	exec('create schema $(Org_Schema)')
GO
if not exists(select schema_id from sys.schemas where name='$(ULN_Schema)')
	exec('create schema $(ULN_Schema)')
GO

CREATE EXTERNAL TABLE [$(EDRS_Schema)].[Employers](
	[URN] [int] NOT NULL
)WITH
(
	DATA_SOURCE=RemoteEmployerData
);GO


CREATE EXTERNAL TABLE [$(LARS_Schema)].[LARS_Standard](
	[StandardCode] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[StandardName] [varchar](256) NULL,
	[StandardSectorCode] [varchar](25) NULL,
	[NotionalEndLevel] [varchar](5) NULL,
	[EffectiveFrom] [date] NULL,
	[LastDateStarts] [date] NULL,
	[EffectiveTo] [date] NULL,
	[URLLink] [varchar](1200) NULL,
	[SectorSubjectAreaTier1] [decimal](5, 2) NULL,
	[SectorSubjectAreaTier2] [decimal](5, 2) NULL,
	[IntegratedDegreeStandard] [char](1) NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](100) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](100) NOT NULL
)WITH
(
	DATA_SOURCE=RemoteLARSData
);
GO

CREATE EXTERNAL TABLE [$(LARS_Schema)].[LARS_FrameworkCmnComp](
	[FworkCode] [int] NOT NULL,
	[ProgType] [int] NOT NULL,
	[PwayCode] [int] NOT NULL,
	[CommonComponent] [int] NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NULL,
	[MinLevel] [char](1) NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](100) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](100) NOT NULL
)WITH
(
	DATA_SOURCE=RemoteLARSData
);
GO



CREATE EXTERNAL TABLE [$(LARS_Schema)].[LARS_Section96](
	[LearnAimRef] [varchar](8) NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NULL,
	[Section96ApprovalStatus] [int] NULL,
	[Section96ApprovalStartDate] [date] NULL,
	[Section96ReviewDate] [date] NULL,
	[Section96ValidPre16] [int] NULL,
	[Section96Valid16to18] [int] NULL,
	[Section96Valid18plus] [int] NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](100) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](100) NOT NULL
)WITH
(
	DATA_SOURCE=RemoteLARSData
);


CREATE EXTERNAL TABLE [$(LARS_Schema)].[LARS_LearningDeliveryCategory_TopMostCategory](
	[LearnAimRef] [varchar](8) NULL,
	[CategoryRef] [int] NULL,
	[CategoryName] [varchar](256) NULL,
	[Target] [varchar](75) NULL
)WITH
(
	DATA_SOURCE=RemoteLARSData
);
GO


CREATE EXTERNAL TABLE [$(LARS_Schema)].[LARS_Framework](
	[FworkCode] [int] NOT NULL,
	[ProgType] [int] NOT NULL,
	[PwayCode] [int] NOT NULL,
	[PathwayName] [varchar](256) NULL,
	[EffectiveFrom] [date] NULL,
	[EffectiveTo] [date] NULL,
	[SectorSubjectAreaTier1] [decimal](5, 2) NULL,
	[SectorSubjectAreaTier2] [decimal](5, 2) NULL,
	[DataSource] [varchar](150) NULL,
	[NASTitle] [varchar](750) NULL,
	[ImplementDate] [date] NULL,
	[IssuingAuthorityTitle] [varchar](256) NULL,
	[IssuingAuthority] [varchar](15) NULL,
	[DataReceivedDate] [date] NULL,
	[MI_FullLevel2] [int] NULL,
	[MI_FullLevel2Percent] [decimal](5, 2) NULL,
	[MI_FullLevel3] [int] NULL,
	[MI_FullLevel3Percent] [decimal](5, 2) NULL,
	[CurrentVersion] [varchar](10) NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](100) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](100) NOT NULL
)WITH
(
	DATA_SOURCE=RemoteLARSData
);
GO


CREATE EXTERNAL TABLE [$(LARS_Schema)].[LARS_LearningDelivery](
	[LearnAimRef] [varchar](8) NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NULL,
	[LearnAimRefTitle] [varchar](254) NULL,
	[LearnAimRefType] [varchar](4) NULL,
	[NotionalNVQLevel] [char](1) NULL,
	[NotionalNVQLevelv2] [varchar](5) NULL,
	[AwardOrgAimRef] [varchar](50) NULL,
	[CertificationEndDate] [date] NULL,
	[OperationalStartDate] [date] NULL,
	[OperationalEndDate] [date] NULL,
	[EnglandFEHEStatus] [char](1) NULL,
	[CreditBasedFwkType] [int] NULL,
	[QltyAssAgencyType] [int] NULL,
	[OfQualGlhMin] [int] NULL,
	[OfQualGlhMax] [int] NULL,
	[DiplomaLinesOfLearning] [varchar](5) NULL,
	[FrameworkCommonComponent] [int] NULL,
	[LTRCPWithProviderUpliftFactor] [int] NULL,
	[EntrySubLevel] [varchar](8) NULL,
	[SuccessRateMapCode] [varchar](8) NULL,
	[AccreditiedNotDfESApproved] [int] NULL,
	[AccreditiedMayPossDfESApproved] [int] NULL,
	[JointInvestmentProgrammeOnly] [int] NULL,
	[OLASSOnly] [int] NULL,
	[UnemployedOnly] [int] NULL,
	[IndependentLivingSkills] [int] NULL,
	[AdditionalOrSpecialistLearning] [int] NULL,
	[EnglPrscID] [int] NULL,
	[Vocational] [int] NULL,
	[AwardOrgCode] [varchar](20) NULL,
	[UnitType] [varchar](50) NULL,
	[LearningDeliveryGenre] [varchar](3) NULL,
	[ApprovedEmployerSchemeFramework] [int] NULL,
	[FrameworkCompletionClassCode] [int] NULL,
	[OfQualOfferedEngland] [int] NULL,
	[OfqualPurpose] [varchar](2) NULL,
	[OfqualSubPurpose] [varchar](4) NULL,
	[RgltnStartDate] [date] NULL,
	[SourceQualType] [varchar](15) NULL,
	[SourceSystemRef] [varchar](50) NULL,
	[SourceURLRef] [varchar](50) NULL,
	[SourceURLLinkType] [int] NULL,
	[OccupationalIndicator] [int] NULL,
	[AccessHEIndicator] [int] NULL,
	[KeySkillsIndicator] [int] NULL,
	[FunctionalSkillsIndicator] [int] NULL,
	[GCEIndicator] [int] NULL,
	[GCSEIndicator] [int] NULL,
	[ASLevelIndicator] [int] NULL,
	[A2LevelIndicator] [int] NULL,
	[ALevelIndicator] [int] NULL,
	[QCFIndicator] [int] NULL,
	[QCFDiplomaIndicator] [int] NULL,
	[QCFCertificateIndicator] [int] NULL,
	[EFAEnglishGCSE] [int] NULL,
	[EFAMathsGCSE] [int] NULL,
	[EFACOFType] [int] NULL,
	[SFAFundedIndicator] [int] NULL,
	[DanceAndDramaIndicator] [int] NULL,
	[AvailabiltyStatus] [int] NULL,
	[Note] [varchar](max) NULL,
	[LearnDirectClassSystemCode1] [varchar](12) NULL,
	[LearnDirectClassSystemCode2] [varchar](12) NULL,
	[LearnDirectClassSystemCode3] [varchar](12) NULL,
	[RegulatedCreditValue] [int] NULL,
	[SectorSubjectAreaTier1] [decimal](5, 2) NULL,
	[SectorSubjectAreaTier2] [decimal](5, 2) NULL,
	[MI_NotionalNVQLevel] [int] NULL,
	[MI_NotionalNVQLevelv2] [decimal](5, 2) NULL,
	[GuidedLearningHours] [int] NULL,
	[DirectStudyHours] [int] NULL,
	[DedicatedAssessmentHours] [int] NULL,
	[TotalQualificationTime] [int] NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](100) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](100) NOT NULL
)WITH
(
	DATA_SOURCE=RemoteLARSData
);



CREATE EXTERNAL TABLE [$(LARS_Schema)].[LARS_LearningDeliveryCategory_Children](
	[RootCategoryRef] [int] NULL,
	[CategoryRef] [int] NULL,
	[ParentCategoryRef] [int] NULL,
	[CategoryName] [varchar](256) NULL,
	[Target] [varchar](75) NULL,
	[Level] [int] NULL
)WITH
(
	DATA_SOURCE=RemoteLARSData
);
GO

CREATE EXTERNAL TABLE [$(LARS_Schema)].[LARS_LearningDeliveryCategory](
	[LearnAimRef] [varchar](8) NOT NULL,
	[CategoryRef] [int] NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](100) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](100) NOT NULL
)WITH
(
	DATA_SOURCE=RemoteLARSData
);
GO

CREATE EXTERNAL TABLE [$(LARS_Schema)].[LARS_StandardFunding](
	[StandardCode] [int] NOT NULL,
	[FundingCategory] [varchar](50) NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NULL,
	[BandNumber] [int] NULL,
	[CoreGovContributionCap] [decimal](10, 5) NULL,
	[1618Incentive] [decimal](10, 5) NULL,
	[SmallBusinessIncentive] [decimal](10, 5) NULL,
	[AchievementIncentive] [decimal](10, 5) NULL,
	[FundableWithoutEmployer] [varchar](50) NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](256) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](256) NOT NULL
)WITH
(
	DATA_SOURCE=RemoteLARSData
);
GO


CREATE EXTERNAL TABLE [$(LARS_Schema)].[LARS_Validity](
	[LearnAimRef] [varchar](8) NOT NULL,
	[ValidityCategory] [varchar](50) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[LastNewStartDate] [date] NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](100) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](100) NOT NULL
)WITH
(
	DATA_SOURCE=RemoteLARSData
);
GO

CREATE EXTERNAL TABLE [$(LARS_Schema)].[LARS_AnnualValue](
	[LearnAimRef] [varchar](8) NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NULL,
	[BasicSkills] [int] NULL,
	[BasicSkillsBroadType] [int] NULL,
	[BasicSkillsType] [int] NULL,
	[BasicSkillsParticipation] [int] NULL,
	[FullLevel2EntitlementCategory] [int] NULL,
	[FullLevel2Percent] [decimal](5, 2) NULL,
	[FullLevel3EntitlementCategory] [int] NULL,
	[FullLevel3Percent] [decimal](5, 2) NULL,
	[MI_FullLevel2] [int] NULL,
	[MI_FullLevel2Percent] [decimal](5, 2) NULL,
	[MI_FullLevel3] [int] NULL,
	[MI_FullLevel3Percent] [decimal](5, 2) NULL,
	[OfQualValid19Plus] [int] NULL,
	[SfaApprovalStatus] [int] NULL,
	[UKCESSector] [int] NULL,
	[UKCESSubSector] [varchar](2) NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](100) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](100) NOT NULL
)WITH
(
	DATA_SOURCE=RemoteLARSData
);
GO

CREATE EXTERNAL TABLE [$(LARS_Schema)].[LARS_FrameworkAims](
	[FworkCode] [int] NOT NULL,
	[ProgType] [int] NOT NULL,
	[PwayCode] [int] NOT NULL,
	[LearnAimRef] [varchar](8) NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NULL,
	[FrameworkComponentType] [int] NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](100) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](100) NOT NULL
)WITH
(
	DATA_SOURCE=RemoteLARSData
);
GO

CREATE EXTERNAL TABLE [$(LARS_Schema)].[LARS_Version](
	[MajorNumber] [int] NOT NULL,
	[MinorNumber] [int] NOT NULL,
	[MaintenanceNumber] [int] NOT NULL,
	[MainDataSchemaName] [varchar](256) NULL,
	[RefDataSchemaName] [varchar](256) NULL,
	[ActivationDate] [date] NOT NULL,
	[ExpiryDate] [date] NULL,
	[Description] [varchar](500) NULL,
	[Comment] [varchar](500) NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](100) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](100) NOT NULL
)WITH
(
	DATA_SOURCE=RemoteLARSData
);
GO



CREATE EXTERNAL TABLE [$(FCT_Schema)].[vw_ContractAllocation](
	[contractNumber] [nvarchar](100) NULL,
	[contractVersionNumber] [nvarchar](100) NULL,
	[contractAllocationNumber] [nvarchar](100) NULL,
	[status] [nvarchar](100) NULL,
	[hierarchyType] [nvarchar](100) NULL,
	[fundingStreamCode] [nvarchar](100) NULL,
	[periodTypeCode] [nvarchar](100) NULL,
	[period] [nvarchar](100) NULL,
	[fundingStreamPeriodCode] [nvarchar](100) NULL,
	[startDate] [nvarchar](100) NULL,
	[endDate] [nvarchar](100) NULL,
	[uopCode] [nvarchar](100) NULL,
	[maximumContractValue] [nvarchar](100) NULL,
	[lotReference] [nvarchar](100) NULL,
	[tenderSpecReference] [nvarchar](100) NULL,
	[learningRatePremiumFactor] [decimal](13, 2) NULL
)WITH
(
	DATA_SOURCE=RemoteFCTData
);
GO

CREATE EXTERNAL TABLE [$(FCT_Schema)].[vw_ContractValidation](
	[organisationIdentifier] [nvarchar](100) NULL,
	[UKPRN] [int] NULL,
	[contractNumber] [nvarchar](100) NULL,
	[contractVersionNumber] [nvarchar](100) NULL,
	[contractAllocationNumber] [nvarchar](100) NULL,
	[hierarchyType] [nvarchar](100) NULL,
	[fundingStreamCode] [nvarchar](100) NULL,
	[periodTypeCode] [nvarchar](100) NULL,
	[period] [nvarchar](100) NULL,
	[fundingStreamPeriodCode] [nvarchar](100) NULL,
	[startDate] [nvarchar](100) NULL,
	[endDate] [nvarchar](100) NULL,
	[uopCode] [nvarchar](100) NULL,
	[unitCost] [nvarchar](100) NULL
)WITH
(
	DATA_SOURCE=RemoteFCTData
);
GO

CREATE EXTERNAL TABLE [$(Postcodes_Schema)].[Postcodes](
	[Postcode] [nvarchar](8) NOT NULL,
	[Outcode] [varchar](4) NOT NULL,
	[Incode] [char](3) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[Active] [nvarchar](1) NOT NULL
)WITH
(
	DATA_SOURCE=RemotePostcodeData
);
GO

CREATE external TABLE [$(Org_Schema)].[Org_HMPP_PostCode](
	[UKPRN] [bigint] NOT NULL,
	[HMPPPostCode] [varchar](15) NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](100) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](100) NOT NULL,
 
)WITH
(
	DATA_SOURCE=RemoteOrganisationData
);
GO

CREATE external TABLE [$(Org_Schema)].[Org_PartnerUKPRN](
	[UKPRN] [bigint] NOT NULL,
	[NameLegal] [varchar](255) NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](100) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](100) NOT NULL
 
)WITH
(
	DATA_SOURCE=RemoteOrganisationData
);
GO

CREATE EXTERNAL TABLE [$(Org_Schema)].[ORG_Details](
	[UKPRN] [bigint] NOT NULL,
	[Name] [varchar](250) NULL,
	[OrganisationCode] [varchar](50) NULL,
	[SubLocation] [varchar](250) NULL,
	[Location] [varchar](250) NULL,
	[Street] [varchar](250) NULL,
	[Town] [varchar](250) NULL,
	[Locality] [varchar](250) NULL,
	[Postcode] [varchar](15) NULL,
	[ExternalData] [varchar](250) NULL,
	[PhaseEduc] [varchar](9) NULL,
	[GovOffReg] [varchar](13) NULL,
	[LegalOrgType] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[StatusExtended] [varchar](75) NULL,
	[ThirdSector] [int] NULL,
	[AccERGFold] [int] NULL,
	[ContAppsTrainAgncy] [int] NULL,
	[DanceDramaAward] [int] NULL,
	[DirectFund] [int] NULL,
	[EmpOnlyTrain] [int] NULL,
	[IndepOrg] [int] NULL,
	[IssueAuth] [int] NULL,
	[LLDDIndepSpec] [int] NULL,
	[NatSkillsAcademy] [int] NULL,
	[PotThirdSector] [int] NULL,
	[NASEmpUnit] [int] NULL,
	[School6Form] [int] NULL,
	[TertiaryColl] [int] NULL,
	[OFSTEDEffect] [varchar](250) NULL,
	[OFSTED_AchStnd] [varchar](250) NULL,
	[DfEEstabNum] [varchar](250) NULL,
	[EduBLocAuthSchEst] [varchar](250) NULL,
	[EdubaseURN] [varchar](250) NULL,
	[LEACode] [varchar](250) NULL,
	[LocalAuthCode] [varchar](250) NULL,
	[LongTermResid] [int] NULL,
	[OfstedCareStds] [int] NULL,
	[OFSTEDNonEduBURN] [varchar](250) NULL,
	[SpecialResources] [int] NULL,
	[StatryHighAge] [int] NULL,
	[StatryLowAge] [int] NULL,
	[OFSTEDRep] [varchar](250) NULL,
	[OFSTEDInsp] [varchar](250) NULL,
	[UKLearnProv] [int] NULL,
	[AgencyTrainProv] [int] NULL,
	[FundBody] [int] NULL,
	[EducProv] [int] NULL,
	[LocalAuthority] [int] NULL,
	[RegCompany] [int] NULL,
	[RegCharity] [int] NULL,
	[Auditor] [int] NULL,
	[AwardOrgCode] [varchar](20) NULL,
	[SecSkillsCoun] [int] NULL,
	[SectorLeadBody] [int] NULL,
	[Regulator] [int] NULL,
	[HMPP] [int] NULL,
	[DanceAndDramaIndicator] [int] NULL,
	[DirectFundedEmpIndicator] [int] NULL,
	[Comment] [varchar](max) NULL,
	[Created_On] [datetime] NOT NULL,
	[Created_By] [varchar](100) NOT NULL,
	[Modified_On] [datetime] NOT NULL,
	[Modified_By] [varchar](100) NOT NULL,
	[HESAProvider] [bit] NULL
)WITH
(
	DATA_SOURCE=RemoteOrganisationData
);
GO

CREATE EXTERNAL TABLE [$(Org_Schema)].[Org_Current_Version](
	[CurrentVersion] [varchar](100) NULL
)WITH
(
	DATA_SOURCE=RemoteOrganisationData
);
GO



CREATE EXTERNAL TABLE [$(ULN_Schema)].[UniqueLearnerNumbers2](
	[ULN] [bigint] NOT NULL,
)WITH
(
	DATA_SOURCE=RemoteULNData
);
GO

-- and now the tables
CREATE EXTERNAL TABLE [dbo].[LearningProvider]
(
	[PK_LearningProvider] [int] NOT NULL,
	[UKPRN] [bigint] NOT NULL
)
WITH
(
	DATA_SOURCE=RemoteILRData
);
GO


/****** Object:  Table [dbo].[CollectionDetails]    Script Date: 11/1/2017 3:56:54 PM ******/
CREATE EXTERNAL TABLE [dbo].[CollectionDetails]
(
	[PK_CollectionDetails] [int] NOT NULL,
	[Collection] [varchar](3) NOT NULL,
	[Year] [varchar](4) NOT NULL,
	[FilePreparationDate] [datetime] NOT NULL
)
WITH
(
	DATA_SOURCE=RemoteILRData
);
GO

/****** Object:  Table [dbo].[Source]    Script Date: 11/1/2017 3:59:02 PM ******/
CREATE EXTERNAL TABLE [dbo].[Source]
(
	[PK_Source] [int] NOT NULL,
	[ProtectiveMarking] [varchar](27) NOT NULL,
	[UKPRN] [bigint] NOT NULL,
	[SoftwareSupplier] [varchar](40) NULL,
	[SoftwarePackage] [varchar](30) NULL,
	[Release] [varchar](20) NULL,
	[SerialNo] [varchar](2) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[ReferenceData] [varchar](100) NULL,
	[ComponentSetVersion] [varchar](20) NULL
)
WITH
(
	DATA_SOURCE=RemoteILRData
);
GO

/****** Object:  Table [dbo].[SourceFile]    Script Date: 11/1/2017 4:00:51 PM ******/
CREATE EXTERNAL TABLE [dbo].[SourceFile](
	[PK_SourceFile] [int] NOT NULL,
	[SourceFileName] [varchar](50) NOT NULL,
	[FilePreparationDate] [datetime] NOT NULL,
	[SoftwareSupplier] [varchar](40) NULL,
	[SoftwarePackage] [varchar](30) NULL,
	[Release] [varchar](20) NULL,
	[SerialNo] [varchar](2) NOT NULL,
	[DateTime] [datetime] NULL
)
WITH 
(
DATA_SOURCE=RemoteILRData
);


CREATE EXTERNAL TABLE [dbo].[AppFinRecord](
	[PK_AppFinRecord] [int] NOT NULL,
	[FK_LearningDelivery] [int] NOT NULL,
	[AFinType] [varchar](3) NOT NULL,
	[AFinCode] [int] NOT NULL,
	[AFinDate] [datetime] NOT NULL,
	[AFinAmount] [bigint] NOT NULL
)
WITH (DATA_SOURCE=RemoteILRData)

CREATE EXTERNAL TABLE [dbo].[ContactPreference](
	[PK_ContactPreference] [int] NOT NULL,
	[FK_Learner] [int] NOT NULL,
	[ContPrefType] [varchar](3) NOT NULL,
	[ContPrefCode] [int] NOT NULL
)WITH (DATA_SOURCE=RemoteILRData)
/****** Object:  Table [dbo].[DPOutcome]    Script Date: 11/1/2017 4:06:00 PM ******/
CREATE EXTERNAL TABLE [dbo].[DPOutcome](
	[PK_DPOutcome] [int] NOT NULL,
	[FK_LearnerDestinationandProgression] [int] NOT NULL,
	[OutType] [varchar](3) NOT NULL,
	[OutCode] [int] NOT NULL,
	[OutStartDate] [datetime] NOT NULL,
	[OutEndDate] [datetime] NULL,
	[OutCollDate] [datetime] NOT NULL
)WITH (DATA_SOURCE=RemoteILRData)
GO
/****** Object:  Table [dbo].[EmploymentStatusMonitoring]    Script Date: 11/1/2017 4:06:00 PM ******/
CREATE EXTERNAL TABLE [dbo].[EmploymentStatusMonitoring](
	[PK_EmploymentStatusMonitoring] [int] NOT NULL,
	[FK_LearnerEmploymentStatus] [int] NOT NULL,
	[ESMType] [varchar](3) NOT NULL,
	[ESMCode] [int] NOT NULL
)WITH (DATA_SOURCE=RemoteILRData)
GO
/****** Object:  Table [dbo].[Learner]    Script Date: 11/1/2017 4:06:00 PM ******/
CREATE EXTERNAL TABLE [dbo].[Learner](
	[PK_Learner] [int] NOT NULL,
	[LearnRefNumber] [varchar](12) NOT NULL,
	[PrevLearnRefNumber] [varchar](12) NULL,
	[PrevUKPRN] [bigint] NULL,
	[PMUKPRN] [bigint] NULL,
	[ULN] [bigint] NOT NULL,
	[FamilyName] [varchar](100) NULL,
	[GivenNames] [varchar](100) NULL,
	[DateOfBirth] [datetime] NULL,
	[Ethnicity] [int] NOT NULL,
	[Sex] [varchar](1) NOT NULL,
	[LLDDHealthProb] [int] NOT NULL,
	[NINumber] [varchar](9) NULL,
	[PriorAttain] [int] NULL,
	[Accom] [int] NULL,
	[ALSCost] [bigint] NULL,
	[PlanLearnHours] [bigint] NULL,
	[PlanEEPHours] [bigint] NULL,
	[MathGrade] [varchar](4) NULL,
	[EngGrade] [varchar](4) NULL,
	[PostcodePrior] [varchar](8) NOT NULL,
	[Postcode] [varchar](8) NOT NULL,
	[AddLine1] [varchar](50) NULL,
	[AddLine2] [varchar](50) NULL,
	[AddLine3] [varchar](50) NULL,
	[AddLine4] [varchar](50) NULL,
	[TelNo] [varchar](18) NULL,
	[Email] [varchar](100) NULL
)WITH (DATA_SOURCE=RemoteILRData)
/****** Object:  Table [dbo].[LearnerDestinationandProgression]    Script Date: 11/1/2017 4:06:00 PM ******/
CREATE EXTERNAL TABLE [dbo].[LearnerDestinationandProgression](
	[PK_LearnerDestinationandProgression] [int] NOT NULL,
	[LearnRefNumber] [varchar](12) NOT NULL,
	[ULN] [bigint] NOT NULL
)WITH (DATA_SOURCE=RemoteILRData)
GO
/****** Object:  Table [dbo].[LearnerEmploymentStatus]    Script Date: 11/1/2017 4:06:00 PM ******/
CREATE EXTERNAL TABLE [dbo].[LearnerEmploymentStatus](
	[PK_LearnerEmploymentStatus] [int] NOT NULL,
	[FK_Learner] [int] NOT NULL,
	[EmpStat] [int] NOT NULL,
	[DateEmpStatApp] [datetime] NOT NULL,
	[EmpId] [int] NULL
)WITH (DATA_SOURCE=RemoteILRData)
GO
/****** Object:  Table [dbo].[LearnerFAM]    Script Date: 11/1/2017 4:06:00 PM ******/
CREATE EXTERNAL TABLE [dbo].[LearnerFAM](
	[PK_LearnerFAM] [int] NOT NULL,
	[FK_Learner] [int] NOT NULL,
	[LearnFAMType] [varchar](3) NOT NULL,
	[LearnFAMCode] [int] NOT NULL
)WITH (DATA_SOURCE=RemoteILRData)
GO
/****** Object:  Table [dbo].[LearnerHE]    Script Date: 11/1/2017 4:06:00 PM ******/
CREATE EXTERNAL TABLE [dbo].[LearnerHE](
	[PK_LearnerHE] [int] NOT NULL,
	[FK_Learner] [int] NOT NULL,
	[UCASPERID] [varchar](10) NULL,
	[TTACCOM] [int] NULL

)WITH (DATA_SOURCE=RemoteILRData)
GO
/****** Object:  Table [dbo].[LearnerHEFinancialSupport]    Script Date: 11/1/2017 4:06:00 PM ******/
GO
CREATE EXTERNAL TABLE [dbo].[LearnerHEFinancialSupport](
	[PK_LearnerHEFinancialSupport] [int] NOT NULL,
	[FK_LearnerHE] [int] NOT NULL,
	[FINTYPE] [int] NOT NULL,
	[FINAMOUNT] [bigint] NOT NULL 
)WITH (DATA_SOURCE=RemoteILRData)
/****** Object:  Table [dbo].[LearningDelivery]    Script Date: 11/1/2017 4:06:00 PM ******/
CREATE EXTERNAL TABLE [dbo].[LearningDelivery](
	[PK_LearningDelivery] [int] NOT NULL,
	[FK_Learner] [int] NOT NULL,
	[LearnAimRef] [varchar](8) NOT NULL,
	[AimType] [int] NOT NULL,
	[AimSeqNumber] [bigint] NOT NULL,
	[LearnStartDate] [datetime] NOT NULL,
	[OrigLearnStartDate] [datetime] NULL,
	[LearnPlanEndDate] [datetime] NOT NULL,
	[FundModel] [int] NOT NULL,
	[ProgType] [int] NULL,
	[FworkCode] [int] NULL,
	[PwayCode] [int] NULL,
	[StdCode] [int] NULL,
	[PartnerUKPRN] [bigint] NULL,
	[DelLocPostCode] [varchar](8) NOT NULL,
	[AddHours] [bigint] NULL,
	[PriorLearnFundAdj] [bigint] NULL,
	[OtherFundAdj] [bigint] NULL,
	[ConRefNumber] [varchar](20) NULL,
	[EPAOrgID] [varchar](7) NULL,
	[EmpOutcome] [int] NULL,
	[CompStatus] [int] NOT NULL,
	[LearnActEndDate] [datetime] NULL,
	[WithdrawReason] [int] NULL,
	[Outcome] [int] NULL,
	[AchDate] [datetime] NULL,
	[OutGrade] [varchar](6) NULL,
	[SWSupAimId] [varchar](36) NULL
)WITH (DATA_SOURCE=RemoteILRData)
GO
/****** Object:  Table [dbo].[LearningDeliveryFAM]    Script Date: 11/1/2017 4:06:00 PM ******/
CREATE EXTERNAL TABLE [dbo].[LearningDeliveryFAM](
	[PK_LearningDeliveryFAM] [int] NOT NULL,
	[FK_LearningDelivery] [int] NOT NULL,
	[LearnDelFAMType] [varchar](3) NOT NULL,
	[LearnDelFAMCode] [varchar](5) NOT NULL,
	[LearnDelFAMDateFrom] [datetime] NULL,
	[LearnDelFAMDateTo] [datetime] NULL
)WITH (DATA_SOURCE=RemoteILRData)
GO
/****** Object:  Table [dbo].[LearningDeliveryHE]    Script Date: 11/1/2017 4:06:00 PM ******/
CREATE EXTERNAL TABLE [dbo].[LearningDeliveryHE](
	[PK_LearningDeliveryHE] [int] NOT NULL,
	[FK_LearningDelivery] [int] NOT NULL,
	[NUMHUS] [varchar](20) NULL,
	[SSN] [varchar](13) NULL,
	[QUALENT3] [varchar](3) NULL,
	[SOC2000] [int] NULL,
	[SEC] [int] NULL,
	[UCASAPPID] [varchar](9) NULL,
	[TYPEYR] [int] NOT NULL,
	[MODESTUD] [int] NOT NULL,
	[FUNDLEV] [int] NOT NULL,
	[FUNDCOMP] [int] NOT NULL,
	[STULOAD] [float] NULL,
	[YEARSTU] [bigint] NOT NULL,
	[MSTUFEE] [int] NOT NULL,
	[PCOLAB] [float] NULL,
	[PCFLDCS] [float] NULL,
	[PCSLDCS] [float] NULL,
	[PCTLDCS] [float] NULL,
	[SPECFEE] [int] NOT NULL,
	[NETFEE] [bigint] NULL,
	[GROSSFEE] [bigint] NULL,
	[DOMICILE] [varchar](2) NULL,
	[ELQ] [int] NULL,
	[HEPostCode] [varchar](8) NULL
)WITH (DATA_SOURCE=RemoteILRData)
GO
/****** Object:  Table [dbo].[LearningDeliveryWorkPlacement]    Script Date: 11/1/2017 4:06:01 PM ******/
CREATE EXTERNAL TABLE [dbo].[LearningDeliveryWorkPlacement](
	[PK_LearningDeliveryWorkPlacement] [int] NOT NULL,
	[FK_LearningDelivery] [int] NOT NULL,
	[WorkPlaceStartDate] [datetime] NOT NULL,
	[WorkPlaceEndDate] [datetime] NULL,
	[WorkPlaceHours] [bigint] NOT NULL,
	[WorkPlaceMode] [int] NOT NULL,
	[WorkPlaceEmpId] [int] NULL
)WITH (DATA_SOURCE=RemoteILRData)
/****** Object:  Table [dbo].[LLDDandHealthProblem]    Script Date: 11/1/2017 4:06:01 PM ******/
CREATE EXTERNAL TABLE [dbo].[LLDDandHealthProblem](
	[PK_LLDDandHealthProblem] [int] NOT NULL,
	[FK_Learner] [int] NOT NULL,
	[LLDDCat] [int] NOT NULL,
	[PrimaryLLDD] [int] NULL
)WITH (DATA_SOURCE=RemoteILRData)
GO
/****** Object:  Table [dbo].[ProviderSpecDeliveryMonitoring]    Script Date: 11/1/2017 4:06:01 PM ******/
CREATE EXTERNAL TABLE [dbo].[ProviderSpecDeliveryMonitoring](
	[PK_ProviderSpecDeliveryMonitoring] [int] NOT NULL,
	[FK_LearningDelivery] [int] NOT NULL,
	[ProvSpecDelMonOccur] [varchar](1) NOT NULL,
	[ProvSpecDelMon] [varchar](20) NOT NULL
)WITH (DATA_SOURCE=RemoteILRData)
GO
/****** Object:  Table [dbo].[ProviderSpecLearnerMonitoring]    Script Date: 11/1/2017 4:06:01 PM ******/
CREATE EXTERNAL TABLE [dbo].[ProviderSpecLearnerMonitoring](
	[PK_ProviderSpecLearnerMonitoring] [int] NOT NULL,
	[FK_Learner] [int] NOT NULL,
	[ProvSpecLearnMonOccur] [varchar](1) NOT NULL,
	[ProvSpecLearnMon] [varchar](20) NOT NULL
)WITH (DATA_SOURCE=RemoteILRData)
GO
