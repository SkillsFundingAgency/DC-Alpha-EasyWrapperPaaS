-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 13 July 2016 08:30
-- Profile: 1516 Test Harness Calculation
-- Rulebase Version: ILR EFA Periodisation 1617, Drop 000, Version 1617.01
-- =====================================================================================================
use [$(IntrajobDatabase)]
GO
if not exists(select schema_id from sys.schemas where name='Rulebase')
	exec('create schema Rulebase')
GO
if object_id('[Rulebase].[EFA_SFA_Cases]','u') is not null
	drop table [Rulebase].[EFA_SFA_Cases]
create table [Rulebase].[EFA_SFA_Cases]
	(
		[LearnRefNumber] varchar(12),
		[CaseData] [xml] not null
	)
GO
if object_id('[Rulebase].[EFA_SFA_global]','u') is not null
	drop table [Rulebase].[EFA_SFA_global]
create table [Rulebase].[EFA_SFA_global]
	(
		[UKPRN] int,
		[RulebaseVersion] varchar(8),
	)
GO
if object_id('[Rulebase].[EFA_SFA_Learner_Period]','u') is not null
	drop table [Rulebase].[EFA_SFA_Learner_Period]
create table [Rulebase].[EFA_SFA_Learner_Period]
	(
		[LearnRefNumber] varchar(12),
		[Period] int,
		[LnrOnProgPay] decimal(10,5),
		primary key clustered
		(
			[LearnRefNumber] asc,
			[Period] asc
		)
	)
GO
if object_id('[Rulebase].[EFA_SFA_Learner_PeriodisedValues]','u') is not null
	drop table [Rulebase].[EFA_SFA_Learner_PeriodisedValues]
create table [Rulebase].[EFA_SFA_Learner_PeriodisedValues]
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
