-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 25 April 2017 09:06
-- Profile: Test Harness Validation
-- Rulebase Version: ILR Validation Learner 1617, Version 1617.07
-- =====================================================================================================
use [$(IntrajobDatabase)]
go
insert into [Input].[LearningProvider] (
	[LearningProvider_Id],
	[UKPRN]
)
select
	[PK_LearningProvider],
	[UKPRN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningProvider]
go

insert into [Input].[CollectionDetails] (
	[CollectionDetails_Id]
	,[Collection]
	,[FilePreparationDate]
	,[Year]
)
select
	[PK_CollectionDetails]
	,[Collection]
	,[FilePreparationDate]
	,[Year]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[CollectionDetails]
go

insert into [Input].[Learner] (
	[Learner_Id],
	[LearnRefNumber],
	[Accom],
	[ALSCost],
	[DateOfBirth],
	[EngGrade],
	[Ethnicity],
	[FamilyName],
	[GivenNames],
	[LLDDHealthProb],
	[MathGrade],
	[NINumber],
	[PlanEEPHours],
	[PlanLearnHours],
	[PrevUKPRN],
	[PMUKPRN],
	[PriorAttain],
	[Sex],
	[ULN],
	[PostcodePrior],
	[Postcode],
	[AddLine1],
	[AddLine2],
	[AddLine3] ,
	[AddLine4],
	[TelNo] ,
	[Email]
)
select
	[PK_Learner],
	[LearnRefNumber],
	[Accom],
	[ALSCost],
	[DateOfBirth],
	[EngGrade],
	[Ethnicity],
	[FamilyName],
	[GivenNames],
	[LLDDHealthProb],
	[MathGrade],
	[NINumber],
	[PlanEEPHours],
	[PlanLearnHours],
	[PrevUKPRN],
	[PMUKPRN],
	[PriorAttain],
	[Sex],
	[ULN],
	[PostcodePrior],
	[Postcode],
	[AddLine1],
	[AddLine2],
	[AddLine3] ,
	[AddLine4],
	[TelNo] ,
	[Email]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[Learner]
go

insert into [Input].[LearningDelivery] (
	[LearningDelivery_Id],
	[Learner_Id],
	[AimSeqNumber],
	[AchDate],
	[AddHours],
	[AimType],
	[CompStatus],
	[ConRefNumber],
	[DelLocPostCode],
	[EmpOutcome],
	[FundModel],
	[FworkCode],
	[LearnActEndDate],
	[LearnAimRef],
	[LearnPlanEndDate],
	[LearnStartDate],
	[OrigLearnStartDate],
	[OtherFundAdj],
	[Outcome],
	[OutGrade],
	[PartnerUKPRN],
	[PriorLearnFundAdj],
	[ProgType],
	[PwayCode],
	[StdCode],
	[SWSupAimId],
	[WithdrawReason]
)
select
	[PK_LearningDelivery],
	[FK_Learner],
	[AimSeqNumber],
	[AchDate],
	[AddHours],
	[AimType],
	[CompStatus],
	[ConRefNumber],
	[DelLocPostCode],
	[EmpOutcome],
	[FundModel],
	[FworkCode],
	[LearnActEndDate],
	[LearnAimRef],
	[LearnPlanEndDate],
	[LearnStartDate],
	[OrigLearnStartDate],
	[OtherFundAdj],
	[Outcome],
	[OutGrade],
	[PartnerUKPRN],
	[PriorLearnFundAdj],
	[ProgType],
	[PwayCode],
	[StdCode],
	[SWSupAimId],
	[WithdrawReason]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDelivery]
go

insert into [Input].[LearningDeliveryFAM] (
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

insert into [Input].[LearningDeliveryHE] (
	[LearningDeliveryHE_Id],
	[LearningDelivery_Id],
	[DOMICILE],
	[ELQ],
	[FUNDCOMP],
	[FUNDLEV],
	[GROSSFEE],
	[HEPostCode],
	[MODESTUD],
	[MSTUFEE],
	[NETFEE],
	[NUMHUS],
	[PCFLDCS],
	[PCOLAB],
	[PCSLDCS],
	[PCTLDCS],
	[QUALENT3],
	[SEC],
	[SOC2000],
	[SPECFEE],
	[SSN],
	[STULOAD],
	[TYPEYR],
	[UCASAPPID]
)
select
	[PK_LearningDeliveryHE],
	[FK_LearningDelivery],
	[DOMICILE],
	[ELQ],
	[FUNDCOMP],
	[FUNDLEV],
	[GROSSFEE],
	[HEPostCode],
	[MODESTUD],
	[MSTUFEE],
	[NETFEE],
	[NUMHUS],
	[PCFLDCS],
	[PCOLAB],
	[PCSLDCS],
	[PCTLDCS],
	[QUALENT3],
	[SEC],
	[SOC2000],
	[SPECFEE],
	[SSN],
	[STULOAD],
	[TYPEYR],
	[UCASAPPID]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDeliveryHE]
