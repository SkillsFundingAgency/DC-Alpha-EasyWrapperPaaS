if not exists(select schema_id from sys.schemas where name='Valid')
	exec('create schema Valid')
GO
if object_id('[Valid].[CollectionDetails]','u') is not null
	drop table [Valid].[CollectionDetails]
create table [Valid].[CollectionDetails](
	[Collection] [varchar](3) NULL,
	[Year] [varchar](4) NULL,
	[FilePreparationDate] [date] NULL
)

if object_id('[Valid].[ContactPreference]','u') is not null
	drop table [Valid].[ContactPreference]
create table [Valid].[ContactPreference](
	[LearnRefNumber] [varchar](12) NULL,
	[ContPrefType] [varchar](3) NULL,
	[ContPrefCode] [int] NULL
)

if object_id('[Valid].[DPOutcome]','u') is not null
	drop table [Valid].[DPOutcome]
create table [Valid].[DPOutcome](
	[LearnRefNumber] [varchar](12) NULL,
	[OutType] [varchar](3) NULL,
	[OutCode] [int] NULL,
	[OutStartDate] [date] NULL,
	[OutEndDate] [date] NULL,
	[OutCollDate] [date] NULL
)

if object_id('[Valid].[Learner]','u') is not null
	drop table [Valid].[Learner]
create table [Valid].[Learner](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[PrevLearnRefNumber] [varchar](12) NULL,
	[PrevUKPRN] [int] NULL,
	[ULN] [bigint] NULL,
	[FamilyName] [varchar](100) NULL,
	[GivenNames] [varchar](100) NULL,
	[DateOfBirth] [date] NULL,
	[Ethnicity] [int] NULL,
	[Sex] [varchar](1) NULL,
	[LLDDHealthProb] [int] NULL,
	[NINumber] [varchar](9) NULL,
	[PriorAttain] [int] NULL,
	[Accom] [int] NULL,
	[ALSCost] [int] NULL,
	[PlanLearnHours] [int] NULL,
	[PlanEEPHours] [int] NULL,
	[MathGrade] [varchar](4) NULL,
	[EngGrade] [varchar](4) NULL,
	[HomePostcode] [varchar](8) NULL,
	[CurrentPostcode] [varchar](8) NULL,
	[LrnFAM_DLA] [int] NULL,
	[LrnFAM_ECF] [int] NULL,
	[LrnFAM_EDF1] [int] NULL,
	[LrnFAM_EDF2] [int] NULL,
	[LrnFAM_EHC] [int] NULL,
	[LrnFAM_FME] [int] NULL,
	[LrnFAM_HNS] [int] NULL,
	[LrnFAM_LDA] [int] NULL,
	[LrnFAM_LSR1] [int] NULL,
	[LrnFAM_LSR2] [int] NULL,
	[LrnFAM_LSR3] [int] NULL,
	[LrnFAM_LSR4] [int] NULL,
	[LrnFAM_MCF] [int] NULL,
	[LrnFAM_NLM1] [int] NULL,
	[LrnFAM_NLM2] [int] NULL,
	[LrnFAM_PPE1] [int] NULL,
	[LrnFAM_PPE2] [int] NULL,
	[LrnFAM_SEN] [int] NULL,
	[ProvSpecMon_A] [varchar](20) NULL,
	[ProvSpecMon_B] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC
)
)

if object_id('[Valid].[LearnerContact]','u') is not null
	drop table [Valid].[LearnerContact]
create table [Valid].[LearnerContact](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[HomePostcode] [varchar](8) NULL,
	[CurrentPostcode] [varchar](8) NULL,
	[TelNumber] [varchar](18) NULL,
	[Email] [varchar](100) NULL,
	[AddLine1] [varchar](50) NULL,
	[AddLine2] [varchar](50) NULL,
	[AddLine3] [varchar](50) NULL,
	[AddLine4] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC
)
)

if object_id('[Valid].[LearnerDestinationandProgression]','u') is not null
	drop table [Valid].[LearnerDestinationandProgression]
create table [Valid].[LearnerDestinationandProgression](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[ULN] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC
)
)

if object_id('[Valid].[LearnerEmploymentStatus]','u') is not null
	drop table [Valid].[LearnerEmploymentStatus]
