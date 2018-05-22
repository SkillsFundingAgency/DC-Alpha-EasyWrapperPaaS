--VALFD results copy
insert into [$(FromILRDatabase)].Rulebase.[VALFD_ValidationError]
(
	AimSeqNumber
	,ErrorString
	,FieldValues
	,LearnRefNumber
	,RuleId
)
select
	AimSeqNumber
	,ErrorString
	,FieldValues
	,LearnRefNumber
	,RuleId
from
	Rulebase.[VALFD_ValidationError]
go