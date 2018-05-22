-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 08 March 2017 15:01
-- Profile: Test Harness Calculation
-- Rulebase Version: ILR Apprenticeship Earnings Calc 1617, Version 1617.16
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
			[ULN]
		)
select
	[PK_Learner],
	[LearnRefNumber],
	[DateOfBirth],
	[ULN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[Learner]
go

insert into
	[Input].[LearningDelivery]
		(
			[LearningDelivery_Id],
			[Learner_Id],
			[AimSeqNumber],
			[AimType],
			[CompStatus],
			[FworkCode],
			[LearnActEndDate],
			[LearnAimRef],
			[LearnPlanEndDate],
			[LearnStartDate],
			[OrigLearnStartDate],
			[OtherFundAdj],
			[PriorLearnFundAdj],
			[ProgType],
			[PwayCode],
			[StdCode],
			[FundModel]
		)
select
	[PK_LearningDelivery],
	[FK_Learner],
	[AimSeqNumber],
	[AimType],
	[CompStatus],
	[FworkCode],
	[LearnActEndDate],
	[LearnAimRef],
	[LearnPlanEndDate],
	[LearnStartDate],
	[OrigLearnStartDate],
	[OtherFundAdj],
	[PriorLearnFundAdj],
	[ProgType],
	[PwayCode],
	[StdCode],
	[FundModel]
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
			[LearnDelFAMCode],
			[LearnDelFAMDateTo]
		)
select
	[PK_LearningDeliveryFAM],
	[FK_LearningDelivery],
	[LearnDelFAMType],
	[LearnDelFAMDateFrom],
	[LearnDelFAMCode],
	[LearnDelFAMDateTo]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDeliveryFAM]
go

insert into
	[Input].[TrailblazerApprenticeshipFinancialRecord]
		(
			[TrailblazerApprenticeshipFinancialRecord_Id],
			[LearningDelivery_Id],
			[TBFinType],
			[TBFinAmount],
			[TBFinCode],
			[TBFinDate]
		)
select
	[PK_TrailblazerApprenticeshipFinancialRecord],
	[FK_LearningDelivery],
	[TBFinType],
	[TBFinAmount],
	[TBFinCode],
	[TBFinDate]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[TrailblazerApprenticeshipFinancialRecord]
go

insert into
	[Input].[LearnerEmploymentStatus]
		(
			[LearnerEmploymentStatus_Id],
			[Learner_Id],
			[DateEmpStatApp],
			[EmpId],
			[EmpStat]
		)
select
	[PK_LearnerEmploymentStatus],
	[FK_Learner],
	[DateEmpStatApp],
	[EmpId],
	[EmpStat]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerEmploymentStatus]
go

insert into
	[Input].[EmploymentStatusMonitoring]
		(
			[EmploymentStatusMonitoring_Id],
			[LearnerEmploymentStatus_Id],
			[ESMType],
			[ESMCode]
		)
select
	[PK_EmploymentStatusMonitoring],
	[FK_LearnerEmploymentStatus],
	[ESMType],
	[ESMCode]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[EmploymentStatusMonitoring]
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