create table [Valid].[LearnerEmploymentStatus](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[EmpStat] [int] NULL,
	[DateEmpStatApp] [date] NOT NULL,
	[EmpId] [int] NULL,
	[EmpStatMon_BSI] [int] NULL,
	[EmpStatMon_EII] [int] NULL,
	[EmpStatMon_LOE] [int] NULL,
	[EmpStatMon_LOU] [int] NULL,
	[EmpStatMon_PEI] [int] NULL,
	[EmpStatMon_SEI] [int] NULL,
	[EmpStatMon_SEM] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC,
	[DateEmpStatApp] ASC
)
)

if object_id('[Valid].[LearnerHE]','u') is not null
	drop table [Valid].[LearnerHE]
create table [Valid].[LearnerHE](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[UCASPERID] [bigint] NULL,
	[TTACCOM] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC
)
)

if object_id('[Valid].[LearnerHEFinancialSupport]','u') is not null
	drop table [Valid].[LearnerHEFinancialSupport]
create table [Valid].[LearnerHEFinancialSupport](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[FINTYPE] [int] NOT NULL,
	[FINAMOUNT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC,
	[FINTYPE] ASC
)
)

if object_id('[Valid].[LearningDelivery]','u') is not null
	drop table [Valid].[LearningDelivery]
create table [Valid].[LearningDelivery](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[LearnAimRef] [varchar](8) NULL,
	[AimType] [int] NULL,
	[AimSeqNumber] [int] NOT NULL,
	[LearnStartDate] [date] NULL,
	[OrigLearnStartDate] [date] NULL,
	[LearnPlanEndDate] [date] NULL,
	[FundModel] [int] NULL,
	[ProgType] [int] NULL,
	[FworkCode] [int] NULL,
	[PwayCode] [int] NULL,
	[StdCode] [bigint] NULL,
	[PartnerUKPRN] [int] NULL,
	[DelLocPostCode] [varchar](8) NULL,
	[AddHours] [int] NULL,
	[PriorLearnFundAdj] [int] NULL,
	[OtherFundAdj] [int] NULL,
	[ConRefNumber] [varchar](20) NULL,
	[EmpOutcome] [int] NULL,
	[CompStatus] [int] NULL,
	[LearnActEndDate] [date] NULL,
	[WithdrawReason] [int] NULL,
	[Outcome] [int] NULL,
	[AchDate] [date] NULL,
	[OutGrade] [varchar](6) NULL,
	[SWSupAimId] [varchar](36) NULL,
	[LrnDelFAM_ADL] [varchar](5) NULL,
	[LrnDelFAM_ASL] [varchar](5) NULL,
	[LrnDelFAM_EEF] [varchar](5) NULL,
	[LrnDelFAM_FFI] [varchar](5) NULL,
	[LrnDelFAM_FLN] [varchar](5) NULL,
	[LrnDelFAM_HEM1] [varchar](5) NULL,
	[LrnDelFAM_HEM2] [varchar](5) NULL,
	[LrnDelFAM_HEM3] [varchar](5) NULL,
	[LrnDelFAM_HHS1] [varchar](5) NULL,
	[LrnDelFAM_HHS2] [varchar](5) NULL,
	[LrnDelFAM_LDM1] [varchar](5) NULL,
	[LrnDelFAM_LDM2] [varchar](5) NULL,
	[LrnDelFAM_LDM3] [varchar](5) NULL,
	[LrnDelFAM_LDM4] [varchar](5) NULL,
	[LrnDelFAM_NSA] [varchar](5) NULL,
	[LrnDelFAM_POD] [varchar](5) NULL,
	[LrnDelFAM_RES] [varchar](5) NULL,
	[LrnDelFAM_SOF] [varchar](5) NULL,
	[LrnDelFAM_SPP] [varchar](5) NULL,
	[LrnDelFAM_WPP] [varchar](5) NULL,
	[ProvSpecMon_A] [varchar](20) NULL,
	[ProvSpecMon_B] [varchar](20) NULL,
	[ProvSpecMon_C] [varchar](20) NULL,
	[ProvSpecMon_D] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC,
	[AimSeqNumber] ASC
)
)

if object_id('[Valid].[LearningDeliveryFAM]','u') is not null
	drop table [Valid].[LearningDeliveryFAM]
