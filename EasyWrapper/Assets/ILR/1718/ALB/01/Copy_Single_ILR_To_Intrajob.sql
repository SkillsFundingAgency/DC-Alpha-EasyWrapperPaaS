-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 13 July 2016 15:37
-- Profile: 1516 Test Harness Calculation
-- Rulebase Version: ILR 24+ Loans Calculation 1617, Drop 000, Version 1617.03
-- =====================================================================================================
use [$(IntrajobDatabase)]
go
insert into
	[Input].[LearningProvider]
		(
			[LearningProvider_Id],
			[UKPRN]
		)
select distinct
	[PK_LearningProvider],
	[UKPRN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningProvider]
go

insert into
	[Input].[Learner]
		(
			[Learner_Id],
			[LearnRefNumber],
			[ULN],
			Ethnicity,
			Sex,
			LLDDHealthProb
		)
select distinct
	[PK_Learner],
	[LearnRefNumber],
	[ULN],
	Ethnicity,
	Sex,
	LLDDHealthProb
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[Learner]
go

insert into
	[Input].[LearningDelivery]
		(
			[LearningDelivery_Id],
			[Learner_Id],
			[AimSeqNumber],
			LearnRefNumber,
			[CompStatus],
			[LearnActEndDate],
			[LearnAimRef],
			[LearnPlanEndDate],
			[LearnStartDate],
			[OrigLearnStartDate],
			[OtherFundAdj],
			[Outcome],
			[PriorLearnFundAdj],
			[DelLocPostCode],
			[FundModel],
			[AimType]
		)
select distinct
	[PK_LearningDelivery],
	[FK_Learner],
	[AimSeqNumber],
	Learner.LearnRefNumber,
	[CompStatus],
	[LearnActEndDate],
	[LearnAimRef],
	[LearnPlanEndDate],
	[LearnStartDate],
	[OrigLearnStartDate],
	[OtherFundAdj],
	[Outcome],
	[PriorLearnFundAdj],
	[DelLocPostCode],
	[FundModel],
	[AimType]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDelivery]
	join [$(FromILRDatabase)].[$(FromILRSchema)].Learner
		on Learner.PK_Learner = LearningDelivery.FK_Learner
go

insert into
	[Input].[LearningDeliveryFAM]
		(
			[LearningDeliveryFAM_Id],
			[LearningDelivery_Id],
			LearnRefNumber,
			AimSeqNumber,
			[LearnDelFAMType],
			[LearnDelFAMDateFrom],
			[LearnDelFAMCode],
			[LearnDelFAMDateTo]
		)
select distinct
	[PK_LearningDeliveryFAM],
	[FK_LearningDelivery],
	Learner.LearnRefNumber,
	AimSeqNumber,
	[LearnDelFAMType],
	[LearnDelFAMDateFrom],
	[LearnDelFAMCode],
	[LearnDelFAMDateTo]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDeliveryFAM]
	join [$(FromILRDatabase)].[$(FromILRSchema)].[LearningDelivery]
		on LearningDeliveryFAM.FK_LearningDelivery = LearningDelivery.PK_LearningDelivery
	join [$(FromILRDatabase)].[$(FromILRSchema)].Learner
		on Learner.PK_Learner = LearningDelivery.FK_Learner
go