go

insert into [Input].[ProviderSpecDeliveryMonitoring] (
	[ProviderSpecDeliveryMonitoring_Id],
	[LearningDelivery_Id],
	[ProvSpecDelMonOccur],
	[ProvSpecDelMon]
)
select
	[PK_ProviderSpecDeliveryMonitoring],
	[FK_LearningDelivery],
	[ProvSpecDelMonOccur],
	[ProvSpecDelMon]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[ProviderSpecDeliveryMonitoring]
go

insert into [Input].[LearningDeliveryWorkPlacement] (
	[LearningDeliveryWorkPlacement_Id],
	[LearningDelivery_Id],
	[WorkPlaceStartDate],
	[WorkPlaceMode],
	[WorkPlaceEmpId],
	[WorkPlaceEndDate]
)
select
	[PK_LearningDeliveryWorkPlacement],
	[FK_LearningDelivery],
	[WorkPlaceStartDate],
	[WorkPlaceMode],
	[WorkPlaceEmpId],
	[WorkPlaceEndDate]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningDeliveryWorkPlacement]
go

insert into [Input].[LearnerEmploymentStatus] (
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

insert into [Input].[AppFinRecord] (
	[AppFinRecord_Id],
	[LearningDelivery_Id],
	[AFinType],
	[AFinAmount],
	[AFinCode],
	[AFinDate]
)
select
	[PK_AppFinRecord],
	[FK_LearningDelivery],
	[AFinType],
	[AFinAmount],
	[AFinCode],
	[AFinDate]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[AppFinRecord]
go

insert into [Input].[LearnerFAM] (
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

insert into [Input].[EmploymentStatusMonitoring] (
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

insert into [Input].[ContactPreference] (
	[ContactPreference_Id],
	[Learner_Id],
	[ContPrefType],
	[ContPrefCode]
)
select
	[PK_ContactPreference],
	[FK_Learner],
	[ContPrefType],
	[ContPrefCode]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[ContactPreference]
go

insert into [Input].[LLDDandHealthProblem] (
	[LLDDandHealthProblem_Id],
	[Learner_Id],
	[LLDDCat],
	[PrimaryLLDD]
)
select
	[PK_LLDDandHealthProblem],
	[FK_Learner],
	[LLDDCat],
	[PrimaryLLDD]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LLDDandHealthProblem]
go

insert into [Input].[LearnerHE] (
	[LearnerHE_Id],
	[Learner_Id],
	[TTACCOM],
	[UCASPERID]
)
select
	[PK_LearnerHE],
	[FK_Learner],
	[TTACCOM],
	[UCASPERID]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerHE]
go

insert into [Input].[LearnerHEFinancialSupport] (
	[LearnerHEFinancialSupport_Id],
	[LearnerHE_Id],
	[FINTYPE]
)
select
	[PK_LearnerHEFinancialSupport],
	[FK_LearnerHE],
	[FINTYPE]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerHEFinancialSupport]
go

insert into [Input].[ProviderSpecLearnerMonitoring] (
	[ProviderSpecLearnerMonitoring_Id],
	[Learner_Id],
	[ProvSpecLearnMonOccur]
)
select
	[PK_ProviderSpecLearnerMonitoring],
	[FK_Learner],
	[ProvSpecLearnMonOccur]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[ProviderSpecLearnerMonitoring]
go

insert into [Input].[LearnerDestinationandProgression] (
	[LearnerDestinationandProgression_Id],
	[LearnRefNumber],
	[ULN]
)
select
	[PK_LearnerDestinationandProgression],
	[LearnRefNumber],
	[ULN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerDestinationandProgression]
go

insert into [Input].[DPOutcome] (
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