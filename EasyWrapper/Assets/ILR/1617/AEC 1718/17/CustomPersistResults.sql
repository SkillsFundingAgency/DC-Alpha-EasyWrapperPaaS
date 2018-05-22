declare @ukprn int
declare @year varchar(4)='1718'
declare @return varchar(4)='R01'

select
	@ukprn=[UKPRN]
from
	[Valid].[LearningProvider]
--go
-- =====================================================================================================
-- AEC_global
-- =====================================================================================================
if not exists (select * from [$(FromILRDatabase)].INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'AEC_global' and TABLE_SCHEMA = 'dbo')
begin
	create table [$(FromILRDatabase)].[dbo].[AEC_global]
	(
		[UKPRN] int,
		[Year] varchar(4),
		[LARSVersion] varchar(100),
		[RulebaseVersion] varchar(10)
	)
end

insert into
	[$(FromILRDatabase)].[dbo].[AEC_global]
	(
		UKPRN,
		[Year],
		[LARSVersion],
		[RulebaseVersion]
	)
select
	@ukprn,
	@year,
	[LARSVersion],
	[RulebaseVersion]
from
	[Intrajob].[Rulebase].[AEC_global]
--go
-- =====================================================================================================
-- AEC_LearningDelivery
-- =====================================================================================================
if object_id('$(FromILRDatabase).dbo.AEC_LearningDelivery','u') is null begin
	create table [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery]
		(
			[UKPRN] int,
			[Year] varchar(4),
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
		[DisUpFactAdj] decimal(10,4),
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
		[LearnDelApplicTot1618Incentive] decimal(10,5),
		[LearnDelAppPrevAccDaysIL] int,
		[LearnDelDaysIL] int,
		[LearnDelDisadAmount] decimal(10,5),
		[LearnDelEligDisadvPayment] bit,
		[LearnDelEmpIdFirstAdditionalPaymentThreshold] int,
		[LearnDelEmpIdSecondAdditionalPaymentThreshold] int,
		[LearnDelHistDaysThisApp] int,
		[LearnDelHistProgEarnings] decimal(10,5),
		[LearnDelInitialFundLineType] varchar(60),
		[LearnDelSEMContWaiver] bit,
		[MathEngAimValue] decimal(10,5),
		[OutstandNumOnProgInstalm] int,
		[PlannedNumOnProgInstalm] int,
		[PlannedTotalDaysIL] int,
		[SecondIncentiveThresholdDate] date,
		[ThresholdDays] int,
		primary key clustered
		(
			[LearnRefNumber] asc,
			[AimSeqNumber] asc,
			[Year] asc
		)
		)
end

insert into
	[$(FromILRDatabase)].[dbo].[AEC_LearningDelivery]
	(
		[ukprn],
		[Year],
		[LearnRefNumber],
		[AimSeqNumber],
		[ActualDaysIL],
		[ActualNumInstalm],
		[AdjStartDate] ,
		[AgeAtProgStart] ,
		[AppAdjLearnStartDate],
		[ApplicCompDate],
		[CombinedAdjProp],
		[Completed],
		[DisUpFactAdj],
		[FirstIncentiveThresholdDate],
		[FundStart],
		[LDApplic1618FrameworkUpliftBalancingValue],
		[LDApplic1618FrameworkUpliftCompElement],
		[LDApplic1618FRameworkUpliftCompletionValue],
		[LDApplic1618FrameworkUpliftMonthInstalVal],
		[LDApplic1618FrameworkUpliftPrevEarnings],
		[LDApplic1618FrameworkUpliftRemainingAmount],
		[LDApplic1618FrameworkUpliftTotalActEarnings],
		[LearnAimRef],
		[LearnDel1618AtStart],
		[LearnDelAppAccDaysIL],
		[LearnDelApplicDisadvAmount],
		[LearnDelApplicEmp1618Incentive],
		[LearnDelApplicEmpDate],
		[LearnDelApplicProv1618FrameworkUplift],
		[LearnDelApplicProv1618Incentive],
		[LearnDelApplicTot1618Incentive],
		[LearnDelAppPrevAccDaysIL],
		[LearnDelDaysIL],
		[LearnDelDisadAmount],
		[LearnDelEligDisadvPayment],
		[LearnDelHistDaysThisApp],
		[LearnDelHistProgEarnings],
		[LearnDelInitialFundLineType],
		[LearnDelSEMContWaiver],
		[MathEngAimValue],
		[OutstandNumOnProgInstalm],
		[PlannedNumOnProgInstalm],
		[PlannedTotalDaysIL],
		[SecondIncentiveThresholdDate],
		[ThresholdDays]
	)
