-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 24 August 2016 12:03
-- Profile: Test Harness Calculation
-- Rulebase Version: ILR EFA Calculation 1617, Drop 000, Version 1617.04
-- =====================================================================================================
use [$(IntrajobDatabase)]
go
insert into
	[Input].[LearningProvider]
		(
			[LearningProvider_Id],
			[UKPRN]
		)
select
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
			[DateOfBirth],
			[EngGrade],
			[MathGrade],
			[PlanEEPHours],
			[PlanLearnHours],
			[ULN]
		)
select
	[PK_Learner],
	[LearnRefNumber],
	[DateOfBirth],
	[EngGrade],
	[MathGrade],
	[PlanEEPHours],
	[PlanLearnHours],
	[ULN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[Learner]
go

insert into
	[Input].[LearnerFAM]
		(
			[LearnerFAM_Id],
			[Learner_Id],
			[LearnFAMType],
			[LearnFAMCode]
		)
select
	[PK_LearnerFAM],
	[FK_Learner],
	[LearnFAMType],
	[LearnFAMCode]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerFAM]
go

insert into
	[Input].[LearnerContact]
		(
			[LearnerContact_Id],
			[Learner_Id],
			[LocType],
			[ContType],
			[PostCode]
		)
select
	[PK_LearnerContact],
	[FK_Learner],
	[LocType],
	[ContType],
	[PostCode]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerContact]
go

insert into
	[Input].[LearningDelivery]
		(
			[LearningDelivery_Id],
			[Learner_Id],
			[AimSeqNumber],
			[AimType],
			[LearnAimRef],
			[CompStatus],
			[FundModel],
			[LearnActEndDate],
			[LearnPlanEndDate],
			[LearnStartDate],
			[ProgType],
			[WithdrawReason]
		)
select
	[PK_LearningDelivery],
	[FK_Learner],
	[AimSeqNumber],
	[AimType],
	[LearnAimRef],
	[CompStatus],
	[FundModel],
	[LearnActEndDate],
	[LearnPlanEndDate],
	[LearnStartDate],
	[ProgType],
	[WithdrawReason]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDelivery]
go

insert into
	[Input].[LearningDeliveryFAM]
		(
			[LearningDeliveryFAM_Id],
			[LearningDelivery_Id],
			[LearnDelFAMType],
			[LearnDelFAMDateFrom],
			[LearnDelFAMCode]
		)
select
	[PK_LearningDeliveryFAM],
	[FK_LearningDelivery],
	[LearnDelFAMType],
	[LearnDelFAMDateFrom],
	[LearnDelFAMCode]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDeliveryFAM]
go

insert into
	[Input].[DPOutcome]
		(
			[DPOutcome_Id],
			[LearnerDestinationandProgression_Id],
			[OutType],
			[OutCode],
			[OutStartDate]
		)
select
	[PK_DPOutcome],
	[FK_LearnerDestinationandProgression],
	[OutType],
	[OutCode],
	[OutStartDate]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[DPOutcome]
go

insert into
	[Input].[LearnerDestinationandProgression]
		(
			[LearnerDestinationandProgression_Id],
			[LearnRefNumber]
		)
select
	[PK_LearnerDestinationandProgression],
	[LearnRefNumber]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerDestinationandProgression]
go

