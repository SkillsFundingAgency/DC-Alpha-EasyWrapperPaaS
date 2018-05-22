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
	@pUKPRN,
	@pYEAR,
	[LARSVersion],
	[RulebaseVersion]
from
	[Intrajob].[Rulebase].[AEC_global]
go

if object_id('[$(FromILRDatabase)].[dbo].[AEC_LearningDelivery]','u') is null
begin

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
		,primary key clustered
		(
			[LearnRefNumber] asc,
			[AimSeqNumber] asc,
			UKPRN,
			[Year]
		)
	)
end

insert into
	[$(FromILRDatabase)].[dbo].[AEC_LearningDelivery]
	(
		UKPRN,
		[Year],
		[LearnRefNumber],
		[AimSeqNumber] ,
		[ActualDaysIL],
		[ActualNumInstalm],
		[AdjStartDate], 
		[AgeAtProgStart],
		[AppAdjLearnStartDate],
		[AppAdjLearnStartDateMatchPathway],
		[ApplicCompDate],
		[CombinedAdjProp],
		[Completed],
		[FirstIncentiveThresholdDate],
		[FundStart],
		[LDApplic1618FrameworkUpliftBalancingValue],
		[LDApplic1618FrameworkUpliftCompElement], 
		[LDApplic1618FRameworkUpliftCompletionValue],
		[LDApplic1618FrameworkUpliftMonthInstalVal],
		[LDApplic1618FrameworkUpliftPrevEarnings],
		[LDApplic1618FrameworkUpliftPrevEarningsStage1],
		[LDApplic1618FrameworkUpliftRemainingAmount],
		[LDApplic1618FrameworkUpliftTotalActEarnings],
		[LearnAimRef] ,
		[LearnDel1618AtStart],
		[LearnDelAppAccDaysIL],
		[LearnDelApplicDisadvAmount],
		[LearnDelApplicEmp1618Incentive],
		[LearnDelApplicEmpDate],
		[LearnDelApplicProv1618FrameworkUplift],
		[LearnDelApplicProv1618Incentive],
		[LearnDelAppPrevAccDaysIL],
		[LearnDelDaysIL],
		[LearnDelDisadAmount],
		[LearnDelEligDisadvPayment] ,
		[LearnDelEmpIdFirstAdditionalPaymentThreshold],
		[LearnDelEmpIdSecondAdditionalPaymentThreshold],
		[LearnDelHistDaysThisApp] ,
		[LearnDelHistProgEarnings] ,
		[LearnDelInitialFundLineType],
		[LearnDelMathEng],
		[MathEngAimValue],
		[OutstandNumOnProgInstalm],
		[PlannedNumOnProgInstalm],
		[PlannedTotalDaysIL],
		[SecondIncentiveThresholdDate],
		[ThresholdDays]
	)
select distinct
	@pUKPRN,
	@pYEAR,
	[LearnRefNumber],
	[AimSeqNumber] ,
	[ActualDaysIL],
	[ActualNumInstalm],
	[AdjStartDate], 
	[AgeAtProgStart],
	[AppAdjLearnStartDate],
	[AppAdjLearnStartDateMatchPathway],
	[ApplicCompDate],
	[CombinedAdjProp],
	[Completed],
	[FirstIncentiveThresholdDate],
	[FundStart],
	[LDApplic1618FrameworkUpliftBalancingValue],
	[LDApplic1618FrameworkUpliftCompElement], 
	[LDApplic1618FRameworkUpliftCompletionValue],
	[LDApplic1618FrameworkUpliftMonthInstalVal],
	[LDApplic1618FrameworkUpliftPrevEarnings],
	[LDApplic1618FrameworkUpliftPrevEarningsStage1],
	[LDApplic1618FrameworkUpliftRemainingAmount],
	[LDApplic1618FrameworkUpliftTotalActEarnings],
	[LearnAimRef] ,
	[LearnDel1618AtStart],
	[LearnDelAppAccDaysIL],
	[LearnDelApplicDisadvAmount],
	[LearnDelApplicEmp1618Incentive],
	[LearnDelApplicEmpDate],
	[LearnDelApplicProv1618FrameworkUplift],
	[LearnDelApplicProv1618Incentive],
	[LearnDelAppPrevAccDaysIL],
	[LearnDelDaysIL],
	[LearnDelDisadAmount],
	[LearnDelEligDisadvPayment] ,
	[LearnDelEmpIdFirstAdditionalPaymentThreshold],
	[LearnDelEmpIdSecondAdditionalPaymentThreshold],
	[LearnDelHistDaysThisApp] ,
	[LearnDelHistProgEarnings] ,
	[LearnDelInitialFundLineType],
	[LearnDelMathEng],
	[MathEngAimValue],
	[OutstandNumOnProgInstalm],
	[PlannedNumOnProgInstalm],
	[PlannedTotalDaysIL],
	[SecondIncentiveThresholdDate],
	[ThresholdDays]
