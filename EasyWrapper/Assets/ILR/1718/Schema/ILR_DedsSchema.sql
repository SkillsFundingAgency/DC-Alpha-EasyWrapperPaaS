--VALID

if not exists(select schema_id from sys.schemas where name='Valid')
	exec('create schema Valid')
GO
 
if object_id('[Valid].[CollectionDetails]','u') is not null
	drop table [Valid].[CollectionDetails]
 
create table [Valid].[CollectionDetails]
	(	
		[UKPRN] int not null,	
		[Collection] varchar(3) not null,
		[Year] varchar(4) not null,
		[FilePreparationDate] date null
	)

if object_id('[Valid].[Source]','u') is not null
	drop table [Valid].[Source]
 
create table [Valid].[Source]
	(		
		[ProtectiveMarking] varchar(30) null,
		[UKPRN] int not null,
		[SoftwareSupplier] varchar(40) null,
		[SoftwarePackage] varchar(30) null,
		[Release] varchar(20) null,
		[SerialNo] varchar(2) null,
		[DateTime] datetime null,
		[ReferenceData] varchar(100) null,
		[ComponentSetVersion] varchar(20) null
	)

if object_id('[Valid].[SourceFile]','u') is not null
	drop table [Valid].[SourceFile]
 
create table [Valid].[SourceFile]
	(		
		[UKPRN] int not null,
		[SourceFileName] varchar(50) not null,
		[FilePreparationDate] date null,
		[SoftwareSupplier] varchar(40) null,
		[SoftwarePackage] varchar(30) null,
		[Release] varchar(20) null,
		[SerialNo] varchar(2) null,
		[DateTime] datetime null
	)
create clustered index [IX_Valid_SourceFile] on [Valid].[SourceFile]
(
		[SourceFileName] asc
)

if object_id('[Valid].[LearningProvider]','u') is not null
	drop table [Valid].[LearningProvider]
 
create table [Valid].[LearningProvider]
(		
	[UKPRN] int not null
	,primary key clustered
	(
		[UKPRN] asc
	)
)

if object_id('[Valid].[Learner]','u') is not null
	drop table [Valid].[Learner]
 
create table [Valid].[Learner]
(	
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[PrevLearnRefNumber] varchar(12) null,
	[PrevUKPRN] int null,
	[PMUKPRN] int null,
	[ULN] bigint not null,
	[FamilyName] varchar(100) null,
	[GivenNames] varchar(100) null,
	[DateOfBirth] date null,
	[Ethnicity] int not null,
	[Sex] varchar(1) not null,
	[LLDDHealthProb] int not null,
	[NINumber] varchar(9) null,
	[PriorAttain] int null,
	[Accom] int null,
	[ALSCost] int null,
	[PlanLearnHours] int null,
	[PlanEEPHours] int null,
	[MathGrade] varchar(4) null,
	[EngGrade] varchar(4) null,
	[PostcodePrior] varchar(8) null,
	[Postcode] varchar(8) null,
	[AddLine1] varchar(50) null,
	[AddLine2] varchar(50) null,
	[AddLine3] varchar(50) null,
	[AddLine4] varchar(50) null,
	[TelNo] varchar(18) null,
	[Email] varchar(100) null
	,primary key clustered
	(
		[UKPRN]
		,[LearnRefNumber] asc
	)
)

if object_id('[Valid].[ContactPreference]','u') is not null
	drop table [Valid].[ContactPreference]
 
create table [Valid].[ContactPreference]
(	
	[UKPRN] int not null,	
	[LearnRefNumber] varchar(12) not null,
	[ContPrefType] varchar(3) not null,
	[ContPrefCode] int not null,
	primary key
	(
		[UKPRN]
		,LearnRefNumber
		,ContPrefType
		,ContPrefCode
	)
)
create index [IX_Valid_ContactPreference] on [Valid].[ContactPreference]
(
	[LearnRefNumber] asc,
	[ContPrefType] asc
)

if object_id('[Valid].[LLDDandHealthProblem]','u') is not null
	drop table [Valid].[LLDDandHealthProblem]
 
create table [Valid].[LLDDandHealthProblem]
(	
	[UKPRN] int not null,	
	[LearnRefNumber] varchar(12) not null,
	[LLDDCat] int not null,
	[PrimaryLLDD] int not null
	,primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[LLDDCat] asc
	)
)

if object_id('[Valid].[LearnerFAM]','u') is not null
	drop table [Valid].[LearnerFAM]
 
create table [Valid].[LearnerFAM]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[LearnFAMType] varchar(3) null,
	[LearnFAMCode] int not null
)
create clustered index [IX_Valid_LearnerFAM] on [Valid].[LearnerFAM]
(
	[UKPRN],
	[LearnRefNumber] asc
)

if object_id('[Valid].[ProviderSpecLearnerMonitoring]','u') is not null
	drop table [Valid].[ProviderSpecLearnerMonitoring]
 
create table [Valid].[ProviderSpecLearnerMonitoring]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[ProvSpecLearnMonOccur] varchar(1) not null,
	[ProvSpecLearnMon] varchar(20) not null
	,primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[ProvSpecLearnMonOccur] asc
	)
)

if object_id('[Valid].[LearnerEmploymentStatus]','u') is not null
	drop table [Valid].[LearnerEmploymentStatus]
 
create table [Valid].[LearnerEmploymentStatus]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[EmpStat] int null,
	[DateEmpStatApp] date not null,
	[EmpId] int null
	,primary key clustered
	(
		[UKPRN] asc,
		[LearnRefNumber] asc,
		[DateEmpStatApp] asc
	)
)

if object_id('[Valid].[EmploymentStatusMonitoring]','u') is not null
	drop table [Valid].[EmploymentStatusMonitoring]
 
create table [Valid].[EmploymentStatusMonitoring]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[DateEmpStatApp] date not null,
	[ESMType] varchar(3) not null,
	[ESMCode] int null
	,primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[DateEmpStatApp] asc,
		[ESMType] asc
	)
)

if object_id('[Valid].[LearnerHE]','u') is not null
	drop table [Valid].[LearnerHE]
 
create table [Valid].[LearnerHE]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[UCASPERID] varchar(10) null,
	[TTACCOM] int null
	,primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc
	)
)

if object_id('[Valid].[LearnerHEFinancialSupport]','u') is not null
	drop table [Valid].[LearnerHEFinancialSupport]
 
create table [Valid].[LearnerHEFinancialSupport]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[FINTYPE] int not null,
	[FINAMOUNT] int not null
	,primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[FINTYPE] asc
	)
)

if object_id('[Valid].[LearningDelivery]','u') is not null
	drop table [Valid].[LearningDelivery]
 
create table [Valid].[LearningDelivery]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[LearnAimRef] varchar(8) not null,
	[AimType] int not null,
	[AimSeqNumber] int not null,
	[LearnStartDate] date not null,
	[OrigLearnStartDate] date null,
	[LearnPlanEndDate] date not null,
	[FundModel] int not null,
	[ProgType] int null,
	[FworkCode] int null,
	[PwayCode] int null,
	[StdCode] int null,
	[PartnerUKPRN] int null,
	[DelLocPostCode] varchar(8) null,
	[AddHours] int null,
	[PriorLearnFundAdj] int null,
	[OtherFundAdj] int null,
	[ConRefNumber] varchar(20) null,
	[EPAOrgID] varchar(7) null,
	[EmpOutcome] int null,
	[CompStatus] int not null,
	[LearnActEndDate] date null,
	[WithdrawReason] int null,
	[Outcome] int null,
	[AchDate] date null,
	[OutGrade] varchar(6) null,
	[SWSupAimId] varchar(36) null
	,primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AimSeqNumber] asc
	)
)

if object_id('[Valid].[LearningDeliveryFAM]','u') is not null
	drop table [Valid].[LearningDeliveryFAM]
 
create table [Valid].[LearningDeliveryFAM]
(		
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[AimSeqNumber] int not null,
	[LearnDelFAMType] varchar(3) not null,
	[LearnDelFAMCode] varchar(5) not null,
	[LearnDelFAMDateFrom] date null,
	[LearnDelFAMDateTo] date null
)
create clustered index [IX_Valid_LearningDeliveryFAM] on [Valid].[LearningDeliveryFAM]
(
	[UKPRN],
	[LearnRefNumber] asc,
	[AimSeqNumber] asc,
	[LearnDelFAMType] asc,
	[LearnDelFAMDateFrom] asc
)

if object_id('[Valid].[LearningDeliveryWorkPlacement]','u') is not null
	drop table [Valid].[LearningDeliveryWorkPlacement]
 
create table [Valid].[LearningDeliveryWorkPlacement]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[AimSeqNumber] int not null,
	[WorkPlaceStartDate] date not null,
	[WorkPlaceEndDate] date null,
	[WorkPlaceHours] int null,
	[WorkPlaceMode] int not null,
	[WorkPlaceEmpId] int not null
)
create clustered index [IX_Valid_LearningDeliveryWorkPlacement] on [Valid].[LearningDeliveryWorkPlacement]
(
	[UKPRN],
	[LearnRefNumber] asc,
	[AimSeqNumber] asc,
	[WorkPlaceStartDate] asc,
	[WorkPlaceMode] asc,
	[WorkPlaceEmpId] asc
)

if object_id('[Valid].[AppFinRecord]','u') is not null
	drop table [Valid].[AppFinRecord]
 
create table [Valid].[AppFinRecord]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[AimSeqNumber] int not null,
	[AFinType] varchar(3) not null,
	[AFinCode] int not null,
	[AFinDate] date not null,
	[AFinAmount] int not null
)
create clustered index [IX_Valid_AppFinRecord] on [Valid].[AppFinRecord]
(
	[UKPRN],
	[LearnRefNumber] asc,
	[AimSeqNumber] asc,
	[AFinType] asc
)

if object_id('[Valid].[ProviderSpecDeliveryMonitoring]','u') is not null
	drop table [Valid].[ProviderSpecDeliveryMonitoring]
 
create table [Valid].[ProviderSpecDeliveryMonitoring]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[AimSeqNumber] int not null,
	[ProvSpecDelMonOccur] varchar(1) not null,
	[ProvSpecDelMon] varchar(20) not null
	,primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AimSeqNumber] asc,
		[ProvSpecDelMonOccur] asc
	)
)

if object_id('[Valid].[LearningDeliveryHE]','u') is not null
	drop table [Valid].[LearningDeliveryHE]
 
create table [Valid].[LearningDeliveryHE]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[AimSeqNumber] int not null,
	[NUMHUS] varchar(20) null,
	[SSN] varchar(13) null,
	[QUALENT3] varchar(3) null,
	[SOC2000] int null,
	[SEC] int null,
	[UCASAPPID] varchar(9) null,
	[TYPEYR] int not null,
	[MODESTUD] int not null,
	[FUNDLEV] int not null,
	[FUNDCOMP] int not null,
	[STULOAD] decimal(4,1) null,
	[YEARSTU] int not null,
	[MSTUFEE] int not null,
	[PCOLAB] decimal(4,1) null,
	[PCFLDCS] decimal(4,1) null,
	[PCSLDCS] decimal(4,1) null,
	[PCTLDCS] decimal(4,1) null,
	[SPECFEE] int not null,
	[NETFEE] int null,
	[GROSSFEE] int null,
	[DOMICILE] varchar(2) null,
	[ELQ] int null,
	[HEPostCode] varchar(8) null
	,primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AimSeqNumber] asc
	)
)

if object_id('[Valid].[LearnerDestinationandProgression]','u') is not null
	drop table [Valid].[LearnerDestinationandProgression]
 
create table [Valid].[LearnerDestinationandProgression]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[ULN] bigint not null
	,primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc
	)
)

if object_id('[Valid].[DPOutcome]','u') is not null
	drop table [Valid].[DPOutcome]
 
create table [Valid].[DPOutcome]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12) not null,
	[OutType] varchar(3) not null,
	[OutCode] int not null,
	[OutStartDate] date not null,
	[OutEndDate] date null,
	[OutCollDate] date not null
)
create clustered index [IX_Valid_DPOutcome] on [Valid].[DPOutcome]
(
	[UKPRN],
	[LearnRefNumber] asc,
	[OutType] asc,
	[OutCode] asc,
	[OutStartDate] asc
)

--INVALID

if not exists(select schema_id from sys.schemas where name='Invalid')
	exec('create schema Invalid')
GO
 
if object_id('[Invalid].[CollectionDetails]','u') is not null
	drop table [Invalid].[CollectionDetails]
 
create table [Invalid].[CollectionDetails]
(
		[CollectionDetails_Id] int not null,
		[UKPRN] int not null,
		[Collection] varchar(3) not null,
		[Year] varchar(4) not null,
		[FilePreparationDate] date not null,
		primary key 
		(
			[UKPRN]
			,[CollectionDetails_Id]
		)
)

if object_id('[Invalid].[Source]','u') is not null
	drop table [Invalid].[Source]
 
create table [Invalid].[Source]
(		
	[Source_Id] int not null,
	[ProtectiveMarking] varchar(30) not null,
	[UKPRN] int not null,
	[SoftwareSupplier] varchar(40),
	[SoftwarePackage] varchar(30),
	[Release] varchar(20),
	[SerialNo] varchar(2) not null,
	[DateTime] datetime not null,
	[ReferenceData] varchar(100),
	[ComponentSetVersion] varchar(20)
	primary key
	(
		[Source_Id],
		[UKPRN]
	)
)

if object_id('[Invalid].[SourceFile]','u') is not null
	drop table [Invalid].[SourceFile]
 
