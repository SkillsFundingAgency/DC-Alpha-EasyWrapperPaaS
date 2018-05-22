if not exists(select schema_id from sys.schemas where name = 'Rulebase')
begin
	exec('create schema Rulebase')
end
go

if object_id('Rulebase.VALFD_ValidationError','u') is not NULL
begin
	EXEC('drop table [Rulebase].[VALFD_ValidationError]')
end
go

create table [Rulebase].[VALFD_ValidationError]
	(
		[AimSeqNumber] bigint null,
		[ErrorString] varchar(2000) null,
		[FieldValues] varchar(2000) null,
		[LearnRefNumber] varchar(100) null,
		[RuleId] varchar(50) null
	)
go