from
	[Intrajob].[Rulebase].[AEC_LearningDelivery]
go

if object_id('[$(FromILRDatabase)].[dbo].AEC_LearningDelivery_Period','u') is null begin
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
			[ProgrammeAimOnProgPayment] decimal(10,5)
			,primary key clustered
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
select distinct
	@pUKPRN,
	@pYEAR,
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
go

if object_id('[$(FromILRDatabase)].[dbo].AEC_LearningDelivery_PeriodisedValues','u') is null begin
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
			[Period_12] [decimal](15,5)
			,primary key clustered
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
	@pUKPRN,
	@pYEAR,
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
go

if object_id('[$(FromILRDatabase)].[dbo].AEC_LearningDelivery_PeriodisedTextValues','u') is null begin
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
			[Period_12] [varchar](255)
			,primary key clustered
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
	@pUKPRN,
	@pYEAR,
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
go

if object_id('[$(FromILRDatabase)].[dbo].AEC_ApprenticeshipPriceEpisode','u') is null begin
	create table [$(FromILRDatabase)].[dbo].AEC_ApprenticeshipPriceEpisode
	(
		UKPRN int,
		[Year] varchar(4),
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
			,UKPRN
			,[Year]
		)
	)
end

insert into
	[$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode]
	(
		[UKPRN]
		,[Year]
		,LearnRefNumber 
		,PriceEpisodeIdentifier 
		,TNP4 
		,TNP1 
		,EpisodeStartDate
		,TNP2 
		,TNP3 
		,PriceEpisodeUpperBandLimit
		,PriceEpisodePlannedEndDate
		,PriceEpisodeActualEndDate
		,PriceEpisodeTotalTNPPrice 
		,PriceEpisodeUpperLimitAdjustment 
		,PriceEpisodePlannedInstalments 
		,PriceEpisodeActualInstalments 
		,PriceEpisodeInstalmentsThisPeriod
		,PriceEpisodeCompletionElement 
		,PriceEpisodePreviousEarnings 
		,PriceEpisodeInstalmentValue 
		,PriceEpisodeOnProgPayment 
		,PriceEpisodeTotalEarnings 
		,PriceEpisodeBalanceValue 
		,PriceEpisodeBalancePayment
		,PriceEpisodeCompleted 
		,PriceEpisodeCompletionPayment 
		,PriceEpisodeRemainingTNPAmount
		,PriceEpisodeRemainingAmountWithinUpperLimit
		,PriceEpisodeCappedRemainingTNPAmount
		,PriceEpisodeExpectedTotalMonthlyValue
		,PriceEpisodeAimSeqNumber 
		,PriceEpisodeFirstDisadvantagePayment
		,PriceEpisodeSecondDisadvantagePayment 
		,PriceEpisodeApplic1618FrameworkUpliftBalancing
		,PriceEpisodeApplic1618FrameworkUpliftCompletionPayment
		,PriceEpisodeApplic1618FrameworkUpliftOnProgPayment 
		,PriceEpisodeSecondProv1618Pay 
		,PriceEpisodeFirstEmp1618Pay 
		,PriceEpisodeSecondEmp1618Pay 
		,PriceEpisodeFirstProv1618Pay 
		,PriceEpisodeLSFCash 
		,PriceEpisodeFundLineType
		,PriceEpisodeSFAContribPct
		,PriceEpisodeLevyNonPayInd
		,EpisodeEffectiveTNPStartDate
		,PriceEpisodeFirstAdditionalPaymentThresholdDate 
		,PriceEpisodeSecondAdditionalPaymentThresholdDate
		,PriceEpisodeContractType
		,PriceEpisodePreviousEarningsSameProvider 
		,PriceEpisodeTotProgFunding 
		,PriceEpisodeProgFundIndMinCoInvest 
		,PriceEpisodeProgFundIndMaxEmpCont 
		,PriceEpisodeTotalPMRs 
		,PriceEpisodeCumulativePMRs 
		,PriceEpisodeCompExemCode 
	)
