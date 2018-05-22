-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 07 April 2016 09:42
-- Profile: 1516 Test Harness Calculation
-- Rulebase Version: DCSS 1516 EFA Calculation 1516, Drop 000, Version 1516.06
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
			[DateOfBirth],
			[EngGrade],
			[LrnFAM_ECF],
			[LrnFAM_EDF1],
			[LrnFAM_EDF2],
			[LrnFAM_EHC],
			[LrnFAM_HNS],
			[LrnFAM_LDA],
			[LrnFAM_MCF],
			[MathGrade],
			[PlanEEPHours],
			[PlanLearnHours],
			[HomePostcode],
			[CurrentPostcode],
			[ULN]
		)
select
	[LearnRefNumber],
	[DateOfBirth],
	[EngGrade],
	[LrnFAM_ECF],
	[LrnFAM_EDF1],
	[LrnFAM_EDF2],
	[LrnFAM_EHC],
	[LrnFAM_HNS],
	[LrnFAM_LDA],
	[LrnFAM_MCF],
	[MathGrade],
	[PlanEEPHours],
	[PlanLearnHours],
	[HomePostcode],
	[CurrentPostcode],
	[ULN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerDenorm] Learner
where
	[Learner].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[LearningDelivery]
		(
			[LearnRefNumber],
			[AimSeqNumber],
			[AimType],
			[CompStatus],
			[FundModel],
			[LearnActEndDate],
			[LearnAimRef],
			[LearnPlanEndDate],
			[LearnStartDate],
			[LrnDelFAM_LDM1],
			[LrnDelFAM_LDM2],
			[LrnDelFAM_LDM3],
			[LrnDelFAM_LDM4],
			[LrnDelFAM_SOF],
			[ProgType]
		)
select
	[LearnRefNumber],
	[AimSeqNumber],
	[AimType],
	[CompStatus],
	[FundModel],
	[LearnActEndDate],
	[LearnAimRef],
	[LearnPlanEndDate],
	[LearnStartDate],
	[LrnDelFAM_LDM1],
	[LrnDelFAM_LDM2],
	[LrnDelFAM_LDM3],
	[LrnDelFAM_LDM4],
	[LrnDelFAM_SOF],
	[ProgType]
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
			[OutStartDate]
		)
select
	[LearnRefNumber],
	[OutType],
	[OutCode],
	[OutStartDate]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[DPOutcome]
where
	[DPOutcome].[UKPRN]=$(UKPRN)
go