select
	@ukprn,
	@year,
	[LearnRefNumber],
		[AimSeqNumber],
		[ActualDaysIL],
		[ActualNumInstalm],
		[AdjStartDate] ,
		[AgeAtProgStart] ,
		[AppAdjLearnStartDate],
		[ApplicCompDate],
		[CombinedAdjProp],
		[Completed],
		[DisUpFactAdj],
		[FirstIncentiveThresholdDate],
		[FundStart],
		[LDApplic1618FrameworkUpliftBalancingValue],
		[LDApplic1618FrameworkUpliftCompElement],
		[LDApplic1618FRameworkUpliftCompletionValue],
		[LDApplic1618FrameworkUpliftMonthInstalVal],
		[LDApplic1618FrameworkUpliftPrevEarnings],
		[LDApplic1618FrameworkUpliftRemainingAmount],
		[LDApplic1618FrameworkUpliftTotalActEarnings],
		[LearnAimRef],
		[LearnDel1618AtStart],
		[LearnDelAppAccDaysIL],
		[LearnDelApplicDisadvAmount],
		[LearnDelApplicEmp1618Incentive],
		[LearnDelApplicEmpDate],
		[LearnDelApplicProv1618FrameworkUplift],
		[LearnDelApplicProv1618Incentive],
		[LearnDelApplicTot1618Incentive],
		[LearnDelAppPrevAccDaysIL],
		[LearnDelDaysIL],
		[LearnDelDisadAmount],
		[LearnDelEligDisadvPayment],
		[LearnDelHistDaysThisApp],
		[LearnDelHistProgEarnings],
		[LearnDelInitialFundLineType],
		[LearnDelSEMContWaiver],
		[MathEngAimValue],
		[OutstandNumOnProgInstalm],
		[PlannedNumOnProgInstalm],
		[PlannedTotalDaysIL],
		[SecondIncentiveThresholdDate],
		[ThresholdDays]
from
	[Intrajob].[Rulebase].[AEC_LearningDelivery]
--go
-- =====================================================================================================
-- AEC_LearningDelivery_Period
-- =====================================================================================================
if object_id('$(FromILRDatabase).dbo.AEC_LearningDelivery_Period','u') is null begin
	create table [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_Period]
		(
			[UKPRN] int,
			[Year] varchar(4),
			[LearnRefNumber] varchar(12),
		[AimSeqNumber] int,
		[Period] int,
		[DisadvFirstPayment] decimal(10,5),
		[DisadvSecondPayment] decimal(10,5),
		[FundLineType] varchar(60),
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
		primary key clustered
		(
			[LearnRefNumber] asc,
			[AimSeqNumber] asc,
			[Period] asc,
			[Year] asc
		)
		)

end

insert into
	[$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_Period]
	(
		[UKPRN],
		[Year],
		[LearnRefNumber],
		[AimSeqNumber],
		[Period],
		[DisadvFirstPayment],
		[DisadvSecondPayment],
		[FundLineType],
		[InstPerPeriod],
		[LDApplic1618FrameworkUpliftBalancingPayment],
		[LDApplic1618FrameworkUpliftCompletionPayment],
		[LDApplic1618FrameworkUpliftOnProgPayment],
		[LearnDelContType],
		[LearnDelFirstEmp1618Pay],
		[LearnDelFirstProv1618Pay],
		[LearnDelLevyNonPayInd],
		[LearnDelSecondEmp1618Pay],
		[LearnDelSecondProv1618Pay],
		[LearnDelSFAContribPct],
		[LearnSuppFund],
		[LearnSuppFundCash],
		[MathEngBalPayment],
		[MathEngBalPct],
		[MathEngOnProgPayment],
		[MathEngOnProgPct],
		[ProgrammeAimBalPayment],
		[ProgrammeAimCompletionPayment],
		[ProgrammeAimOnProgPayment]
	)