create table [Invalid].[SourceFile]
(		
	[SourceFile_Id] int not null,
	[UKPRN] int not null,
	[SourceFileName] varchar(50) not null,
	[FilePreparationDate] date not null,
	[SoftwareSupplier] varchar(40),
	[SoftwarePackage] varchar(30),
	[Release] varchar(20),
	[SerialNo] varchar(2) not null,
	[DateTime] datetime
	primary key
	(
		[SourceFile_Id]
		,[UKPRN]
	)
)
create index [IX_Invalid_SourceFile] on [Invalid].[SourceFile]
(
	[SourceFileName] asc
)

if object_id('[Invalid].[LearningProvider]','u') is not null
	drop table [Invalid].[LearningProvider]
 
create table [Invalid].[LearningProvider]
(	
	[LearningProvider_Id] int not null,
	[UKPRN] int not null
	,primary key
	(
		[LearningProvider_Id]
		,[UKPRN]
	)
)
create index [IX_Invalid_LearningProvider] on [Invalid].[LearningProvider]
(
	[UKPRN] asc
)

if object_id('[Invalid].[Learner]','u') is not null
	drop table [Invalid].[Learner]
 
create table [Invalid].[Learner]
(		
	[Learner_Id] int not null,
	[LearnRefNumber] varchar(100),
	[UKPRN] int not null,
	[PrevLearnRefNumber] varchar(1000),
	[PrevUKPRN] bigint,
	[PMUKPRN] bigint,
	[ULN] bigint,
	[FamilyName] varchar(1000),
	[GivenNames] varchar(1000),
	[DateOfBirth] date,
	[Ethnicity] bigint,
	[Sex] varchar(1000),
	[LLDDHealthProb] bigint,
	[NINumber] varchar(1000),
	[PriorAttain] bigint,
	[Accom] bigint,
	[ALSCost] bigint,
	[PlanLearnHours] bigint,
	[PlanEEPHours] bigint,
	[MathGrade] varchar(1000),
	[EngGrade] varchar(1000),
	[PostcodePrior] varchar(1000),
	[Postcode] varchar(1000),
	[AddLine1] varchar(1000),
	[AddLine2] varchar(1000),
	[AddLine3] varchar(1000),
	[AddLine4] varchar(1000),
	[TelNo] varchar(1000),
	[Email] varchar(1000)
	primary key
	(
		[UKPRN],
		[LearnRefNumber],
		[Learner_Id]
	)
)
create index [IX_Invalid_Learner] on [Invalid].[Learner]
(
	[LearnRefNumber] asc
)

if object_id('[Invalid].[ContactPreference]','u') is not null
	drop table [Invalid].[ContactPreference]
 
create table [Invalid].[ContactPreference]
(		
	[ContactPreference_Id] int not null,
	[Learner_Id] int  not null,
	[UKPRN] int not null,
	[LearnRefNumber] varchar(100),
	[ContPrefType] varchar(100),
	[ContPrefCode] bigint,
	primary key
	(
		[UKPRN]
		,[LearnRefNumber]
		,[ContactPreference_Id]
		,[Learner_Id]
	)
)
create index [IX_Parent_Invalid_ContactPreference] on [Invalid].[ContactPreference]
(
	[Learner_Id] asc
)
create index [IX_Invalid_ContactPreference] on [Invalid].[ContactPreference]
(
	[LearnRefNumber] asc,
	[ContPrefType] asc
)

if object_id('[Invalid].[LLDDandHealthProblem]','u') is not null
	drop table [Invalid].[LLDDandHealthProblem]
 
create table [Invalid].[LLDDandHealthProblem]
(		
	[LLDDandHealthProblem_Id] int not null,
	[Learner_Id] int  not null,
	[UKPRN] int not null,
	[LearnRefNumber] varchar(100),
	[LLDDCat] bigint,
	[PrimaryLLDD] bigint
	,primary key
	(
		[LLDDandHealthProblem_Id]
		,[Learner_Id]
		,[LearnRefNumber]
		,[UKPRN]
	)
)
create index [IX_Parent_Invalid_LLDDandHealthProblem] on [Invalid].[LLDDandHealthProblem]
(
	[Learner_Id] asc
)
create index [IX_Invalid_LLDDandHealthProblem] on [Invalid].[LLDDandHealthProblem]
(
	[LearnRefNumber] asc,
	[LLDDCat] asc
)

if object_id('[Invalid].[LearnerFAM]','u') is not null
	drop table [Invalid].[LearnerFAM]
 
create table [Invalid].[LearnerFAM]
(		
	[LearnerFAM_Id] int not null,
	[Learner_Id] int  not null,
	[UKPRN] int not null,
	[LearnRefNumber] varchar(100),
	[LearnFAMType] varchar(1000),
	[LearnFAMCode] bigint
)
create index [IX_Parent_Invalid_LearnerFAM] on [Invalid].[LearnerFAM]
(
	[Learner_Id] asc
)
create index [IX_Invalid_LearnerFAM] on [Invalid].[LearnerFAM]
(
	[LearnRefNumber] asc
)

if object_id('[Invalid].[ProviderSpecLearnerMonitoring]','u') is not null
	drop table [Invalid].[ProviderSpecLearnerMonitoring]
 
create table [Invalid].[ProviderSpecLearnerMonitoring]
(		
	[ProviderSpecLearnerMonitoring_Id] int not null,
	[Learner_Id] int  not null,
	[UKPRN] int not null,
	[LearnRefNumber] varchar(100),
	[ProvSpecLearnMonOccur] varchar(100),
	[ProvSpecLearnMon] varchar(1000)
	,primary key
	(
		[ProviderSpecLearnerMonitoring_Id]
		,[Learner_Id]
		,[LearnRefNumber]
		,[UKPRN]
	)
)
create index [IX_Parent_Invalid_ProviderSpecLearnerMonitoring] on [Invalid].[ProviderSpecLearnerMonitoring]
(
	[Learner_Id] asc
)
create index [IX_Invalid_ProviderSpecLearnerMonitoring] on [Invalid].[ProviderSpecLearnerMonitoring]
(
	[LearnRefNumber] asc,
	[ProvSpecLearnMonOccur] asc
)

if object_id('[Invalid].[LearnerEmploymentStatus]','u') is not null
	drop table [Invalid].[LearnerEmploymentStatus]
 
create table [Invalid].[LearnerEmploymentStatus]
(		
	[LearnerEmploymentStatus_Id] int not null,
	[Learner_Id] int  not null,
	[UKPRN] int not null,
	[LearnRefNumber] varchar(100),
	[EmpStat] bigint,
	[DateEmpStatApp] date,
	[EmpId] bigint
	,primary key
	(
		[LearnerEmploymentStatus_Id]
		,[Learner_Id]
		,[UKPRN]
		,[LearnRefNumber]
	)
)
create index [IX_Parent_Invalid_LearnerEmploymentStatus] on [Invalid].[LearnerEmploymentStatus]
(
	[Learner_Id] asc
)
create index [IX_Invalid_LearnerEmploymentStatus] on [Invalid].[LearnerEmploymentStatus]
(
	[LearnRefNumber] asc,
	[DateEmpStatApp] asc
)

if object_id('[Invalid].[EmploymentStatusMonitoring]','u') is not null
	drop table [Invalid].[EmploymentStatusMonitoring]
 
create table [Invalid].[EmploymentStatusMonitoring]
(	
	[EmploymentStatusMonitoring_Id] int NOT NULL,
	[LearnerEmploymentStatus_Id] int  not null,
	[UKPRN] int not null,
	[LearnRefNumber] varchar(100),
	[DateEmpStatApp] date,
	[ESMType] varchar(100),
	[ESMCode] bigint
	,primary key
	(
		[EmploymentStatusMonitoring_Id],
		[LearnerEmploymentStatus_Id]
		,[LearnRefNumber]
		,[UKPRN]
	)
)
create index [IX_Parent_Invalid_EmploymentStatusMonitoring] on [Invalid].[EmploymentStatusMonitoring]
(
	[LearnerEmploymentStatus_Id] asc
)
create index [IX_Invalid_EmploymentStatusMonitoring] on [Invalid].[EmploymentStatusMonitoring]
(
	[LearnRefNumber] asc,
	[DateEmpStatApp] asc,
	[ESMType] asc
)

if object_id('[Invalid].[LearnerHE]','u') is not null
	drop table [Invalid].[LearnerHE]
 
create table [Invalid].[LearnerHE]
(		
	[LearnerHE_Id] int not null,
	[Learner_Id] int  not null,
	[UKPRN] int not null,
	[LearnRefNumber] varchar(100),
	[UCASPERID] varchar(1000),
	[TTACCOM] bigint,
	primary key
	(
		[LearnerHE_Id]
		,[Learner_Id]
		,[UKPRN]
		,[LearnRefNumber]
	)
)
create index [IX_Parent_Invalid_LearnerHE] on [Invalid].[LearnerHE]
(
	[Learner_Id] asc
)
create index [IX_Invalid_LearnerHE] on [Invalid].[LearnerHE]
(
	[LearnRefNumber] asc
)

if object_id('[Invalid].[LearnerHEFinancialSupport]','u') is not null
	drop table [Invalid].[LearnerHEFinancialSupport]
 
create table [Invalid].[LearnerHEFinancialSupport]
(		
	[LearnerHEFinancialSupport_Id] int not null,
	[LearnerHE_Id] int  not null,
	[UKPRN] int not null,
	[LearnRefNumber] varchar(100),
	[FINTYPE] bigint,
	[FINAMOUNT] bigint,
	primary key
	(
		[LearnerHEFinancialSupport_Id]
		,[LearnerHE_Id]
		,[UKPRN]
		,[LearnRefNumber]
	)
)
create index [IX_Parent_Invalid_LearnerHEFinancialSupport] on [Invalid].[LearnerHEFinancialSupport]
(
	[LearnerHE_Id] asc
)
create index [IX_Invalid_LearnerHEFinancialSupport] on [Invalid].[LearnerHEFinancialSupport]
(
	[LearnRefNumber] asc,
	[FINTYPE] asc
)

if object_id('[Invalid].[LearningDelivery]','u') is not null
	drop table [Invalid].[LearningDelivery]
 
create table [Invalid].[LearningDelivery]
(	
	[LearningDelivery_Id] int not null,
	[Learner_Id] int  not null,
	[UKPRN] int not null,
	[LearnRefNumber] varchar(100),
	[LearnAimRef] varchar(1000),
	[AimType] bigint,
	[AimSeqNumber] bigint,
	[LearnStartDate] date,
	[OrigLearnStartDate] date,
	[LearnPlanEndDate] date,
	[FundModel] bigint,
	[ProgType] bigint,
	[FworkCode] bigint,
	[PwayCode] bigint,
	[StdCode] bigint,
	[PartnerUKPRN] bigint,
	[DelLocPostCode] varchar(1000),
	[AddHours] bigint,
	[PriorLearnFundAdj] bigint,
	[OtherFundAdj] bigint,
	[ConRefNumber] varchar(1000),
	[EPAOrgID] varchar(1000),
	[EmpOutcome] bigint,
	[CompStatus] bigint,
	[LearnActEndDate] date,
	[WithdrawReason] bigint,
	[Outcome] bigint,
	[AchDate] date,
	[OutGrade] varchar(1000),
	[SWSupAimId] varchar(1000)
	,primary key
	(
		[LearningDelivery_Id]
		,[Learner_Id]
		,[LearnRefNumber]
		,[UKPRN]
	)
)
create index [IX_Parent_Invalid_LearningDelivery] on [Invalid].[LearningDelivery]
(
	[Learner_Id] asc
)
create index [IX_Invalid_LearningDelivery] on [Invalid].[LearningDelivery]
(
	[LearnRefNumber] asc,
	[AimSeqNumber] asc
)

if object_id('[Invalid].[LearningDeliveryFAM]','u') is not null
	drop table [Invalid].[LearningDeliveryFAM]
 
create table [Invalid].[LearningDeliveryFAM]
(		
	[LearningDeliveryFAM_Id] int not null,
	[LearningDelivery_Id] int  not null,
	[UKPRN] int not null,
	[LearnRefNumber] varchar(100),
	[AimSeqNumber] bigint,
	[LearnDelFAMType] varchar(100),
	[LearnDelFAMCode] varchar(1000),
	[LearnDelFAMDateFrom] date,
	[LearnDelFAMDateTo] date,
	primary key
	(
		[LearningDeliveryFAM_Id]
		,[LearningDelivery_Id]
		,[UKPRN]
		,[LearnRefNumber]
		,[AimSeqNumber]
	)
)
create index [IX_Parent_Invalid_LearningDeliveryFAM] on [Invalid].[LearningDeliveryFAM]
(
	[LearningDelivery_Id] asc
)
create index [IX_Invalid_LearningDeliveryFAM] on [Invalid].[LearningDeliveryFAM]
(
	[LearnRefNumber] asc,
	[AimSeqNumber] asc,
	[LearnDelFAMType] asc,
	[LearnDelFAMDateFrom] asc
)

if object_id('[Invalid].[LearningDeliveryWorkPlacement]','u') is not null
	drop table [Invalid].[LearningDeliveryWorkPlacement]
 
create table [Invalid].[LearningDeliveryWorkPlacement]
(		
	[LearningDeliveryWorkPlacement_Id] int,
	[LearningDelivery_Id] int  not null,
	[UKPRN] int not null,
	[LearnRefNumber] varchar(100),
	[AimSeqNumber] bigint,
	[WorkPlaceStartDate] date,
	[WorkPlaceEndDate] date,
	[WorkPlaceHours] bigint,
	[WorkPlaceMode] bigint,
	[WorkPlaceEmpId] bigint
	,primary key
	(
		UKPRN
		,LearningDeliveryWorkPlacement_Id
		,LearningDelivery_Id
	)
)
create index [IX_Parent_Invalid_LearningDeliveryWorkPlacement] on [Invalid].[LearningDeliveryWorkPlacement]
(
	[LearningDelivery_Id] asc
)
create index [IX_Invalid_LearningDeliveryWorkPlacement] on [Invalid].[LearningDeliveryWorkPlacement]
(
	[LearnRefNumber] asc,
	[AimSeqNumber] asc,
	[WorkPlaceStartDate] asc,
	[WorkPlaceMode] asc,
	[WorkPlaceEmpId] asc
)

