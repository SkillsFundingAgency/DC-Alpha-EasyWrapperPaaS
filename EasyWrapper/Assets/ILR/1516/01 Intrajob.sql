CREATE SCHEMA [Input]
GO
CREATE SCHEMA [Rulebase]
GO
CREATE SCHEMA [Valid]
GO

CREATE TABLE [Input].[CollectionDetails](
	[CollectionDetails_Id] [int] NOT NULL,
	[Collection] [varchar](3) NULL,
	[Year] [varchar](4) NULL,
	[FilePreparationDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CollectionDetails_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [Input].[ContactPreference](
	[ContactPreference_Id] [int] NOT NULL,
	[Learner_Id] [int] NOT NULL,
	[ContPrefType] [varchar](100) NULL,
	[ContPrefCode] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactPreference_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [Input].[DPOutcome](
	[DPOutcome_Id] [int] NOT NULL,
	[LearnerDestinationandProgression_Id] [int] NOT NULL,
	[OutType] [varchar](100) NULL,
	[OutCode] [bigint] NULL,
	[OutStartDate] [date] NULL,
	[OutEndDate] [date] NULL,
	[OutCollDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DPOutcome_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [Input].[EmploymentStatusMonitoring](
	[EmploymentStatusMonitoring_Id] [int] NOT NULL,
	[LearnerEmploymentStatus_Id] [int] NOT NULL,
	[ESMType] [varchar](100) NULL,
	[ESMCode] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmploymentStatusMonitoring_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [Input].[Learner](
	[Learner_Id] [int] NOT NULL,
	[LearnRefNumber] [varchar](100) NULL,
	[PrevLearnRefNumber] [varchar](1000) NULL,
	[PrevUKPRN] [bigint] NULL,
	[ULN] [bigint] NULL,
	[FamilyName] [varchar](1000) NULL,
	[GivenNames] [varchar](1000) NULL,
	[DateOfBirth] [date] NULL,
	[Ethnicity] [bigint] NULL,
	[Sex] [varchar](1000) NULL,
	[LLDDHealthProb] [bigint] NULL,
	[NINumber] [varchar](1000) NULL,
	[PriorAttain] [bigint] NULL,
	[Accom] [bigint] NULL,
	[ALSCost] [bigint] NULL,
	[PlanLearnHours] [bigint] NULL,
	[PlanEEPHours] [bigint] NULL,
	[MathGrade] [varchar](1000) NULL,
	[EngGrade] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Learner_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [Input].[LearnerContact](
	[LearnerContact_Id] [int] NOT NULL,
	[Learner_Id] [int] NOT NULL,
	[LocType] [bigint] NULL,
	[ContType] [bigint] NULL,
	[PostCode] [varchar](1000) NULL,
	[TelNumber] [varchar](1000) NULL,
	[Email] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnerContact_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [Input].[LearnerDestinationandProgression](
	[LearnerDestinationandProgression_Id] [int] NOT NULL,
	[LearnRefNumber] [varchar](100) NULL,
	[ULN] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnerDestinationandProgression_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [Input].[LearnerEmploymentStatus](
	[LearnerEmploymentStatus_Id] [int] NOT NULL,
	[Learner_Id] [int] NOT NULL,
	[EmpStat] [bigint] NULL,
	[DateEmpStatApp] [date] NULL,
	[EmpId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnerEmploymentStatus_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [Input].[LearnerFAM](
	[LearnerFAM_Id] [int] NOT NULL,
	[Learner_Id] [int] NOT NULL,
	[LearnFAMType] [varchar](100) NULL,
	[LearnFAMCode] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnerFAM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [Input].[LearnerHE](
	[LearnerHE_Id] [int] NOT NULL,
	[Learner_Id] [int] NOT NULL,
	[UCASPERID] [bigint] NULL,
	[TTACCOM] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnerHE_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [Input].[LearnerHEFinancialSupport](
	[LearnerHEFinancialSupport_Id] [int] NOT NULL,
	[LearnerHE_Id] [int] NOT NULL,
	[FINTYPE] [bigint] NULL,
	[FINAMOUNT] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnerHEFinancialSupport_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Input].[LearningDelivery](
	[LearningDelivery_Id] [int] NOT NULL,
	[Learner_Id] [int] NOT NULL,
	[LearnAimRef] [varchar](1000) NULL,
	[AimType] [bigint] NULL,
	[AimSeqNumber] [bigint] NULL,
	[LearnStartDate] [date] NULL,
	[OrigLearnStartDate] [date] NULL,
	[LearnPlanEndDate] [date] NULL,
	[FundModel] [bigint] NULL,
	[ProgType] [bigint] NULL,
	[FworkCode] [bigint] NULL,
	[PwayCode] [bigint] NULL,
	[PartnerUKPRN] [bigint] NULL,
	[DelLocPostCode] [varchar](1000) NULL,
	[AddHours] [bigint] NULL,
	[PriorLearnFundAdj] [bigint] NULL,
	[OtherFundAdj] [bigint] NULL,
	[ConRefNumber] [varchar](1000) NULL,
	[EmpOutcome] [bigint] NULL,
	[CompStatus] [bigint] NULL,
	[LearnActEndDate] [date] NULL,
	[WithdrawReason] [bigint] NULL,
	[Outcome] [bigint] NULL,
	[AchDate] [date] NULL,
	[OutGrade] [varchar](1000) NULL,
	[SWSupAimId] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[LearningDelivery_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Input].[LearningDeliveryFAM](
	[LearningDeliveryFAM_Id] [int] NOT NULL,
	[LearningDelivery_Id] [int] NOT NULL,
	[LearnDelFAMType] [varchar](100) NULL,
	[LearnDelFAMCode] [varchar](1000) NULL,
	[LearnDelFAMDateFrom] [date] NULL,
	[LearnDelFAMDateTo] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearningDeliveryFAM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Input].[LearningDeliveryHE](
	[LearningDeliveryHE_Id] [int] NOT NULL,
	[LearningDelivery_Id] [int] NOT NULL,
	[NUMHUS] [varchar](1000) NULL,
	[SSN] [varchar](1000) NULL,
	[QUALENT3] [varchar](1000) NULL,
	[SOC2000] [bigint] NULL,
	[SEC] [bigint] NULL,
	[UCASAPPID] [varchar](1000) NULL,
	[TYPEYR] [bigint] NULL,
	[MODESTUD] [bigint] NULL,
	[FUNDLEV] [bigint] NULL,
	[FUNDCOMP] [bigint] NULL,
	[STULOAD] [float] NULL,
	[YEARSTU] [bigint] NULL,
	[MSTUFEE] [bigint] NULL,
	[PCOLAB] [float] NULL,
	[PCFLDCS] [float] NULL,
	[PCSLDCS] [float] NULL,
	[PCTLDCS] [float] NULL,
	[SPECFEE] [bigint] NULL,
	[NETFEE] [bigint] NULL,
	[GROSSFEE] [bigint] NULL,
	[DOMICILE] [varchar](1000) NULL,
	[ELQ] [bigint] NULL,
	[HEPostCode] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[LearningDeliveryHE_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Input].[LearningDeliveryWorkPlacement](
	[LearningDeliveryWorkPlacement_Id] [int] NOT NULL,
	[LearningDelivery_Id] [int] NOT NULL,
	[WorkPlaceStartDate] [date] NULL,
	[WorkPlaceEndDate] [date] NULL,
	[WorkPlaceMode] [bigint] NULL,
	[WorkPlaceEmpId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearningDeliveryWorkPlacement_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Input].[LearningProvider](
	[LearningProvider_Id] [int] NOT NULL,
	[UKPRN] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearningProvider_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Input].[LLDDandHealthProblem](
	[LLDDandHealthProblem_Id] [int] NOT NULL,
	[Learner_Id] [int] NOT NULL,
	[LLDDCat] [bigint] NULL,
	[PrimaryLLDD] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[LLDDandHealthProblem_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Input].[PostAdd](
	[PostAdd_Id] [int] NOT NULL,
	[LearnerContact_Id] [int] NOT NULL,
	[AddLine1] [varchar](1000) NULL,
	[AddLine2] [varchar](1000) NULL,
	[AddLine3] [varchar](1000) NULL,
	[AddLine4] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[PostAdd_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Input].[ProviderSpecDeliveryMonitoring](
	[ProviderSpecDeliveryMonitoring_Id] [int] NOT NULL,
	[LearningDelivery_Id] [int] NOT NULL,
	[ProvSpecDelMonOccur] [varchar](100) NULL,
	[ProvSpecDelMon] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProviderSpecDeliveryMonitoring_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Input].[ProviderSpecLearnerMonitoring](
	[ProviderSpecLearnerMonitoring_Id] [int] NOT NULL,
	[Learner_Id] [int] NOT NULL,
	[ProvSpecLearnMonOccur] [varchar](100) NULL,
	[ProvSpecLearnMon] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProviderSpecLearnerMonitoring_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Input].[Source](
	[Source_Id] [int] NOT NULL,
	[ProtectiveMarking] [varchar](100) NULL,
	[UKPRN] [int] NULL,
	[SoftwareSupplier] [varchar](40) NULL,
	[SoftwarePackage] [varchar](30) NULL,
	[Release] [varchar](20) NULL,
	[SerialNo] [varchar](2) NULL,
	[DateTime] [datetime] NULL,
	[ReferenceData] [varchar](100) NULL,
	[ComponentSetVersion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Source_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Input].[SourceFile](
	[SourceFile_Id] [int] NOT NULL,
	[SourceFileName] [varchar](50) NOT NULL,
	[FilePreparationDate] [date] NULL,
	[SoftwareSupplier] [varchar](40) NULL,
	[SoftwarePackage] [varchar](30) NULL,
	[Release] [varchar](20) NULL,
	[SerialNo] [varchar](2) NULL,
	[DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SourceFile_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Input].[TrailblazerApprenticeshipFinancialRecord](
	[TrailblazerApprenticeshipFinancialRecord_Id] [int] NOT NULL,
	[LearningDelivery_Id] [int] NOT NULL,
	[TBFinType] [varchar](100) NULL,
	[TBFinCode] [bigint] NULL,
	[TBFinDate] [date] NULL,
	[TBFinAmount] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[TrailblazerApprenticeshipFinancialRecord_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Valid].[CollectionDetails](
	[Collection] [varchar](3) NULL,
	[Year] [varchar](4) NULL,
	[FilePreparationDate] [date] NULL
) ON [PRIMARY]
GO

CREATE TABLE [Valid].[ContactPreference](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[ContPrefType] [varchar](3) NOT NULL,
	[ContPrefCode] [int] NULL
) ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [IX_Valid_ContactPreference] ON [Valid].[ContactPreference]
(
	[LearnRefNumber] ASC,
	[ContPrefType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE TABLE [Valid].[DPOutcome](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[OutType] [varchar](3) NOT NULL,
	[OutCode] [int] NULL,
	[OutStartDate] [date] NOT NULL,
	[OutEndDate] [date] NULL,
	[OutCollDate] [date] NULL
) ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [IX_Valid_DPOutcome] ON [Valid].[DPOutcome]
(
	[LearnRefNumber] ASC,
	[OutType] ASC,
	[OutCode] ASC,
	[OutStartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE TABLE [Valid].[Learner](
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Valid].[LearnerContact](
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Valid].[LearnerDestinationandProgression](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[ULN] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Valid].[LearnerEmploymentStatus](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[EmpStat] [int] NULL,
	[DateEmpStatApp] [date] NOT NULL,
	[EmpId] [int] NULL,
	[EmpStatMon_BSI] [int] NULL,
	[EmpStatMon_EII] [int] NULL,
	[EmpStatMon_LOE] [int] NULL,
	[EmpStatMon_LOU] [int] NULL,
	[EmpStatMon_PEI] [int] NULL,
	[EmpStatMon_RON] [int] NULL,
	[EmpStatMon_SEI] [int] NULL,
	[EmpStatMon_SEM] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC,
	[DateEmpStatApp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Valid].[LearnerHE](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[UCASPERID] [bigint] NULL,
	[TTACCOM] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Valid].[LearnerHEFinancialSupport](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[FINTYPE] [int] NOT NULL,
	[FINAMOUNT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC,
	[FINTYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Valid].[LearningDelivery](
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
	[LrnDelFAM_TBS] [varchar](5) NULL,
	[LrnDelFAM_WPL] [varchar](5) NULL,
	[LrnDelFAM_WPP] [varchar](5) NULL,
	[ProvSpecMon_A] [varchar](20) NULL,
	[ProvSpecMon_B] [varchar](20) NULL,
	[ProvSpecMon_C] [varchar](20) NULL,
	[ProvSpecMon_D] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC,
	[AimSeqNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Valid].[LearningDeliveryFAM](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[AimSeqNumber] [int] NOT NULL,
	[LearnDelFAMType] [varchar](3) NULL,
	[LearnDelFAMCode] [varchar](5) NULL,
	[LearnDelFAMDateFrom] [date] NULL,
	[LearnDelFAMDateTo] [date] NULL
) ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [IX_Valid_LearningDeliveryFAM] ON [Valid].[LearningDeliveryFAM]
(
	[LearnRefNumber] ASC,
	[AimSeqNumber] ASC,
	[LearnDelFAMType] ASC,
	[LearnDelFAMDateFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE TABLE [Valid].[LearningDeliveryHE](
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Valid].[LearningDeliveryWorkPlacement](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[AimSeqNumber] [int] NOT NULL,
	[WorkPlaceStartDate] [date] NOT NULL,
	[WorkPlaceEndDate] [date] NULL,
	[WorkPlaceMode] [int] NOT NULL,
	[WorkPlaceEmpId] [int] NULL
) ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [IX_Valid_LearningDeliveryWorkPlacement] ON [Valid].[LearningDeliveryWorkPlacement]
(
	[LearnRefNumber] ASC,
	[AimSeqNumber] ASC,
	[WorkPlaceStartDate] ASC,
	[WorkPlaceMode] ASC,
	[WorkPlaceEmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE TABLE [Valid].[LearningProvider](
	[UKPRN] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UKPRN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Valid].[LLDDandHealthProblem](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[LLDDCat] [int] NOT NULL,
	[PrimaryLLDD] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LearnRefNumber] ASC,
	[LLDDCat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Valid].[Source](
	[ProtectiveMarking] [varchar](100) NULL,
	[UKPRN] [int] NULL,
	[SoftwareSupplier] [varchar](40) NULL,
	[SoftwarePackage] [varchar](30) NULL,
	[Release] [varchar](20) NULL,
	[SerialNo] [varchar](2) NULL,
	[DateTime] [datetime] NULL,
	[ReferenceData] [varchar](100) NULL,
	[ComponentSetVersion] [varchar](20) NULL
) ON [PRIMARY]
GO

CREATE TABLE [Valid].[SourceFile](
	[SourceFileName] [varchar](50) NULL,
	[FilePreparationDate] [date] NULL,
	[SoftwareSupplier] [varchar](40) NULL,
	[SoftwarePackage] [varchar](30) NULL,
	[Release] [varchar](20) NULL,
	[SerialNo] [varchar](2) NULL,
	[DateTime] [datetime] NULL
) ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [IX_Valid_SourceFile] ON [Valid].[SourceFile]
(
	[SourceFileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE TABLE [Valid].[TrailblazerApprenticeshipFinancialRecord](
	[LearnRefNumber] [varchar](12) NOT NULL,
	[AimSeqNumber] [int] NOT NULL,
	[TBFinType] [varchar](3) NOT NULL,
	[TBFinCode] [int] NULL,
	[TBFinDate] [date] NULL,
	[TBFinAmount] [int] NULL
) ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [IX_Valid_TrailblazerApprenticeshipFinancialRecord] ON [Valid].[TrailblazerApprenticeshipFinancialRecord]
(
	[LearnRefNumber] ASC,
	[AimSeqNumber] ASC,
	[TBFinType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

create view [dbo].[ValidLearnerDestinationandProgressions] as
	select LearnerDestinationandProgression_Id from Input.LearnerDestinationandProgression
GO
create view [dbo].[ValidLearners] as
	select Learner_Id from Input.Learner
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_ContactPreference] ON [Input].[ContactPreference]
(
	[Learner_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_DPOutcome] ON [Input].[DPOutcome]
(
	[LearnerDestinationandProgression_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_EmploymentStatusMonitoring] ON [Input].[EmploymentStatusMonitoring]
(
	[LearnerEmploymentStatus_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_LearnerContact] ON [Input].[LearnerContact]
(
	[Learner_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_LearnerEmploymentStatus] ON [Input].[LearnerEmploymentStatus]
(
	[Learner_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_LearnerFAM] ON [Input].[LearnerFAM]
(
	[Learner_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_LearnerHE] ON [Input].[LearnerHE]
(
	[Learner_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_LearnerHEFinancialSupport] ON [Input].[LearnerHEFinancialSupport]
(
	[LearnerHE_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_LearningDelivery] ON [Input].[LearningDelivery]
(
	[Learner_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_LearningDeliveryFAM] ON [Input].[LearningDeliveryFAM]
(
	[LearningDelivery_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_LearningDeliveryHE] ON [Input].[LearningDeliveryHE]
(
	[LearningDelivery_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_LearningDeliveryWorkPlacement] ON [Input].[LearningDeliveryWorkPlacement]
(
	[LearningDelivery_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_LLDDandHealthProblem] ON [Input].[LLDDandHealthProblem]
(
	[Learner_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_PostAdd] ON [Input].[PostAdd]
(
	[LearnerContact_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_ProviderSpecDeliveryMonitoring] ON [Input].[ProviderSpecDeliveryMonitoring]
(
	[LearningDelivery_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_ProviderSpecLearnerMonitoring] ON [Input].[ProviderSpecLearnerMonitoring]
(
	[Learner_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Parent_Input_TrailblazerApprenticeshipFinancialRecord] ON [Input].[TrailblazerApprenticeshipFinancialRecord]
(
	[LearningDelivery_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

create procedure [dbo].[ClearStageTables] AS

	begin

		set nocount on

		declare truncursor cursor for 
			(
				select 
					'truncate table ' + s.name + '.' + t.name
				from
					sys.schemas s
					inner join sys.tables t
						on s.schema_id=t.schema_id
				where
					s.name in ('Input','Valid','Invalid')
			)
		open truncursor

		declare @sql varchar(1024)
		fetch next from truncursor into @sql

		while @@fetch_status=0 begin
			exec(@sql)
			fetch next from truncursor into @sql
		end

		close truncursor
		deallocate truncursor

	end
GO

create procedure [dbo].[ClearTargetTables] AS

	begin

		set nocount on

		declare truncursor cursor for 
			(
				select 
					'truncate table ' + s.name + '.' + t.name
				from
					sys.schemas s
					inner join sys.tables t
						on s.schema_id=t.schema_id
				where
					s.name in ('Rulebase')
			)
		open truncursor

		declare @sql varchar(1024)
		fetch next from truncursor into @sql

		while @@fetch_status=0 begin
			exec(@sql)
			fetch next from truncursor into @sql
		end

		close truncursor
		deallocate truncursor

	end
GO

create procedure [dbo].[TransformInputToValid] as
	begin
		exec dbo.TransformInputToValid_CollectionDetails
		exec dbo.TransformInputToValid_Source
		exec dbo.TransformInputToValid_LearnerDestinationandProgression
		exec dbo.TransformInputToValid_DPOutcome
		exec dbo.TransformInputToValid_SourceFile
		exec dbo.TransformInputToValid_LearningProvider
		exec dbo.TransformInputToValid_Learner
		exec dbo.TransformInputToValid_ContactPreference
		exec dbo.TransformInputToValid_LLDDandHealthProblem
		exec dbo.TransformInputToValid_LearnerEmploymentStatus
		exec dbo.TransformInputToValid_LearnerHE
		exec dbo.TransformInputToValid_LearnerHEFinancialSupport
		exec dbo.TransformInputToValid_LearningDelivery
		exec dbo.TransformInputToValid_LearningDeliveryFAM
		exec dbo.TransformInputToValid_LearningDeliveryWorkPlacement
		exec dbo.TransformInputToValid_TrailblazerApprenticeshipFinancialRecord
		exec dbo.TransformInputToValid_LearningDeliveryHE
		exec dbo.TransformInputToValid_LearnerContact
	end

GO

create procedure [dbo].[TransformInputToValid_CollectionDetails] as
	begin
		insert into 
			[Valid].[CollectionDetails]
				(
					[Collection],
					[Year],
					[FilePreparationDate]
				)
		select
			[CollectionDetails].[Collection],
			[CollectionDetails].[Year],
			[CollectionDetails].[FilePreparationDate]
		from
			[Input].[CollectionDetails]
	end

GO

create procedure [dbo].[TransformInputToValid_ContactPreference] as
	begin
		insert into 
			[Valid].[ContactPreference]
				(
					[LearnRefNumber],
					[ContPrefType],
					[ContPrefCode]
				)
		select
			[Learner].[LearnRefNumber],
			[ContactPreference].[ContPrefType],
			[ContactPreference].[ContPrefCode]
		from
			[Input].[ContactPreference]
			inner join [Input].[Learner]
				on [ContactPreference].[Learner_Id]=[Learner].[Learner_Id]
			inner join [dbo].[ValidLearners]
				on [ContactPreference].[Learner_Id]=[ValidLearners].[Learner_Id]
	end

GO

create procedure [dbo].[TransformInputToValid_DPOutcome] as
	begin
		insert into 
			[Valid].[DPOutcome]
				(
					[LearnRefNumber],
					[OutType],
					[OutCode],
					[OutStartDate],
					[OutEndDate],
					[OutCollDate]
				)
		select
			[LearnerDestinationandProgression].[LearnRefNumber],
			[DPOutcome].[OutType],
			[DPOutcome].[OutCode],
			[DPOutcome].[OutStartDate],
			[DPOutcome].[OutEndDate],
			[DPOutcome].[OutCollDate]
		from
			[Input].[DPOutcome]
			inner join [Input].[LearnerDestinationandProgression]
				on [LearnerDestinationandProgression].[LearnerDestinationandProgression_Id]=[DPOutcome].[LearnerDestinationandProgression_Id]
			inner join [dbo].[ValidLearnerDestinationandProgressions]
				on [DPOutcome].[LearnerDestinationandProgression_Id]=[ValidLearnerDestinationandProgressions].[LearnerDestinationandProgression_Id]
	end

GO

create procedure [dbo].[TransformInputToValid_Learner] as
	begin
		insert into 
			[Valid].[Learner]
				(
					[LearnRefNumber],
					[PrevLearnRefNumber],
					[PrevUKPRN],
					[ULN],
					[FamilyName],
					[GivenNames],
					[DateOfBirth],
					[Ethnicity],
					[Sex],
					[LLDDHealthProb],
					[NINumber],
					[PriorAttain],
					[Accom],
					[ALSCost],
					[PlanLearnHours],
					[PlanEEPHours],
					[MathGrade],
					[EngGrade],
					[HomePostcode],
					[CurrentPostcode],
					[LrnFAM_DLA],
					[LrnFAM_ECF],
					[LrnFAM_EDF1],
					[LrnFAM_EDF2],
					[LrnFAM_EHC],
					[LrnFAM_FME],
					[LrnFAM_HNS],
					[LrnFAM_LDA],
					[LrnFAM_LSR1],
					[LrnFAM_LSR2],
					[LrnFAM_LSR3],
					[LrnFAM_LSR4],
					[LrnFAM_MCF],
					[LrnFAM_NLM1],
					[LrnFAM_NLM2],
					[LrnFAM_PPE1],
					[LrnFAM_PPE2],
					[LrnFAM_SEN],
					[ProvSpecMon_A],
					[ProvSpecMon_B]
				)
		select
			[Learner].[LearnRefNumber],
			[Learner].[PrevLearnRefNumber],
			[Learner].[PrevUKPRN],
			[Learner].[ULN],
			[Learner].[FamilyName],
			[Learner].[GivenNames],
			[Learner].[DateOfBirth],
			[Learner].[Ethnicity],
			[Learner].[Sex],
			[Learner].[LLDDHealthProb],
			[Learner].[NINumber],
			[Learner].[PriorAttain],
			[Learner].[Accom],
			[Learner].[ALSCost],
			[Learner].[PlanLearnHours],
			[Learner].[PlanEEPHours],
			[Learner].[MathGrade],
			[Learner].[EngGrade],
			HP.Postcode,
			CP.Postcode,
			[LrnFAM_DLA].[LearnFAMCode],
			[LrnFAM_ECF].[LearnFAMCode],
			[EDF].[EDF1],
			[EDF].[EDF2],
			[LrnFAM_EHC].[LearnFAMCode],
			[LrnFAM_FME].[LearnFAMCode],
			[LrnFAM_HNS].[LearnFAMCode],
			[LrnFAM_LDA].[LearnFAMCode],
			[LSR].[LSR1],
			[LSR].[LSR2],
			[LSR].[LSR3],
			[LSR].[LSR4],
			[LrnFAM_MCF].[LearnFAMCode],
			[NLM].[NLM1],
			[NLM].[NLM2],
			[PPE].[PPE1],
			[PPE].[PPE2],
			[LrnFAM_SEN].[LearnFAMCode],
			[ProvSpecMon_A].[ProvSpecLearnMon],
			[ProvSpecMon_B].[ProvSpecLearnMon]
		from
			[Input].[Learner]
			left join [Input].LearnerContact HP
				on Learner.Learner_Id=HP.Learner_Id
				and HP.LocType=2
				and HP.ContType=1
			left join [Input].LearnerContact CP
				on Learner.Learner_Id=CP.Learner_Id
				and CP.LocType=2
				and CP.ContType=2
			left join [Input].[LearnerFAM] as [LrnFAM_DLA]
				on [LrnFAM_DLA].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_DLA].[LearnFAMType]='DLA'
			left join [Input].[LearnerFAM] as [LrnFAM_ECF]
				on [LrnFAM_ECF].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_ECF].[LearnFAMType]='ECF'
			left join
				(
					select
						[Learner_Id],
						max([EDF1]) as [EDF1],
						max([EDF2]) as [EDF2]
					from
						(
							select
								[Learner_Id],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 1 then LearnFAMCode else null end  as [EDF1],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 2 then LearnFAMCode else null end  as [EDF2]
							from
								[Input].[LearnerFAM]
							where
								[LearnFAMType]='EDF'
						) as [EDFs]
					group by
						[Learner_Id]
				) as [EDF]
				on [EDF].[Learner_Id]=[Learner].[Learner_Id]
			left join [Input].[LearnerFAM] as [LrnFAM_EHC]
				on [LrnFAM_EHC].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_EHC].[LearnFAMType]='EHC'
			left join [Input].[LearnerFAM] as [LrnFAM_FME]
				on [LrnFAM_FME].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_FME].[LearnFAMType]='FME'
			left join [Input].[LearnerFAM] as [LrnFAM_HNS]
				on [LrnFAM_HNS].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_HNS].[LearnFAMType]='HNS'
			left join [Input].[LearnerFAM] as [LrnFAM_LDA]
				on [LrnFAM_LDA].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_LDA].[LearnFAMType]='LDA'
			left join
				(
					select
						[Learner_Id],
						max([LSR1]) as [LSR1],
						max([LSR2]) as [LSR2],
						max([LSR3]) as [LSR3],
						max([LSR4]) as [LSR4]
					from
						(
							select
								[Learner_Id],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 1 then LearnFAMCode else null end  as [LSR1],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 2 then LearnFAMCode else null end  as [LSR2],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 3 then LearnFAMCode else null end  as [LSR3],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 4 then LearnFAMCode else null end  as [LSR4]
							from
								[Input].[LearnerFAM]
							where
								[LearnFAMType]='LSR'
						) as [LSRs]
					group by
						[Learner_Id]
				) as [LSR]
				on [LSR].[Learner_Id]=[Learner].[Learner_Id]
			left join [Input].[LearnerFAM] as [LrnFAM_MCF]
				on [LrnFAM_MCF].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_MCF].[LearnFAMType]='MCF'
			left join
				(
					select
						[Learner_Id],
						max([NLM1]) as [NLM1],
						max([NLM2]) as [NLM2]
					from
						(
							select
								[Learner_Id],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 1 then LearnFAMCode else null end  as [NLM1],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 2 then LearnFAMCode else null end  as [NLM2]
							from
								[Input].[LearnerFAM]
							where
								[LearnFAMType]='NLM'
						) as [NLMs]
					group by
						[Learner_Id]
				) as [NLM]
				on [NLM].[Learner_Id]=[Learner].[Learner_Id]
			left join
				(
					select
						[Learner_Id],
						max([PPE1]) as [PPE1],
						max([PPE2]) as [PPE2]
					from
						(
							select
								[Learner_Id],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 1 then LearnFAMCode else null end  as [PPE1],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 2 then LearnFAMCode else null end  as [PPE2]
							from
								[Input].[LearnerFAM]
							where
								[LearnFAMType]='PPE'
						) as [PPEs]
					group by
						[Learner_Id]
				) as [PPE]
				on [PPE].[Learner_Id]=[Learner].[Learner_Id]
			left join [Input].[LearnerFAM] as [LrnFAM_SEN]
				on [LrnFAM_SEN].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_SEN].[LearnFAMType]='SEN'
			left join [Input].[ProviderSpecLearnerMonitoring] as [ProvSpecMon_A]
				on [ProvSpecMon_A].[Learner_Id]=[Learner].[Learner_Id]
				and [ProvSpecMon_A].[ProvSpecLearnMonOccur]='A'
			left join [Input].[ProviderSpecLearnerMonitoring] as [ProvSpecMon_B]
				on [ProvSpecMon_B].[Learner_Id]=[Learner].[Learner_Id]
				and [ProvSpecMon_B].[ProvSpecLearnMonOccur]='B'
			inner join [dbo].[ValidLearners]
				on [Learner].[Learner_Id]=[ValidLearners].[Learner_Id]
	end

GO

create procedure [dbo].[TransformInputToValid_LearnerContact] as
	begin
		insert into 
			[Valid].[LearnerContact]
				(
					[LearnRefNumber],
					[HomePostcode],
					[CurrentPostcode],
					[TelNumber],
					[Email],
					[AddLine1],
					[AddLine2],
					[AddLine3],
					[AddLine4]
				)
		select
			[Learner].[LearnRefNumber],
			[ConjoinedLearnerContact].[HomePostcode],
			[ConjoinedLearnerContact].[CurrentPostcode],
			[ConjoinedLearnerContact].[TelNumber],
			[ConjoinedLearnerContact].[Email],
			[ConjoinedLearnerContact].[AddLine1],
			[ConjoinedLearnerContact].[AddLine2],
			[ConjoinedLearnerContact].[AddLine3],
			[ConjoinedLearnerContact].[AddLine4]
		from
			(
				select
					coalesce(CurrentContact.Learner_Id,PreviousContact.Learner_Id) Learner_Id,
					max(PostAdd.AddLine1) AddLine1,
					max(PostAdd.AddLine2) AddLine2,
					max(PostAdd.AddLine3) AddLine3,
					max(PostAdd.AddLine4) AddLine4,
					max(CurrentContact.Postcode) CurrentPostcode,
					max(PreviousContact.Postcode) HomePostcode,
					max(CurrentContact.Email) Email,
					max(CurrentContact.TelNumber) TelNumber
				from
					(select * from [Input].LearnerContact where ContType=2) CurrentContact
					full outer join [Input].LearnerContact PreviousContact
						on CurrentContact.Learner_Id=PreviousContact.Learner_Id
						and PreviousContact.ContType=1
					full outer join [Input].PostAdd 
						on CurrentContact.LearnerContact_Id=PostAdd.LearnerContact_Id
				group by
					coalesce(CurrentContact.Learner_Id,PreviousContact.Learner_Id)			
			) as [ConjoinedLearnerContact]
			inner join [Input].[Learner]
				on [ConjoinedLearnerContact].[Learner_Id]=[Learner].[Learner_Id]

	end

GO

create procedure [dbo].[TransformInputToValid_LearnerDestinationandProgression] as
	begin
		insert into 
			[Valid].[LearnerDestinationandProgression]
				(
					[LearnRefNumber],
					[ULN]
				)
		select
			[LearnerDestinationandProgression].[LearnRefNumber],
			[LearnerDestinationandProgression].[ULN]
		from
			[Input].[LearnerDestinationandProgression]
			inner join [dbo].[ValidLearnerDestinationandProgressions]
				on [LearnerDestinationandProgression].[LearnerDestinationandProgression_Id]=[ValidLearnerDestinationandProgressions].[LearnerDestinationandProgression_Id]
	end

GO

create procedure [dbo].[TransformInputToValid_LearnerEmploymentStatus] as
	begin
		insert into 
			[Valid].[LearnerEmploymentStatus]
				(
					[LearnRefNumber],
					[EmpStat],
					[DateEmpStatApp],
					[EmpId],
					[EmpStatMon_BSI],
					[EmpStatMon_EII],
					[EmpStatMon_LOE],
					[EmpStatMon_LOU],
					[EmpStatMon_PEI],
					[EmpStatMon_RON],
					[EmpStatMon_SEI],
					[EmpStatMon_SEM]
				)
		select
			[Learner].[LearnRefNumber],
			[LearnerEmploymentStatus].[EmpStat],
			[LearnerEmploymentStatus].[DateEmpStatApp],
			[LearnerEmploymentStatus].[EmpId],
			[EmpStatMon_BSI].[ESMCode],
			[EmpStatMon_EII].[ESMCode],
			[EmpStatMon_LOE].[ESMCode],
			[EmpStatMon_LOU].[ESMCode],
			[EmpStatMon_PEI].[ESMCode],
			[EmpStatMon_RON].[ESMCode],
			[EmpStatMon_SEI].[ESMCode],
			[EmpStatMon_SEM].[ESMCode]
		from
			[Input].[LearnerEmploymentStatus]
			inner join [Input].[Learner]
				on [LearnerEmploymentStatus].[Learner_Id]=[Learner].[Learner_Id]
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_BSI]
				on [EmpStatMon_BSI].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_BSI].[ESMType]='BSI'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_EII]
				on [EmpStatMon_EII].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_EII].[ESMType]='EII'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_LOE]
				on [EmpStatMon_LOE].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_LOE].[ESMType]='LOE'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_LOU]
				on [EmpStatMon_LOU].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_LOU].[ESMType]='LOU'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_PEI]
				on [EmpStatMon_PEI].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_PEI].[ESMType]='PEI'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_RON]
				on [EmpStatMon_RON].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_RON].[ESMType]='RON'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_SEI]
				on [EmpStatMon_SEI].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_SEI].[ESMType]='SEI'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_SEM]
				on [EmpStatMon_SEM].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_SEM].[ESMType]='SEM'
			inner join [dbo].[ValidLearners]
				on [LearnerEmploymentStatus].[Learner_Id]=[ValidLearners].[Learner_Id]
	end

GO

create procedure [dbo].[TransformInputToValid_LearnerHE] as
	begin
		insert into 
			[Valid].[LearnerHE]
				(
					[LearnRefNumber],
					[UCASPERID],
					[TTACCOM]
				)
		select
			[Learner].[LearnRefNumber],
			[LearnerHE].[UCASPERID],
			[LearnerHE].[TTACCOM]
		from
			[Input].[LearnerHE]
			inner join [Input].[Learner]
				on [LearnerHE].[Learner_Id]=[Learner].[Learner_Id]
			inner join [dbo].[ValidLearners]
				on [LearnerHE].[Learner_Id]=[ValidLearners].[Learner_Id]
	end

GO

CREATE procedure [dbo].[TransformInputToValid_LearnerHEFinancialSupport] as
	begin
		insert into 
			[Valid].[LearnerHEFinancialSupport]
				(
					[LearnRefNumber],
					[FINTYPE],
					[FINAMOUNT]
				)
		select
			[Learner].[LearnRefNumber],
			[LearnerHEFinancialSupport].[FINTYPE],
			[LearnerHEFinancialSupport].[FINAMOUNT]
		from
			[Input].[LearnerHEFinancialSupport]
			inner join [Input].[LearnerHE]
				on [LearnerHEFinancialSupport].[LearnerHE_Id]=[LearnerHE].[LearnerHE_Id]
			inner join [Input].[Learner]
				on [Learner].[Learner_Id]=[LearnerHE].[Learner_Id]
			inner join [dbo].[ValidLearners]
				on [LearnerHE].[Learner_Id]=[ValidLearners].[Learner_Id]
	end

GO

CREATE procedure [dbo].[TransformInputToValid_LearningDelivery] as
	begin
		insert into 
			[Valid].[LearningDelivery]
				(
					[LearnRefNumber],
					[LearnAimRef],
					[AimType],
					[AimSeqNumber],
					[LearnStartDate],
					[OrigLearnStartDate],
					[LearnPlanEndDate],
					[FundModel],
					[ProgType],
					[FworkCode],
					[PwayCode],
					[PartnerUKPRN],
					[DelLocPostCode],
					[AddHours],
					[PriorLearnFundAdj],
					[OtherFundAdj],
					[ConRefNumber],
					[EmpOutcome],
					[CompStatus],
					[LearnActEndDate],
					[WithdrawReason],
					[Outcome],
					[AchDate],
					[OutGrade],
					[SWSupAimId],
					[LrnDelFAM_ADL],
					[LrnDelFAM_ASL],
					[LrnDelFAM_EEF],
					[LrnDelFAM_FFI],
					[LrnDelFAM_FLN],
					[LrnDelFAM_HEM1],
					[LrnDelFAM_HEM2],
					[LrnDelFAM_HEM3],
					[LrnDelFAM_HHS1],
					[LrnDelFAM_HHS2],
					[LrnDelFAM_LDM1],
					[LrnDelFAM_LDM2],
					[LrnDelFAM_LDM3],
					[LrnDelFAM_LDM4],
					[LrnDelFAM_NSA],
					[LrnDelFAM_POD],
					[LrnDelFAM_RES],
					[LrnDelFAM_SOF],
					[LrnDelFAM_SPP],
					[LrnDelFAM_TBS],
					[LrnDelFAM_WPL],
					[LrnDelFAM_WPP],
					[ProvSpecMon_A],
					[ProvSpecMon_B],
					[ProvSpecMon_C],
					[ProvSpecMon_D]
				)
		select
			[Learner].[LearnRefNumber],
			[LearningDelivery].[LearnAimRef],
			[LearningDelivery].[AimType],
			[LearningDelivery].[AimSeqNumber],
			[LearningDelivery].[LearnStartDate],
			[LearningDelivery].[OrigLearnStartDate],
			[LearningDelivery].[LearnPlanEndDate],
			[LearningDelivery].[FundModel],
			[LearningDelivery].[ProgType],
			[LearningDelivery].[FworkCode],
			[LearningDelivery].[PwayCode],
			[LearningDelivery].[PartnerUKPRN],
			[LearningDelivery].[DelLocPostCode],
			[LearningDelivery].[AddHours],
			[LearningDelivery].[PriorLearnFundAdj],
			[LearningDelivery].[OtherFundAdj],
			[LearningDelivery].[ConRefNumber],
			[LearningDelivery].[EmpOutcome],
			[LearningDelivery].[CompStatus],
			[LearningDelivery].[LearnActEndDate],
			[LearningDelivery].[WithdrawReason],
			[LearningDelivery].[Outcome],
			[LearningDelivery].[AchDate],
			[LearningDelivery].[OutGrade],
			[LearningDelivery].[SWSupAimId],
			[LrnDelFAM_ADL].[LearnDelFAMCode],
			[LrnDelFAM_ASL].[LearnDelFAMCode],
			[LrnDelFAM_EEF].[LearnDelFAMCode],
			[LrnDelFAM_FFI].[LearnDelFAMCode],
			[LrnDelFAM_FLN].[LearnDelFAMCode],
			[HEM].[HEM1],
			[HEM].[HEM2],
			[HEM].[HEM3],
			[HHS].[HHS1],
			[HHS].[HHS2],
			[LDM].[LDM1],
			[LDM].[LDM2],
			[LDM].[LDM3],
			[LDM].[LDM4],
			[LrnDelFAM_NSA].[LearnDelFAMCode],
			[LrnDelFAM_POD].[LearnDelFAMCode],
			[LrnDelFAM_RES].[LearnDelFAMCode],
			[LrnDelFAM_SOF].[LearnDelFAMCode],
			[LrnDelFAM_SPP].[LearnDelFAMCode],
			[LrnDelFAM_TBS].[LearnDelFAMCode],
			[LrnDelFAM_WPL].[LearnDelFAMCode],
			[LrnDelFAM_WPP].[LearnDelFAMCode],
			[ProvSpecMon_A].[ProvSpecDelMon],
			[ProvSpecMon_B].[ProvSpecDelMon],
			[ProvSpecMon_C].[ProvSpecDelMon],
			[ProvSpecMon_D].[ProvSpecDelMon]
		from
			[Input].[LearningDelivery]
			inner join [Input].[Learner]
				on [LearningDelivery].[Learner_Id]=[Learner].[Learner_Id]
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_ADL]
				on [LrnDelFAM_ADL].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_ADL].[LearnDelFAMType]='ADL'
			left join
				(
					select
						[LearningDelivery_Id]
					from
						(
							select
								[LearningDelivery_Id]
							from
								[Input].[LearningDeliveryFAM]
							where
								[LearnDelFAMType]='ALB'
						) as [ALBs]
					group by
						[LearningDelivery_Id]
				) as [ALB]
				on [ALB].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_ASL]
				on [LrnDelFAM_ASL].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_ASL].[LearnDelFAMType]='ASL'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_EEF]
				on [LrnDelFAM_EEF].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_EEF].[LearnDelFAMType]='EEF'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_FFI]
				on [LrnDelFAM_FFI].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_FFI].[LearnDelFAMType]='FFI'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_FLN]
				on [LrnDelFAM_FLN].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_FLN].[LearnDelFAMType]='FLN'
			left join
				(
					select
						[LearningDelivery_Id],
						max([HEM1]) as [HEM1],
						max([HEM2]) as [HEM2],
						max([HEM3]) as [HEM3]
					from
						(
							select
								[LearningDelivery_Id],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 1 then LearnDelFAMCode else null end  as [HEM1],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 2 then LearnDelFAMCode else null end  as [HEM2],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 3 then LearnDelFAMCode else null end  as [HEM3]
							from
								[Input].[LearningDeliveryFAM]
							where
								[LearnDelFAMType]='HEM'
						) as [HEMs]
					group by
						[LearningDelivery_Id]
				) as [HEM]
				on [HEM].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			left join
				(
					select
						[LearningDelivery_Id],
						max([HHS1]) as [HHS1],
						max([HHS2]) as [HHS2]
					from
						(
							select
								[LearningDelivery_Id],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 1 then LearnDelFAMCode else null end  as [HHS1],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 2 then LearnDelFAMCode else null end  as [HHS2]
							from
								[Input].[LearningDeliveryFAM]
							where
								[LearnDelFAMType]='HHS'
						) as [HHSs]
					group by
						[LearningDelivery_Id]
				) as [HHS]
				on [HHS].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			left join
				(
					select
						[LearningDelivery_Id],
						max([LDM1]) as [LDM1],
						max([LDM2]) as [LDM2],
						max([LDM3]) as [LDM3],
						max([LDM4]) as [LDM4]
					from
						(
							select
								[LearningDelivery_Id],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 1 then LearnDelFAMCode else null end  as [LDM1],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 2 then LearnDelFAMCode else null end  as [LDM2],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 3 then LearnDelFAMCode else null end  as [LDM3],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 4 then LearnDelFAMCode else null end  as [LDM4]
							from
								[Input].[LearningDeliveryFAM]
							where
								[LearnDelFAMType]='LDM'
						) as [LDMs]
					group by
						[LearningDelivery_Id]
				) as [LDM]
				on [LDM].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			left join
				(
					select
						[LearningDelivery_Id]
					from
						(
							select
								[LearningDelivery_Id]
							from
								[Input].[LearningDeliveryFAM]
							where
								[LearnDelFAMType]='LSF'
						) as [LSFs]
					group by
						[LearningDelivery_Id]
				) as [LSF]
				on [LSF].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_NSA]
				on [LrnDelFAM_NSA].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_NSA].[LearnDelFAMType]='NSA'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_POD]
				on [LrnDelFAM_POD].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_POD].[LearnDelFAMType]='POD'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_RES]
				on [LrnDelFAM_RES].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_RES].[LearnDelFAMType]='RES'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_SOF]
				on [LrnDelFAM_SOF].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_SOF].[LearnDelFAMType]='SOF'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_SPP]
				on [LrnDelFAM_SPP].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_SPP].[LearnDelFAMType]='SPP'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_TBS]
				on [LrnDelFAM_TBS].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_TBS].[LearnDelFAMType]='TBS'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_WPL]
				on [LrnDelFAM_WPL].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_WPL].[LearnDelFAMType]='WPL'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_WPP]
				on [LrnDelFAM_WPP].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_WPP].[LearnDelFAMType]='WPP'
			left join [Input].[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_A]
				on [ProvSpecMon_A].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [ProvSpecMon_A].[ProvSpecDelMonOccur]='A'
			left join [Input].[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_B]
				on [ProvSpecMon_B].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [ProvSpecMon_B].[ProvSpecDelMonOccur]='B'
			left join [Input].[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_C]
				on [ProvSpecMon_C].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [ProvSpecMon_C].[ProvSpecDelMonOccur]='C'
			left join [Input].[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_D]
				on [ProvSpecMon_D].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [ProvSpecMon_D].[ProvSpecDelMonOccur]='D'
			inner join [dbo].[ValidLearners]
				on [Learner].[Learner_Id]=[ValidLearners].[Learner_Id]
	end
GO

create procedure [dbo].[TransformInputToValid_LearningDeliveryFAM] as
	begin
		insert into 
			[Valid].[LearningDeliveryFAM]
				(
					[LearnRefNumber],
					[AimSeqNumber],
					[LearnDelFAMType],
					[LearnDelFAMCode],
					[LearnDelFAMDateFrom],
					[LearnDelFAMDateTo]
				)
		select
			[Learner].[LearnRefNumber],
			[LearningDelivery].[AimSeqNumber],
			[LearningDeliveryFAM].[LearnDelFAMType],
			[LearningDeliveryFAM].[LearnDelFAMCode],
			[LearningDeliveryFAM].[LearnDelFAMDateFrom],
			[LearningDeliveryFAM].[LearnDelFAMDateTo]
		from
			[Input].[LearningDeliveryFAM]
			inner join [Input].[LearningDelivery]
				on [LearningDeliveryFAM].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			inner join [Input].[Learner]
				on [LearningDelivery].[Learner_Id]=[Learner].[Learner_Id]
			inner join [dbo].[ValidLearners]
				on [Learner].[Learner_Id]=[ValidLearners].[Learner_Id]
		where 
			[LearningDeliveryFAM].[LearnDelFAMType] in ('LSF','ALB')
	end
GO

create procedure [dbo].[TransformInputToValid_LearningDeliveryHE] as
	begin
		insert into 
			[Valid].[LearningDeliveryHE]
				(
					[LearnRefNumber],
					[AimSeqNumber],
					[NUMHUS],
					[SSN],
					[QUALENT3],
					[SOC2000],
					[SEC],
					[UCASAPPID],
					[TYPEYR],
					[MODESTUD],
					[FUNDLEV],
					[FUNDCOMP],
					[STULOAD],
					[YEARSTU],
					[MSTUFEE],
					[PCOLAB],
					[PCFLDCS],
					[PCSLDCS],
					[PCTLDCS],
					[SPECFEE],
					[NETFEE],
					[GROSSFEE],
					[DOMICILE],
					[ELQ],
					[HEPostCode]
				)
		select
			[Learner].[LearnRefNumber],
			[LearningDelivery].[AimSeqNumber],
			[LearningDeliveryHE].[NUMHUS],
			[LearningDeliveryHE].[SSN],
			[LearningDeliveryHE].[QUALENT3],
			[LearningDeliveryHE].[SOC2000],
			[LearningDeliveryHE].[SEC],
			[LearningDeliveryHE].[UCASAPPID],
			[LearningDeliveryHE].[TYPEYR],
			[LearningDeliveryHE].[MODESTUD],
			[LearningDeliveryHE].[FUNDLEV],
			[LearningDeliveryHE].[FUNDCOMP],
			[LearningDeliveryHE].[STULOAD],
			[LearningDeliveryHE].[YEARSTU],
			[LearningDeliveryHE].[MSTUFEE],
			[LearningDeliveryHE].[PCOLAB],
			[LearningDeliveryHE].[PCFLDCS],
			[LearningDeliveryHE].[PCSLDCS],
			[LearningDeliveryHE].[PCTLDCS],
			[LearningDeliveryHE].[SPECFEE],
			[LearningDeliveryHE].[NETFEE],
			[LearningDeliveryHE].[GROSSFEE],
			[LearningDeliveryHE].[DOMICILE],
			[LearningDeliveryHE].[ELQ],
			[LearningDeliveryHE].[HEPostCode]
		from
			[Input].[LearningDeliveryHE]
			inner join [Input].[LearningDelivery]
				on [LearningDeliveryHE].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			inner join [Input].[Learner]
				on [LearningDelivery].[Learner_Id]=[Learner].[Learner_Id]
			inner join [dbo].[ValidLearners]
				on [Learner].[Learner_Id]=[ValidLearners].[Learner_Id]
	end
GO

create procedure [dbo].[TransformInputToValid_LearningDeliveryWorkPlacement] as
	begin
		insert into 
			[Valid].[LearningDeliveryWorkPlacement]
				(
					[LearnRefNumber],
					[AimSeqNumber],
					[WorkPlaceStartDate],
					[WorkPlaceEndDate],
					[WorkPlaceMode],
					[WorkPlaceEmpId]
				)
		select
			[Learner].[LearnRefNumber],
			[LearningDelivery].[AimSeqNumber],
			[LearningDeliveryWorkPlacement].[WorkPlaceStartDate],
			[LearningDeliveryWorkPlacement].[WorkPlaceEndDate],
			[LearningDeliveryWorkPlacement].[WorkPlaceMode],
			[LearningDeliveryWorkPlacement].[WorkPlaceEmpId]
		from
			[Input].[LearningDeliveryWorkPlacement]
			inner join [Input].[LearningDelivery]
				on [LearningDeliveryWorkPlacement].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			inner join [Input].[Learner]
				on [LearningDelivery].[Learner_Id]=[Learner].[Learner_Id]
			inner join [dbo].[ValidLearners]
				on [Learner].[Learner_Id]=[ValidLearners].[Learner_Id]
	end
GO

create procedure [dbo].[TransformInputToValid_LearningProvider] as
	begin
		insert into 
			[Valid].[LearningProvider]
				(
					[UKPRN]
				)
		select
			[LearningProvider].[UKPRN]
		from
			[Input].[LearningProvider]
	end
GO

create procedure [dbo].[TransformInputToValid_LLDDandHealthProblem] as
	begin
		insert into 
			[Valid].[LLDDandHealthProblem]
				(
					[LearnRefNumber],
					[LLDDCat],
					[PrimaryLLDD]
				)
		select
			[Learner].[LearnRefNumber],
			[LLDDandHealthProblem].[LLDDCat],
			[LLDDandHealthProblem].[PrimaryLLDD]
		from
			[Input].[LLDDandHealthProblem]
			inner join [Input].[Learner]
				on [LLDDandHealthProblem].[Learner_Id]=[Learner].[Learner_Id]
			inner join [dbo].[ValidLearners]
				on [LLDDandHealthProblem].[Learner_Id]=[ValidLearners].[Learner_Id]
	end
GO

create procedure [dbo].[TransformInputToValid_Source] as
	begin
		insert into 
			[Valid].[Source]
				(
					[ProtectiveMarking],
					[UKPRN],
					[SoftwareSupplier],
					[SoftwarePackage],
					[Release],
					[SerialNo],
					[DateTime],
					[ReferenceData],
					[ComponentSetVersion]
				)
		select
			[Source].[ProtectiveMarking],
			[Source].[UKPRN],
			[Source].[SoftwareSupplier],
			[Source].[SoftwarePackage],
			[Source].[Release],
			[Source].[SerialNo],
			[Source].[DateTime],
			[Source].[ReferenceData],
			[Source].[ComponentSetVersion]
		from
			[Input].[Source]
	end
GO

create procedure [dbo].[TransformInputToValid_SourceFile] as
	begin
		insert into 
			[Valid].[SourceFile]
				(
					[SourceFileName],
					[FilePreparationDate],
					[SoftwareSupplier],
					[SoftwarePackage],
					[Release],
					[SerialNo],
					[DateTime]
				)
		select
			[SourceFile].[SourceFileName],
			[SourceFile].[FilePreparationDate],
			[SourceFile].[SoftwareSupplier],
			[SourceFile].[SoftwarePackage],
			[SourceFile].[Release],
			[SourceFile].[SerialNo],
			[SourceFile].[DateTime]
		from
			[Input].[SourceFile]
	end
GO

CREATE procedure [dbo].[TransformInputToValid_TrailblazerApprenticeshipFinancialRecord] as
	begin
		insert into 
			[Valid].[TrailblazerApprenticeshipFinancialRecord]
				(
					[LearnRefNumber],
					[AimSeqNumber],
					[TBFinType],
					[TBFinCode],
					[TBFinDate],
					[TBFinAmount]
				)
		select
			[Learner].[LearnRefNumber],
			[LearningDelivery].[AimSeqNumber],
			[TrailblazerApprenticeshipFinancialRecord].[TBFinType],
			[TrailblazerApprenticeshipFinancialRecord].[TBFinCode],
			[TrailblazerApprenticeshipFinancialRecord].[TBFinDate],
			[TrailblazerApprenticeshipFinancialRecord].[TBFinAmount]
		from
			[Input].[TrailblazerApprenticeshipFinancialRecord]
			inner join [Input].[LearningDelivery]
				on [LearningDelivery].[LearningDelivery_Id]=[TrailblazerApprenticeshipFinancialRecord].[LearningDelivery_Id]
			inner join [Input].[Learner]
				on [Learner].[Learner_Id]=[LearningDelivery].[Learner_Id]
			inner join [dbo].[ValidLearners]
				on [Learner].[Learner_Id]=[ValidLearners].[Learner_Id]
	end

go

create procedure TransformValidToInput_Learner as

	begin
		truncate table Input.LearningProvider
		insert into 
			Input.LearningProvider
				(
					[LearningProvider_Id],
					[UKPRN]
				)
		select 
			1,
			UKPRN
		from
			Valid.LearningProvider

		truncate table Input.Learner
		insert into 
			Input.Learner
				(
					[Learner_Id],
					[LearnRefNumber],
					[DateOfBirth],
					[PriorAttain]
				)
		select 
			row_number() over(order by LearnRefNumber),
			[LearnRefNumber],
			[DateOfBirth],
			[PriorAttain]
		from 
			Valid.Learner

		truncate table Input.LearningDelivery
		insert into 
			Input.LearningDelivery
				(
					[LearningDelivery_Id],
					[Learner_Id],
					[AimSeqNumber],
					[AimType],
					[CompStatus],
					[ConRefNumber],
					[DelLocPostCode],
					[EmpOutcome],
					[FundModel],
					[FworkCode],
					[LearnAimRef],
					[LearnActEndDate],
					[LearnPlanEndDate],			
					[LearnStartDate],
					[OrigLearnStartDate],
					[Outcome],
					[OutGrade],
					[ProgType],
					[PwayCode]
				)
		select
					row_number() over(order by [LearningDelivery].[LearnRefNumber], [LearningDelivery].[AimSeqNumber]),
					[Learner].[Learner_Id],
					[LearningDelivery].[AimSeqNumber],
					[LearningDelivery].[AimType],
					[LearningDelivery].[CompStatus],
					[LearningDelivery].[ConRefNumber],
					[LearningDelivery].[DelLocPostCode],
					[LearningDelivery].[EmpOutcome],
					[LearningDelivery].[FundModel],
					[LearningDelivery].[FworkCode],
					[LearningDelivery].[LearnAimRef],
					[LearningDelivery].[LearnActEndDate],
					[LearningDelivery].[LearnPlanEndDate],
					[LearningDelivery].[LearnStartDate],
					[LearningDelivery].[OrigLearnStartDate],
					[LearningDelivery].[Outcome],
					[LearningDelivery].[OutGrade],
					[LearningDelivery].[ProgType],
					[LearningDelivery].[PwayCode]
		from
			Valid.LearningDelivery
			left join Input.Learner
				on LearningDelivery.LearnRefNumber=Learner.LearnRefNumber

		truncate table Input.LearnerEmploymentStatus
		insert into 
			Input.LearnerEmploymentStatus
				(
					[LearnerEmploymentStatus_Id],
					[Learner_Id],
					[DateEmpStatApp],
					[EmpId],
					[EmpStat]
				)
		select
					row_number() over(order by [LearnerEmploymentStatus].[LearnRefNumber], [LearnerEmploymentStatus].[DateEmpStatApp]),
					[Learner].[Learner_Id],
					[LearnerEmploymentStatus].[DateEmpStatApp],
					[LearnerEmploymentStatus].[EmpId],
					[LearnerEmploymentStatus].[EmpStat]
		from
			Valid.LearnerEmploymentStatus
			left join Input.Learner
				on LearnerEmploymentStatus.LearnRefNumber=Learner.LearnRefNumber

		truncate table Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMDateFrom],
					[LearnDelFAMDateTo],
					[LearnDelFAMType]
				)
		select
					row_number() over(order by [LearningDeliveryFAM].[LearnRefNumber], [LearningDeliveryFAM].[AimSeqNumber],[LearningDeliveryFAM].[LearnDelFAMType],[LearningDeliveryFAM].[LearnDelFAMDateFrom]),
					[LearningDelivery].[LearningDelivery_Id],
					[LearningDeliveryFAM].[LearnDelFAMCode],
					[LearningDeliveryFAM].[LearnDelFAMDateFrom],
					[LearningDeliveryFAM].[LearnDelFAMDateTo],
					[LearningDeliveryFAM].[LearnDelFAMType]
		from
			Valid.LearningDeliveryFAM
			left join Input.Learner
				on LearningDeliveryFAM.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and LearningDeliveryFAM.AimSeqNumber=LearningDelivery.AimSeqNumber

		declare @id int
		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_ADL,
					'ADL'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_ADL is not null
		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_ASL,
					'ASL'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_ASL is not null

		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_EEF,
					'EEF'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_EEF is not null
		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_FFI,
					'FFI'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_FFI is not null
		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_FLN,
					'FLN'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_FLN is not null

		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_HEM1,
					'HEM'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_HEM1 is not null

		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_HEM2,
					'HEM'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_HEM2 is not null

		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_HEM3,
					'HEM'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_HEM3 is not null

		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_HHS1,
					'HHS'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_HHS1 is not null

		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_HHS2,
					'HHS'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_HHS2 is not null

		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_LDM1,
					'LDM'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_LDM1 is not null

		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_LDM2,
					'LDM'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_LDM2 is not null

		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_LDM3,
					'LDM'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_LDM3 is not null

		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_LDM4,
					'LDM'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_LDM4 is not null


		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_NSA,
					'NSA'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_NSA is not null
		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_POD,
					'POD'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_POD is not null
		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_RES,
					'RES'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_RES is not null
		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_SOF,
					'SOF'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_SOF is not null
		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_SPP,
					'SPP'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_SPP is not null
		select @id=max(LearningDeliveryFAM_Id) from Input.LearningDeliveryFAM
		insert into 
			Input.LearningDeliveryFAM
				(
					[LearningDeliveryFAM_Id],
					[LearningDelivery_Id],
					[LearnDelFAMCode],
					[LearnDelFAMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearningDelivery].[LearnRefNumber], [ValidLearningDelivery].[AimSeqNumber]),
					[LearningDelivery].[LearningDelivery_Id],
					ValidLearningDelivery.LrnDelFAM_WPP,
					'WPP'
		from
			Valid.LearningDelivery ValidLearningDelivery
			left join Input.Learner
				on ValidLearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearningDelivery
				on Learner.Learner_Id=LearningDelivery.Learner_Id
				and ValidLearningDelivery.AimSeqNumber=LearningDelivery.AimSeqNumber
		where
			ValidLearningDelivery.LrnDelFAM_WPP is not null


		truncate table Input.EmploymentStatusMonitoring
		select @id=0
		insert into 
			Input.EmploymentStatusMonitoring
				(
					[EmploymentStatusMonitoring_Id],
					[LearnerEmploymentStatus_Id],
					[ESMCode],
					[ESMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearnerEmploymentStatus].[LearnRefNumber], [ValidLearnerEmploymentStatus].[DateEmpStatApp]),
					[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id],
					ValidLearnerEmploymentStatus.EmpStatMon_BSI,
					'BSI'
		from
			Valid.LearnerEmploymentStatus ValidLearnerEmploymentStatus
			left join Input.Learner
				on ValidLearnerEmploymentStatus.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearnerEmploymentStatus
				on Learner.Learner_Id=LearnerEmploymentStatus.Learner_Id
				and ValidLearnerEmploymentStatus.DateEmpStatApp=LearnerEmploymentStatus.DateEmpStatApp
		where
			ValidLearnerEmploymentStatus.EmpStatMon_BSI is not null
	
		select @id=max(EmploymentStatusMonitoring_Id) from Input.EmploymentStatusMonitoring
		insert into 
			Input.EmploymentStatusMonitoring
				(
					[EmploymentStatusMonitoring_Id],
					[LearnerEmploymentStatus_Id],
					[ESMCode],
					[ESMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearnerEmploymentStatus].[LearnRefNumber], [ValidLearnerEmploymentStatus].[DateEmpStatApp]),
					[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id],
					ValidLearnerEmploymentStatus.EmpStatMon_EII,
					'EII'
		from
			Valid.LearnerEmploymentStatus ValidLearnerEmploymentStatus
			left join Input.Learner
				on ValidLearnerEmploymentStatus.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearnerEmploymentStatus
				on Learner.Learner_Id=LearnerEmploymentStatus.Learner_Id
				and ValidLearnerEmploymentStatus.DateEmpStatApp=LearnerEmploymentStatus.DateEmpStatApp
		where
			ValidLearnerEmploymentStatus.EmpStatMon_EII is not null
	
		select @id=max(EmploymentStatusMonitoring_Id) from Input.EmploymentStatusMonitoring
		insert into 
			Input.EmploymentStatusMonitoring
				(
					[EmploymentStatusMonitoring_Id],
					[LearnerEmploymentStatus_Id],
					[ESMCode],
					[ESMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearnerEmploymentStatus].[LearnRefNumber], [ValidLearnerEmploymentStatus].[DateEmpStatApp]),
					[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id],
					ValidLearnerEmploymentStatus.EmpStatMon_LOE,
					'LOE'
		from
			Valid.LearnerEmploymentStatus ValidLearnerEmploymentStatus
			left join Input.Learner
				on ValidLearnerEmploymentStatus.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearnerEmploymentStatus
				on Learner.Learner_Id=LearnerEmploymentStatus.Learner_Id
				and ValidLearnerEmploymentStatus.DateEmpStatApp=LearnerEmploymentStatus.DateEmpStatApp
		where
			ValidLearnerEmploymentStatus.EmpStatMon_LOE is not null
	
		select @id=max(EmploymentStatusMonitoring_Id) from Input.EmploymentStatusMonitoring
		insert into 
			Input.EmploymentStatusMonitoring
				(
					[EmploymentStatusMonitoring_Id],
					[LearnerEmploymentStatus_Id],
					[ESMCode],
					[ESMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearnerEmploymentStatus].[LearnRefNumber], [ValidLearnerEmploymentStatus].[DateEmpStatApp]),
					[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id],
					ValidLearnerEmploymentStatus.EmpStatMon_LOU,
					'LOU'
		from
			Valid.LearnerEmploymentStatus ValidLearnerEmploymentStatus
			left join Input.Learner
				on ValidLearnerEmploymentStatus.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearnerEmploymentStatus
				on Learner.Learner_Id=LearnerEmploymentStatus.Learner_Id
				and ValidLearnerEmploymentStatus.DateEmpStatApp=LearnerEmploymentStatus.DateEmpStatApp
		where
			ValidLearnerEmploymentStatus.EmpStatMon_LOU is not null
	
		select @id=max(EmploymentStatusMonitoring_Id) from Input.EmploymentStatusMonitoring
		insert into 
			Input.EmploymentStatusMonitoring
				(
					[EmploymentStatusMonitoring_Id],
					[LearnerEmploymentStatus_Id],
					[ESMCode],
					[ESMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearnerEmploymentStatus].[LearnRefNumber], [ValidLearnerEmploymentStatus].[DateEmpStatApp]),
					[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id],
					ValidLearnerEmploymentStatus.EmpStatMon_PEI,
					'PEI'
		from
			Valid.LearnerEmploymentStatus ValidLearnerEmploymentStatus
			left join Input.Learner
				on ValidLearnerEmploymentStatus.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearnerEmploymentStatus
				on Learner.Learner_Id=LearnerEmploymentStatus.Learner_Id
				and ValidLearnerEmploymentStatus.DateEmpStatApp=LearnerEmploymentStatus.DateEmpStatApp
		where
			ValidLearnerEmploymentStatus.EmpStatMon_PEI is not null
	
		select @id=max(EmploymentStatusMonitoring_Id) from Input.EmploymentStatusMonitoring
		insert into 
			Input.EmploymentStatusMonitoring
				(
					[EmploymentStatusMonitoring_Id],
					[LearnerEmploymentStatus_Id],
					[ESMCode],
					[ESMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearnerEmploymentStatus].[LearnRefNumber], [ValidLearnerEmploymentStatus].[DateEmpStatApp]),
					[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id],
					ValidLearnerEmploymentStatus.EmpStatMon_SEI,
					'SEI'
		from
			Valid.LearnerEmploymentStatus ValidLearnerEmploymentStatus
			left join Input.Learner
				on ValidLearnerEmploymentStatus.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearnerEmploymentStatus
				on Learner.Learner_Id=LearnerEmploymentStatus.Learner_Id
				and ValidLearnerEmploymentStatus.DateEmpStatApp=LearnerEmploymentStatus.DateEmpStatApp
		where
			ValidLearnerEmploymentStatus.EmpStatMon_SEI is not null
	
		select @id=max(EmploymentStatusMonitoring_Id) from Input.EmploymentStatusMonitoring
		insert into 
			Input.EmploymentStatusMonitoring
				(
					[EmploymentStatusMonitoring_Id],
					[LearnerEmploymentStatus_Id],
					[ESMCode],
					[ESMType]
				)
		select
					coalesce(@id,0) + row_number() over(order by [ValidLearnerEmploymentStatus].[LearnRefNumber], [ValidLearnerEmploymentStatus].[DateEmpStatApp]),
					[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id],
					ValidLearnerEmploymentStatus.EmpStatMon_SEM,
					'SEM'
		from
			Valid.LearnerEmploymentStatus ValidLearnerEmploymentStatus
			left join Input.Learner
				on ValidLearnerEmploymentStatus.LearnRefNumber=Learner.LearnRefNumber
			left join Input.LearnerEmploymentStatus
				on Learner.Learner_Id=LearnerEmploymentStatus.Learner_Id
				and ValidLearnerEmploymentStatus.DateEmpStatApp=LearnerEmploymentStatus.DateEmpStatApp
		where
			ValidLearnerEmploymentStatus.EmpStatMon_SEM is not null
	
	end