select
	@ukprn,
	@year,
	[LearnRefNumber],
	[AimSeqNumber],
	[Period],
	[DisadvFirstPayment],
	[DisadvSecondPayment],
	[FundLineType],
	[InstPerPeriod],
	[LDApplic1618FrameworkUpliftBalancingPayment],
	[LDApplic1618FrameworkUpliftCompletionPayment],
	[LDApplic1618FrameworkUpliftOnProgPayment],
	[LearnDelContType],
	[LearnDelFirstEmp1618Pay],
	[LearnDelFirstProv1618Pay],
	[LearnDelLevyNonPayInd],
	[LearnDelSecondEmp1618Pay],
	[LearnDelSecondProv1618Pay],
	[LearnDelSFAContribPct],
	[LearnSuppFund],
	[LearnSuppFundCash],
	[MathEngBalPayment],
	[MathEngBalPct],
	[MathEngOnProgPayment],
	[MathEngOnProgPct],
	[ProgrammeAimBalPayment],
	[ProgrammeAimCompletionPayment],
	[ProgrammeAimOnProgPayment]
from
	[Rulebase].[AEC_LearningDelivery_Period]
--go
-- =====================================================================================================
-- AEC_LearningDelivery_PeriodisedValues
-- =====================================================================================================
if object_id('$(FromILRDatabase).dbo.AEC_LearningDelivery_PeriodisedValues','u') is null begin
	create table [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_PeriodisedValues]
		(
			[UKPRN] int,
			[Year] varchar(4),
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
			[LearnRefNumber] asc,
			[AimSeqNumber] asc,
			[AttributeName] asc,
			[Year] asc
		)
		)

end

insert into
	[$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_PeriodisedValues]
	(
		[UKPRN],
		[Year],
		[LearnRefNumber],
		[AimSeqNumber],
		[AttributeName],
		[Period_1],
		[Period_2],
		[Period_3],
		[Period_4],
		[Period_5],
		[Period_6],
		[Period_7],
		[Period_8],
		[Period_9],
		[Period_10],
		[Period_11],
		[Period_12]
	)
select
	@ukprn,
	@year,
	[LearnRefNumber],
	[AimSeqNumber],
	[AttributeName],
	[Period_1],
	[Period_2],
	[Period_3],
	[Period_4],
	[Period_5],
	[Period_6],
	[Period_7],
	[Period_8],
	[Period_9],
	[Period_10],
	[Period_11],
	[Period_12]
from
	[Rulebase].[AEC_LearningDelivery_PeriodisedValues]
--go
-- =====================================================================================================
-- AEC_LearningDelivery_PeriodisedTextValues
-- =====================================================================================================
if object_id('$(FromILRDatabase).dbo.AEC_LearningDelivery_PeriodisedTextValues','u') is null begin
	create table [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_PeriodisedTextValues]
		(
			[UKPRN] int,
			[Year] varchar(4),
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
			[LearnRefNumber] asc,
			[AimSeqNumber] asc,
			[AttributeName] asc,
			[Year] asc
		)
		)

end

insert into
	[$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_PeriodisedTextValues]
	(
		[UKPRN],
		[Year],
		[LearnRefNumber],
		[AimSeqNumber],
		[AttributeName],
		[Period_1],
		[Period_2],
		[Period_3],
		[Period_4],
		[Period_5],
		[Period_6],
		[Period_7],
		[Period_8],
		[Period_9],
		[Period_10],
		[Period_11],
		[Period_12]
	)
select
	@ukprn,
	@year,
	[LearnRefNumber],
	[AimSeqNumber],
	[AttributeName],
	[Period_1],
	[Period_2],
	[Period_3],
	[Period_4],
	[Period_5],
	[Period_6],
	[Period_7],
	[Period_8],
	[Period_9],
	[Period_10],
	[Period_11],
	[Period_12]
