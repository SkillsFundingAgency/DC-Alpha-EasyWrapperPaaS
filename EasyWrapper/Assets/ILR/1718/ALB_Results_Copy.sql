--ALB_Results_Copy
insert into [$(FromILRDatabase)].Rulebase.[ALB_Cases]
(
	LearnRefNumber
	,Cases
)
select
	LearnRefNumber
	,Cases
from
	Rulebase.[ALB_Cases]
go

insert into [$(FromILRDatabase)].Rulebase.[ALB_global]
(
	UKPRN, 
	LARSVersion, 
	PostcodeAreaCostVersion, 
	RulebaseVersion
)
select
	UKPRN, 
	LARSVersion, 
	PostcodeAreaCostVersion, 
	RulebaseVersion
from
	Rulebase.[ALB_global]
go

insert into [$(FromILRDatabase)].Rulebase.[ALB_Learner_Period]
(
	LearnRefNumber
	,[Period]
	,ALBSeqNum
)
select
	LearnRefNumber
	,[Period]
	,ALBSeqNum
from
	[Rulebase].[ALB_Learner_Period]
go

insert into [$(FromILRDatabase)].Rulebase.[ALB_Learner_PeriodisedValues]
(
	LearnRefNumber, 
	AttributeName,
	Period_1, 
	Period_2, 
	Period_3, 
	Period_4, 
	Period_5, 
	Period_6, 
	Period_7, 
	Period_8, 
	Period_9, 
	Period_10, 
	Period_11, 
	Period_12
)
select
	LearnRefNumber, 
	AttributeName,
	Period_1, 
	Period_2, 
	Period_3, 
	Period_4, 
	Period_5, 
	Period_6, 
	Period_7, 
	Period_8, 
	Period_9, 
	Period_10, 
	Period_11, 
	Period_12
from
	Rulebase.[ALB_Learner_PeriodisedValues]
go

insert into [$(FromILRDatabase)].[Rulebase].[ALB_LearningDelivery]
(
	LearnRefNumber, 
	AimSeqNumber, 
	Achieved, 
	ActualNumInstalm, 
	AdvLoan, 
	ApplicFactDate, 
	ApplicProgWeightFact, 
	AreaCostFactAdj, 
	AreaCostInstalment, 
	FundLine, 
	FundStart, 
	LiabilityDate, 
	LoanBursAreaUplift, 
	LoanBursSupp, 
	OutstndNumOnProgInstalm, 
	PlannedNumOnProgInstalm, 
	WeightedRate
)
select
	LearnRefNumber, 
	AimSeqNumber, 
	Achieved, 
	ActualNumInstalm, 
	AdvLoan, 
	ApplicFactDate, 
	ApplicProgWeightFact, 
	AreaCostFactAdj, 
	AreaCostInstalment, 
	FundLine, 
	FundStart, 
	LiabilityDate, 
	LoanBursAreaUplift, 
	LoanBursSupp, 
	OutstndNumOnProgInstalm, 
	PlannedNumOnProgInstalm, 
	WeightedRate
from
	[Rulebase].[ALB_LearningDelivery]
go

insert into [$(FromILRDatabase)].Rulebase.[ALB_LearningDelivery_Period]
(
	LearnRefNumber, 
	AimSeqNumber, 
	[Period], 
	ALBCode, 
	ALBSupportPayment, 
	AreaUpliftBalPayment, 
	AreaUpliftOnProgPayment
)
select
	LearnRefNumber, 
	AimSeqNumber, 
	[Period], 
	ALBCode, 
	ALBSupportPayment, 
	AreaUpliftBalPayment, 
	AreaUpliftOnProgPayment
from
	Rulebase.[ALB_LearningDelivery_Period]
go

insert into [$(FromILRDatabase)].[Rulebase].[ALB_LearningDelivery_PeriodisedValues]
(
	LearnRefNumber, 
	AimSeqNumber, 
	AttributeName, 
	Period_1, 
	Period_2, 
	Period_3, 
	Period_4, 
	Period_5, 
	Period_6, 
	Period_7, 
	Period_8, 
	Period_9, 
	Period_10, 
	Period_11, 
	Period_12
)
select
	LearnRefNumber, 
	AimSeqNumber, 
	AttributeName, 
	Period_1, 
	Period_2, 
	Period_3, 
	Period_4, 
	Period_5, 
	Period_6, 
	Period_7, 
	Period_8, 
	Period_9, 
	Period_10, 
	Period_11, 
	Period_12
from
	Rulebase.[ALB_LearningDelivery_PeriodisedValues]
go