if object_id('[Invalid].[AppFinRecord]','u') is not null
	drop table [Invalid].[AppFinRecord]
 
create table [Invalid].[AppFinRecord]
(		
	[AppFinRecord_Id] int,
	[UKPRN] int not null,
	[LearningDelivery_Id] int  not null,
	[LearnRefNumber] varchar(100),
	[AimSeqNumber] bigint,
	[AFinType] varchar(100),
	[AFinCode] bigint,
	[AFinDate] date,
	[AFinAmount] bigint
	,primary key
	(
		UKPRN
		,AppFinRecord_Id
		,LearningDelivery_Id
	)
)
create index [IX_Parent_Invalid_AppFinRecord] on [Invalid].[AppFinRecord]
(
	[LearningDelivery_Id] asc
)
create index [IX_Invalid_AppFinRecord] on [Invalid].[AppFinRecord]
(
	[LearnRefNumber] asc,
	[AimSeqNumber] asc,
	[AFinType] asc
)

if object_id('[Invalid].[ProviderSpecDeliveryMonitoring]','u') is not null
	drop table [Invalid].[ProviderSpecDeliveryMonitoring]
 
create table [Invalid].[ProviderSpecDeliveryMonitoring]
(		
	[ProviderSpecDeliveryMonitoring_Id] int not null,
	[UKPRN] int not null,
	[LearningDelivery_Id] int  not null,
	[LearnRefNumber] varchar(100),
	[AimSeqNumber] bigint,
	[ProvSpecDelMonOccur] varchar(100),
	[ProvSpecDelMon] varchar(1000),
	primary key
	(
		[ProviderSpecDeliveryMonitoring_Id]
		,[UKPRN]
		,[LearningDelivery_Id]
		,[LearnRefNumber]
	)
)
create index [IX_Parent_Invalid_ProviderSpecDeliveryMonitoring] on [Invalid].[ProviderSpecDeliveryMonitoring]
(
	[LearningDelivery_Id] asc
)
create index [IX_Invalid_ProviderSpecDeliveryMonitoring] on [Invalid].[ProviderSpecDeliveryMonitoring]
(
	[LearnRefNumber] asc,
	[AimSeqNumber] asc,
	[ProvSpecDelMonOccur] asc
)

if object_id('[Invalid].[LearningDeliveryHE]','u') is not null
	drop table [Invalid].[LearningDeliveryHE]
 
create table [Invalid].[LearningDeliveryHE]
(		
	[LearningDeliveryHE_Id] int,
	[UKPRN] int not null,
	[LearningDelivery_Id] int  not null,
	[LearnRefNumber] varchar(100),
	[AimSeqNumber] bigint,
	[NUMHUS] varchar(1000),
	[SSN] varchar(1000),
	[QUALENT3] varchar(1000),
	[SOC2000] bigint,
	[SEC] bigint,
	[UCASAPPID] varchar(1000),
	[TYPEYR] bigint,
	[MODESTUD] bigint,
	[FUNDLEV] bigint,
	[FUNDCOMP] bigint,
	[STULOAD] float,
	[YEARSTU] bigint,
	[MSTUFEE] bigint,
	[PCOLAB] float,
	[PCFLDCS] float,
	[PCSLDCS] float,
	[PCTLDCS] float,
	[SPECFEE] bigint,
	[NETFEE] bigint,
	[GROSSFEE] bigint,
	[DOMICILE] varchar(1000),
	[ELQ] bigint,
	[HEPostCode] varchar(1000)
	,primary key
	(
		UKPRN
		,LearningDeliveryHE_Id
		,LearningDelivery_Id
	)
)
create index [IX_Parent_Invalid_LearningDeliveryHE] on [Invalid].[LearningDeliveryHE]
(
	[LearningDelivery_Id] asc
)
create index [IX_Invalid_LearningDeliveryHE] on [Invalid].[LearningDeliveryHE]
(
	[LearnRefNumber] asc,
	[AimSeqNumber] asc
)

if object_id('[Invalid].[LearnerDestinationandProgression]','u') is not null
	drop table [Invalid].[LearnerDestinationandProgression]
 
create table [Invalid].[LearnerDestinationandProgression]
(		
	[LearnerDestinationandProgression_Id] int not null,
	[UKPRN] int not null,
	[LearnRefNumber] varchar(100),
	[ULN] bigint
	,primary key
	(
		[LearnerDestinationandProgression_Id]
		,[UKPRN]
		,[LearnRefNumber]
	)
)
create index [IX_Invalid_LearnerDestinationandProgression] on [Invalid].[LearnerDestinationandProgression]
(
	[LearnRefNumber] asc
)

if object_id('[Invalid].[DPOutcome]','u') is not null
	drop table [Invalid].[DPOutcome]
 
create table [Invalid].[DPOutcome]
(		
	[DPOutcome_Id] int not null,
	[UKPRN] int not null,
	[LearnerDestinationandProgression_Id] int  not null,
	[LearnRefNumber] varchar(100),
	[OutType] varchar(100),
	[OutCode] bigint,
	[OutStartDate] date,
	[OutEndDate] date,
	[OutCollDate] date
	,primary key
	(
		[DPOutcome_Id]
		,[LearnerDestinationandProgression_Id]
		,[UKPRN]
		,[LearnRefNumber]
	)
)
create index [IX_Parent_Invalid_DPOutcome] on [Invalid].[DPOutcome]
(
	[LearnerDestinationandProgression_Id] asc
)
create index [IX_Invalid_DPOutcome] on [Invalid].[DPOutcome]
(
	[LearnRefNumber] asc,
	[OutType] asc,
	[OutCode] asc,
	[OutStartDate] asc
)

--Rulebase Schema

if not exists(select schema_id from sys.schemas where name='Rulebase')
begin
	exec('create schema Rulebase')
end
go

if object_id('[Rulebase].[EFA_SFA_Cases]','u') is not null
begin
	drop table [Rulebase].[EFA_SFA_Cases]
end
go

create table [Rulebase].[EFA_SFA_Cases]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[CaseData] [xml] not null,
	primary key
	(
		[UKPRN]
		,[LearnRefNumber]
	)
)
go

if object_id('[Rulebase].[EFA_SFA_global]','u') is not null
begin
	drop table [Rulebase].[EFA_SFA_global]
end
go

create table [Rulebase].[EFA_SFA_global]
(
	[UKPRN] int primary key,
	[RulebaseVersion] varchar(10),
)
go

if object_id('[Rulebase].[EFA_SFA_Learner_Period]','u') is not null
begin
	drop table [Rulebase].[EFA_SFA_Learner_Period]
end
go

create table [Rulebase].[EFA_SFA_Learner_Period]
(
	UKPRN int not null,
	[LearnRefNumber] varchar(12),
	[Period] int,
	[LnrOnProgPay] decimal(10,5),
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[Period] asc
	)
)
go

if object_id('[Rulebase].[EFA_SFA_Learner_PeriodisedValues]','u') is not null
begin
	drop table [Rulebase].[EFA_SFA_Learner_PeriodisedValues]
end
go

create table [Rulebase].[EFA_SFA_Learner_PeriodisedValues]
(
	UKPRN int not null,
	[LearnRefNumber] varchar(12),
	[AttributeName] [varchar](100) not null,
	[Period_1] [decimal](15,5),
	[Period_2] [decimal](15,5),
	[Period_3] [decimal](15,5),
	[Period_4] [decimal](15,5),
	[Period_5] [decimal](15,5),
	[Period_6] [decimal](15,5),
	[Period_7] [decimal](15,5),
	[Period_8] [decimal](15,5),
	[Period_9] [decimal](15,5),
	[Period_10] [decimal](15,5),
	[Period_11] [decimal](15,5),
	[Period_12] [decimal](15,5),
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AttributeName] asc
	)
)
go

if object_id('[Rulebase].[EFA_Cases]','u') is not null
begin	
	drop table [Rulebase].[EFA_Cases]
end
go

create table [Rulebase].[EFA_Cases]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[CaseData] [xml] not null
	primary key
	(
		[UKPRN]
		,[LearnRefNumber]
	)
)
go

if object_id('[Rulebase].[EFA_global]','u') is not null
begin
	drop table [Rulebase].[EFA_global]
end
go

create table [Rulebase].[EFA_global]
(
	[UKPRN] int primary key,
	[LARSVersion] varchar(50),
	[OrgVersion] varchar(50),
	[PostcodeDisadvantageVersion] varchar(50),
	[RulebaseVersion] varchar(10),
)
go

if object_id('[Rulebase].[EFA_Learner]','u') is not null
begin
	drop table [Rulebase].[EFA_Learner]
end
go

create table [Rulebase].[EFA_Learner]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[AcadMonthPayment] int,
	[AcadProg] bit,
	[ActualDaysILCurrYear] int,
	[AreaCostFact1618Hist] decimal(10,5),
	[Block1DisadvUpliftNew] decimal(10,5),
	[Block2DisadvElementsNew] decimal(10,5),
	[ConditionOfFundingEnglish] varchar(100),
	[ConditionOfFundingMaths] varchar(100),
	[CoreAimSeqNumber] int,
	[FullTimeEquiv] decimal(10,5),
	[FundLine] varchar(100),
	[LearnerActEndDate] date,
	[LearnerPlanEndDate] date,
	[LearnerStartDate] date,
	[NatRate] decimal(10,5),
	[OnProgPayment] decimal(10,5),
	[PlannedDaysILCurrYear] int,
	[ProgWeightHist] decimal(10,5),
	[ProgWeightNew] decimal(10,5),
	[PrvDisadvPropnHist] decimal(10,5),
	[PrvHistLrgProgPropn] decimal(10,5),
	[PrvRetentFactHist] decimal(10,5),
	[RateBand] varchar(50),
	[RetentNew] decimal(10,5),
	[StartFund] bit,
	[ThresholdDays] int
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc
	)
)
go

if not exists(select schema_id from sys.schemas where name='Rulebase')
begin
	exec('create schema Rulebase')
end
go

if object_id('[Rulebase].[VAL_Cases]','u') is not null
begin
	drop table [Rulebase].[VAL_Cases]
end
go

create table [Rulebase].[VAL_Cases]
(
	[UKPRN] int not null,
	[Learner_Id] [int] not null,
	[CaseData] [xml] not null,
	primary key
	(
		[UKPRN],
		[Learner_Id]
	)
)
go

if object_id('[Rulebase].[VAL_global]','u') is not null
begin
	drop table [Rulebase].[VAL_global]
end
go

create table [Rulebase].[VAL_global]
(
	[UKPRN] int primary key,
	[EmployerVersion] varchar(50),
	[LARSVersion] varchar(50),
	[OrgVersion] varchar(50),
	[PostcodeVersion] varchar(50),
	[RulebaseVersion] varchar(10)
)
go

if object_id('Rulebase.VAL_Learner', 'u') is not null
begin
	drop table [Rulebase].[VAL_Learner]
end
go

create table [Rulebase].VAL_Learner
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	primary key
	(
		[UKPRN],
		[LearnRefNumber]
	)
)
go

if object_id('Rulebase.VAL_LearningDelivery', 'u') is not null
begin
	drop table Rulebase.VAL_LearningDelivery
end
go

create table Rulebase.VAL_LearningDelivery
(
	[UKPRN] int not null,
	[AimSeqNumber] int,
	primary key
	(
		[UKPRN],
		[AimSeqNumber]
	)
)
go

if object_id('[Rulebase].[VAL_ValidationError]','u') is not null
begin
	drop table [Rulebase].[VAL_ValidationError]
end
go

create table [Rulebase].[VAL_ValidationError]
(
	[UKPRN] int not null,
	[AimSeqNumber] bigint,
	[ErrorString] varchar(2000),
	[FieldValues] varchar(2000),
	[LearnRefNumber] varchar(100),
	[RuleId] varchar(50)
)
go


if object_id('[Rulebase].[ALB_Cases]','u') is not null
BEGIN
	drop table [Rulebase].[ALB_Cases]
END
GO

create table [Rulebase].[ALB_Cases]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[CaseData] [xml] not null,
	primary key
	(
		[UKPRN]
		,[LearnRefNumber]
	)
)
GO

if object_id('[Rulebase].[ALB_global]','u') is not null
begin
	drop table [Rulebase].[ALB_global]
END
GO

create table [Rulebase].[ALB_global]
(
	[UKPRN] int primary key,
	[LARSVersion] varchar(100),
	[PostcodeAreaCostVersion] varchar(20),
	[RulebaseVersion] varchar(10)
)
GO

if object_id('[Rulebase].[ALB_Learner_Period]','u') is not null
BEGIN
	drop table [Rulebase].[ALB_Learner_Period]
END
GO

create table [Rulebase].[ALB_Learner_Period]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[Period] int,
	[ALBSeqNum] int,
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[Period] asc
	)
)
GO

if object_id('[Rulebase].[ALB_Learner_PeriodisedValues]','u') is not null
BEGIN
	drop table [Rulebase].[ALB_Learner_PeriodisedValues]
END
GO