from
	[Rulebase].[AEC_LearningDelivery_PeriodisedTextValues]
--go
-- =====================================================================================================
-- AEC_ApprenticeshipPriceEpisode
-- =====================================================================================================
if object_id('$(FromILRDatabase).dbo.AEC_ApprenticeshipPriceEpisode','u') is null begin
	create table [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode]
		(
			[UKPRN] int,
			[Year] varchar(4),
			[LearnRefNumber] varchar(12),
		[PriceEpisodeIdentifier] varchar(25),
		[EpisodeEffectiveTNPStartDate] date,
		[EpisodeStartDate] date,
		[PriceEpisodeActualEndDate] date,
		[PriceEpisodeActualInstalments] int,
		[PriceEpisodeAimSeqNumber] int,
		[PriceEpisodeCappedRemainingTNPAmount] decimal(10,5),
		[PriceEpisodeCompleted] bit,
		[PriceEpisodeCompletionElement] decimal(10,5),
		[PriceEpisodeContractType] varchar(50),
		[PriceEpisodeExpectedTotalMonthlyValue] decimal(10,5),
		[PriceEpisodeFirstAdditionalPaymentThresholdDate] date,
		[PriceEpisodeFundLineType] varchar(60),
		[PriceEpisodeInstalmentValue] decimal(10,5),
		[PriceEpisodePlannedEndDate] date,
		[PriceEpisodePlannedInstalments] int,
		[PriceEpisodePreviousEarnings] decimal(10,5),
		[PriceEpisodePreviousEarningsSameProvider] decimal(10,5),
		[PriceEpisodeRemainingAmountWithinUpperLimit] decimal(10,5),
		[PriceEpisodeRemainingTNPAmount] decimal(10,5),
		[PriceEpisodeSecondAdditionalPaymentThresholdDate] date,
		[PriceEpisodeTotalEarnings] decimal(10,5),
		[PriceEpisodeTotalTNPPrice] decimal(10,5),
		[PriceEpisodeUpperBandLimit] decimal(10,5),
		[PriceEpisodeUpperLimitAdjustment] decimal(10,5),
		[TNP1] decimal(10,5),
		[TNP2] decimal(10,5),
		[TNP3] decimal(10,5),
		[TNP4] decimal(10,5)
		primary key clustered
		(
			[LearnRefNumber] asc,
			[PriceEpisodeIdentifier] asc,
			[Year] asc
		)
		)
end

insert into
	[$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode]
	(
		[UKPRN],
		[Year],
		[LearnRefNumber],
		[PriceEpisodeIdentifier],
		[EpisodeEffectiveTNPStartDate],
		[EpisodeStartDate],
		[PriceEpisodeActualEndDate],
		[PriceEpisodeActualInstalments],
		[PriceEpisodeAimSeqNumber],
		[PriceEpisodeCappedRemainingTNPAmount],
		[PriceEpisodeCompleted],
		[PriceEpisodeCompletionElement],
		[PriceEpisodeContractType],
		[PriceEpisodeExpectedTotalMonthlyValue],
		[PriceEpisodeFirstAdditionalPaymentThresholdDate],
		[PriceEpisodeFundLineType],
		[PriceEpisodeInstalmentValue],
		[PriceEpisodePlannedEndDate],
		[PriceEpisodePlannedInstalments],
		[PriceEpisodePreviousEarnings],
		[PriceEpisodeRemainingAmountWithinUpperLimit],
		[PriceEpisodeRemainingTNPAmount],
		[PriceEpisodeSecondAdditionalPaymentThresholdDate],
		[PriceEpisodeTotalEarnings],
		[PriceEpisodeTotalTNPPrice],
		[PriceEpisodeUpperBandLimit],
		[PriceEpisodeUpperLimitAdjustment],
		[TNP1],
		[TNP2],
		[TNP3],
		[TNP4]
	)
