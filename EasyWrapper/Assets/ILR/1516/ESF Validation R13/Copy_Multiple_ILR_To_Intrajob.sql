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
			[UKPRN]
		)
select
	[UKPRN]
from
	[$(FromILRDatabase)].[Valid].[LearningProvider] LearningProvider
where
	[LearningProvider].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[Learner]
		(
			[DateOfBirth],
			[LearnRefNumber],
			[PriorAttain]
		)
select
	[DateOfBirth],
	[LearnRefNumber],
	[PriorAttain]
from
	[$(FromILRDatabase)].[Valid].[Learner] Learner
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
			[PwayCode],
			[LrnDelFAM_ADL],
			[LrnDelFAM_ASL],
			[LrnDelFAM_EEF],
			[LrnDelFAM_FFI],
			[LrnDelFAM_FLN],
			[LrnDelFAM_HEM1],
			[LrnDelFAM_HEM2],
			[LrnDelFAM_HEM3],
			[LrnDelFAM_HHS1],
			[LrnDelFAM_HHS2],
			[LrnDelFAM_LDM1],
			[LrnDelFAM_LDM2],
			[LrnDelFAM_LDM3],
			[LrnDelFAM_LDM4],
			[LrnDelFAM_NSA],
			[LrnDelFAM_POD],
			[LrnDelFAM_RES],
			[LrnDelFAM_SOF],
			[LrnDelFAM_SPP],
			[LrnDelFAM_WPP]
		)
select
	[LearnRefNumber],
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
	[PwayCode],
	[LrnDelFAM_ADL],
	[LrnDelFAM_ASL],
	[LrnDelFAM_EEF],
	[LrnDelFAM_FFI],
	[LrnDelFAM_FLN],
	[LrnDelFAM_HEM1],
	[LrnDelFAM_HEM2],
	[LrnDelFAM_HEM3],
	[LrnDelFAM_HHS1],
	[LrnDelFAM_HHS2],
	[LrnDelFAM_LDM1],
	[LrnDelFAM_LDM2],
	[LrnDelFAM_LDM3],
	[LrnDelFAM_LDM4],
	[LrnDelFAM_NSA],
	[LrnDelFAM_POD],
	[LrnDelFAM_RES],
	[LrnDelFAM_SOF],
	[LrnDelFAM_SPP],
	[LrnDelFAM_WPP]
from
	[$(FromILRDatabase)].[Valid].[LearningDelivery] LearningDelivery
where
	[LearningDelivery].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[LearningDeliveryFAM]
		(
			[LearnRefNumber],
			[AimSeqNumber],
			[LearnDelFAMCode],
			[LearnDelFAMDateFrom],
			[LearnDelFAMDateTo],
			[LearnDelFAMType]
		)
select
	[LearnRefNumber],
	[AimSeqNumber],
	[LearnDelFAMCode],
	[LearnDelFAMDateFrom],
	[LearnDelFAMDateTo],
	[LearnDelFAMType]
from
	[$(FromILRDatabase)].[Valid].[LearningDeliveryFAM] LearningDeliveryFAM
where
	[LearningDeliveryFAM].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[LearnerEmploymentStatus]
		(
			[LearnRefNumber],
			[DateEmpStatApp],
			[EmpId],
			[EmpStat],
			[EmpStatMon_BSI],
			[EmpStatMon_EII],
			[EmpStatMon_LOE],
			[EmpStatMon_LOU],
			[EmpStatMon_PEI],
			[EmpStatMon_SEI],
			[EmpStatMon_SEM]
		)
select
	[LearnRefNumber],
	[DateEmpStatApp],
	[EmpId],
	[EmpStat],
	[EmpStatMon_BSI],
	[EmpStatMon_EII],
	[EmpStatMon_LOE],
	[EmpStatMon_LOU],
	[EmpStatMon_PEI],
	[EmpStatMon_SEI],
	[EmpStatMon_SEM]
from
	[$(FromILRDatabase)].[Valid].[LearnerEmploymentStatus] LearnerEmploymentStatus
where
	[LearnerEmploymentStatus].[UKPRN]=$(UKPRN)
go
