if not exists(select schema_id from sys.schemas where name='Input')
	exec('create schema Input')
GO
if object_id('[Input].[CollectionDetails]','u') is not null
	drop table [Input].[CollectionDetails]
create table [Input].[CollectionDetails]
	(
		[CollectionDetails_Id] int  primary key,
		[Collection] varchar(3),
		[Year] varchar(4),
		[FilePreparationDate] date
	)

if object_id('[Input].[Source]','u') is not null
	drop table [Input].[Source]
create table [Input].[Source]
	(
		[Source_Id] int  primary key,
		[ProtectiveMarking] varchar(30),
		[UKPRN] int,
		[SoftwareSupplier] varchar(40),
		[SoftwarePackage] varchar(30),
		[Release] varchar(20),
		[SerialNo] varchar(2),
		[DateTime] datetime,
		[ReferenceData] varchar(100),
		[ComponentSetVersion] varchar(20)
	)

if object_id('[Input].[SourceFile]','u') is not null
	drop table [Input].[SourceFile]
create table [Input].[SourceFile]
	(
		[SourceFile_Id] int  primary key,
		[SourceFileName] varchar(50),
		[FilePreparationDate] date,
		[SoftwareSupplier] varchar(40),
		[SoftwarePackage] varchar(30),
		[Release] varchar(20),
		[SerialNo] varchar(2),
		[DateTime] datetime
	)
create index [IX_Input_SourceFile] on [Input].[SourceFile]
	(
		[SourceFileName] asc
	)

if object_id('[Input].[LearningProvider]','u') is not null
	drop table [Input].[LearningProvider]
create table [Input].[LearningProvider]
	(
		[LearningProvider_Id] int  primary key,
		[UKPRN] int not null
	)
create index [IX_Input_LearningProvider] on [Input].[LearningProvider]
	(
		[UKPRN] asc
	)

if object_id('[Input].[Learner]','u') is not null
	drop table [Input].[Learner]
create table [Input].[Learner]
	(
		[Learner_Id] int  primary key,
		[LearnRefNumber] varchar(100),
		[PrevLearnRefNumber] varchar(1000),
		[PrevUKPRN] bigint,
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
		[EngGrade] varchar(1000)
	)
create index [IX_Input_Learner] on [Input].[Learner]
	(
		[LearnRefNumber] asc
	)

if object_id('[Input].[LearnerContact]','u') is not null
	drop table [Input].[LearnerContact]