select
	@ukprn,
	@year,
	[LearnRefNumber],
	[PriceEpisodeIdentifier],
	[EpisodeEffectiveTNPStartDate],
	[EpisodeStartDate],
	[PriceEpisodeActualEndDate],
	[PriceEpisodeActualInstalments],
	[PriceEpisodeAimSeqNumber],
	[PriceEpisodeCappedRemainingTNPAmount],
	[PriceEpisodeCompleted],
	[PriceEpisodeCompletionElement],
	[PriceEpisodeContractType],
	[PriceEpisodeExpectedTotalMonthlyValue],
	[PriceEpisodeFirstAdditionalPaymentThresholdDate],
	[PriceEpisodeFundLineType],
	[PriceEpisodeInstalmentValue],
	[PriceEpisodePlannedEndDate],
	[PriceEpisodePlannedInstalments],
	[PriceEpisodePreviousEarnings],
	[PriceEpisodeRemainingAmountWithinUpperLimit],
	[PriceEpisodeRemainingTNPAmount],
	[PriceEpisodeSecondAdditionalPaymentThresholdDate],
	[PriceEpisodeTotalEarnings],
	[PriceEpisodeTotalTNPPrice],
	[PriceEpisodeUpperBandLimit],
	[PriceEpisodeUpperLimitAdjustment],
	[TNP1],
	[TNP2],
	[TNP3],
	[TNP4]
from
	[Intrajob].[Rulebase].[AEC_ApprenticeshipPriceEpisode]
--go
-- =====================================================================================================
-- AEC_ApprenticeshipPriceEpisode_Period
-- =====================================================================================================
if object_id('$(FromILRDatabase).dbo.AEC_ApprenticeshipPriceEpisode_Period','u') is null begin
	create table [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_Period]
		(
			[UKPRN] int,
			[Year] varchar(4),
			[LearnRefNumber] varchar(12),
		[PriceEpisodeIdentifier] varchar(25),
		[Period] int,
		[PriceEpisodeApplic1618FrameworkUpliftBalancing] decimal(10,5),
		[PriceEpisodeApplic1618FrameworkUpliftCompletionPayment] decimal(10,5),
		[PriceEpisodeApplic1618FrameworkUpliftOnProgPayment] decimal(10,5),
		[PriceEpisodeBalancePayment] decimal(10,5),
		[PriceEpisodeBalanceValue] decimal(10,5),
		[PriceEpisodeCompletionPayment] decimal(10,5),
		[PriceEpisodeFirstDisadvantagePayment] decimal(10,5),
		[PriceEpisodeFirstEmp1618Pay] decimal(10,5),
		[PriceEpisodeFirstProv1618Pay] decimal(10,5),
		[PriceEpisodeInstalmentsThisPeriod] int,
		[PriceEpisodeLevyNonPayInd] int,
		[PriceEpisodeLSFCash] decimal(10,5),
		[PriceEpisodeOnProgPayment] decimal(10,5),
		[PriceEpisodeSecondDisadvantagePayment] decimal(10,5),
		[PriceEpisodeSecondEmp1618Pay] decimal(10,5),
		[PriceEpisodeSecondProv1618Pay] decimal(10,5),
		[PriceEpisodeSFAContribPct] decimal(10,5),
		primary key clustered
		(
			[LearnRefNumber] asc,
			[PriceEpisodeIdentifier] asc,
			[Period] asc,
			[Year] asc
		)
		)

end

insert into
	[$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_Period]
	(
		[UKPRN],
		[Year],
		[LearnRefNumber],
		[PriceEpisodeIdentifier],
		[Period],
		[PriceEpisodeApplic1618FrameworkUpliftBalancing],
		[PriceEpisodeApplic1618FrameworkUpliftCompletionPayment],
		[PriceEpisodeApplic1618FrameworkUpliftOnProgPayment],
		[PriceEpisodeBalancePayment],
		[PriceEpisodeBalanceValue],
		[PriceEpisodeCompletionPayment],
		[PriceEpisodeFirstDisadvantagePayment],
		[PriceEpisodeFirstEmp1618Pay],
		[PriceEpisodeFirstProv1618Pay],
		[PriceEpisodeInstalmentsThisPeriod],
		[PriceEpisodeLevyNonPayInd],
		[PriceEpisodeLSFCash],
		[PriceEpisodeOnProgPayment],
		[PriceEpisodeSecondDisadvantagePayment],
		[PriceEpisodeSecondEmp1618Pay],
		[PriceEpisodeSecondProv1618Pay],
		[PriceEpisodeSFAContribPct]
	)