create table [Rulebase].[ALB_Learner_PeriodisedValues]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[AttributeName] [varchar](100) not null,
	[Period_1] [decimal](15,5),
	[Period_2] [decimal](15,5),
	[Period_3] [decimal](15,5),
	[Period_4] [decimal](15,5),
	[Period_5] [decimal](15,5),
	[Period_6] [decimal](15,5),
	[Period_7] [decimal](15,5),
	[Period_8] [decimal](15,5),
	[Period_9] [decimal](15,5),
	[Period_10] [decimal](15,5),
	[Period_11] [decimal](15,5),
	[Period_12] [decimal](15,5),
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AttributeName] asc
	)
)
GO

if object_id('[Rulebase].[ALB_LearningDelivery]','u') is not null
begin
	drop table [Rulebase].[ALB_LearningDelivery]
END
go

create table [Rulebase].[ALB_LearningDelivery]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[AimSeqNumber] int,
	[Achieved] bit,
	[ActualNumInstalm] int,
	[AdvLoan] bit,
	[ApplicFactDate] date,
	[ApplicProgWeightFact] varchar(1),
	[AreaCostFactAdj] decimal(10,5),
	[AreaCostInstalment] decimal(10,5),
	[FundLine] varchar(50),
	[FundStart] bit,
	[LiabilityDate] date,
	[LoanBursAreaUplift] bit,
	[LoanBursSupp] bit,
	[OutstndNumOnProgInstalm] int,
	[PlannedNumOnProgInstalm] int,
	[WeightedRate] decimal(10,4)
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AimSeqNumber] asc
	)
)
GO

if object_id('[Rulebase].[ALB_LearningDelivery_Period]','u') is not null
BEGIN
	drop table [Rulebase].[ALB_LearningDelivery_Period]
end
GO

create table [Rulebase].[ALB_LearningDelivery_Period]
( 
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[AimSeqNumber] int,
	[Period] int,
	[ALBCode] int,
	[ALBSupportPayment] decimal(10,5),
	[AreaUpliftBalPayment] decimal(10,5),
	[AreaUpliftOnProgPayment] decimal(10,5),
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AimSeqNumber] asc,
		[Period] asc
	)
)
GO

if object_id('[Rulebase].[ALB_LearningDelivery_PeriodisedValues]','u') is not null
BEGIN
	drop table [Rulebase].[ALB_LearningDelivery_PeriodisedValues]
END
GO

create table [Rulebase].[ALB_LearningDelivery_PeriodisedValues]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[AimSeqNumber] int,
	[AttributeName] [varchar](100) not null,
	[Period_1] [decimal](15,5),
	[Period_2] [decimal](15,5),
	[Period_3] [decimal](15,5),
	[Period_4] [decimal](15,5),
	[Period_5] [decimal](15,5),
	[Period_6] [decimal](15,5),
	[Period_7] [decimal](15,5),
	[Period_8] [decimal](15,5),
	[Period_9] [decimal](15,5),
	[Period_10] [decimal](15,5),
	[Period_11] [decimal](15,5),
	[Period_12] [decimal](15,5),
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AimSeqNumber] asc,
		[AttributeName] asc
	)
)
GO


if object_id('[Rulebase].[VALDP_Cases]','u') is not null
BEGIN
	drop table [Rulebase].[VALDP_Cases]
END
GO

create table [Rulebase].[VALDP_Cases]
(
	[UKPRN] int not null,
	[LearnerDestinationAndProgression_Id] [int] not null,
	[CaseData] [xml] not null,
	primary key
	(
		[UKPRN],
		LearnerDestinationandProgression_Id
	)
)
go

if object_id('[Rulebase].[VALDP_global]','u') is not null
BEGIN
	drop table [Rulebase].[VALDP_global]
END
GO

create table [Rulebase].[VALDP_global]
(
	[UKPRN] int primary key,
	[OrgVersion] varchar(50),
	[RulebaseVersion] varchar(10),
	[ULNVersion] varchar(50)
)
go

if object_id('[Rulebase].[VALDP_ValidationError]','u') is not null
BEGIN
	drop table [Rulebase].[VALDP_ValidationError]
END
go

create table [Rulebase].[VALDP_ValidationError]
(
	[UKPRN] int not null,
	[ErrorString] varchar(2000),
	[FieldValues] varchar(2000),
	[LearnRefNumber] varchar(100),
	[RuleId] varchar(50)
)
go


if object_id('[Rulebase].[VAL_Cases]','u') is not null
begin
	drop table [Rulebase].[VAL_Cases]
end
go

create table [Rulebase].[VAL_Cases]
(
	[UKPRN] int not null,
	[Learner_Id] [int] not null,
	[CaseData] [xml] not null
	,primary key
	(
		UKPRN
		,Learner_Id
	)
)
go

if object_id('[Rulebase].[VAL_global]','u') is not null
begin
	drop table [Rulebase].[VAL_global]
end
go

create table [Rulebase].[VAL_global]
(
	[UKPRN] int primary key,
	[EmployerVersion] varchar(50),
	[LARSVersion] varchar(50),
	[OrgVersion] varchar(50),
	[PostcodeVersion] varchar(50),
	[RulebaseVersion] varchar(10),
)
go

if object_id('[Rulebase].[VAL_ValidationError]','u') is not null
begin
	drop table [Rulebase].[VAL_ValidationError]
end
go

create table [Rulebase].[VAL_ValidationError]
(
	[UKPRN] int not null,
	[AimSeqNumber] bigint,
	[ErrorString] varchar(2000),
	[FieldValues] varchar(2000),
	[LearnRefNumber] varchar(100),
	[RuleId] varchar(50)
)
go

if object_id('[Rulebase].[SFA_Cases]','u') is not null
BEGIN
	drop table [Rulebase].[SFA_Cases]
END
GO

create table [Rulebase].[SFA_Cases]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[CaseData] [xml] not null
	,primary key
	(
		[UKPRN]
		,[LearnRefNumber]
	)
)
go

if object_id('[Rulebase].[SFA_global]','u') is not null
BEGIN
	drop table [Rulebase].[SFA_global]
END
GO

create table [Rulebase].[SFA_global]
(
	[UKPRN] varchar(8) primary key,
	[CurFundYr] varchar(9),
	[LARSVersion] varchar(100),
	[OrgVersion] varchar(100),
	[PostcodeDisadvantageVersion] varchar(50),
	[RulebaseVersion] varchar(10),
)
go

if object_id('[Rulebase].[SFA_LearningDelivery]','u') is not null
BEGIN
	drop table [Rulebase].[SFA_LearningDelivery]
END
GO

create table [Rulebase].[SFA_LearningDelivery]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[AimSeqNumber] int,
	[AchApplicDate] date,
	[Achieved] bit,
	[AchieveElement] decimal(10,5),
	[AchievePayElig] bit,
	[AchievePayPctPreTrans] decimal(10,5),
	[AchPayTransHeldBack] decimal(10,5),
	[ActualDaysIL] int,
	[ActualNumInstalm] int,
	[ActualNumInstalmPreTrans] int,
	[ActualNumInstalmTrans] int,
	[AdjLearnStartDate] date,
	[AdltLearnResp] bit,
	[AgeAimStart] int,
	[AimValue] decimal(10,5),
	[AppAdjLearnStartDate] date,
	[AppAgeFact] decimal(10,5),
	[AppATAGTA] bit,
	[AppCompetency] bit,
	[AppFuncSkill] bit,
	[AppFuncSkill1618AdjFact] decimal(10,5),
	[AppKnowl] bit,
	[AppLearnStartDate] date,
	[ApplicEmpFactDate] date,
	[ApplicFactDate] date,
	[ApplicFundRateDate] date,
	[ApplicProgWeightFact] varchar(1),
	[ApplicUnweightFundRate] decimal(10,5),
	[ApplicWeightFundRate] decimal(10,5),
	[AppNonFund] bit,
	[AreaCostFactAdj] decimal(10,5),
	[BalInstalmPreTrans] int,
	[BaseValueUnweight] decimal(10,5),
	[CapFactor] decimal(10,5),
	[DisUpFactAdj] decimal(10,4),
	[EmpOutcomePayElig] bit,
	[EmpOutcomePctHeldBackTrans] decimal(10,5),
	[EmpOutcomePctPreTrans] decimal(10,5),
	[EmpRespOth] bit,
	[ESOL] bit,
	[FullyFund] bit,
	[FundLine] varchar(100),
	[FundStart] bit,
	[LargeEmployerID] int,
	[LargeEmployerSFAFctr] decimal(10,2),
	[LargeEmployerStatusDate] date,
	[LTRCUpliftFctr] decimal(10,5),
	[NonGovCont] decimal(10,5),
	[OLASSCustody] bit,
	[OnProgPayPctPreTrans] decimal(10,5),
	[OutstndNumOnProgInstalm] int,
	[OutstndNumOnProgInstalmTrans] int,
	[PlannedNumOnProgInstalm] int,
	[PlannedNumOnProgInstalmTrans] int,
	[PlannedTotalDaysIL] int,
	[PlannedTotalDaysILPreTrans] int,
	[PropFundRemain] decimal(10,2),
	[PropFundRemainAch] decimal(10,2),
	[PrscHEAim] bit,
	[Residential] bit,
	[Restart] bit,
	[SpecResUplift] decimal(10,5),
	[StartPropTrans] decimal(10,5),
	[ThresholdDays] int,
	[Traineeship] bit,
	[Trans] bit,
	[TrnAdjLearnStartDate] date,
	[TrnWorkPlaceAim] bit,
	[TrnWorkPrepAim] bit,
	[UnWeightedRateFromESOL] decimal(10,5),
	[UnweightedRateFromLARS] decimal(10,5),
	[WeightedRateFromESOL] decimal(10,5),
	[WeightedRateFromLARS] decimal(10,5)
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AimSeqNumber] asc
	)
)
go

if object_id('[Rulebase].[SFA_LearningDelivery_Period]','u') is not null
BEGIN
	drop table [Rulebase].[SFA_LearningDelivery_Period]
END
go

create table [Rulebase].[SFA_LearningDelivery_Period]
(
	UKPRN int not null,
	[LearnRefNumber] varchar(12),
	[AimSeqNumber] int,
	[Period] int,
	[AchievePayment] decimal(10,5),
	[AchievePayPct] decimal(10,5),
	[AchievePayPctTrans] decimal(10,5),
	[BalancePayment] decimal(10,5),
	[BalancePaymentUncapped] decimal(10,5),
	[BalancePct] decimal(10,5),
	[BalancePctTrans] decimal(10,5),
	[EmpOutcomePay] decimal(10,5),
	[EmpOutcomePct] decimal(10,5),
	[EmpOutcomePctTrans] decimal(10,5),
	[InstPerPeriod] int,
	[LearnSuppFund] bit,
	[LearnSuppFundCash] decimal(10,5),
	[OnProgPayment] decimal(10,5),
	[OnProgPaymentUncapped] decimal(10,5),
	[OnProgPayPct] decimal(10,5),
	[OnProgPayPctTrans] decimal(10,5),
	[TransInstPerPeriod] int,
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AimSeqNumber] asc,
		[Period] asc
	)
)
go

if object_id('[Rulebase].[SFA_LearningDelivery_PeriodisedValues]','u') is not null
BEGIN
	drop table [Rulebase].[SFA_LearningDelivery_PeriodisedValues]
END
GO

create table [Rulebase].[SFA_LearningDelivery_PeriodisedValues]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[AimSeqNumber] int,
	[AttributeName] [varchar](100) not null,
	[Period_1] [decimal](15,5),
	[Period_2] [decimal](15,5),
	[Period_3] [decimal](15,5),
	[Period_4] [decimal](15,5),
	[Period_5] [decimal](15,5),
	[Period_6] [decimal](15,5),
	[Period_7] [decimal](15,5),
	[Period_8] [decimal](15,5),
	[Period_9] [decimal](15,5),
	[Period_10] [decimal](15,5),
	[Period_11] [decimal](15,5),
	[Period_12] [decimal](15,5),
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AimSeqNumber] asc,
		[AttributeName] asc
	)
)
go

if object_id('[Rulebase].[TBL_Cases]','u') is not null
BEGIN
	drop table [Rulebase].[TBL_Cases]
END
GO

create table [Rulebase].[TBL_Cases]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[CaseData] [xml] not null
	,primary key
	(
		[UKPRN]
		,[LearnRefNumber]
	)
)
go

if object_id('[Rulebase].[TBL_global]','u') is not null
BEGIN
	drop table [Rulebase].[TBL_global]
END
GO

create table [Rulebase].[TBL_global]
(
	[UKPRN] int primary key,
	[CurFundYr] varchar(10),
	[LARSVersion] varchar(100),
	[RulebaseVersion] varchar(10),
)
go

if object_id('[Rulebase].[TBL_LearningDelivery]','u') is not null
BEGIN
	drop table [Rulebase].[TBL_LearningDelivery]
END
GO

