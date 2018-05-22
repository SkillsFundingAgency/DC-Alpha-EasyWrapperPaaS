-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 18 May 2017 10:36
-- Profile: DCSS Calculation
-- Rulebase Version: ILR Trailblazer Funding Calculation 1617, Version 1617.02
-- =====================================================================================================
if not exists(select schema_id from sys.schemas where name='Rulebase')
	exec('create schema Rulebase')
go
if object_id('[Rulebase].[TBL_Cases]','u') is not null
	drop table [Rulebase].[TBL_Cases]
create table [Rulebase].[TBL_Cases]
	(
		[LearnRefNumber] varchar(12),
		[CaseData] [xml] not null
	)
go
if object_id('[Rulebase].[TBL_global]','u') is not null
	drop table [Rulebase].[TBL_global]
create table [Rulebase].[TBL_global]
	(
		[UKPRN] int,
		[CurFundYr] varchar(10),
		[LARSVersion] varchar(100),
		[RulebaseVersion] varchar(10),
	)
go
if object_id('[Rulebase].[TBL_LearningDelivery]','u') is not null
	drop table [Rulebase].[TBL_LearningDelivery]
create table [Rulebase].[TBL_LearningDelivery]
	(	
		LearnRefNumber varchar(12)
		,AimSeqNumber int
		,ProgStandardStartDate date
		,FundLine varchar(50)
		,MathEngAimValue	decimal(10,5)
		,PlannedNumOnProgInstalm int
		,LearnSuppFundCash decimal(10,5)
		,AdjProgStartDate date
		,LearnSuppFund bit
		,MathEngOnProgPayment decimal(10,5)
		,InstPerPeriod int
		,SmallBusPayment decimal(10,5)
		,YoungAppSecondPayment decimal(10,5)
		,CoreGovContPayment decimal(10,5)
		,YoungAppEligible bit
		,SmallBusEligible bit
		,MathEngOnProgPct int
		,AgeStandardStart int
		,YoungAppSecondThresholdDate date
		,EmpIdFirstDayStandard int
		,EmpIdFirstYoungAppDate	int
		,EmpIdSecondYoungAppDate int
		,EmpIdSmallBusDate int 
		,YoungAppFirstThresholdDate date 
		,AchApplicDate date
		,AchEligible bit
		,Achieved bit
		,AchievementApplicVal decimal(10,5)
		,AchPayment decimal(10,5)
		,ActualNumInstalm int
		,CombinedAdjProp bigint
		,EmpIdAchDate int
		,LearnDelDaysIL int
		,LearnDelStandardAccDaysIL int
		,LearnDelStandardPrevAccDaysIL int
		,LearnDelStandardTotalDaysIL int
		,ActualDaysIL int
		,MathEngBalPayment decimal(10,5)
		,MathEngBalPct bigint
		,MathEngLSFFundStart bit
		,PlannedTotalDaysIL int
		,MathEngLSFThresholdDays int
		,OutstandNumOnProgInstalm int
		,SmallBusApplicVal decimal(10,5)
		,SmallBusStatusFirstDayStandard int
		,SmallBusStatusThreshold int
		,YoungAppApplicVal decimal(10,5)
		,CoreGovContCapApplicVal bigint
		,CoreGovContUncapped decimal(10,5)
		,ApplicFundValDate date
		,YoungAppFirstPayment decimal(10,5)
		,YoungAppPayment decimal(10,5)	
		primary key clustered
		(
			[LearnRefNumber] asc,
			[AimSeqNumber] asc
		)
	)
go
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
go
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
go
