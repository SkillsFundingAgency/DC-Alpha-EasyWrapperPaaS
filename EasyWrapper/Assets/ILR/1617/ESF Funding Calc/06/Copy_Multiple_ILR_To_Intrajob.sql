-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 20 December 2016 11:12
-- Profile: Test Harness Calculation
-- Rulebase Version: ILR ESF Funding Calc 1617, Version 1617.06
-- =====================================================================================================
use [$(IntrajobDatabase)]
go
insert into
	[Valid].[LearningProvider]
		(
			[UKPRN]
		)
select
	[UKPRN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningProvider]
where
	[LearningProvider].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[Learner]
		(
			[LearnRefNumber],
			[DateOfBirth]
		)
select
	[LearnRefNumber],
	[DateOfBirth]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[Learner]
where
	[Learner].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[LearningDelivery]
		(
			[LearnRefNumber],
			[AimSeqNumber],
			[AchDate],
			[AddHours],
			[ConRefNumber],
			[CompStatus],
			[LearnAimRef],
			[LearnActEndDate],
			[LearnPlanEndDate],
			[LearnStartDate],
			[LrnDelFAM_LDM1],
			[LrnDelFAM_LDM2],
			[LrnDelFAM_LDM3],
			[LrnDelFAM_LDM4],
			[LrnDelFAM_RES],
			[OrigLearnStartDate],
			[OtherFundAdj],
			[Outcome],
			[PriorLearnFundAdj],
			[DelLocPostCode],
			[FundModel]
		)
select
	[LearnRefNumber],
	[AimSeqNumber],
	[AchDate],
	[AddHours],
	[ConRefNumber],
	[CompStatus],
	[LearnAimRef],
	[LearnActEndDate],
	[LearnPlanEndDate],
	[LearnStartDate],
	[LrnDelFAM_LDM1],
	[LrnDelFAM_LDM2],
	[LrnDelFAM_LDM3],
	[LrnDelFAM_LDM4],
	[LrnDelFAM_RES],
	[OrigLearnStartDate],
	[OtherFundAdj],
	[Outcome],
	[PriorLearnFundAdj],
	[DelLocPostCode],
	[FundModel]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDeliveryDenorm] LearningDelivery
where
	[LearningDelivery].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[DPOutcome]
		(
			[LearnRefNumber],
			[OutType],
			[OutCode],
			[OutStartDate],
			[OutCollDate],
			[OutEndDate]
		)
select
	[LearnRefNumber],
	[OutType],
	[OutCode],
	[OutStartDate],
	[OutCollDate],
	[OutEndDate]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[DPOutcome]
where
	[DPOutcome].[UKPRN]=$(UKPRN)
go
