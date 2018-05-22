-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 14 December 2016 11:09
-- Profile: Test Harness Calculation
-- Rulebase Version: ILR Apprenticeship Earnings Calc 1617, Version 1617.09
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
			[ULN],
			[HomePostcode]
		)
select
	[LearnRefNumber],
	[DateOfBirth],
	[ULN],
	[HomePostcode]
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
			[AimType],
			[CompStatus],
			[LearnAimRef],
			[FworkCode],
			[LearnActEndDate],
			[LearnPlanEndDate],
			[LearnStartDate],
			[LrnDelFAM_EEF],
			[OrigLearnStartDate],
			[OtherFundAdj],
			[PriorLearnFundAdj],
			[ProgType],
			[PwayCode],
			[StdCode],
			[FundModel]
		)
select
	[LearnRefNumber],
	[AimSeqNumber],
	[AimType],
	[CompStatus],
	[LearnAimRef],
	[FworkCode],
	[LearnActEndDate],
	[LearnPlanEndDate],
	[LearnStartDate],
	[LrnDelFAM_EEF],
	[OrigLearnStartDate],
	[OtherFundAdj],
	[PriorLearnFundAdj],
	[ProgType],
	[PwayCode],
	[StdCode],
	[FundModel]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDeliveryDenorm] LearningDelivery
where
	[LearningDelivery].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[TrailblazerApprenticeshipFinancialRecord]
		(
			[TBFinAmount],
			[TBFinCode],
			[TBFinDate],
			[TBFinType]
		)
select
	[TBFinAmount],
	[TBFinCode],
	[TBFinDate],
	[TBFinType]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[TrailblazerApprenticeshipFinancialRecord]
where
	[TrailblazerApprenticeshipFinancialRecord].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[LearningDeliveryFAM]
		(
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

insert into
	[Valid].[LearnerEmploymentStatus]
		(
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