select
	@ukprn,
	@year,
	[LearnRefNumber],
	[PriceEpisodeIdentifier],
	[Period],
	[PriceEpisodeApplic1618FrameworkUpliftBalancing],
	[PriceEpisodeApplic1618FrameworkUpliftCompletionPayment],
	[PriceEpisodeApplic1618FrameworkUpliftOnProgPayment],
	[PriceEpisodeBalancePayment],
	[PriceEpisodeBalanceValue],
	[PriceEpisodeCompletionPayment],
	[PriceEpisodeFirstDisadvantagePayment],
	[PriceEpisodeFirstEmp1618Pay],
	[PriceEpisodeFirstProv1618Pay],
	[PriceEpisodeInstalmentsThisPeriod],
	[PriceEpisodeLevyNonPayInd],
	[PriceEpisodeLSFCash],
	[PriceEpisodeOnProgPayment],
	[PriceEpisodeSecondDisadvantagePayment],
	[PriceEpisodeSecondEmp1618Pay],
	[PriceEpisodeSecondProv1618Pay],
	[PriceEpisodeSFAContribPct]
from
	[Rulebase].[AEC_ApprenticeshipPriceEpisode_Period]
--go
-- =====================================================================================================
-- AEC_ApprenticeshipPriceEpisode_PeriodisedValues
-- =====================================================================================================
if object_id('$(FromILRDatabase).dbo.AEC_ApprenticeshipPriceEpisode_PeriodisedValues','u') is null begin
	create table [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_PeriodisedValues]
		(
			[UKPRN] int,
			[Year] varchar(4),
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
			[LearnRefNumber] asc,
			[PriceEpisodeIdentifier] asc,
			[AttributeName] asc,
			[Year]
		)
		)

end

insert into
	[$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_PeriodisedValues]
	(
		[UKPRN],
		[Year],
		[LearnRefNumber],
		[PriceEpisodeIdentifier],
		[AttributeName],
		[Period_1],
		[Period_2],
		[Period_3],
		[Period_4],
		[Period_5],
		[Period_6],
		[Period_7],
		[Period_8],
		[Period_9],
		[Period_10],
		[Period_11],
		[Period_12]
	)
select
	@ukprn,
	@year,
	[LearnRefNumber],
		[PriceEpisodeIdentifier],
		[AttributeName],
		[Period_1],
		[Period_2],
		[Period_3],
		[Period_4],
		[Period_5],
		[Period_6],
		[Period_7],
		[Period_8],
		[Period_9],
		[Period_10],
		[Period_11],
		[Period_12]
from
	[Rulebase].[AEC_ApprenticeshipPriceEpisode_PeriodisedValues]

--go

-- =====================================================================================================
-- AEC_ApprenticeshipPriceEpisode_PeriodisedTextValues
-- =====================================================================================================
--if object_id('$(FromILRDatabase).dbo.AEC_ApprenticeshipPriceEpisode_PeriodisedTextValues','u') is not null begin
--	begin try
--		delete from 
--			[$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_PeriodisedTextValues]
--		where
--			[UKPRN]=@ukprn
--			and [Year]=@year
--	end try
--	begin catch
--		alter table [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_PeriodisedTextValues]
--		add [UKPRN] int, [Year] varchar(4)
--	end catch
--end else begin

