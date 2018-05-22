-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 23 July 2015 13:58
-- Profile: 1516 Test Harness Calculation
-- Rulebase Version: DCSS 1516 Trailblazer Funding Calculation 1516, Drop 000, Version 1516.04
-- =====================================================================================================
use [Intrajob_1516]
GO
if not exists(select schema_id from sys.schemas where name='Rulebase')
	exec('create schema Rulebase')
GO
if object_id('[Rulebase].[TBL_Cases]','u') is not null
	drop table [Rulebase].[TBL_Cases]
create table [Rulebase].[TBL_Cases]
	(
		[LearnRefNumber] varchar(12),
		[CaseData] [xml] not null
	)
GO
if object_id('[Rulebase].[TBL_global]','u') is not null
	drop table [Rulebase].[TBL_global]
create table [Rulebase].[TBL_global]
	(
		[UKPRN] int,
		[CurFundYr] varchar(10),
		[LARSVersion] varchar(50),
		[RulebaseVersion] varchar(10),
	)
GO
if object_id('[Rulebase].[TBL_LearningDelivery]','u') is not null
	drop table [Rulebase].[TBL_LearningDelivery]
create table [Rulebase].[TBL_LearningDelivery]
	(
		[LearnRefNumber] varchar(12),
		[AimSeqNumber] int,
		[AchApplicDate] date,
		[AchEligible] bit,
		[Achieved] bit,
		[AchievementApplicVal] decimal(10,5),
		[ActualDaysIL] int,
		[ActualNumInstalm] int,
		[AdjProgStartDate] date,
		[AdjStartDate] date,
		[AgeStandardStart] int,
		[ApplicFundValDate] date,
		[CombinedAdjProp] decimal(10,5),
		[CoreGovContCapApplicVal] decimal(10,5),
		[EmpIdAchDate] int,
		[EmpIdFirstDayStandard] int,
		[EmpIdFirstYoungAppDate] int,
		[EmpIdSecondYoungAppDate] int,
		[EmpIdSmallBusDate] int,
		[FundLine] varchar(50),
		[LearnAimRef] varchar(8),
		[LearnDelDaysIL] int,
		[LearnDelStandardAccDaysIL] int,
		[LearnDelStandardPrevAccDaysIL] int,
		[LearnDelStandardTotalDaysIL] int,
		[MathEngAimValue] decimal(10,5),
		[MathEngLSFFundStart] bit,
		[MathEngLSFThresholdDays] int,
		[OutstandNumOnProgInstalm] int,
		[PlannedNumOnProgInstalm] int,
		[PlannedTotalDaysIL] int,
		[ProgStandardStartDate] date,
		[SmallBusApplicVal] decimal(10,5),
		[SmallBusEligible] bit,
		[SmallBusStatusFirstDayStandard] int,
		[SmallBusStatusThreshold] int,
		[SmallBusThresholdDate] date,
		[YoungAppApplicVal] decimal(10,5),
		[YoungAppEligible] bit,
		[YoungAppFirstThresholdDate] date,
		[YoungAppSecondThresholdDate] date
		primary key clustered
		(
			[LearnRefNumber] asc,
			[AimSeqNumber] asc
		)
	)
GO
if object_id('[Rulebase].[TBL_LearningDelivery_Period]','u') is not null
	drop table [Rulebase].[TBL_LearningDelivery_Period]
create table [Rulebase].[TBL_LearningDelivery_Period]
	(
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
			[LearnRefNumber] asc,
			[AimSeqNumber] asc,
			[Period] asc
		)
	)
GO
if object_id('[Rulebase].[TBL_LearningDelivery_PeriodisedValues]','u') is not null
	drop table [Rulebase].[TBL_LearningDelivery_PeriodisedValues]
create table [Rulebase].[TBL_LearningDelivery_PeriodisedValues]
	(
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
			[AttributeName] asc
		)
	)
GO