create table [Valid].[LearningDeliveryFAM](
	[LearnRefNumber] [varchar](12) NULL,
	[AimSeqNumber] [int] NULL,
	[LearnDelFAMType] [varchar](3) NULL,
	[LearnDelFAMCode] [varchar](5) NULL,
	[LearnDelFAMDateFrom] [date] NULL,
	[LearnDelFAMDateTo] [date] NULL
)

if object_id('[Valid].[LearningDeliveryHE]','u') is not null
	drop table [Valid].[LearningDeliveryHE]
create table [Valid].[LearningDeliveryHE](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[AimSeqNumber] [int] NOT NULL,
	[NUMHUS] [varchar](20) NULL,
	[SSN] [varchar](13) NULL,
	[QUALENT3] [varchar](3) NULL,
	[SOC2000] [int] NULL,
	[SEC] [int] NULL,
	[UCASAPPID] [varchar](9) NULL,
	[TYPEYR] [int] NULL,
	[MODESTUD] [int] NULL,
	[FUNDLEV] [int] NULL,
	[FUNDCOMP] [int] NULL,
	[STULOAD] [decimal](4, 1) NULL,
	[YEARSTU] [int] NULL,
	[MSTUFEE] [int] NULL,
	[PCOLAB] [decimal](4, 1) NULL,
	[PCFLDCS] [decimal](4, 1) NULL,
	[PCSLDCS] [decimal](4, 1) NULL,
	[PCTLDCS] [decimal](4, 1) NULL,
	[SPECFEE] [int] NULL,
	[NETFEE] [int] NULL,
	[GROSSFEE] [int] NULL,
	[DOMICILE] [varchar](2) NULL,
	[ELQ] [int] NULL,
	[HEPostCode] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC,
	[AimSeqNumber] ASC
)
)

if object_id('[Valid].[LearningDeliveryWorkPlacement]','u') is not null
	drop table [Valid].[LearningDeliveryWorkPlacement]
create table [Valid].[LearningDeliveryWorkPlacement](
	[LearnRefNumber] [varchar](12) NULL,
	[AimSeqNumber] [int] NULL,
	[WorkPlaceStartDate] [date] NULL,
	[WorkPlaceEndDate] [date] NULL,
	[WorkPlaceMode] [int] NULL,
	[WorkPlaceEmpId] [int] NULL
)

if object_id('[Valid].[LearningProvider]','u') is not null
	drop table [Valid].[LearningProvider]
create table [Valid].[LearningProvider](
	[UKPRN] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UKPRN] ASC
)
)

if object_id('[Valid].[LLDDandHealthProblem]','u') is not null
	drop table [Valid].[LLDDandHealthProblem]
create table [Valid].[LLDDandHealthProblem](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[LLDDCat] [int] NOT NULL,
	[PrimaryLLDD] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC,
	[LLDDCat] ASC
)
)

if object_id('[Valid].[Source]','u') is not null
	drop table [Valid].[Source]
create table [Valid].[Source](
	[ProtectiveMarking] [varchar](100) NULL,
	[UKPRN] [int] NULL,
	[SoftwareSupplier] [varchar](40) NULL,
	[SoftwarePackage] [varchar](30) NULL,
	[Release] [varchar](20) NULL,
	[SerialNo] [varchar](2) NULL,
	[DateTime] [datetime] NULL,
	[ReferenceData] [varchar](100) NULL,
	[ComponentSetVersion] [varchar](20) NULL
)

if object_id('[Valid].[SourceFile]','u') is not null
	drop table [Valid].[SourceFile]
create table [Valid].[SourceFile](
	[SourceFileName] [varchar](50) NULL,
	[FilePreparationDate] [date] NULL,
	[SoftwareSupplier] [varchar](40) NULL,
	[SoftwarePackage] [varchar](30) NULL,
	[Release] [varchar](20) NULL,
	[SerialNo] [varchar](2) NULL,
	[DateTime] [datetime] NULL
)

if object_id('[Valid].[TrailblazerApprenticeshipFinancialRecord]','u') is not null
	drop table [Valid].[TrailblazerApprenticeshipFinancialRecord]
create table [Valid].[TrailblazerApprenticeshipFinancialRecord](
	[LearnRefNumber] [varchar](12) NULL,
	[AimSeqNumber] [int] NULL,
	[TBFinType] [varchar](3) NULL,
	[TBFinCode] [int] NULL,
	[TBFinDate] [date] NULL,
	[TBFinAmount] [int] NULL
)