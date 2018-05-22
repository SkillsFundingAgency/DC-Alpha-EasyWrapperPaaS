-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 06 April 2016 10:54
-- Profile: 1516 Test Harness Calculation
-- Rulebase Version: DCSS 1516 EFA Calculation 1516, Drop 000, Version 1516.06
-- =====================================================================================================
use [$(IntrajobDatabase)]
GO
if not exists(select schema_id from sys.schemas where name='Rulebase')
	exec('create schema Rulebase')
GO
if object_id('[Rulebase].[EFA_Cases]','u') is not null
	drop table [Rulebase].[EFA_Cases]
create table [Rulebase].[EFA_Cases]
	(
		[LearnRefNumber] varchar(12),
		[CaseData] [xml] not null
	)
GO
if object_id('[Rulebase].[EFA_global]','u') is not null
	drop table [Rulebase].[EFA_global]
create table [Rulebase].[EFA_global]
	(
		[UKPRN] int,
		[LARSVersion] varchar(50),
		[OrgVersion] varchar(50),
		[PostcodeDisadvantageVersion] varchar(50),
		[RulebaseVersion] varchar(10),
	)
GO
if object_id('[Rulebase].[EFA_Learner]','u') is not null
	drop table [Rulebase].[EFA_Learner]
create table [Rulebase].[EFA_Learner]
	(
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
		[PrvRetentFactHist] decimal(10,5),
		[RateBand] varchar(50),
		[RetentNew] decimal(10,5),
		[StartFund] bit,
		[ThresholdDays] int
		primary key clustered
		(
			[LearnRefNumber] asc
		)
	)
GO
