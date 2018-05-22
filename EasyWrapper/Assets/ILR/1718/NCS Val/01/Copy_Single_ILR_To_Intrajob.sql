-- =====================================================================================================
-- Cranked by hand
-- Date: 8TH JUNE 2017
-- Profile: 
-- Rulebase Version: ILR NCS Validation, Version 1718.01
-- =====================================================================================================
use [$(IntrajobDatabase)]
go

insert into [Input].[CollectionDetails] (
	[CollectionDetails_Id]
	,[FilePreparationDate]
	,[CalendarMonth]
	,[CalendarYear]
)
select
	[CollectionDetails_Id]
	,[FilePreparationDate]
	,[CalendarMonth]
	,[CalendarYear]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[CollectionDetailsDenorm] CollectionDetails
go

insert into [Input].[NCS_OffenderAggregate] (
	[NumberOfAccreditedLearningOutcomesInCustody]
	,[NumberOfCareerManagementOutcomesInCustody]
	,[NumberOf2ndCareerManagementOutcomesInCustody]
	,[NumberOfCareerProgressionOutcomesInCustody]
	,[NumberOfCustomerSatisfactionOutcomesInCustody]
	,[NumberOfCustomersSeenInCustody]
	,[NumberOfSustainableEmploymentOutcomesInCustody] 
)
select
	[NumberOfAccreditedLearningOutcomesInCustody]
	,[NumberOfCareerManagementOutcomesInCustody]
	,[NumberOf2ndCareerManagementOutcomesInCustody]
	,[NumberOfCareerProgressionOutcomesInCustody]
	,[NumberOfCustomerSatisfactionOutcomesInCustody]
	,[NumberOfCustomersSeenInCustody]
	,[NumberOfSustainableEmploymentOutcomesInCustody] 
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[NCS_OffenderAggregate]
go

insert into [Input].[NCS_Contractor] (
	[NumberOfEmployersActual]
	,[NumberOfSchoolsActual]
	,[TotalMonthlyInspirationSpendActual]
)
select
	[NumberOfEmployersActual]
	,[NumberOfSchoolsActual]
	,[TotalMonthlyInspirationSpendActual]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[NCS_Contractor]
go

insert into [Input].[Source] (
	[TouchpointID]
	,[UKPRN]
)
select
	[TouchpointID]
	,[UKPRN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[Source]
go

insert into [Input].[NCS_Customer] (
	[CdsCustomerID]
	,[CustomerType]
	,[DateOfBirth]
	,[DisabilityType]
	,[Ethnicity]
	,[EUCitizen]
	,[FamilyName]
	,[Gender]
	,[GivenName]
	,[LearningDifficulty]
	,[LLAAccountNumber]
	,[NINumber]
	,[ParticipateResearchEvaluation]
	,[TerminationOfServiceReason]
	,[TouchpointCustomerID]
)
select
	[CdsCustomerID]
	,[CustomerType]
	,[DateOfBirth]
	,[DisabilityType]
	,[Ethnicity]
	,[EUCitizen]
	,[FamilyName]
	,[Gender]
	,[GivenName]
	,[LearningDifficulty]
	,[LLAAccountNumber]
	,[NINumber]
	,[ParticipateResearchEvaluation]
	,[TerminationOfServiceReason]
	,[TouchpointCustomerID]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[NCS_Customer]
go

insert into [Input].[NCS_CustomerContact] (
	[AlternativePhoneNumber]
	,[ContactPreference]
	,[ContactEmail]
	,[PrimaryPhoneNumber] 
)
select
	[AlternativePhoneNumber]
	,[ContactPreference]
	,[ContactEmail]
	,[PrimaryPhoneNumber] 
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[NCS_CustomerContact]
go

insert into [Input].[NCS_CustomerAddress] (
	[AlternativePostCode]
	,[HomePostcode] 
)
select
	[AlternativePostCode]
	,[HomePostcode] 
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[NCS_CustomerAddress]
go

insert into [Input].[NCS_CustomerActionPlan] (
	[TouchpointCustomerID]
	,[ActionPlanID]
	,[BenefitType]
	,[MainDeliveryType]
	,[PriorityGroupL1]
	,[ReferralType]
	,[SessionDate]
	,[SourceOfAwarenessL1]
	,[SourceOfAwarenessL2] 
)
select
	[TouchpointCustomerID]
	,[ActionPlanID]
	,[BenefitType]
	,[MainDeliveryType]
	,[PriorityGroupL1]
	,[ReferralType]
	,[SessionDate]
	,[SourceOfAwarenessL1]
	,[SourceOfAwarenessL2] 
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[NCS_CustomerActionPlan]
go

insert into [Input].[NCS_CustomerOutcome] (
	[OutcomeAchieved]
	,[OutcomeClaimed]
	,[OutcomeEffectiveDate]
	,[OutcomeID]
	,[OutcomeType]
)
select
	[OutcomeAchieved]
	,[OutcomeClaimed]
	,[OutcomeEffectiveDate]
	,[OutcomeID]
	,[OutcomeType]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[NCS_CustomerOutcome]
go

insert into [Input].[NCS_CustomerPriorityGroups] (
	[PriorityGroup]
)
select
	[PriorityGroup]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[NCS_CustomerPriorityGroups]
go

insert into [Input].[NCS_CustomerEducationProgression] (
	[EducationAttainmentLevel]
)
select
	[EducationAttainmentLevel]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[NCS_CustomerEducationProgression]
go

insert into [Input].[NCS_CustomerEmploymentProgression] (
	[EmploymentStatus]
	,[LengthOfUnEmployment]
)
select
	[EmploymentStatus]
	,[LengthOfUnEmployment]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[NCS_CustomerEmploymentProgression]
go

insert into [Input].[NCS_CustomerLearningProgression] (
	[LearningStatus]
)
select
	[LearningStatus]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[NCS_CustomerLearningProgression]
go