create table [Rulebase].[TBL_LearningDelivery]
(	
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12)
	,[AimSeqNumber] int
	,[ProgStandardStartDate] date
	,[FundLine] varchar(50)
	,[MathEngAimValue]	decimal(10,5)
	,[PlannedNumOnProgInstalm] int
	,[LearnSuppFundCash] decimal(10,5)
	,[AdjProgStartDate] date
	,[LearnSuppFund] bit
	,[MathEngOnProgPayment] decimal(10,5)
	,[InstPerPeriod] int
	,[SmallBusPayment] decimal(10,5)
	,[YoungAppSecondPayment] decimal(10,5)
	,[CoreGovContPayment] decimal(10,5)
	,[YoungAppEligible] bit
	,[SmallBusEligible] bit
	,[MathEngOnProgPct] int
	,[AgeStandardStart] int
	,[YoungAppSecondThresholdDate] date
	,[EmpIdFirstDayStandard] int
	,[EmpIdFirstYoungAppDate]	int
	,[EmpIdSecondYoungAppDate] int
	,[EmpIdSmallBusDate] int 
	,[YoungAppFirstThresholdDate] date 
	,[AchApplicDate] date
	,[AchEligible] bit
	,[Achieved] bit
	,[AchievementApplicVal] decimal(10,5)
	,[AchPayment] decimal(10,5)
	,[ActualNumInstalm] int
	,[CombinedAdjProp] bigint
	,[EmpIdAchDate] int
	,[LearnDelDaysIL] int
	,[LearnDelStandardAccDaysIL] int
	,[LearnDelStandardPrevAccDaysIL] int
	,[LearnDelStandardTotalDaysIL] int
	,[ActualDaysIL] int
	,[MathEngBalPayment] decimal(10,5)
	,[MathEngBalPct] bigint
	,[MathEngLSFFundStart] bit
	,[PlannedTotalDaysIL] int
	,[MathEngLSFThresholdDays] int
	,[OutstandNumOnProgInstalm] int
	,[SmallBusApplicVal] decimal(10,5)
	,[SmallBusStatusFirstDayStandard] int
	,[SmallBusStatusThreshold] int
	,[YoungAppApplicVal] decimal(10,5)
	,[CoreGovContCapApplicVal] bigint
	,[CoreGovContUncapped] decimal(10,5)
	,[ApplicFundValDate] date
	,[YoungAppFirstPayment] decimal(10,5)
	,[YoungAppPayment] decimal(10,5)	
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AimSeqNumber] asc
	)
)
go

if object_id('[Rulebase].[TBL_LearningDelivery_Period]','u') is not null
BEGIN
	drop table [Rulebase].[TBL_LearningDelivery_Period]
END
GO

create table [Rulebase].[TBL_LearningDelivery_Period]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[AimSeqNumber] int,
	[Period] int,
	[AchPayment] decimal(10,5),
	[CoreGovContPayment] decimal(10,5),
	[CoreGovContUncapped] decimal(10,5),
	[InstPerPeriod] int,
	[LearnSuppFund] bit,
	[LearnSuppFundCash] decimal(10,5),
	[MathEngBalPayment] decimal(10,5),
	[MathEngBalPct] decimal(8,5),
	[MathEngOnProgPayment] decimal(10,5),
	[MathEngOnProgPct] decimal(8,5),
	[SmallBusPayment] decimal(10,5),
	[YoungAppFirstPayment] decimal(10,5),
	[YoungAppPayment] decimal(10,5),
	[YoungAppSecondPayment] decimal(10,5),
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AimSeqNumber] asc,
		[Period] asc
	)
)
go

if object_id('[Rulebase].[TBL_LearningDelivery_PeriodisedValues]','u') is not null
BEGIN
	drop table [Rulebase].[TBL_LearningDelivery_PeriodisedValues]
END
GO

create table [Rulebase].[TBL_LearningDelivery_PeriodisedValues]
(
	[UKPRN] int not null,
	[LearnRefNumber] varchar(12),
	[AimSeqNumber] int,
	[AttributeName] [varchar](100) not null,
	[Period_1] [decimal](15,5),
	[Period_2] [decimal](15,5),
	[Period_3] [decimal](15,5),
	[Period_4] [decimal](15,5),
	[Period_5] [decimal](15,5),
	[Period_6] [decimal](15,5),
	[Period_7] [decimal](15,5),
	[Period_8] [decimal](15,5),
	[Period_9] [decimal](15,5),
	[Period_10] [decimal](15,5),
	[Period_11] [decimal](15,5),
	[Period_12] [decimal](15,5),
	primary key clustered
	(
		[UKPRN],
		[LearnRefNumber] asc,
		[AimSeqNumber] asc,
		[AttributeName] asc
	)
)
go


if not exists(select schema_id from sys.schemas where name='Rulebase')
	exec('create schema Rulebase')
go
if object_id('[Rulebase].[AEC_Cases]','u') is not null
	drop table [Rulebase].[AEC_Cases]
create table [Rulebase].[AEC_Cases]
	(
		[LearnRefNumber] varchar(12),
		[UKPRN] int,
		[CaseData] [xml] not null
	)
go
if object_id('[Rulebase].[AEC_global]','u') is not null
	drop table [Rulebase].[AEC_global]
create table [Rulebase].[AEC_global]
	(
		[UKPRN] int,
		[LARSVersion] varchar(100),
		[RulebaseVersion] varchar(10),
		[Year] varchar(4)
	)
go
if object_id('[Rulebase].[AEC_LearningDelivery]','u') is not null
	drop table [Rulebase].[AEC_LearningDelivery]
create table [Rulebase].[AEC_LearningDelivery]
	(
		[UKPRN] int,
		[LearnRefNumber] varchar(12),
		[AimSeqNumber] int,
		[ActualDaysIL] int,
		[ActualNumInstalm] int,
		[AdjStartDate] date,
		[AgeAtProgStart] int,
		[AppAdjLearnStartDate] date,
		[AppAdjLearnStartDateMatchPathway] date,
		[ApplicCompDate] date,
		[CombinedAdjProp] decimal(10,5),
		[Completed] bit,
		[FirstIncentiveThresholdDate] date,
		[FundStart] bit,
		[LDApplic1618FrameworkUpliftBalancingValue] decimal(10,5),
		[LDApplic1618FrameworkUpliftCompElement] decimal(10,5),
		[LDApplic1618FRameworkUpliftCompletionValue] decimal(10,5),
		[LDApplic1618FrameworkUpliftMonthInstalVal] decimal(10,5),
		[LDApplic1618FrameworkUpliftPrevEarnings] decimal(10,5),
		[LDApplic1618FrameworkUpliftPrevEarningsStage1] decimal(10,5),
		[LDApplic1618FrameworkUpliftRemainingAmount] decimal(10,5),
		[LDApplic1618FrameworkUpliftTotalActEarnings] decimal(10,5),
		[LearnAimRef] varchar(8),
		[LearnDel1618AtStart] bit,
		[LearnDelAppAccDaysIL] int,
		[LearnDelApplicDisadvAmount] decimal(10,5),
		[LearnDelApplicEmp1618Incentive] decimal(10,5),
		[LearnDelApplicEmpDate] date,
		[LearnDelApplicProv1618FrameworkUplift] decimal(10,5),
		[LearnDelApplicProv1618Incentive] decimal(10,5),
		[LearnDelAppPrevAccDaysIL] int,
		[LearnDelDaysIL] int,
		[LearnDelDisadAmount] decimal(10,5),
		[LearnDelEligDisadvPayment] bit,
		[LearnDelEmpIdFirstAdditionalPaymentThreshold] int,
		[LearnDelEmpIdSecondAdditionalPaymentThreshold] int,
		[LearnDelHistDaysThisApp] int,
		[LearnDelHistProgEarnings] decimal(10,5),
		[LearnDelInitialFundLineType] varchar(100),
		[LearnDelMathEng] bit,
		[MathEngAimValue] decimal(10,5),
		[OutstandNumOnProgInstalm] int,
		[PlannedNumOnProgInstalm] int,
		[PlannedTotalDaysIL] int,
		[SecondIncentiveThresholdDate] date,
		[ThresholdDays] int
		primary key clustered
		(
			[UKPRN],
			[LearnRefNumber] asc,
			[AimSeqNumber] asc
		)
	)
go
if object_id('[Rulebase].[AEC_LearningDelivery_Period]','u') is not null
	drop table [Rulebase].[AEC_LearningDelivery_Period]
create table [Rulebase].[AEC_LearningDelivery_Period]
	(
		[UKPRN] int,
		[LearnRefNumber] varchar(12),
		[AimSeqNumber] int,
		[Period] int,
		[DisadvFirstPayment] decimal(10,5),
		[DisadvSecondPayment] decimal(10,5),
		[FundLineType] varchar(100),
		[InstPerPeriod] int,
		[LDApplic1618FrameworkUpliftBalancingPayment] decimal(10,5),
		[LDApplic1618FrameworkUpliftCompletionPayment] decimal(10,5),
		[LDApplic1618FrameworkUpliftOnProgPayment] decimal(10,5),
		[LearnDelContType] varchar(50),
		[LearnDelFirstEmp1618Pay] decimal(10,5),
		[LearnDelFirstProv1618Pay] decimal(10,5),
		[LearnDelLevyNonPayInd] int,
		[LearnDelSecondEmp1618Pay] decimal(10,5),
		[LearnDelSecondProv1618Pay] decimal(10,5),
		[LearnDelSEMContWaiver] bit,
		[LearnDelSFAContribPct] decimal(10,5),
		[LearnSuppFund] bit,
		[LearnSuppFundCash] decimal(10,5),
		[MathEngBalPayment] decimal(10,5),
		[MathEngBalPct] decimal(8,5),
		[MathEngOnProgPayment] decimal(10,5),
		[MathEngOnProgPct] decimal(8,5),
		[ProgrammeAimBalPayment] decimal(10,5),
		[ProgrammeAimCompletionPayment] decimal(10,5),
		[ProgrammeAimOnProgPayment] decimal(10,5),
		[ProgrammeAimProgFundIndMaxEmpCont] decimal(12,5),
		[ProgrammeAimProgFundIndMinCoInvest] decimal(12,5),
		[ProgrammeAimTotProgFund] decimal(12,5),
		primary key clustered
		(
			[UKPRN],
			[LearnRefNumber] asc,
			[AimSeqNumber] asc,
			[Period] asc
		)
	)
go
if object_id('[Rulebase].[AEC_LearningDelivery_PeriodisedValues]','u') is not null
	drop table [Rulebase].[AEC_LearningDelivery_PeriodisedValues]
create table [Rulebase].[AEC_LearningDelivery_PeriodisedValues]
	(
		[UKPRN] int,
		[LearnRefNumber] varchar(12),
		[AimSeqNumber] int,
		[AttributeName] [varchar](100) not null,
		[Period_1] [decimal](15,5),
		[Period_2] [decimal](15,5),
		[Period_3] [decimal](15,5),
		[Period_4] [decimal](15,5),
		[Period_5] [decimal](15,5),
		[Period_6] [decimal](15,5),
		[Period_7] [decimal](15,5),
		[Period_8] [decimal](15,5),
		[Period_9] [decimal](15,5),
		[Period_10] [decimal](15,5),
		[Period_11] [decimal](15,5),
		[Period_12] [decimal](15,5),
		primary key clustered
		(
			[UKPRN] asc,
			[LearnRefNumber] asc,
			[AimSeqNumber] asc,
			[AttributeName] asc
		)
	)
go
if object_id('[Rulebase].[AEC_LearningDelivery_PeriodisedTextValues]','u') is not null
	drop table [Rulebase].[AEC_LearningDelivery_PeriodisedTextValues]
create table [Rulebase].[AEC_LearningDelivery_PeriodisedTextValues]
	(
		[UKPRN] int,
		[LearnRefNumber] varchar(12),
		[AimSeqNumber] int,
		[AttributeName] [varchar](100) not null,
		[Period_1] [varchar](255),
		[Period_2] [varchar](255),
		[Period_3] [varchar](255),
		[Period_4] [varchar](255),
		[Period_5] [varchar](255),
		[Period_6] [varchar](255),
		[Period_7] [varchar](255),
		[Period_8] [varchar](255),
		[Period_9] [varchar](255),
		[Period_10] [varchar](255),
		[Period_11] [varchar](255),
		[Period_12] [varchar](255),
		primary key clustered
		(
			[UKPRN],
			[LearnRefNumber] asc,
			[AimSeqNumber] asc,
			[AttributeName] asc
		)
	)
go
if object_id('[Rulebase].[AEC_HistoricEarningOutput]','u') is not null
	drop table [Rulebase].[AEC_HistoricEarningOutput]
create table [Rulebase].[AEC_HistoricEarningOutput]
	(
		[UKPRN] int,
		[LearnRefNumber] varchar(12),
		[AppIdentifierOutput] varchar(10),
		[AppProgCompletedInTheYearOutput] bit,
		[HistoricDaysInYearOutput] int,
		[HistoricEffectiveTNPStartDateOutput] date,
		[HistoricEmpIdEndWithinYearOutput] int,
		[HistoricEmpIdStartWithinYearOutput] int,
		[HistoricFworkCodeOutput] int,
		[HistoricLearner1618AtStartOutput] bit,
		[HistoricPMRAmountOutput] decimal(12,5),
		[HistoricProgrammeStartDateIgnorePathwayOutput] date,
		[HistoricProgrammeStartDateMatchPathwayOutput] date,
		[HistoricProgTypeOutput] int,
		[HistoricPwayCodeOutput] int,
		[HistoricSTDCodeOutput] int,
		[HistoricTNP1Output] decimal(12,5),
		[HistoricTNP2Output] decimal(12,5),
		[HistoricTNP3Output] decimal(12,5),
		[HistoricTNP4Output] decimal(12,5),
		[HistoricTotal1618UpliftPaymentsInTheYear] decimal(11,5),
		[HistoricTotalProgAimPaymentsInTheYear] decimal(11,5),
		[HistoricULNOutput] bigint,
		[HistoricUptoEndDateOutput] date,
		[HistoricVirtualTNP3EndofThisYearOutput] decimal(12,5),
		[HistoricVirtualTNP4EndofThisYearOutput] decimal(12,5)
		primary key clustered
		(
			[UKPRN],
			[LearnRefNumber] asc,
			[AppIdentifierOutput] asc
		)
	)
go
if object_id('[Rulebase].[AEC_ApprenticeshipPriceEpisode]','u') is not null
begin
	drop table [Rulebase].[AEC_ApprenticeshipPriceEpisode]
end
go