--	create table [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_PeriodisedTextValues]
--		(
--			[UKPRN] int,
--			[Year] varchar(4),
--			[LearnRefNumber] varchar(12),
--			[PriceEpisodeIdentifier] varchar(25),
--			[AttributeName] [varchar](100) not null,
--			[Period_1] [varchar](255),
--			[Period_2] [varchar](255),
--			[Period_3] [varchar](255),
--			[Period_4] [varchar](255),
--			[Period_5] [varchar](255),
--			[Period_6] [varchar](255),
--			[Period_7] [varchar](255),
--			[Period_8] [varchar](255),
--			[Period_9] [varchar](255),
--			[Period_10] [varchar](255),
--			[Period_11] [varchar](255),
--			[Period_12] [varchar](255),
--			primary key clustered
--			(
--				[UKPRN],
--				[Year],
--				[LearnRefNumber],
--				[PriceEpisodeIdentifier],
--				[AttributeName]
--			)
--		)

--end

--insert into
--	[$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_PeriodisedTextValues]
--	(
--		[UKPRN],
--		[Year],
--		[LearnRefNumber],
--		[PriceEpisodeIdentifier],
--		[AttributeName],
--		[Period_1],
--		[Period_2],
--		[Period_3],
--		[Period_4],
--		[Period_5],
--		[Period_6],
--		[Period_7],
--		[Period_8],
--		[Period_9],
--		[Period_10],
--		[Period_11],
--		[Period_12]
--	)
--select
--	@ukprn,
--	@year,
--	[LearnRefNumber],
--	[PriceEpisodeIdentifier],
--	[AttributeName],
--	[Period_1],
--	[Period_2],
--	[Period_3],
--	[Period_4],
--	[Period_5],
--	[Period_6],
--	[Period_7],
--	[Period_8],
--	[Period_9],
--	[Period_10],
--	[Period_11],
--	[Period_12]
--from
--	[Rulebase].[AEC_ApprenticeshipPriceEpisode_PeriodisedTextValues]


-- =====================================================================================================
-- AEC_HistoricEarningOutput
-- =====================================================================================================
exec [$(AECHistory)].[dbo].[PrepareForNewData] @year, @return, @ukprn

insert into
	[$(AECHistory)].[dbo].[AEC_EarningHistory]
	(
		LearnRefNumber,
		AppIdentifier,
		AppProgCompletedInTheYearInput,
		CollectionYear, 
		CollectionReturnCode, 
		DaysInYear, 
		HistoricEffectiveTNPStartDateInput, 
		FworkCode,
		 HistoricLearner1618StartInput,
		ProgrammeStartDateIgnorePathway, 
		ProgrammeStartDateMatchPathway, 
		ProgType, 
		PwayCode, 
		STDCode,
		HistoricTNP1Input, 
		HistoricTNP2Input, 
		HistoricTNP3Input, 
		HistoricTNP4Input,
		 HistoricTotal1618UpliftPaymentsInTheYearInput,
		 TotalProgAimPaymentsInTheYear,
		 ULN,
		 UKPRN,
		 UptoEndDate,
		HistoricVirtualTNP3EndOfTheYearInput, 
		HistoricVirtualTNP4EndOfTheYearInput,
		LatestInYear
	)
select
		LearnRefNumber, 
		AppIdentifierOutput, 
		AppProgCompletedInTheYearOutput, 
		@year,
		@return,
		HistoricDaysInYearOutput, 
		HistoricEffectiveTNPStartDateOutput, 
		HistoricFworkCodeOutput, 
		HistoricLearner1618AtStartOutput, 
		HistoricProgrammeStartDateIgnorePathwayOutput, 
		HistoricProgrammeStartDateMatchPathwayOutput, 
		HistoricProgTypeOutput,
		 HistoricPwayCodeOutput, 
		 HistoricSTDCodeOutput, 
		 HistoricTNP1Output, 
		 HistoricTNP2Output, 
		 HistoricTNP3Output, 
		 HistoricTNP4Output, 
		 HistoricTotal1618UpliftPaymentsInTheYear,
		  HistoricTotalProgAimPaymentsInTheYear, 
		  HistoricULNOutput, 
		  @ukprn,
		  HistoricUptoEndDateOutput, 
		  HistoricVirtualTNP3EndofThisYearOutput, 
		  HistoricVirtualTNP4EndofThisYearOutput,
		  1
from
	[Rulebase].[AEC_HistoricEarningOutput]
--go