create table [Input].[LearnerContact]
	(
		[LearnerContact_Id] int  primary key,
		[Learner_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[LocType] bigint,
		[ContType] bigint,
		[PostCode] varchar(1000),
		[TelNumber] varchar(1000),
		[Email] varchar(1000)
	)
create index [IX_Parent_Input_LearnerContact] on [Input].[LearnerContact]
	(
		[Learner_Id] asc
	)
create index [IX_Input_LearnerContact] on [Input].[LearnerContact]
	(
		[LearnRefNumber] asc,
		[ContType] asc,
		[LocType] asc
	)

if object_id('[Input].[PostAdd]','u') is not null
	drop table [Input].[PostAdd]
create table [Input].[PostAdd]
	(
		[PostAdd_Id] int  primary key,
		[LearnerContact_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[ContType] bigint,
		[LocType] bigint,
		[AddLine1] varchar(1000),
		[AddLine2] varchar(1000),
		[AddLine3] varchar(1000),
		[AddLine4] varchar(1000)
	)
create index [IX_Parent_Input_PostAdd] on [Input].[PostAdd]
	(
		[LearnerContact_Id] asc
	)
create index [IX_Input_PostAdd] on [Input].[PostAdd]
	(
		[LearnRefNumber] asc,
		[ContType] asc,
		[LocType] asc
	)

if object_id('[Input].[ContactPreference]','u') is not null
	drop table [Input].[ContactPreference]
create table [Input].[ContactPreference]
	(
		[ContactPreference_Id] int  primary key,
		[Learner_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[ContPrefType] varchar(100),
		[ContPrefCode] bigint
	)
create index [IX_Parent_Input_ContactPreference] on [Input].[ContactPreference]
	(
		[Learner_Id] asc
	)
create index [IX_Input_ContactPreference] on [Input].[ContactPreference]
	(
		[LearnRefNumber] asc,
		[ContPrefType] asc
	)

if object_id('[Input].[LLDDandHealthProblem]','u') is not null
	drop table [Input].[LLDDandHealthProblem]
create table [Input].[LLDDandHealthProblem]
	(
		[LLDDandHealthProblem_Id] int  primary key,
		[Learner_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[LLDDCat] bigint,
		[PrimaryLLDD] bigint
	)
create index [IX_Parent_Input_LLDDandHealthProblem] on [Input].[LLDDandHealthProblem]
	(
		[Learner_Id] asc
	)
create index [IX_Input_LLDDandHealthProblem] on [Input].[LLDDandHealthProblem]
	(
		[LearnRefNumber] asc,
		[LLDDCat] asc
	)

if object_id('[Input].[LearnerFAM]','u') is not null
	drop table [Input].[LearnerFAM]
create table [Input].[LearnerFAM]
	(
		[LearnerFAM_Id] int  primary key,
		[Learner_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[LearnFAMType] varchar(100),
		[LearnFAMCode] bigint
	)
create index [IX_Parent_Input_LearnerFAM] on [Input].[LearnerFAM]
	(
		[Learner_Id] asc
	)
create index [IX_Input_LearnerFAM] on [Input].[LearnerFAM]
	(
		[LearnRefNumber] asc,
		[LearnFAMType] asc
	)

if object_id('[Input].[ProviderSpecLearnerMonitoring]','u') is not null
	drop table [Input].[ProviderSpecLearnerMonitoring]
create table [Input].[ProviderSpecLearnerMonitoring]
	(
		[ProviderSpecLearnerMonitoring_Id] int  primary key,
		[Learner_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[ProvSpecLearnMonOccur] varchar(100),
		[ProvSpecLearnMon] varchar(1000)
	)
create index [IX_Parent_Input_ProviderSpecLearnerMonitoring] on [Input].[ProviderSpecLearnerMonitoring]
	(
		[Learner_Id] asc
	)
create index [IX_Input_ProviderSpecLearnerMonitoring] on [Input].[ProviderSpecLearnerMonitoring]
	(
		[LearnRefNumber] asc,
		[ProvSpecLearnMonOccur] asc
	)

if object_id('[Input].[LearnerEmploymentStatus]','u') is not null
	drop table [Input].[LearnerEmploymentStatus]
create table [Input].[LearnerEmploymentStatus]
	(
		[LearnerEmploymentStatus_Id] int  primary key,
		[Learner_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[EmpStat] bigint,
		[DateEmpStatApp] date,
		[EmpId] bigint
	)
create index [IX_Parent_Input_LearnerEmploymentStatus] on [Input].[LearnerEmploymentStatus]
	(
		[Learner_Id] asc
	)
create index [IX_Input_LearnerEmploymentStatus] on [Input].[LearnerEmploymentStatus]
	(
		[LearnRefNumber] asc,
		[DateEmpStatApp] asc
	)

if object_id('[Input].[EmploymentStatusMonitoring]','u') is not null
	drop table [Input].[EmploymentStatusMonitoring]
create table [Input].[EmploymentStatusMonitoring]
	(
		[EmploymentStatusMonitoring_Id] int  primary key,
		[LearnerEmploymentStatus_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[DateEmpStatApp] date,
		[ESMType] varchar(100),
		[ESMCode] bigint
	)
create index [IX_Parent_Input_EmploymentStatusMonitoring] on [Input].[EmploymentStatusMonitoring]
	(
		[LearnerEmploymentStatus_Id] asc
	)
create index [IX_Input_EmploymentStatusMonitoring] on [Input].[EmploymentStatusMonitoring]
	(
		[LearnRefNumber] asc,
		[DateEmpStatApp] asc,
		[ESMType] asc
	)

if object_id('[Input].[LearnerHE]','u') is not null
	drop table [Input].[LearnerHE]
create table [Input].[LearnerHE]
	(
		[LearnerHE_Id] int  primary key,
		[Learner_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[UCASPERID] varchar(1000),
		[TTACCOM] bigint
	)
create index [IX_Parent_Input_LearnerHE] on [Input].[LearnerHE]
	(
		[Learner_Id] asc
	)
create index [IX_Input_LearnerHE] on [Input].[LearnerHE]
	(
		[LearnRefNumber] asc
	)

if object_id('[Input].[LearnerHEFinancialSupport]','u') is not null
	drop table [Input].[LearnerHEFinancialSupport]
create table [Input].[LearnerHEFinancialSupport]
	(
		[LearnerHEFinancialSupport_Id] int  primary key,
		[LearnerHE_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[FINTYPE] bigint,
		[FINAMOUNT] bigint
	)
create index [IX_Parent_Input_LearnerHEFinancialSupport] on [Input].[LearnerHEFinancialSupport]
	(
		[LearnerHE_Id] asc
	)
create index [IX_Input_LearnerHEFinancialSupport] on [Input].[LearnerHEFinancialSupport]
	(
		[LearnRefNumber] asc,
		[FINTYPE] asc
	)

if object_id('[Input].[LearningDelivery]','u') is not null
	drop table [Input].[LearningDelivery]
create table [Input].[LearningDelivery]
	(
		[LearningDelivery_Id] int  primary key,
		[Learner_Id] int  not null,
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
		[EmpOutcome] bigint,
		[CompStatus] bigint,
		[LearnActEndDate] date,
		[WithdrawReason] bigint,
		[Outcome] bigint,
		[AchDate] date,
		[OutGrade] varchar(1000),
		[SWSupAimId] varchar(1000)
	)
create index [IX_Parent_Input_LearningDelivery] on [Input].[LearningDelivery]
	(
		[Learner_Id] asc
	)
create index [IX_Input_LearningDelivery] on [Input].[LearningDelivery]
	(
		[LearnRefNumber] asc,
		[AimSeqNumber] asc
	)

if object_id('[Input].[LearningDeliveryFAM]','u') is not null
	drop table [Input].[LearningDeliveryFAM]
create table [Input].[LearningDeliveryFAM]
	(
		[LearningDeliveryFAM_Id] int  primary key,
		[LearningDelivery_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[AimSeqNumber] bigint,
		[LearnDelFAMType] varchar(100),
		[LearnDelFAMCode] varchar(1000),
		[LearnDelFAMDateFrom] date,
		[LearnDelFAMDateTo] date
	)
create index [IX_Parent_Input_LearningDeliveryFAM] on [Input].[LearningDeliveryFAM]
	(
		[LearningDelivery_Id] asc
	)
create index [IX_Input_LearningDeliveryFAM] on [Input].[LearningDeliveryFAM]
	(
		[LearnRefNumber] asc,
		[AimSeqNumber] asc,
		[LearnDelFAMType] asc,
		[LearnDelFAMDateFrom] asc
	)

if object_id('[Input].[LearningDeliveryWorkPlacement]','u') is not null
	drop table [Input].[LearningDeliveryWorkPlacement]
create table [Input].[LearningDeliveryWorkPlacement]
	(
		[LearningDeliveryWorkPlacement_Id] int  primary key,
		[LearningDelivery_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[AimSeqNumber] bigint,
		[WorkPlaceStartDate] date,
		[WorkPlaceEndDate] date,
		[WorkPlaceMode] bigint,
		[WorkPlaceEmpId] bigint
	)
create index [IX_Parent_Input_LearningDeliveryWorkPlacement] on [Input].[LearningDeliveryWorkPlacement]
	(
		[LearningDelivery_Id] asc
	)
create index [IX_Input_LearningDeliveryWorkPlacement] on [Input].[LearningDeliveryWorkPlacement]
	(
		[LearnRefNumber] asc,
		[AimSeqNumber] asc,
		[WorkPlaceStartDate] asc,
		[WorkPlaceMode] asc,
		[WorkPlaceEmpId] asc
	)

if object_id('[Input].[TrailblazerApprenticeshipFinancialRecord]','u') is not null
	drop table [Input].[TrailblazerApprenticeshipFinancialRecord]
create table [Input].[TrailblazerApprenticeshipFinancialRecord]
	(
		[TrailblazerApprenticeshipFinancialRecord_Id] int  primary key,
		[LearningDelivery_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[AimSeqNumber] bigint,
		[TBFinType] varchar(100),
		[TBFinCode] bigint,
		[TBFinDate] date,
		[TBFinAmount] bigint
	)
create index [IX_Parent_Input_TrailblazerApprenticeshipFinancialRecord] on [Input].[TrailblazerApprenticeshipFinancialRecord]
	(
		[LearningDelivery_Id] asc
	)
create index [IX_Input_TrailblazerApprenticeshipFinancialRecord] on [Input].[TrailblazerApprenticeshipFinancialRecord]
	(
		[LearnRefNumber] asc,
		[AimSeqNumber] asc,
		[TBFinType] asc
	)

if object_id('[Input].[ProviderSpecDeliveryMonitoring]','u') is not null
	drop table [Input].[ProviderSpecDeliveryMonitoring]
create table [Input].[ProviderSpecDeliveryMonitoring]
	(
		[ProviderSpecDeliveryMonitoring_Id] int  primary key,
		[LearningDelivery_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[AimSeqNumber] bigint,
		[ProvSpecDelMonOccur] varchar(100),
		[ProvSpecDelMon] varchar(1000)
	)
create index [IX_Parent_Input_ProviderSpecDeliveryMonitoring] on [Input].[ProviderSpecDeliveryMonitoring]
	(
		[LearningDelivery_Id] asc
	)
create index [IX_Input_ProviderSpecDeliveryMonitoring] on [Input].[ProviderSpecDeliveryMonitoring]
	(
		[LearnRefNumber] asc,
		[AimSeqNumber] asc,
		[ProvSpecDelMonOccur] asc
	)

if object_id('[Input].[LearningDeliveryHE]','u') is not null
	drop table [Input].[LearningDeliveryHE]
create table [Input].[LearningDeliveryHE]
	(
		[LearningDeliveryHE_Id] int  primary key,
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
	)
create index [IX_Parent_Input_LearningDeliveryHE] on [Input].[LearningDeliveryHE]
	(
		[LearningDelivery_Id] asc
	)
create index [IX_Input_LearningDeliveryHE] on [Input].[LearningDeliveryHE]
	(
		[LearnRefNumber] asc,
		[AimSeqNumber] asc
	)

if object_id('[Input].[LearnerDestinationandProgression]','u') is not null
	drop table [Input].[LearnerDestinationandProgression]
create table [Input].[LearnerDestinationandProgression]
	(
		[LearnerDestinationandProgression_Id] int  primary key,
		[LearnRefNumber] varchar(100),
		[ULN] bigint
	)
create index [IX_Input_LearnerDestinationandProgression] on [Input].[LearnerDestinationandProgression]
	(
		[LearnRefNumber] asc
	)

if object_id('[Input].[DPOutcome]','u') is not null
	drop table [Input].[DPOutcome]
create table [Input].[DPOutcome]
	(
		[DPOutcome_Id] int  primary key,
		[LearnerDestinationandProgression_Id] int  not null,
		[LearnRefNumber] varchar(100),
		[OutType] varchar(100),
		[OutCode] bigint,
		[OutStartDate] date,
		[OutEndDate] date,
		[OutCollDate] date
	)
create index [IX_Parent_Input_DPOutcome] on [Input].[DPOutcome]
	(
		[LearnerDestinationandProgression_Id] asc
	)
create index [IX_Input_DPOutcome] on [Input].[DPOutcome]
	(
		[LearnRefNumber] asc,
		[OutType] asc,
		[OutCode] asc,
		[OutStartDate] asc
	)