create table Rulebase.AEC_ApprenticeshipPriceEpisode
(
	LearnRefNumber varchar(12) not null
    ,PriceEpisodeIdentifier varchar(25) not null
    ,TNP4 decimal(12,5)
    ,TNP1 decimal(12,5)
    ,EpisodeStartDate date
    ,TNP2 decimal(12, 5)
    ,TNP3 decimal(12, 5)
    ,PriceEpisodeUpperBandLimit decimal(12, 5)
    ,PriceEpisodePlannedEndDate date
    ,PriceEpisodeActualEndDate date
    ,PriceEpisodeTotalTNPPrice decimal(12, 5)
    ,PriceEpisodeUpperLimitAdjustment decimal(12, 5)
    ,PriceEpisodePlannedInstalments INT
    ,PriceEpisodeActualInstalments INT
    ,PriceEpisodeInstalmentsThisPeriod INT
    ,PriceEpisodeCompletionElement decimal(12, 5)
    ,PriceEpisodePreviousEarnings decimal(12, 5)
    ,PriceEpisodeInstalmentValue decimal(12, 5)
    ,PriceEpisodeOnProgPayment decimal(12, 5)
    ,PriceEpisodeTotalEarnings decimal(12, 5)
    ,PriceEpisodeBalanceValue decimal(12, 5)
    ,PriceEpisodeBalancePayment decimal(12, 5)
    ,PriceEpisodeCompleted BIT
    ,PriceEpisodeCompletionPayment decimal(12, 5)
    ,PriceEpisodeRemainingTNPAmount decimal(12, 5)
    ,PriceEpisodeRemainingAmountWithinUpperLimit decimal(12, 5)
    ,PriceEpisodeCappedRemainingTNPAmount decimal(12, 5)
    ,PriceEpisodeExpectedTotalMonthlyValue decimal(12, 5)
    ,PriceEpisodeAimSeqNumber bigint
    ,PriceEpisodeFirstDisadvantagePayment decimal(12, 5)
    ,PriceEpisodeSecondDisadvantagePayment decimal(12, 5)
    ,PriceEpisodeApplic1618FrameworkUpliftBalancing decimal(12, 5)
    ,PriceEpisodeApplic1618FrameworkUpliftCompletionPayment decimal(12, 5)
    ,PriceEpisodeApplic1618FrameworkUpliftOnProgPayment decimal(12, 5)
    ,PriceEpisodeSecondProv1618Pay decimal(12, 5)
    ,PriceEpisodeFirstEmp1618Pay decimal(12, 5)
    ,PriceEpisodeSecondEmp1618Pay decimal(12, 5)
    ,PriceEpisodeFirstProv1618Pay decimal(12, 5)
    ,PriceEpisodeLSFCash decimal(12, 5)
    ,PriceEpisodeFundLineType varchar(100)
    ,PriceEpisodeSFAContribPct decimal(10, 5)
    ,PriceEpisodeLevyNonPayInd INT
    ,EpisodeEffectiveTNPStartDate DATE
    ,PriceEpisodeFirstAdditionalPaymentThresholdDate date
    ,PriceEpisodeSecondAdditionalPaymentThresholdDate DATE
    ,PriceEpisodeContractType varchar(50)
    ,PriceEpisodePreviousEarningsSameProvider decimal(12, 5)
    ,PriceEpisodeTotProgFunding decimal(12, 5)
    ,PriceEpisodeProgFundIndMinCoInvest decimal(12, 5)
    ,PriceEpisodeProgFundIndMaxEmpCont decimal(12, 5)
    ,PriceEpisodeTotalPMRs decimal(12, 5)
    ,PriceEpisodeCumulativePMRs decimal(12, 5)
    ,PriceEpisodeCompExemCode int
	,primary key
	(
		LearnRefNumber
		,PriceEpisodeIdentifier
	)
)
go
if object_id('[Rulebase].[AEC_ApprenticeshipPriceEpisode_Period]','u') is not null
	drop table [Rulebase].[AEC_ApprenticeshipPriceEpisode_Period]
create table [Rulebase].[AEC_ApprenticeshipPriceEpisode_Period]
	(
		[UKPRN] int,
		[LearnRefNumber] varchar(12),
		[PriceEpisodeIdentifier] varchar(25),
		[Period] int,
		[PriceEpisodeApplic1618FrameworkUpliftBalancing] decimal(12,5),
		[PriceEpisodeApplic1618FrameworkUpliftCompletionPayment] decimal(12,5),
		[PriceEpisodeApplic1618FrameworkUpliftOnProgPayment] decimal(12,5),
		[PriceEpisodeBalancePayment] decimal(12,5),
		[PriceEpisodeBalanceValue] decimal(12,5),
		[PriceEpisodeCompletionPayment] decimal(12,5),
		[PriceEpisodeFirstDisadvantagePayment] decimal(12,5),
		[PriceEpisodeFirstEmp1618Pay] decimal(12,5),
		[PriceEpisodeFirstProv1618Pay] decimal(12,5),
		[PriceEpisodeInstalmentsThisPeriod] int,
		[PriceEpisodeLevyNonPayInd] int,
		[PriceEpisodeLSFCash] decimal(12,5),
		[PriceEpisodeOnProgPayment] decimal(12,5),
		[PriceEpisodeProgFundIndMaxEmpCont] decimal(12,5),
		[PriceEpisodeProgFundIndMinCoInvest] decimal(12,5),
		[PriceEpisodeSecondDisadvantagePayment] decimal(12,5),
		[PriceEpisodeSecondEmp1618Pay] decimal(12,5),
		[PriceEpisodeSecondProv1618Pay] decimal(12,5),
		[PriceEpisodeSFAContribPct] decimal(10,5),
		[PriceEpisodeTotProgFunding] decimal(12,5),
		primary key clustered
		(
			[UKPRN],
			[LearnRefNumber] asc,
			[PriceEpisodeIdentifier] asc,
			[Period] asc
		)
	)
go
if object_id('[Rulebase].[AEC_ApprenticeshipPriceEpisode_PeriodisedValues]','u') is not null
	drop table [Rulebase].[AEC_ApprenticeshipPriceEpisode_PeriodisedValues]
create table [Rulebase].[AEC_ApprenticeshipPriceEpisode_PeriodisedValues]
	(
		[UKPRN] int,
		[LearnRefNumber] varchar(12),
		[PriceEpisodeIdentifier] varchar(25),
		[AttributeName] [varchar](100) not null,
		[Period_1] [decimal](15,5),
		[Period_2] [decimal](15,5),
		[Period_3] [decimal](15,5),
		[Period_4] [decimal](15,5),
		[Period_5] [decimal](15,5),
		[Period_6] [decimal](15,5),
		[Period_7] [decimal](15,5),
		[Period_8] [decimal](15,5),
		[Period_9] [decimal](15,5),
		[Period_10] [decimal](15,5),
		[Period_11] [decimal](15,5),
		[Period_12] [decimal](15,5),
		primary key clustered
		(
			[UKPRN],
			[LearnRefNumber] asc,
			[PriceEpisodeIdentifier] asc,
			[AttributeName] asc
		)
	)
go

if not exists(select schema_id from sys.schemas where name='Rulebase')
	exec('create schema Rulebase')
go
if object_id('[Rulebase].[ESFVAL_Cases]','u') is not null
	drop table [Rulebase].[ESFVAL_Cases]
create table [Rulebase].[ESFVAL_Cases]
	(		
		[Learner_Id] [int] primary key,
		[UKPRN] int,
		[CaseData] [xml] not null
	)
go
if object_id('[Rulebase].[ESFVAL_global]','u') is not null
	drop table [Rulebase].[ESFVAL_global]
create table [Rulebase].[ESFVAL_global]
	(
		[UKPRN] int,
		[RulebaseVersion] varchar(10),
	)
go
if object_id('[Rulebase].[ESFVAL_ValidationError]','u') is not null
	drop table [Rulebase].[ESFVAL_ValidationError]
create table [Rulebase].[ESFVAL_ValidationError]
	(
		[UKPRN] int,
		[AimSeqNumber] bigint,
		[ErrorString] varchar(2000),
		[FieldValues] varchar(2000),
		[LearnRefNumber] varchar(100),
		[RuleId] varchar(50)
	)
go

if object_id('[Rulebase].[DV_Cases]','u') is not null
begin
	drop table [Rulebase].[DV_Cases]
end
go

create table [Rulebase].[DV_Cases]
(
	[LearnRefNumber] varchar(12),
	[CaseData] [xml] not null
)
go

if object_id('[Rulebase].[DV_global]','u') is not null
begin
	drop table [Rulebase].[DV_global]
end
go

create table [Rulebase].[DV_global]
(
	[UKPRN] int,
	[RulebaseVersion] varchar(10),
)
go

if object_id('[Rulebase].[DV_Learner]','u') is not null
begin
	drop table [Rulebase].[DV_Learner]
end
go

create table [Rulebase].[DV_Learner]
(
	[LearnRefNumber] varchar(12),
	[Learn_3rdSector] int,
	[Learn_Active] int,
	[Learn_ActiveJan] int,
	[Learn_ActiveNov] int,
	[Learn_ActiveOct] int,
	[Learn_Age31Aug] int,
	[Learn_BasicSkill] int,
	[Learn_EmpStatFDL] int,
	[Learn_EmpStatPrior] int,
	[Learn_FirstFullLevel2] int,
	[Learn_FirstFullLevel2Ach] int,
	[Learn_FirstFullLevel3] int,
	[Learn_FirstFullLevel3Ach] int,
	[Learn_FullLevel2] int,
	[Learn_FullLevel2Ach] int,
	[Learn_FullLevel3] int,
	[Learn_FullLevel3Ach] int,
	[Learn_FundAgency] int,
	[Learn_FundingSource] int,
	[Learn_FundPrvYr] int,
	[Learn_ILAcMonth1] int,
	[Learn_ILAcMonth10] int,
	[Learn_ILAcMonth11] int,
	[Learn_ILAcMonth12] int,
	[Learn_ILAcMonth2] int,
	[Learn_ILAcMonth3] int,
	[Learn_ILAcMonth4] int,
	[Learn_ILAcMonth5] int,
	[Learn_ILAcMonth6] int,
	[Learn_ILAcMonth7] int,
	[Learn_ILAcMonth8] int,
	[Learn_ILAcMonth9] int,
	[Learn_ILCurrAcYr] int,
	[Learn_LargeEmployer] int,
	[Learn_LenEmp] int,
	[Learn_LenUnemp] int,
	[Learn_LrnAimRecords] int,
	[Learn_ModeAttPlanHrs] int,
	[Learn_NotionLev] int,
	[Learn_NotionLevV2] int,
	[Learn_OLASS] int,
	[Learn_PrefMethContact] int,
	[Learn_PrimaryLLDD] int,
	[Learn_PriorEducationStatus] int,
	[Learn_UnempBenFDL] int,
	[Learn_UnempBenPrior] int,
	[Learn_Uplift1516EFA] decimal(6,5),
	[Learn_Uplift1516SFA] decimal(6,5),
	primary key clustered
	(
		[LearnRefNumber] asc
	)
)
go

if object_id('[Rulebase].[DV_LearningDelivery]','u') is not null
begin
	drop table [Rulebase].[DV_LearningDelivery]
end
go

