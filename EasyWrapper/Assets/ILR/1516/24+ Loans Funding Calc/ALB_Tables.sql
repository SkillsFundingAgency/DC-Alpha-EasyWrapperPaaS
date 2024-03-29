-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 21 July 2015 10:33
-- Profile: 1516 Test Harness Calculation
-- Rulebase Version: DCSS 1516 24+ Loans Calculation 1516, Drop 002, Version 1516.04
-- =====================================================================================================
use [Intrajob_1516]
GO
if not exists(select schema_id from sys.schemas where name='Rulebase')
	exec('create schema Rulebase')
GO
if object_id('[Rulebase].[ALB_Cases]','u') is not null
	drop table [Rulebase].[ALB_Cases]
create table [Rulebase].[ALB_Cases]
	(
		[LearnRefNumber] varchar(12),
		[CaseData] [xml] not null
	)
GO
if object_id('[Rulebase].[ALB_global]','u') is not null
	drop table [Rulebase].[ALB_global]
create table [Rulebase].[ALB_global]
	(
		[UKPRN] int,
		[LARSVersion] varchar(20),
		[PostcodeAreaCostVersion] varchar(20),
		[RulebaseVersion] varchar(10),
	)
GO
if object_id('[Rulebase].[ALB_Learner_Period]','u') is not null
	drop table [Rulebase].[ALB_Learner_Period]
create table [Rulebase].[ALB_Learner_Period]
	(
		[LearnRefNumber] varchar(12),
		[Period] int,
		[ALBSeqNum] int,
		primary key clustered
		(
			[LearnRefNumber] asc,
			[Period] asc
		)
	)
GO
if object_id('[Rulebase].[ALB_Learner_PeriodisedValues]','u') is not null
	drop table [Rulebase].[ALB_Learner_PeriodisedValues]
create table [Rulebase].[ALB_Learner_PeriodisedValues]
	(
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
			[LearnRefNumber] asc,
			[AttributeName] asc
		)
	)
GO
if object_id('[Rulebase].[ALB_LearningDelivery]','u') is not null
	drop table [Rulebase].[ALB_LearningDelivery]
create table [Rulebase].[ALB_LearningDelivery]
	(
		[LearnRefNumber] varchar(12),
		[AimSeqNumber] int,
		[Achieved] bit,
		[ActualNumInstalm] int,
		[AdvLoan] bit,
		[ALBPaymentEndDate] date,
		[ApplicProgWeightFact] varchar(1),
		[AreaCostFactAdj] decimal(10,5),
		[AreaCostInstalment] decimal(10,5),
		[CourseType] varchar(100),
		[FundLine] varchar(50),
		[FundStart] bit,
		[LiabilityDate] date,
		[LoanBursAreaUplift] bit,
		[LoanBursSupp] bit,
		[MaxNumYears] int,
		[OutstndNumOnProgInstalm] int,
		[PlannedNumOnProgInstalm] int,
		[SpecResUplift] decimal(10,5),
		[WeightedRate] decimal(10,4)
		primary key clustered
		(
			[LearnRefNumber] asc,
			[AimSeqNumber] asc
		)
	)
GO
if object_id('[Rulebase].[ALB_LearningDelivery_Period]','u') is not null
	drop table [Rulebase].[ALB_LearningDelivery_Period]
create table [Rulebase].[ALB_LearningDelivery_Period]
	(
		[LearnRefNumber] varchar(12),
		[AimSeqNumber] int,
		[Period] int,
		[ALBCode] int,
		[ALBSupportPayment] decimal(10,5),
		[AreaUpliftBalPayment] decimal(10,5),
		[AreaUpliftOnProgPayment] decimal(10,5),
		primary key clustered
		(
			[LearnRefNumber] asc,
			[AimSeqNumber] asc,
			[Period] asc
		)
	)
GO
if object_id('[Rulebase].[ALB_LearningDelivery_PeriodisedValues]','u') is not null
	drop table [Rulebase].[ALB_LearningDelivery_PeriodisedValues]
create table [Rulebase].[ALB_LearningDelivery_PeriodisedValues]
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
