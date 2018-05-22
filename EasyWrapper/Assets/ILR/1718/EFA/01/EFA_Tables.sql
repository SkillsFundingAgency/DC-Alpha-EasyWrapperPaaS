if not exists(select schema_id from sys.schemas where name='Rulebase')
begin
	exec('create schema Rulebase')
end
go

if object_id('[Rulebase].[EFA_Cases]','u') is not null
begin	
	drop table [Rulebase].[EFA_Cases]
end
go

create table [Rulebase].[EFA_Cases]
(
	[LearnRefNumber] varchar(12)
	,[UKPRN] int NOT NULL
	,[CaseData] [xml] not NULL
    ,PRIMARY KEY
	(
		LearnRefNumber
		,UKPRN
	)
)
go

if object_id('[Rulebase].[EFA_global]','u') is not null
begin
	drop table [Rulebase].[EFA_global]
end
go

create table [Rulebase].[EFA_global]
(
	[UKPRN] int,
	[LARSVersion] varchar(50),
	[OrgVersion] varchar(50),
	[PostcodeDisadvantageVersion] varchar(50),
	[RulebaseVersion] varchar(10),
)
go

if object_id('[Rulebase].[EFA_Learner]','u') is not null
begin
	drop table [Rulebase].[EFA_Learner]
end
go

create table [Rulebase].[EFA_Learner]
(
	[LearnRefNumber] varchar(12)
	,[AcadMonthPayment] int,
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
	[PrvHistLrgProgPropn] decimal(10,5),
	[PrvRetentFactHist] decimal(10,5),
	[RateBand] varchar(50),
	[RetentNew] decimal(10,5),
	[StartFund] bit,
	[ThresholdDays] int
	primary key clustered
	(
		[LearnRefNumber] ASC
	)
)
go