create table [Rulebase].[DV_LearningDelivery]
(
	[LearnRefNumber] varchar(12),
	[AimSeqNumber] int,
	[LearnDel_AccToApp] int,
	[LearnDel_AccToAppEmpDate] date,
	[LearnDel_AccToAppEmpStat] int,
	[LearnDel_AchFullLevel2Pct] decimal(5,2),
	[LearnDel_AchFullLevel3Pct] decimal(5,2),
	[LearnDel_Achieved] int,
	[LearnDel_AchievedIY] int,
	[LearnDel_AcMonthYTD] varchar(2),
	[LearnDel_ActDaysILAfterCurrAcYr] int,
	[LearnDel_ActDaysILCurrAcYr] int,
	[LearnDel_ActEndDateOnAfterJan1] int,
	[LearnDel_ActEndDateOnAfterNov1] int,
	[LearnDel_ActEndDateOnAfterOct1] int,
	[LearnDel_ActiveIY] int,
	[LearnDel_ActiveJan] int,
	[LearnDel_ActiveNov] int,
	[LearnDel_ActiveOct] int,
	[LearnDel_ActTotalDaysIL] int,
	[LearnDel_AdvLoan] int,
	[LearnDel_AgeAimOrigStart] int,
	[LearnDel_AgeAtStart] int,
	[LearnDel_App] int,
	[LearnDel_App1618Fund] int,
	[LearnDel_App1925Fund] int,
	[LearnDel_AppAimType] int,
	[LearnDel_AppKnowl] int,
	[LearnDel_AppMainAim] int,
	[LearnDel_AppNonFund] int,
	[LearnDel_BasicSkills] int,
	[LearnDel_BasicSkillsParticipation] int,
	[LearnDel_BasicSkillsType] int,
	[LearnDel_CarryIn] int,
	[LearnDel_ClassRm] int,
	[LearnDel_CompAimApp] int,
	[LearnDel_CompAimProg] int,
	[LearnDel_Completed] int,
	[LearnDel_CompletedIY] int,
	[LearnDel_CompleteFullLevel2Pct] decimal(5,2),
	[LearnDel_CompleteFullLevel3Pct] decimal(5,2),
	[LearnDel_EFACoreAim] int,
	[LearnDel_Emp6MonthAimStart] int,
	[LearnDel_Emp6MonthProgStart] int,
	[LearnDel_EmpDateBeforeFDL] date,
	[LearnDel_EmpDatePriorFDL] date,
	[LearnDel_EmpID] int,
	[LearnDel_Employed] int,
	[LearnDel_EmpStatFDL] int,
	[LearnDel_EmpStatPrior] int,
	[LearnDel_EmpStatPriorFDL] int,
	[LearnDel_EnhanAppFund] int,
	[LearnDel_FullLevel2AchPct] decimal(5,2),
	[LearnDel_FullLevel2ContPct] decimal(5,2),
	[LearnDel_FullLevel3AchPct] decimal(5,2),
	[LearnDel_FullLevel3ContPct] decimal(5,2),
	[LearnDel_FuncSkills] int,
	[LearnDel_FundAgency] int,
	[LearnDel_FundingLineType] varchar(100),
	[LearnDel_FundingSource] int,
	[LearnDel_FundPrvYr] int,
	[LearnDel_FundStart] int,
	[LearnDel_GCE] int,
	[LearnDel_GCSE] int,
	[LearnDel_ILAcMonth1] int,
	[LearnDel_ILAcMonth10] int,
	[LearnDel_ILAcMonth11] int,
	[LearnDel_ILAcMonth12] int,
	[LearnDel_ILAcMonth2] int,
	[LearnDel_ILAcMonth3] int,
	[LearnDel_ILAcMonth4] int,
	[LearnDel_ILAcMonth5] int,
	[LearnDel_ILAcMonth6] int,
	[LearnDel_ILAcMonth7] int,
	[LearnDel_ILAcMonth8] int,
	[LearnDel_ILAcMonth9] int,
	[LearnDel_ILCurrAcYr] int,
	[LearnDel_IYActEndDate] date,
	[LearnDel_IYPlanEndDate] date,
	[LearnDel_IYStartDate] date,
	[LearnDel_KeySkills] int,
	[LearnDel_LargeEmpDiscountId] int,
	[LearnDel_LargeEmployer] int,
	[LearnDel_LastEmpDate] date,
	[LearnDel_LeaveMonth] int,
	[LearnDel_LenEmp] int,
	[LearnDel_LenUnemp] int,
	[LearnDel_LoanBursFund] int,
	[LearnDel_NotionLevel] int,
	[LearnDel_NotionLevelV2] int,
	[LearnDel_NumHEDatasets] int,
	[LearnDel_OccupAim] int,
	[LearnDel_OLASS] int,
	[LearnDel_OLASSCom] int,
	[LearnDel_OLASSCus] int,
	[LearnDel_OrigStartDate] date,
	[LearnDel_PlanDaysILAfterCurrAcYr] int,
	[LearnDel_PlanDaysILCurrAcYr] int,
	[LearnDel_PlanEndBeforeAug1] int,
	[LearnDel_PlanEndOnAfterJan1] int,
	[LearnDel_PlanEndOnAfterNov1] int,
	[LearnDel_PlanEndOnAfterOct1] int,
	[LearnDel_PlanTotalDaysIL] int,
	[LearnDel_PriorEducationStatus] int,
	[LearnDel_Prog] int,
	[LearnDel_ProgAimAch] int,
	[LearnDel_ProgAimApp] int,
	[LearnDel_ProgCompleted] int,
	[LearnDel_ProgCompletedIY] int,
	[LearnDel_ProgStartDate] date,
	[LearnDel_QCF] int,
	[LearnDel_QCFCert] int,
	[LearnDel_QCFDipl] int,
	[LearnDel_QCFType] int,
	[LearnDel_RegAim] int,
	[LearnDel_SecSubAreaTier1] varchar(3),
	[LearnDel_SecSubAreaTier2] varchar(5),
	[LearnDel_SFAApproved] int,
	[LearnDel_SourceFundEFA] int,
	[LearnDel_SourceFundSFA] int,
	[LearnDel_StartBeforeApr1] int,
	[LearnDel_StartBeforeAug1] int,
	[LearnDel_StartBeforeDec1] int,
	[LearnDel_StartBeforeFeb1] int,
	[LearnDel_StartBeforeJan1] int,
	[LearnDel_StartBeforeJun1] int,
	[LearnDel_StartBeforeMar1] int,
	[LearnDel_StartBeforeMay1] int,
	[LearnDel_StartBeforeNov1] int,
	[LearnDel_StartBeforeOct1] int,
	[LearnDel_StartBeforeSep1] int,
	[LearnDel_StartIY] int,
	[LearnDel_StartJan1] int,
	[LearnDel_StartMonth] int,
	[LearnDel_StartNov1] int,
	[LearnDel_StartOct1] int,
	[LearnDel_SuccRateStat] int,
	[LearnDel_TrainAimType] int,
	[LearnDel_TransferDiffProvider] int,
	[LearnDel_TransferDiffProviderGovStrat] int,
	[LearnDel_TransferProvider] int,
	[LearnDel_UfIProv] int,
	[LearnDel_UnempBenFDL] int,
	[LearnDel_UnempBenPrior] int,
	[LearnDel_Withdrawn] int,
	[LearnDel_WorkplaceLocPostcode] varchar(8),
	[Prog_AccToApp] int,
	[Prog_Achieved] int,
	[Prog_AchievedIY] int,
	[Prog_ActEndDate] date,
	[Prog_ActiveIY] int,
	[Prog_AgeAtStart] int,
	[Prog_EarliestAim] int,
	[Prog_Employed] int,
	[Prog_FundPrvYr] int,
	[Prog_ILCurrAcYear] int,
	[Prog_LatestAim] int,
	[Prog_SourceFundEFA] int,
	[Prog_SourceFundSFA] int
	primary key clustered
	(
		[LearnRefNumber] asc,
		[AimSeqNumber] asc
	)
)
go




if object_id('[Valid].[LearnerDenorm]','V') is not null
begin
	drop VIEW [Valid].[LearnerDenorm]
end
go
create view Valid.LearnerDenorm
as
	select
		l.UKPRN,
		l.[LearnRefNumber],
		l.[PrevLearnRefNumber],
		l.[PrevUKPRN],
		l.[PMUKPRN],
		l.[ULN],
		l.[FamilyName],
		l.[GivenNames],
		l.[DateOfBirth],
		l.[Ethnicity],
		l.[Sex],
		l.[LLDDHealthProb],
		l.[NINumber],
		l.[PriorAttain],
		l.[Accom],
		l.[ALSCost],
		l.[PlanLearnHours],
		l.[PlanEEPHours],
		l.[MathGrade],
		l.[EngGrade],
		l.[PostcodePrior],
		l.[Postcode],
		l.[AddLine1],
		l.[AddLine2],
		l.[AddLine3],
		l.[AddLine4],
		l.[TelNo],
		l.[Email]
		,LSR.LSR1
		,LSR.LSR2
		,LSR.LSR3
		,LSR.LSR4
		,NLM.NLM1
		,NLM.NLM2
		,PPE.PPE1
		,PPE.PPE2
		,EDF.EDF1
		,EDF.EDF2
		,ehc.LearnFAMCode as [EHC]
		,ecf.LearnFAMCode as [ECF]
		,hns.LearnFAMCode as [HNS]
		,lda.LearnFAMCode as [LDA]
		,mcf.LearnFAMCode as [MCF]
		,ProvSpecMon_A.ProvSpecLearnMon AS ProvSpecLearnMon_A	
		,ProvSpecMon_B.ProvSpecLearnMon AS ProvSpecLearnMon_B
	from
		Valid.Learner as l
		left join
		(
			select
				[LearnRefNumber],
				[UKPRN],
				max([LSR1]) as [LSR1],
				max([LSR2]) as [LSR2],
				max([LSR3]) as [LSR3],
				max([LSR4]) as [LSR4]
			from
				(
					select
						lf.LearnRefNumber,
						lf.[UKPRN],
						case row_number() over (partition by lf.[LearnRefNumber], lf.UKPRN order by lf.[LearnRefNumber], lf.UKPRN) when 1 then lf.LearnFAMCode else null end  as [LSR1],
						case row_number() over (partition by lf.[LearnRefNumber], lf.UKPRN order by lf.[LearnRefNumber], lf.UKPRN) when 2 then lf.LearnFAMCode else null end  as [LSR2],
						case row_number() over (partition by lf.[LearnRefNumber], lf.UKPRN order by lf.[LearnRefNumber], lf.UKPRN) when 3 then lf.LearnFAMCode else null end  as [LSR3],
						case row_number() over (partition by lf.[LearnRefNumber], lf.UKPRN order by lf.[LearnRefNumber], lf.UKPRN) when 4 then lf.LearnFAMCode else null end  as [LSR4]
					from
						Valid.[LearnerFAM] as lf
					where
						lf.[LearnFAMType]='LSR'
				) as [LSRs]
			group by
				LearnRefNumber,
				UKPRN
		) as [LSR]
		on [LSR].LearnRefNumber = l.LearnRefNumber
		and LSR.UKPRN = l.UKPRN
		left join
		(
			select
				LearnRefNumber,
				UKPRN,
				max([NLM1]) as [NLM1],
				max([NLM2]) as [NLM2]
			from
				(
					select
						LearnRefNumber,
						UKPRN,
						case row_number() over (partition by [LearnRefNumber], UKPRN order by [LearnRefNumber], UKPRN) when 1 then LearnFAMCode else null end  as [NLM1],
						case row_number() over (partition by [LearnRefNumber], UKPRN order by [LearnRefNumber], UKPRN) when 2 then LearnFAMCode else null end  as [NLM2]
					from
						Valid.[LearnerFAM]
					where
						[LearnFAMType]='NLM'
				) as [NLMs]
			group by
				LearnRefNumber,
				UKPRN
		) as [NLM]
			on [NLM].LearnRefNumber = l.LearnRefNumber
			and NLM.UKPRN = l.UKPRN
		left join
		(
			select
				LearnRefNumber,
				UKPRN,
				max([PPE1]) as [PPE1],
				max([PPE2]) as [PPE2]
			from
				(
					select
						LearnRefNumber,
						UKPRN,
						case row_number() over (partition by [LearnRefNumber], UKPRN order by [LearnRefNumber], UKPRN) when 1 then LearnFAMCode else null end  as [PPE1],
						case row_number() over (partition by [LearnRefNumber], UKPRN order by [LearnRefNumber], UKPRN) when 2 then LearnFAMCode else null end  as [PPE2]
					from
						Valid.[LearnerFAM]
					where
						[LearnFAMType]='PPE'
				) as [PPEs]
			group by
				LearnRefNumber,
				UKPRN
		) as [PPE]
			on [PPE].LearnRefNumber = l.LearnRefNumber
			and PPE.UKPRN = l.UKPRN
		left join
		(
			select
				[LearnRefNumber],
				UKPRN,
				max([EDF1]) as [EDF1],
				max([EDF2]) as [EDF2]
			from
				(
					select
						[LearnRefNumber],
						UKPRN,
						case row_number() over (partition by [LearnRefNumber], UKPRN order by [LearnRefNumber], UKPRN) when 1 then LearnFAMCode else null end  as [EDF1],
						case row_number() over (partition by [LearnRefNumber], UKPRN order by [LearnRefNumber], UKPRN) when 2 then LearnFAMCode else null end  as [EDF2]
					from
						[Valid].[LearnerFAM]
					where
						[LearnFAMType]='EDF'
				) as [EDFs]
			group by
				UKPRN,
				[LearnRefNumber]
		) as [EDF]
			on [EDF].[LearnRefNumber]=l.LearnRefNumber
			and EDF.UKPRN = l.UKPRN
		left join
			Valid.LearnerFAM as ehc
				on ehc.LearnRefNumber = l.LearnRefNumber
				and ehc.LearnFAMType = 'EHC' 
				and ehc.UKPRN = l.UKPRN
		left join
			Valid.LearnerFAM as ecf
				on ecf.LearnRefNumber = l.LearnRefNumber
				and ecf.LearnFAMType = 'ECF'
				and ecf.UKPRN = l.UKPRN
		left join
			Valid.LearnerFAM as hns
				on hns.LearnRefNumber = l.LearnRefNumber
				and hns.LearnFAMType = 'HNS'
				and hns.UKPRN = l.UKPRN
		left join
			Valid.LearnerFAM as lda
				on lda.LearnRefNumber = l.LearnRefNumber
				and lda.LearnFAMType = 'LDA'
				and lda.UKPRN = l.UKPRN
		left join
			Valid.LearnerFAM as mcf
				on mcf.LearnRefNumber = l.LearnRefNumber
				and mcf.LearnFAMType = 'MCF'
				and mcf.UKPRN = l.UKPRN

		left join Valid.[ProviderSpecLearnerMonitoring] as [ProvSpecMon_A]
			on [ProvSpecMon_A].[LearnRefNumber] = l.LearnRefNumber
			and [ProvSpecMon_A].[ProvSpecLearnMonOccur]='A'
			and ProvSpecMon_A.UKPRN = l.UKPRN
		left join Valid.[ProviderSpecLearnerMonitoring] as [ProvSpecMon_B]
			on [ProvSpecMon_B].LearnRefNumber = l.[LearnRefNumber]
			and [ProvSpecMon_B].[ProvSpecLearnMonOccur]='B'
			and ProvSpecMon_B.UKPRN = l.UKPRN
go

if object_id('[Valid].[LearnerEmploymentStatusDenorm]','V') is not null
begin
	drop VIEW [Valid].LearnerEmploymentStatusDenorm
end
go
create view Valid.LearnerEmploymentStatusDenorm
as
SELECT 
	les.UKPRN
	,les.[LearnRefNumber]
	,les.[EmpStat]
	,les.[EmpId]
	,les.[DateEmpStatApp]
	,[EmpStatMon_BSI].ESMCode AS ESMCode_BSI
	,[EmpStatMon_EII].ESMCode AS ESMCode_EII
	,[EmpStatMon_LOE].ESMCode AS ESMCode_LOE
	,[EmpStatMon_LOU].ESMCode AS ESMCode_LOU
	,[EmpStatMon_PEI].ESMCode AS ESMCode_PEI
	,[EmpStatMon_SEI].ESMCode AS ESMCode_SEI
	,[EmpStatMon_SEM].ESMCode AS ESMCode_SEM
