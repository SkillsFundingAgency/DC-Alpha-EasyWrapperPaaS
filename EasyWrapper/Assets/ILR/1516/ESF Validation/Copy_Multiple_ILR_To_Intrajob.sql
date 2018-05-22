-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 15 September 2016 08:35
-- Profile: Test Harness Validation
-- Rulebase Version: ILR ESF Validation 1516, Drop 000, Version 1516.13
-- =====================================================================================================
use [$(IntrajobDatabase)]
go
insert into
	[Valid].[LearningProvider]
		(
			[LearningProvider_Id],
			[UKPRN]
		)
select
	[LearningProvider_Id],
	[UKPRN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningProviderDenorm] LearningProvider
where
	[LearningProvider].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[Learner]
		(
			[Learner_Id],
			[DateOfBirth],
			[LearnRefNumber],
			[PriorAttain]
		)
select
	[Learner_Id],
	[DateOfBirth],
	[LearnRefNumber],
	[PriorAttain]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerDenorm] Learner
where
	[Learner].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[LearningDelivery]
		(
			[LearningDelivery_Id],
			[AimSeqNumber],
			[AimType],
			[CompStatus],
			[ConRefNumber],
			[DelLocPostCode],
			[EmpOutcome],
			[FundModel],
			[FworkCode],
			[LearnAimRef],
			[LearnActEndDate],
			[LearnPlanEndDate],
			[LearnStartDate],
			[OrigLearnStartDate],
			[Outcome],
			[OutGrade],
			[ProgType],
			[PwayCode]
		)
select
	[LearningDelivery_Id],
	[AimSeqNumber],
	[AimType],
	[CompStatus],
	[ConRefNumber],
	[DelLocPostCode],
	[EmpOutcome],
	[FundModel],
	[FworkCode],
	[LearnAimRef],
	[LearnActEndDate],
	[LearnPlanEndDate],
	[LearnStartDate],
	[OrigLearnStartDate],
	[Outcome],
	[OutGrade],
	[ProgType],
	[PwayCode]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDeliveryDenorm] LearningDelivery
where
	[LearningDelivery].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[LearningDeliveryFAM]
		(
			[LearningDeliveryFAM_Id],
			[LearnDelFAMCode],
			[LearnDelFAMDateFrom],
			[LearnDelFAMDateTo],
			[LearnDelFAMType]
		)
select
	[LearningDeliveryFAM_Id],
	[LearnDelFAMCode],
	[LearnDelFAMDateFrom],
	[LearnDelFAMDateTo],
	[LearnDelFAMType]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDeliveryFAMDenorm] LearningDeliveryFAM
where
	[LearningDeliveryFAM].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[LearnerEmploymentStatus]
		(
			[LearnerEmploymentStatus_Id],
			[DateEmpStatApp],
			[EmpId],
			[EmpStat]
		)
select
	[LearnerEmploymentStatus_Id],
	[DateEmpStatApp],
	[EmpId],
	[EmpStat]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerEmploymentStatusDenorm] LearnerEmploymentStatus
where
	[LearnerEmploymentStatus].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[EmploymentStatusMonitoring]
		(
			[EmploymentStatusMonitoring_Id],
			[ESMCode],
			[ESMType]
		)
select
	[EmploymentStatusMonitoring_Id],
	[ESMCode],
	[ESMType]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[EmploymentStatusMonitoringDenorm] EmploymentStatusMonitoring
where
	[EmploymentStatusMonitoring].[UKPRN]=$(UKPRN)
go

