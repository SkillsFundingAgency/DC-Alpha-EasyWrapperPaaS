-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 26 August 2016 11:06
-- Profile: Test Harness Validation
-- Rulebase Version: ILR ESF Validation 1617, Drop 000, Version 1617.01
-- =====================================================================================================
use [$(IntrajobDatabase)]
go
if not exists(select schema_id from sys.schemas where name='Rulebase')
	exec('create schema Rulebase')
go
if object_id('[Rulebase].[ESFVAL_Cases]','u') is not null
	drop table [Rulebase].[ESFVAL_Cases]
create table [Rulebase].[ESFVAL_Cases]
	(
		[Learner_Id] [int] primary key,
		[CaseData] [xml] not null
	)
go
if object_id('[Rulebase].[ESFVAL_global]','u') is not null
	drop table [Rulebase].[ESFVAL_global]
create table [Rulebase].[ESFVAL_global]
	(
		[UKPRN] int,
		[RulebaseVersion] varchar(10),
	)
go
if object_id('[Rulebase].[ESFVAL_ValidationError]','u') is not null
	drop table [Rulebase].[ESFVAL_ValidationError]
create table [Rulebase].[ESFVAL_ValidationError]
	(
		[AimSeqNumber] bigint,
		[ErrorString] varchar(2000),
		[FieldValues] varchar(2000),
		[LearnRefNumber] varchar(100),
		[RuleId] varchar(50)
	)
go