FROM 
	Valid.[LearnerEmploymentStatus] as les
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_BSI]
		on [EmpStatMon_BSI].LearnRefNumber=les.LearnRefNumber
		and [EmpStatMon_BSI].DateEmpStatApp = les.DateEmpStatApp
		and EmpStatMon_BSI.UKPRN = les.UKPRN
		and [EmpStatMon_BSI].[ESMType]='BSI'
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_EII]
		on [EmpStatMon_EII].LearnRefNumber=les.LearnRefNumber
		and [EmpStatMon_EII].DateEmpStatApp = les.DateEmpStatApp
		and EmpStatMon_EII.UKPRN = les.UKPRN
		and [EmpStatMon_EII].[ESMType]='EII'
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_LOE]
		on [EmpStatMon_LOE].LearnRefNumber=les.LearnRefNumber
		and [EmpStatMon_LOE].DateEmpStatApp = les.DateEmpStatApp
		and EmpStatMon_LOE.UKPRN = les.UKPRN
		and [EmpStatMon_LOE].[ESMType]='LOE'
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_LOU]
		on [EmpStatMon_LOU].LearnRefNumber=les.LearnRefNumber
		and [EmpStatMon_LOU].DateEmpStatApp = les.DateEmpStatApp
		and EmpStatMon_LOU.UKPRN = les.UKPRN
		and [EmpStatMon_LOU].[ESMType]='LOU'
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_PEI]
		on [EmpStatMon_PEI].LearnRefNumber=les.LearnRefNumber
		and [EmpStatMon_PEI].DateEmpStatApp = les.DateEmpStatApp
		and EmpStatMon_PEI.UKPRN = les.UKPRN
		and [EmpStatMon_PEI].[ESMType]='PEI'
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_SEI]
		on [EmpStatMon_SEI].LearnRefNumber=les.LearnRefNumber
		and [EmpStatMon_SEI].DateEmpStatApp = les.DateEmpStatApp
		and EmpStatMon_SEI.UKPRN = les.UKPRN
		and [EmpStatMon_SEI].[ESMType]='SEI'
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_SEM]
		on [EmpStatMon_SEM].LearnRefNumber=les.LearnRefNumber
		and EmpStatMon_SEM.DateEmpStatApp = les.DateEmpStatApp
		and [EmpStatMon_SEM].[ESMType]='SEM'
GO


if object_id('[Valid].[LearningDeliveryDenorm]','V') is not null
begin
	drop VIEW [Valid].[LearningDeliveryDenorm]
end
go
CREATE VIEW Valid.LearningDeliveryDenorm
AS
SELECT
	ld.UKPRN
	,ld.[LearnRefNumber]
	,ld.[LearnAimRef]
	,ld.[AimType]
	,ld.[AimSeqNumber]
	,ld.[LearnStartDate]
	,ld.[OrigLearnStartDate]
	,ld.[LearnPlanEndDate]
	,ld.[FundModel]
	,ld.[ProgType]
	,ld.[FworkCode]
	,ld.[PwayCode]
	,ld.[StdCode]
	,ld.[PartnerUKPRN]
	,ld.[DelLocPostCode]
	,ld.[AddHours]
	,ld.[PriorLearnFundAdj]
	,ld.[OtherFundAdj]
	,ld.[ConRefNumber]
	,ld.[EPAOrgID]
	,ld.[EmpOutcome]
	,ld.[CompStatus]
	,ld.[LearnActEndDate]
	,ld.[WithdrawReason]
	,ld.[Outcome]
	,ld.[AchDate]
	,ld.[OutGrade]
	,ld.[SWSupAimId]
	,HEM.HEM1
	,HEM.HEM2
	,HEM.HEM3
	,HHS.HHS1
	,HHS.HHS2
	,[LDFAM_SOF].LearnDelFAMCode AS [LDFAM_SOF]
	,[LDFAM_EEF].LearnDelFAMCode AS [LDFAM_EEF]
	,[LDFAM_RES].LearnDelFAMCode AS [LDFAM_RES]
	,[LDFAM_ADL].LearnDelFAMCode AS [LDFAM_ADL]
	,[LDFAM_FFI].LearnDelFAMCode AS [LDFAM_FFI]
	,[LDFAM_SPP].LearnDelFAMCode AS [LDFAM_SPP]
	,[ProvSpecMon_A].ProvSpecDelMon AS ProvSpecDelMon_A
	,[ProvSpecMon_B].ProvSpecDelMon	AS ProvSpecDelMon_B
	,[ProvSpecMon_C].ProvSpecDelMon	AS ProvSpecDelMon_C
	,[ProvSpecMon_D].ProvSpecDelMon	AS ProvSpecDelMon_D
	,LDM.LDM1
	,LDM.LDM2
	,LDM.LDM3
	,LDM.LDM4

FROM
	Valid.LearningDelivery as ld
	left join
	(
		select
			[UKPRN],
			[LearnRefNumber],
			[AimSeqNumber],
			max([HEM1]) as [HEM1],
			max([HEM2]) as [HEM2],
			max([HEM3]) as [HEM3]
		from
			(
				select
					[UKPRN],
					[LearnRefNumber],
					[AimSeqNumber],
					case row_number() over (partition by LearnRefNumber, AimSeqNumber order by LearnRefNumber, AimSeqNumber) when 1 then LearnDelFAMCode else null end  as [HEM1],
					case row_number() over (partition by LearnRefNumber, AimSeqNumber order by LearnRefNumber, AimSeqNumber) when 2 then LearnDelFAMCode else null end  as [HEM2],
					case row_number() over (partition by LearnRefNumber, AimSeqNumber order by LearnRefNumber, AimSeqNumber) when 3 then LearnDelFAMCode else null end  as [HEM3]
				from
					Valid.[LearningDeliveryFAM]
				where
					[LearnDelFAMType]='HEM'
			) as [HEMs]
		group by
			UKPRN,
			[LearnRefNumber]
			,[AimSeqNumber]
	) as [HEM]
	on [HEM].[LearnRefNumber]=ld.[LearnRefNumber]
	and [HEM].[AimSeqNumber]=ld.[AimSeqNumber]
	and HEM.UKPRN = ld.UKPRN
	left join
	(
		select
			UKPRN,
			LearnRefNumber, 
			AimSeqNumber,
			max([HHS1]) as [HHS1],
			max([HHS2]) as [HHS2]
		from
			(
				select
					UKPRN,
					LearnRefNumber,
					AimSeqNumber,
					case row_number() over (partition by [LearnRefNumber], AimSeqNumber, UKPRN order by [LearnRefNumber], AimSeqNumber, UKPRN) when 1 then LearnDelFAMCode else null end  as [HHS1],
					case row_number() over (partition by [LearnRefNumber], AimSeqNumber, UKPRN order by [LearnRefNumber], AimSeqNumber, UKPRN) when 2 then LearnDelFAMCode else null end  as [HHS2]
				from
					Valid.[LearningDeliveryFAM]
				where
					[LearnDelFAMType]='HHS'
			) as [HHSs]
		group by
			UKPRN,
			[LearnRefNumber]
			,[AimSeqNumber]
	) as [HHS]
	on [HHS].[LearnRefNumber]=ld.[LearnRefNumber]
	and [HHS].AimSeqNumber=ld.AimSeqNumber
	and HHS.UKPRN = ld.UKPRN

	LEFT JOIN
		[Valid].[LearningDeliveryFAM] AS [LDFAM_SOF] 
			ON ld.[LearnRefNumber] = [LDFAM_SOF].[LearnRefNumber]
			AND ld.[AimSeqNumber] = [LDFAM_SOF].[AimSeqNumber]
			and LDFAM_SOF.UKPRN = ld.UKPRN
			AND [LDFAM_SOF].[LearnDelFAMType] = 'SOF'
	LEFT JOIN
		[Valid].[LearningDeliveryFAM] AS [LDFAM_EEF] 
			ON ld.[LearnRefNumber] = [LDFAM_EEF].[LearnRefNumber]
			AND ld.[AimSeqNumber] = [LDFAM_EEF].[AimSeqNumber]
			and ld.UKPRN = LDFAM_EEF.UKPRN
			AND [LDFAM_EEF].[LearnDelFAMType] = 'EEF'
	LEFT JOIN
		[Valid].[LearningDeliveryFAM] AS [LDFAM_RES] 
			ON ld.[LearnRefNumber] = [LDFAM_RES].[LearnRefNumber]
			AND ld.[AimSeqNumber] = [LDFAM_RES].[AimSeqNumber]
			and ld.UKPRN = LDFAM_RES.UKPRN
			AND [LDFAM_RES].[LearnDelFAMType] = 'RES'
	LEFT JOIN            
		[Valid].[LearningDeliveryFAM] AS [LDFAM_ADL] 
			ON  ld.[LearnRefNumber] = [LDFAM_ADL].[LearnRefNumber]
			AND ld.[AimSeqNumber] = [LDFAM_ADL].[AimSeqNumber]
			and ld.UKPRN = LDFAM_ADL.UKPRN
			AND [LDFAM_ADL].[LearnDelFAMType] = 'ADL'
	LEFT JOIN
        [Valid].[LearningDeliveryFAM] AS [LDFAM_FFI] 
			ON  ld.[LearnRefNumber] = [LDFAM_FFI].[LearnRefNumber]
			AND ld.[AimSeqNumber] = [LDFAM_FFI].[AimSeqNumber]
			and [LDFAM_FFI].UKPRN = ld.UKPRN
			AND [LDFAM_FFI].[LearnDelFAMType] = 'FFI'
	LEFT JOIN 
		[Valid].[LearningDeliveryFAM] AS [LDFAM_SPP] 
			ON ld.[LearnRefNumber] = [LDFAM_SPP].[LearnRefNumber]
			AND ld.[AimSeqNumber] = [LDFAM_SPP].[AimSeqNumber]
			and [LDFAM_SPP].UKPRN = ld.UKPRN
			AND [LDFAM_SPP].[LearnDelFAMType] = 'SPP'

	left join Valid.[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_A]
		on [ProvSpecMon_A].[LearnRefNumber]=ld.[LearnRefNumber]
		and [ProvSpecMon_A].[AimSeqNumber]=ld.[AimSeqNumber]
		and [ProvSpecMon_A].UKPRN = ld.UKPRN
		and [ProvSpecMon_A].[ProvSpecDelMonOccur]='A'

	left join Valid.[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_B]
		on [ProvSpecMon_B].[LearnRefNumber]=ld.[LearnRefNumber]
		and [ProvSpecMon_B].[AimSeqNumber]=ld.[AimSeqNumber]
		and [ProvSpecMon_B].UKPRN = ld.UKPRN
		and [ProvSpecMon_B].[ProvSpecDelMonOccur]='B'

	left join Valid.[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_C]
		on [ProvSpecMon_C].[LearnRefNumber]=ld.[LearnRefNumber]
		and [ProvSpecMon_C].[AimSeqNumber]=ld.[AimSeqNumber]
		and [ProvSpecMon_C].UKPRN = ld.UKPRN
		and [ProvSpecMon_C].[ProvSpecDelMonOccur]='C'

	left join Valid.[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_D]
		on [ProvSpecMon_D].[LearnRefNumber]=ld.[LearnRefNumber]
		and [ProvSpecMon_D].[AimSeqNumber]=ld.[AimSeqNumber]
		and ProvSpecMon_D.UKPRN = ld.UKPRN
		and [ProvSpecMon_D].[ProvSpecDelMonOccur]='D' 
	left join
	(
		select
			[LearnRefNumber],
			[AimSeqNumber],
			[UKPRN],
			max([LDM1]) as [LDM1],
			max([LDM2]) as [LDM2],
			max([LDM3]) as [LDM3],
			max([LDM4]) as [LDM4]
		from
		(
			select
				UKPRN,
				[LearnRefNumber],
				[AimSeqNumber],
				case row_number() over (partition by [LearnRefNumber], AimSeqNumber, UKPRN order by [LearnRefNumber], AimSeqNumber, UKPRN) when 1 then LearnDelFAMCode else null end  as [LDM1],
				case row_number() over (partition by [LearnRefNumber], AimSeqNumber, UKPRN order by [LearnRefNumber], AimSeqNumber, UKPRN) when 2 then LearnDelFAMCode else null end  as [LDM2],
				case row_number() over (partition by [LearnRefNumber], AimSeqNumber, UKPRN order by [LearnRefNumber], AimSeqNumber, UKPRN) when 3 then LearnDelFAMCode else null end  as [LDM3],
				case row_number() over (partition by [LearnRefNumber], AimSeqNumber, UKPRN order by [LearnRefNumber], AimSeqNumber, UKPRN) when 4 then LearnDelFAMCode else null end  as [LDM4]
			from
				[Valid].[LearningDeliveryFAM]
			where
				[LearnDelFAMType]='LDM'
		) as [LDMs]
		group by
			UKPRN,
			[LearnRefNumber],
			[AimSeqNumber]
	) as [LDM]
		on [LDM].[LearnRefNumber]=ld.[LearnRefNumber]
		and LDM.UKPRN = ld.UKPRN
		and LDM.AimSeqNumber = ld.AimSeqNumber
go


if object_id ('Valid.TrailblazerApprenticeshipFinancialRecord', 'v') is not null
begin
	drop view Valid.TrailblazerApprenticeshipFinancialRecord
end
go

create view Valid.TrailblazerApprenticeshipFinancialRecord
as
	select
		UKPRN
		,LearnRefNumber
		,AimSeqNumber
		,AFinType as TBFinType
		,AFinCode as TBFinCode
		,AFinAmount as TBFinAmount
		,AFinDate as TBFinDate
	from
		Valid.AppFinRecord
go