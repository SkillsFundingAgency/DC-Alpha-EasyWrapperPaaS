-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 28 July 2016 08:04
-- Profile: 1516 Test Harness Calculation
-- Rulebase Version: ILR Trailblazer Funding Calculation 1617, Drop 000, Version 1617.02
-- =====================================================================================================
use [$(IntrajobDatabase)]
go
insert into [Valid].[LearningProvider] (
	[UKPRN]
)
select
	[UKPRN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningProvider]
where
	[LearningProvider].[UKPRN]=$(UKPRN)
go

insert into [Valid].[Learner] (
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

insert into [Valid].[LearningDelivery] (
	[LearnRefNumber],
	[AimSeqNumber],
	[AchDate],
	[AimType],
	[CompStatus],
	[LearnAimRef],
	[LearnActEndDate],
	[LearnPlanEndDate],
	[LearnStartDate],
	[LrnDelFAM_EEF],
	[LrnDelFAM_FFI],
	[LrnDelFAM_LDM1],
	[LrnDelFAM_LDM2],
	[LrnDelFAM_LDM3],
	[LrnDelFAM_LDM4],
	[LrnDelFAM_RES],
	[LrnDelFAM_SOF],
	[LrnDelFAM_SPP],
	[OrigLearnStartDate],
	[OtherFundAdj],
	[Outcome],
	[PriorLearnFundAdj],
	[ProgType],
	[StdCode],
	[WithdrawReason],
	[FundModel]
)
select
	[LearnRefNumber],
	[AimSeqNumber],
	[AchDate],
	[AimType],
	[CompStatus],
	[LearnAimRef],
	[LearnActEndDate],
	[LearnPlanEndDate],
	[LearnStartDate],
	[LrnDelFAM_EEF],
	[LrnDelFAM_FFI],
	[LrnDelFAM_LDM1],
	[LrnDelFAM_LDM2],
	[LrnDelFAM_LDM3],
	[LrnDelFAM_LDM4],
	[LrnDelFAM_RES],
	[LrnDelFAM_SOF],
	[LrnDelFAM_SPP],
	[OrigLearnStartDate],
	[OtherFundAdj],
	[Outcome],
	[PriorLearnFundAdj],
	[ProgType],
	[StdCode],
	[WithdrawReason],
	[FundModel]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDeliveryDenorm] LearningDelivery
where
	[LearningDelivery].[UKPRN]=$(UKPRN)
go

insert into [Valid].[AppFinRecord] (
	[AFinAmount],
	[AFinCode],
	[AFinDate],
	[AFinType]
)
select
	[AFinAmount],
	[AFinCode],
	[AFinDate],
	[AFinType]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[AppFinRecord]
where
	[AppFinRecord].[UKPRN]=$(UKPRN)
go

insert into [Valid].[LearningDeliveryFAM] (
	[LearnDelFAMCode],
	[LearnDelFAMDateFrom],
	[LearnDelFAMDateTo],
	[LearnDelFAMType]
)
select
	[LearnDelFAMCode],
	[LearnDelFAMDateFrom],
	[LearnDelFAMDateTo],
	[LearnDelFAMType]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDeliveryFAM]
where
	[LearningDeliveryFAM].[UKPRN]=$(UKPRN)
go

insert into [Valid].[LearnerEmploymentStatus] (
	[LearnRefNumber],
	[DateEmpStatApp],
	[EmpId],
	[EmpStat],
	[EmpStatMon_SEM]
)
select
	[LearnRefNumber],
	[DateEmpStatApp],
	[EmpId],
	[EmpStat],
	[EmpStatMon_SEM]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerEmploymentStatusDenorm] LearnerEmploymentStatus
where
	[LearnerEmploymentStatus].[UKPRN]=$(UKPRN)
go

