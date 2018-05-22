if not exists(select schema_id from sys.schemas where name='Rulebase')
begin
	exec('create schema Rulebase')
end
go

if object_id('[Rulebase].[VAL_Cases]','u') is not null
begin
	drop table [Rulebase].[VAL_Cases]
end
go

create table [Rulebase].[VAL_Cases]
(
	[Learner_Id] [int] primary key,
	[CaseData] [xml] not null
)
go

if object_id('[Rulebase].[VAL_global]','u') is not null
begin
	drop table [Rulebase].[VAL_global]
end
go

create table [Rulebase].[VAL_global]
(
	[UKPRN] int,
	[EmployerVersion] varchar(50),
	[LARSVersion] varchar(50),
	[OrgVersion] varchar(50),
	[PostcodeVersion] varchar(50),
	[RulebaseVersion] varchar(10),
)
go

if object_id('Rulebase.VAL_Learner', 'u') is not null
begin
	drop table Rulebase.VAL_Learner
end
go

create table Rulebase.VAL_Learner
(
	[LearnRefNumber] varchar(12) not null
)
go

if object_id('Rulebase.VAL_LearningDelivery','u') is not null
begin
	drop table Rulebase.VAL_LearningDelivery
end
go

create table Rulebase.VAL_LearningDelivery
(
	[AimSeqNumber] int not null
)
go

if object_id('[Rulebase].[VAL_ValidationError]','u') is not null
begin
	drop table [Rulebase].[VAL_ValidationError]
end
go

create table [Rulebase].[VAL_ValidationError]
(
	[AimSeqNumber] bigint,
	[ErrorString] varchar(2000),
	[FieldValues] varchar(2000),
	[LearnRefNumber] varchar(100),
	[RuleId] varchar(50)
)
go
