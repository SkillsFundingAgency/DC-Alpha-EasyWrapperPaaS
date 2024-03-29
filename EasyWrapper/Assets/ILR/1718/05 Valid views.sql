if not exists (select * from sys.schemas where name = 'Report')
begin
	exec('create schema [Report]');
end
go

IF OBJECT_ID('Report.ValidationError') IS NOT NULL
BEGIN
	DROP VIEW Report.ValidationError
END
GO

create view [Report].[ValidationError]
as
	select
		fd.AimSeqNumber
		,fd.ErrorString
		,eml.Severity
		,fd.FieldValues
		,fd.LearnRefNumber
		,fd.RuleId
	from
		Rulebase.VALFD_ValidationError as fd
		left join
			[ErrorReference].ErrorMessageLookUp as eml
				on eml.RuleName = fd.RuleId

	union all

	select
		NULL, 
		dpe.[ErrorString], 
		eml.Severity,
		dpe.[FieldValues], 
		dpe.[LearnRefNumber], 
		dpe.[RuleId] 
	FROM 
		[Rulebase].[VALDP_ValidationError] as dpe
		left join
			[ErrorReference].ErrorMessageLookUp as eml
				on eml.RuleName = dpe.RuleId

	union all

	select
		ve.[AimSeqNumber], 
		ve.[ErrorString], 
		eml.Severity,
		ve.[FieldValues], 
		ve.[LearnRefNumber], 
		ve.[RuleId] 
	FROM 
		[Rulebase].[VAL_ValidationError] as ve
		left join
			[ErrorReference].ErrorMessageLookUp as eml
				on eml.RuleName = ve.RuleId

	union all

	select
		esfv.[AimSeqNumber],
		esfv.[ErrorString], 
		eml.Severity,
		esfv.[FieldValues], 
		esfv.[LearnRefNumber], 
		esfv.[RuleId] 
	FROM 
		[Rulebase].[ESFVAL_ValidationError] as esfv
		left join
			[ErrorReference].ErrorMessageLookUp as eml
				on eml.RuleName = esfv.RuleId	
go


IF OBJECT_ID('dbo.ValidLearners', 'v') IS NOT NULL
BEGIN
	DROP VIEW ValidLearners
END
GO

CREATE VIEW ValidLearners 
AS
	SELECT 
		L.Learner_Id
	FROM 
		[Input].[Learner] L
	WHERE 
		NOT EXISTS 
		( 
			SELECT 
				* 
			FROM 
				Report.[ValidationError] 
			WHERE 
				LearnRefNumber = L.LearnRefNumber 
				and Severity = 'E'
		)
		AND L.LearnRefNumber IS NOT NULL
GO

IF OBJECT_ID('dbo.ValidLearnerDestinationandProgressions', 'v') IS NOT NULL
BEGIN
	DROP VIEW ValidLearnerDestinationandProgressions
END
GO

CREATE VIEW ValidLearnerDestinationandProgressions 
AS
	SELECT 
		LDP.LearnerDestinationandProgression_Id
	FROM 
		[Input].[LearnerDestinationandProgression] LDP
	WHERE 
		NOT EXISTS 
		( 
			SELECT 
				* 
			FROM 
				Report.[ValidationError] 
			WHERE 
				LearnRefNumber=LDP.LearnRefNumber
				and Severity = 'E'
		)
	AND LDP.LearnRefNumber IS NOT NULL
GO