select
	@pUKPRN,
	@pYEAR,
	LearnRefNumber 
	,PriceEpisodeIdentifier 
	,TNP4 
	,TNP1 
	,EpisodeStartDate
	,TNP2 
	,TNP3 
	,PriceEpisodeUpperBandLimit
	,PriceEpisodePlannedEndDate
	,PriceEpisodeActualEndDate
	,PriceEpisodeTotalTNPPrice 
	,PriceEpisodeUpperLimitAdjustment 
	,PriceEpisodePlannedInstalments 
	,PriceEpisodeActualInstalments 
	,PriceEpisodeInstalmentsThisPeriod
	,PriceEpisodeCompletionElement 
	,PriceEpisodePreviousEarnings 
	,PriceEpisodeInstalmentValue 
	,PriceEpisodeOnProgPayment 
	,PriceEpisodeTotalEarnings 
	,PriceEpisodeBalanceValue 
	,PriceEpisodeBalancePayment
	,PriceEpisodeCompleted 
	,PriceEpisodeCompletionPayment 
	,PriceEpisodeRemainingTNPAmount
	,PriceEpisodeRemainingAmountWithinUpperLimit
	,PriceEpisodeCappedRemainingTNPAmount
	,PriceEpisodeExpectedTotalMonthlyValue
	,PriceEpisodeAimSeqNumber 
	,PriceEpisodeFirstDisadvantagePayment
	,PriceEpisodeSecondDisadvantagePayment 
	,PriceEpisodeApplic1618FrameworkUpliftBalancing
	,PriceEpisodeApplic1618FrameworkUpliftCompletionPayment
	,PriceEpisodeApplic1618FrameworkUpliftOnProgPayment 
	,PriceEpisodeSecondProv1618Pay 
	,PriceEpisodeFirstEmp1618Pay 
	,PriceEpisodeSecondEmp1618Pay 
	,PriceEpisodeFirstProv1618Pay 
	,PriceEpisodeLSFCash 
	,PriceEpisodeFundLineType
	,PriceEpisodeSFAContribPct
	,PriceEpisodeLevyNonPayInd
	,EpisodeEffectiveTNPStartDate
	,PriceEpisodeFirstAdditionalPaymentThresholdDate 
	,PriceEpisodeSecondAdditionalPaymentThresholdDate
	,PriceEpisodeContractType
	,PriceEpisodePreviousEarningsSameProvider 
	,PriceEpisodeTotProgFunding 
	,PriceEpisodeProgFundIndMinCoInvest 
	,PriceEpisodeProgFundIndMaxEmpCont 
	,PriceEpisodeTotalPMRs 
	,PriceEpisodeCumulativePMRs 
	,PriceEpisodeCompExemCode 
from
	[Intrajob].[Rulebase].[AEC_ApprenticeshipPriceEpisode]
go

if object_id('[$(FromILRDatabase)].[dbo].AEC_ApprenticeshipPriceEpisode_Period','u') is null begin
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
			[PriceEpisodeSFAContribPct] decimal(10,5)
			,primary key clustered
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
	@pUKPRN,
	@pYEAR,
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
go

if object_id('[$(FromILRDatabase)].[dbo].AEC_ApprenticeshipPriceEpisode_PeriodisedValues','u') is null begin
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
			[Period_12] [decimal](15,5)
			,primary key clustered
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
	@pUKPRN,
	@pYEAR,
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
go


exec [ApprenticeshipEarningsHistory].[dbo].[PrepareForNewData] @pYEAR, @pRETURN, @pUKPRN
go

insert into
	[ApprenticeshipEarningsHistory].[dbo].[AEC_EarningHistory]
	(
		LearnRefNumber,
		AppIdentifier,
		AppProgCompletedInTheYearInput,
		CollectionYear, 
		CollectionReturnCode, 
		DaysInYear, 
		HistoricEffectiveTNPStartDateInput, 
		HistoricEmpIdEndWithinYear,
		HistoricEmpIdStartWithinYear,
		FworkCode,
		HistoricLearner1618StartInput,
		HistoricPMRAmount,
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
		@pYEAR,
		@pRETURN,
		HistoricDaysInYearOutput, 
		HistoricEffectiveTNPStartDateOutput, 
		HistoricEmpIdEndWithinYearOutput,
		HistoricEmpIdStartWithinYearOutput,
		HistoricFworkCodeOutput, 
		HistoricLearner1618AtStartOutput, 
		HistoricPMRAmountOutput,
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
		@pUKPRN,
		HistoricUptoEndDateOutput, 
		HistoricVirtualTNP3EndofThisYearOutput, 
		HistoricVirtualTNP4EndofThisYearOutput,
		1
from
	[Rulebase].[AEC_HistoricEarningOutput]
go