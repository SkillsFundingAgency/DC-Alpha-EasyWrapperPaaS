--Reference_Inserts

	truncate table [Reference].[LARS_AnnualValue]
	insert into
		[Reference].[LARS_AnnualValue]
		(
			BasicSkills
			,BasicSkillsParticipation
			,BasicSkillsType
			,EffectiveFrom
			,EffectiveTo
			,FullLevel2EntitlementCategory
			,[FullLevel2Percent]
			,[FullLevel3EntitlementCategory]
			,[FullLevel3Percent]
			,[LearnAimRef]
			,[SfaApprovalStatus]
		)
	select distinct
		[LARS_AnnualValue].[BasicSkills],
		[LARS_AnnualValue].[BasicSkillsParticipation],
		[LARS_AnnualValue].[BasicSkillsType],
		[LARS_AnnualValue].[EffectiveFrom],
		[LARS_AnnualValue].[EffectiveTo],
		[LARS_AnnualValue].[FullLevel2EntitlementCategory],
		[LARS_AnnualValue].[FullLevel2Percent],
		[LARS_AnnualValue].[FullLevel3EntitlementCategory],
		[LARS_AnnualValue].[FullLevel3Percent],
		[LARS_AnnualValue].[LearnAimRef],
		[LARS_AnnualValue].[SfaApprovalStatus]
	from
		[Input].[LearningDelivery]
		inner join [${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_AnnualValue]
			on [LARS_AnnualValue].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
	go

	truncate table [Reference].[LARS_Current_Version]
	insert into
		[Reference].[LARS_Current_Version]
		(
			[CurrentVersion]
		)
	select distinct
		[LARS_Current_Version].[CurrentVersion]
	from
		[${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_Current_Version]
	go
 
	truncate table [Reference].[LARS_Framework]
	insert into
		[Reference].[LARS_Framework]
		(
			EffectiveTo
			,FworkCode
			,ProgType
			,PwayCode
		)
	select distinct
		[LARS_Framework].[EffectiveTo],
		[LARS_Framework].[FworkCode],
		[LARS_Framework].[ProgType],
		[LARS_Framework].[PwayCode]
	from
		[Input].[LearningDelivery]
		inner join [${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_Framework]
		on [LARS_Framework].[FworkCode]=[LearningDelivery].[FworkCode]
		and [LARS_Framework].[ProgType]=[LearningDelivery].[ProgType]
	go

	truncate table [Reference].[LARS_FrameworkAims]
	insert into
		[Reference].[LARS_FrameworkAims]
		(
			EffectiveTo
			,FrameworkComponentType
			,FworkCode
			,LearnAimRef
			,ProgType
			,PwayCode
		)
	select distinct
		[LARS_FrameworkAims].[EffectiveTo],
		[LARS_FrameworkAims].[FrameworkComponentType],
		[LARS_FrameworkAims].[FworkCode],
		[LARS_FrameworkAims].[LearnAimRef],
		[LARS_FrameworkAims].[ProgType],
		[LARS_FrameworkAims].[PwayCode]
	from
		[Input].[LearningDelivery]
		inner join [${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_FrameworkAims]
			on [LARS_FrameworkAims].[FworkCode]=[LearningDelivery].[FworkCode]
		and [LARS_FrameworkAims].[ProgType]=[LearningDelivery].[ProgType]
		and [LARS_FrameworkAims].[PwayCode]=[LearningDelivery].[PwayCode]
		and [LARS_FrameworkAims].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
	go
 
	truncate table [Reference].[LARS_FrameworkCmnComp]
	insert into
		[Reference].[LARS_FrameworkCmnComp]
		(
			CommonComponent
			,EffectiveFrom
			,EffectiveTo
			,FworkCode
			,ProgType
			,PwayCode
		)
	select distinct
		[LARS_FrameworkCmnComp].[CommonComponent],
		[LARS_FrameworkCmnComp].[EffectiveFrom],
		[LARS_FrameworkCmnComp].[EffectiveTo],
		[LARS_FrameworkCmnComp].[FworkCode],
		[LARS_FrameworkCmnComp].[ProgType],
		[LARS_FrameworkCmnComp].[PwayCode]
	from
		[${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_FrameworkCmnComp]
		inner merge join 
		[${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_LearningDelivery]
				on [LARS_FrameworkCmnComp].[CommonComponent]=[LARS_LearningDelivery].[FrameworkCommonComponent]
		inner join [Input].[LearningDelivery]
			on[LARS_LearningDelivery].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
			and[LARS_FrameworkCmnComp].[FworkCode]=[LearningDelivery].[FworkCode]
			and[LARS_FrameworkCmnComp].[ProgType]=[LearningDelivery].[ProgType]
			and[LARS_FrameworkCmnComp].[PwayCode]=[LearningDelivery].[PwayCode]
	go
 
	truncate table [Reference].[LARS_LearningDelivery]
	insert into
		[Reference].[LARS_LearningDelivery]
		(
			AwardOrgAimRef
			,AwardOrgCode
			,CreditBasedFwkType
			,EFACOFType
			,[EnglandFEHEStatus]
			,[EnglPrscID]
			,[FrameworkCommonComponent]
			,[LearnAimRef]
			,[LearnAimRefTitle]
			,[LearnAimRefType]
			,[LearnDirectClassSystemCode1]
			,[LearnDirectClassSystemCode2]
			,[LearnDirectClassSystemCode3]
			,[LearningDeliveryGenre]
			,[NotionalNVQLevel]
			,[NotionalNVQLevelv2]
			,[RegulatedCreditValue]
			,[SectorSubjectAreaTier1]
			,[SectorSubjectAreaTier2]
			,[UnemployedOnly]
			,[UnitType]
			,[EffectiveFrom]
		)
	select distinct
		[LARS_LearningDelivery].[AwardOrgAimRef],
		[LARS_LearningDelivery].[AwardOrgCode],
		[LARS_LearningDelivery].[CreditBasedFwkType],
		[LARS_LearningDelivery].[EFACOFType],
		[LARS_LearningDelivery].[EnglandFEHEStatus],
		[LARS_LearningDelivery].[EnglPrscID],
		[LARS_LearningDelivery].[FrameworkCommonComponent],
		[LARS_LearningDelivery].[LearnAimRef],
		[LARS_LearningDelivery].[LearnAimRefTitle],
		[LARS_LearningDelivery].[LearnAimRefType],
		[LARS_LearningDelivery].[LearnDirectClassSystemCode1],
		[LARS_LearningDelivery].[LearnDirectClassSystemCode2],
		[LARS_LearningDelivery].[LearnDirectClassSystemCode3],
		[LARS_LearningDelivery].[LearningDeliveryGenre],
		[LARS_LearningDelivery].[NotionalNVQLevel],
		[LARS_LearningDelivery].[NotionalNVQLevelv2],
		[LARS_LearningDelivery].[RegulatedCreditValue],
		[LARS_LearningDelivery].[SectorSubjectAreaTier1],
		[LARS_LearningDelivery].[SectorSubjectAreaTier2],
		[LARS_LearningDelivery].[UnemployedOnly],
		[LARS_LearningDelivery].[UnitType],
		LARS_LearningDelivery.EffectiveFrom
	from
		[Input].[LearningDelivery]
		inner join [${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_LearningDelivery]
			on [LARS_LearningDelivery].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
	go
 
	truncate table [Reference].[LARS_LearningDeliveryCategory]
	insert into
		[Reference].[LARS_LearningDeliveryCategory]
		(
			CategoryRef
			,EffectiveFrom
			,EffectiveTo
			,LearnAimRef
		)
	select distinct
		[LARS_LearningDeliveryCategory].[CategoryRef],
		[LARS_LearningDeliveryCategory].[EffectiveFrom],
		[LARS_LearningDeliveryCategory].[EffectiveTo],
		[LARS_LearningDeliveryCategory].[LearnAimRef]
	from
		[${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_LearningDeliveryCategory]
		inner merge join 
			[${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_LearningDeliveryCategory_Children]
			on [LARS_LearningDeliveryCategory_Children].[CategoryRef]=[LARS_LearningDeliveryCategory].[CategoryRef]
		inner join [Input].[LearningDelivery]
			on[LARS_LearningDeliveryCategory].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
	go
 
	truncate table [Reference].[LARS_LearningDeliveryCategory_Children]
	insert into
		[Reference].[LARS_LearningDeliveryCategory_Children]
		(
			CategoryRef
			,ParentCategoryRef
			,RootCategoryRef
		)
	select distinct
		[LARS_LearningDeliveryCategory_Children].[CategoryRef],
		[LARS_LearningDeliveryCategory_Children].[ParentCategoryRef],
		[LARS_LearningDeliveryCategory_Children].[RootCategoryRef]
	from
		[${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_LearningDeliveryCategory_Children]
		inner merge join 
			[${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_LearningDeliveryCategory]
			on [LARS_LearningDeliveryCategory_Children].[CategoryRef]=[LARS_LearningDeliveryCategory].[CategoryRef]
		inner join [Input].[LearningDelivery]
			on[LARS_LearningDeliveryCategory].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
	go
 
	truncate table [Reference].[LARS_LearningDeliveryCategory_TopMostCategory]
	insert into
		[Reference].[LARS_LearningDeliveryCategory_TopMostCategory]
		(
			CategoryRef
			,LearnAimRef
		)
	select distinct
		[LARS_LearningDeliveryCategory_TopMostCategory].[CategoryRef],
		[LARS_LearningDeliveryCategory_TopMostCategory].[LearnAimRef]
	from
		[Input].[LearningDelivery]
		inner join [${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_LearningDeliveryCategory_TopMostCategory]
			on [LARS_LearningDeliveryCategory_TopMostCategory].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
		and [LARS_LearningDeliveryCategory_TopMostCategory].[CategoryRef]=9
	go
 
	truncate table [Reference].[LARS_Section96]
	insert into
		[Reference].[LARS_Section96]
		(
			LearnAimRef
			,[Section96ApprovalStatus]
			,[Section96ReviewDate]
			,[Section96Valid16to18]
		)
	select distinct
		[LARS_Section96].[LearnAimRef],
		[LARS_Section96].[Section96ApprovalStatus],
		[LARS_Section96].[Section96ReviewDate],
		[LARS_Section96].[Section96Valid16to18]
	from
		[Input].[LearningDelivery]
		inner join [${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_Section96]
			on [LARS_Section96].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
	go
 
	truncate table [Reference].[LARS_Standard]
	insert into
		[Reference].[LARS_Standard]
		(
			EffectiveTo
			,StandardCode
		)
	select distinct
		[LARS_Standard].[EffectiveTo],
		[LARS_Standard].[StandardCode]
	from
		[Input].[LearningDelivery]
		inner join [${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_Standard]
			on [LARS_Standard].[StandardCode]=[LearningDelivery].[StdCode]
	go
 
	truncate table [Reference].[LARS_StandardFunding]
	insert into
		[Reference].[LARS_StandardFunding]
		(
			[1618Incentive]
			,AchievementIncentive
			,CoreGovContributionCap
			,EffectiveFrom
			,EffectiveTo
			,FundableWithoutEmployer
			,FundingCategory
			,SmallBusinessIncentive
			,StandardCode
		)
	select distinct
		[LARS_StandardFunding].[1618Incentive],
		[LARS_StandardFunding].[AchievementIncentive],
		[LARS_StandardFunding].[CoreGovContributionCap],
		[LARS_StandardFunding].[EffectiveFrom],
		[LARS_StandardFunding].[EffectiveTo],
		[LARS_StandardFunding].[FundableWithoutEmployer],
		[LARS_StandardFunding].[FundingCategory],
		[LARS_StandardFunding].[SmallBusinessIncentive],
		[LARS_StandardFunding].[StandardCode]
	from
		[Input].[LearningDelivery]
		inner join [${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_StandardFunding]
			on [LARS_StandardFunding].[StandardCode]=[LearningDelivery].[StdCode]
			and [LARS_StandardFunding].[FundingCategory]='StandardTblazer'
	go
 
	truncate table [Reference].[LARS_Validity]
	insert into
		[Reference].[LARS_Validity]
		(
			EndDate
			,LastNewStartDate
			,LearnAimRef
			,StartDate
			,ValidityCategory
		)
	select distinct
		[LARS_Validity].[EndDate],
		[LARS_Validity].[LastNewStartDate],
		[LARS_Validity].[LearnAimRef],
		[LARS_Validity].[StartDate],
		[LARS_Validity].[ValidityCategory]
	from
		[Input].[LearningDelivery]
		inner join [${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_Validity]
			on [LARS_Validity].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
	go 

	truncate table [Reference].[Org_Current_Version]
	insert into
		[Reference].[Org_Current_Version]
		(
			CurrentVersion
		)
	select distinct
		[Org_Current_Version].[CurrentVersion]
	from
		[${ORG.FullyQualified}].[${Org.Schemaname}].[Org_Current_Version]
	go
 
	truncate table [Reference].[Org_Details]
	insert into
		[Reference].[Org_Details]
		(
			[LegalOrgType],
			[ThirdSector],
			[UKPRN]
		)
	select distinct
		[Org_Details].[LegalOrgType],
		[Org_Details].[ThirdSector],
		[Org_Details].[UKPRN]
	from
		[Input].[LearningProvider]
		inner join [${ORG.FullyQualified}].[${Org.Schemaname}].[Org_Details]
			on [Org_Details].[UKPRN]=[LearningProvider].[UKPRN]
	go
 
	truncate table [Reference].[Org_PartnerUKPRN]
	insert into
		[Reference].[Org_PartnerUKPRN]
		(
			UKPRN
		)
	 select
		[Org_PartnerUKPRN].[UKPRN]
	from
		[Input].[Learner]
		inner join [${ORG.FullyQualified}].[${Org.Schemaname}].[Org_PartnerUKPRN]
		on [Org_PartnerUKPRN].[UKPRN]=[Learner].[PrevUKPRN]
	union select
		[Org_PartnerUKPRN].[UKPRN]
	from
		[Input].[LearningDelivery]
		inner join [${ORG.FullyQualified}].[${Org.Schemaname}].[Org_PartnerUKPRN]
		on [Org_PartnerUKPRN].[UKPRN]=[LearningDelivery].[PartnerUKPRN]
	go
 
	truncate table [Reference].[LARS_ApprenticeshipFunding]
	insert into
		[Reference].[LARS_ApprenticeshipFunding]
		(
			[ApprenticeshipCode]
			,[ApprenticeshipType]
			,[ProgType]
			,[PwayCode]
			,[FundingCategory]
			,[EffectiveFrom]
			,[EffectiveTo]
			,[BandNumber]
			,[CoreGovContributuionCap]
			,[1618Incentive]
			,[1618ProviderAdditionalPayment]
			,[1618EmployerAdditionalPayment]
			,[1618FrameworkUplift]
			,[Duration]
			,[ReservedValue2]
			,[ReservedValue3]
			,[MaxEmployerLevyCap] 
			,[FundableWithoutEmployer]
		)
	 select
		[LARS_ApprenticeshipFunding].[ApprenticeshipCode]
		,[LARS_ApprenticeshipFunding].[ApprenticeshipType]
		,[LearningDelivery].[ProgType]
		,[LearningDelivery].[PwayCode]
		,[LARS_ApprenticeshipFunding].[FundingCategory]
		,[LARS_ApprenticeshipFunding].[EffectiveFrom]
		,[LARS_ApprenticeshipFunding].[EffectiveTo]
		,[LARS_ApprenticeshipFunding].[BandNumber]
		,[LARS_ApprenticeshipFunding].[CoreGovContributionCap]
		,[LARS_ApprenticeshipFunding].[1618Incentive]
		,[LARS_ApprenticeshipFunding].[1618ProviderAdditionalPayment]
		,[LARS_ApprenticeshipFunding].[1618EmployerAdditionalPayment]
		,[LARS_ApprenticeshipFunding].[1618FrameworkUplift]
		,[LARS_ApprenticeshipFunding].[Duration]
		,[LARS_ApprenticeshipFunding].[ReservedValue2]
		,[LARS_ApprenticeshipFunding].[ReservedValue3]
		,[LARS_ApprenticeshipFunding].[MaxEmployerLevyCap] 
		,[LARS_ApprenticeshipFunding].[FundableWithoutEmployer]
	from
		Input.[LearningDelivery]
		inner join 
			[${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_ApprenticeshipFunding]
				on [LARS_ApprenticeshipFunding].[ApprenticeshipType] = 'STD'
				and [LARS_ApprenticeshipFunding].[ApprenticeshipCode] = [LearningDelivery].[StdCode]
				and [LARS_ApprenticeshipFunding].[ProgType] = [LearningDelivery].[ProgType]
				and [LARS_ApprenticeshipFunding].[PwayCode] = 0

	union 
	
	select
		[LARS_ApprenticeshipFunding].[ApprenticeshipCode]
		,[LARS_ApprenticeshipFunding].[ApprenticeshipType]
		,[LearningDelivery].[ProgType]
		,[LearningDelivery].[PwayCode]
		,[LARS_ApprenticeshipFunding].[FundingCategory]
		,[LARS_ApprenticeshipFunding].[EffectiveFrom]
		,[LARS_ApprenticeshipFunding].[EffectiveTo]
		,[LARS_ApprenticeshipFunding].[BandNumber]
		,[LARS_ApprenticeshipFunding].[CoreGovContributuionCap]
		,[LARS_ApprenticeshipFunding].[1618Incentive]
		,[LARS_ApprenticeshipFunding].[1618ProviderAdditionalPayment]
		,[LARS_ApprenticeshipFunding].[1618EmployerAdditionalPayment]
		,[LARS_ApprenticeshipFunding].[1618FrameworkUplift]
		,[LARS_ApprenticeshipFunding].[Duration]
		,[LARS_ApprenticeshipFunding].[ReservedValue2]
		,[LARS_ApprenticeshipFunding].[ReservedValue3]
		,[LARS_ApprenticeshipFunding].[MaxEmployerLevyCap] 
		,[LARS_ApprenticeshipFunding].[FundableWithoutEmployer]
	from
		Input.[LearningDelivery]
		inner join
			[${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_ApprenticeshipFunding]
				on [LARS_ApprenticeshipFunding].[ApprenticeshipType] = 'FWK'
				and [LARS_ApprenticeshipFunding].[ApprenticeshipCode] = [LearningDelivery].[FworkCode]
				and [LARS_ApprenticeshipFunding].[ProgType] = [LearningDelivery].[ProgType]
				and [LARS_ApprenticeshipFunding].[PwayCode] = [LearningDelivery].[PwayCode]
	go

	truncate table [Reference].[LARS_StandardCommonComponent]
	insert into
		[Reference].[LARS_StandardCommonComponent]
		(
			[CommonComponent],
			[EffectiveFrom],
			[EffectiveTo],
			[StandardCode]
		)
	select distinct
		[LARS_StandardCommonComponent].[CommonComponent],
		[LARS_StandardCommonComponent].[EffectiveFrom],
		[LARS_StandardCommonComponent].[EffectiveTo],
		[LARS_StandardCommonComponent].[StandardCode]
	from
		[Input].[LearningDelivery]
		inner join [${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_StandardCommonComponent]
			on [LARS_StandardCommonComponent].[StandardCode]=[LearningDelivery].[StdCode]
	go

	truncate table Reference.ORG_HMPP_Postcode
	insert into 
		Reference.ORG_HMPP_Postcode
		(
			[HMPPPostcode]
			,[UKPRN]
			,[EffectiveFrom]
		)
	select
		[Org_HMPP_Postcode].[HMPPPostcode]
		,Org_HMPP_Postcode.UKPRN
		,Org_HMPP_Postcode.EffectiveFrom
	from
		Input.Learner
		cross join Input.LearningProvider
		inner join [${ORG.FullyQualified}].[${Org.Schemaname}].[Org_HMPP_Postcode]
			on [Org_HMPP_Postcode].[UKPRN]=[LearningProvider].[UKPRN]
			and Learner.Postcode = Org_HMPP_Postcode.HMPPPostcode
	go	

	 
	truncate table [Reference].[EFA_PostcodeDisadvantage]
	insert into
		[Reference].[EFA_PostcodeDisadvantage]
	select distinct
		[EFA_PostcodeDisadvantage].[Postcode],
		[EFA_PostcodeDisadvantage].[Uplift],
		[EFA_PostcodeDisadvantage].[EffectiveFrom],
		[EFA_PostcodeDisadvantage].[EffectiveTo]
	from
		[Valid].[Learner]
		inner join [${PostcodeFactorsReferenceData.FullyQualified}].[${PostcodeFactorsReferenceData.schemaname}].[EFA_PostcodeDisadvantage]
			on [EFA_PostcodeDisadvantage].[Postcode]=[Learner].[Postcode]
	go
 
	truncate table [Reference].[LargeEmployers]
	insert into
		[Reference].[LargeEmployers]
	select distinct
		[LargeEmployers].[EffectiveFrom],
		[LargeEmployers].[EffectiveTo],
		[LargeEmployers].[ERN]
	from
		[Valid].[LearnerEmploymentStatus]
		inner join [${Large_Employers_Reference_Data.FullyQualified}].[${Large_Employers_Reference_Data.schemaname}].[LargeEmployers]
			on [LargeEmployers].[ERN]=[LearnerEmploymentStatus].[EmpId]
	go
 
	truncate table [Reference].[LARS_Funding]
	insert into
		[Reference].[LARS_Funding]
	select distinct
		[LARS_Funding].[EffectiveFrom],
		[LARS_Funding].[EffectiveTo],
		[LARS_Funding].[FundingCategory],
		[LARS_Funding].[LearnAimRef],
		[LARS_Funding].[RateUnWeighted],
		[LARS_Funding].[RateWeighted],
		[LARS_Funding].[WeightingFactor]
	from
		[Valid].[LearningDelivery]
		inner join [${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_Funding]
			on [LARS_Funding].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
	go
 
	truncate table [Reference].[LARS_StandardCommonComponent]
	insert into
		[Reference].[LARS_StandardCommonComponent]
	select distinct
		[LARS_StandardCommonComponent].[CommonComponent],
		[LARS_StandardCommonComponent].[EffectiveFrom],
		[LARS_StandardCommonComponent].[EffectiveTo],
		[LARS_StandardCommonComponent].[StandardCode]
	from
		[Valid].[LearningDelivery]
		inner join [${UoD.FullyQualified}].[${LARS.schemaname}].[LARS_StandardCommonComponent]
			on [LARS_StandardCommonComponent].[StandardCode]=[LearningDelivery].[StdCode]
	go
	
	truncate table [Reference].[Org_Funding]
	insert into
		[Reference].[Org_Funding]
	select distinct
		[Org_Funding].[EffectiveFrom],
		[Org_Funding].[EffectiveTo],
		[Org_Funding].[FundingFactor],
		[Org_Funding].[FundingFactorType],
		[Org_Funding].[FundingFactorValue],
		[Org_Funding].[UKPRN]
	from
		[Valid].[LearningProvider]
		inner join [${ORG.FullyQualified}].[${Org.Schemaname}].[Org_Funding]
		on [Org_Funding].[UKPRN]=[LearningProvider].[UKPRN]
		and [Org_Funding].[FundingFactorType]='Adult Skills'
	go
 
	truncate table [Reference].[SFA_PostcodeAreaCost]
	insert into
		[Reference].[SFA_PostcodeAreaCost]
	select distinct
		[SFA_PostcodeAreaCost].[AreaCostFactor],
		[SFA_PostcodeAreaCost].[EffectiveFrom],
		[SFA_PostcodeAreaCost].[EffectiveTo],
		[SFA_PostcodeAreaCost].[Postcode]
	from
		[Valid].[LearningDelivery]
		inner join [${PostcodeFactorsReferenceData.FullyQualified}].[${PostcodeFactorsReferenceData.schemaname}].[SFA_PostcodeAreaCost]
			on [SFA_PostcodeAreaCost].[Postcode]=[LearningDelivery].[DelLocPostCode]
	go
 
	truncate table [Reference].[SFA_PostcodeDisadvantage]
	insert into
		[Reference].[SFA_PostcodeDisadvantage]
		(
			[Apprenticeship_Uplift],
			[EffectiveFrom],
			[EffectiveTo],
			[Postcode],
			[Uplift]
		)
	select distinct
		[SFA_PostcodeDisadvantage].[Apprenticeship_Uplift],
		[SFA_PostcodeDisadvantage].[EffectiveFrom],
		[SFA_PostcodeDisadvantage].[EffectiveTo],
		[SFA_PostcodeDisadvantage].[Postcode],
		[SFA_PostcodeDisadvantage].[Uplift]
	from
		[Valid].[Learner]
		inner join [${PostcodeFactorsReferenceData.FullyQualified}].[${PostcodeFactorsReferenceData.schemaname}].[SFA_PostcodeDisadvantage]
			on [SFA_PostcodeDisadvantage].[Postcode]=[Learner].[Postcode] 
	go
 
	truncate table Reference.AEC_LatestInYearEarningHistory
	insert into Reference.AEC_LatestInYearEarningHistory
		(
			[AppIdentifier],
			[AppProgCompletedInTheYearInput],
			[CollectionYear],
			[CollectionReturnCode],
			[DaysInYear],		
			[FworkCode],
			[HistoricEffectiveTNPStartDateInput],
			HistoricEmpIdEndWithinYear,
			HistoricEmpIdStartsWithinYear,
			[HistoricLearner1618StartInput],
			[HistoricPMRAmount],
			[HistoricTNP1Input],
			[HistoricTNP2Input],
			[HistoricTNP3Input],
			[HistoricTNP4Input],
			[HistoricTotal1618UpliftPaymentsInTheYearInput],
			[HistoricVirtualTNP3EndOfTheYearInput],
			[HistoricVirtualTNP4EndOfTheYearInput],
			[LearnRefNumber],
			[ProgrammeStartDateIgnorePathway],
			[ProgrammeStartDateMatchPathway],
			[ProgType],
			[PwayCode],		
			[STDCode],		
			[TotalProgAimPaymentsInTheYear],
			[UptoEndDate],
			[UKPRN],
			[ULN]	
		)
	select
		aec.[AppIdentifier],
		aec.[AppProgCompletedInTheYearInput],
		aec.[CollectionYear],
		aec.[CollectionReturnCode],
		aec.[DaysInYear],		
		aec.[FworkCode],
		aec.[HistoricEffectiveTNPStartDateInput],
		aec.HistoricEmpIdEndWithinYear,
		aec.HistoricEmpIdStartsWithinYear,
		aec.[HistoricLearner1618StartInput],
		aec.[HistoricPMRAmount],
		aec.[HistoricTNP1Input],
		aec.[HistoricTNP2Input],
		aec.[HistoricTNP3Input],
		aec.[HistoricTNP4Input],
		aec.[HistoricTotal1618UpliftPaymentsInTheYearInput],
		aec.[HistoricVirtualTNP3EndOfTheYearInput],
		aec.[HistoricVirtualTNP4EndOfTheYearInput],
		aec.[LearnRefNumber],
		aec.[ProgrammeStartDateIgnorePathway],
		aec.[ProgrammeStartDateMatchPathway],
		aec.[ProgType],
		aec.[PwayCode],		
		aec.[STDCode],		
		aec.[TotalProgAimPaymentsInTheYear],
		aec.[UptoEndDate],
		aec.[UKPRN],
		aec.[ULN]
	from
		Vallid.Learner as l
		cross join (select top 1 UKPRN from Valid.LearningProvider) as lp
		join [${DAS_EarningsHistoryRD.databasename}].[${DAS_EarningsHistoryRD.schemaname}].[AEC_LatestInYearEarningHistory] as aec
			on aec.LearnRefNumber = aec
			and lp.UKPRN = aec.UKPRN
			and l.ULN = aec.ULN
	go

	truncate table [Reference].[Lot]
	insert into
		[Reference].[Lot]
		(
			[CalcMethod]
			,[LotReference]
			,[TenderSpecificationReference]
		)
	select distinct
		[Lot].[CalcMethod],
		[Lot].[LotReference],
		[Lot].[TenderSpecificationReference]
	from
		${ESF_Contract_Reference_Data.FQ}.dbo.[Lot]
		inner merge join 
			[${ESF_Contract_Reference_Data.FQ}].[dbo].[ContractAllocation]
				on [Lot].[TenderSpecificationReference]=[ContractAllocation].[TenderSpecReference]
				and [Lot].[LotReference]=[ContractAllocation].[LotReference]
		inner join 
			[Valid].[LearningDelivery]
				on[ContractAllocation].[ContractAllocationNumber]=[LearningDelivery].[ConRefNumber]
	go

	truncate table [Reference].[DeliverableCodeMappings]
	insert into
		[Reference].[DeliverableCodeMappings] 
		(
			[ExternalDeliverableCode]
			,[FCSDeliverableCode]
			,[FundingStreamPeriodCode]
			,[DeliverableName]
		)
	select distinct
		[DeliverableCodeMappings].[ExternalDeliverableCode],
		[DeliverableCodeMappings].[FCSDeliverableCode],
		[DeliverableCodeMappings].[FundingStreamPeriodCode],
		[DeliverableCodeMappings].[DeliverableName]
	from
		[${FCS-Contracts.databasename}].dbo.[DeliverableCodeMappings]
	inner merge join 
		[${FCS-Contracts.databasename}].[dbo].[vw_ContractDescription]
			on [DeliverableCodeMappings].[FundingStreamPeriodCode]=[vw_ContractDescription].[fundingStreamPeriodCode]
			and [DeliverableCodeMappings].[FCSDeliverableCode]=[vw_ContractDescription].[deliverableCode]
	inner join 
		[Valid].[LearningDelivery]
			on[vw_ContractDescription].[contractAllocationNumber]=[LearningDelivery].[ConRefNumber]
	go

	truncate table [Reference].[vw_ContractDescription]
	insert into
		[Reference].[vw_ContractDescription]
		(
			[contractAllocationNumber]
			,[contractEndDate]
			,[contractStartDate]
			,[deliverableCode]
			,[fundingStreamPeriodCode]
			,[learningRatePremiumFactor]
			,[unitCost]
		)
	select distinct
		[vw_ContractDescription].[contractAllocationNumber],
		[vw_ContractDescription].[contractEndDate],
		[vw_ContractDescription].[contractStartDate],
		[vw_ContractDescription].[deliverableCode],
		[vw_ContractDescription].[fundingStreamPeriodCode],
		[vw_ContractDescription].[learningRatePremiumFactor],
		[vw_ContractDescription].[unitCost]
	from
		[${FCS-Contracts.databasename}].dbo.[vw_ContractDescription]
	inner merge join 
		[${FCS-Contracts.databasename}].[dbo].[DeliverableCodeMappings]
			on [DeliverableCodeMappings].[FundingStreamPeriodCode]=[vw_ContractDescription].[fundingStreamPeriodCode]
			and [DeliverableCodeMappings].[FCSDeliverableCode]=[vw_ContractDescription].[deliverableCode]
	inner join 
		[Valid].[LearningDelivery]
			on[vw_ContractDescription].[contractAllocationNumber]=[LearningDelivery].[ConRefNumber]
	go

	truncate table [Reference].[ContractAllocation]
	insert into
		[Reference].[ContractAllocation]
	select distinct
		[ContractAllocation].[ContractAllocationNumber],
		[ContractAllocation].[LotReference],
		[ContractAllocation].[TenderSpecReference]
	from
		[${ESF_Contract_Reference_Data.FQ}].dbo.[ContractAllocation]
	inner merge join 
		[${ESF_Contract_Reference_Data.FQ}].[dbo].[EligibilityRule]
			on [EligibilityRule].[TenderSpecificationReference]=[ContractAllocation].[TenderSpecReference]
			and [EligibilityRule].[LotReference]=[ContractAllocation].[LotReference]
	inner join
		[Input].[LearningDelivery]
			on[ContractAllocation].[ContractAllocationNumber]=[LearningDelivery].[ConRefNumber]
	go
 
	truncate table [Reference].[EligibilityRule]
	insert into
		[Reference].[EligibilityRule]
	select distinct
		[EligibilityRule].[Benefits],
		[EligibilityRule].[LotReference],
		[EligibilityRule].[MaxAge],
		[EligibilityRule].[MaxLengthOfUnemployment],
		[EligibilityRule].[MaxPriorAttainment],
		[EligibilityRule].[MinAge],
		[EligibilityRule].[MinLengthOfUnemployment],
		[EligibilityRule].[MinPriorAttainment],
		[EligibilityRule].[TenderSpecificationReference]
	from
		[${ESF_Contract_Reference_Data.FQ}].dbo.[EligibilityRule]
	inner merge join 
		[${ESF_Contract_Reference_Data.FQ}].[dbo].[ContractAllocation]
			on [EligibilityRule].[TenderSpecificationReference]=[ContractAllocation].[TenderSpecReference]
			and [EligibilityRule].[LotReference]=[ContractAllocation].[LotReference]
	inner join 
		[Input].[LearningDelivery]
			on [ContractAllocation].[ContractAllocationNumber]=[LearningDelivery].[ConRefNumber]
	go
 
	truncate table [Reference].[EligibilityRuleEmploymentStatus]
	insert into
		[Reference].[EligibilityRuleEmploymentStatus]
	select distinct
		[LotReference],
		[TenderSpecificationReference],
		[EligibilityRuleEmploymentStatus].[EmploymentStatusCode]
	from
		[${ESF_Contract_Reference_Data.FQ}].dbo.[EligibilityRuleEmploymentStatus]
	go
 
	truncate table [Reference].[EligibilityRuleLocalAuthority]
	insert into
		[Reference].[EligibilityRuleLocalAuthority]
	select distinct
		[LotReference],
		[TenderSpecificationReference],
		[EligibilityRuleLocalAuthority].[LocalAuthorityCode]
	from
		[${ESF_Contract_Reference_Data.FQ}].dbo.[EligibilityRuleLocalAuthority]
	go
 
	truncate table [Reference].[EligibilityRuleLocalEnterprisePartnership]
	insert into
		[Reference].[EligibilityRuleLocalEnterprisePartnership]
	select distinct
		[LotReference],
		[TenderSpecificationReference],
		[EligibilityRuleLocalEnterprisePartnership].[LocalEnterprisePartnershipCode]
	from
		[${ESF_Contract_Reference_Data.FQ}].dbo.[EligibilityRuleLocalEnterprisePartnership]
	go
 
	truncate table [Reference].[EligibilityRuleSectorSubjectAreaLevel]
	insert into
		[Reference].[EligibilityRuleSectorSubjectAreaLevel]
	select distinct
		[LotReference],
		[TenderSpecificationReference],
		[EligibilityRuleSectorSubjectAreaLevel].[MaxLevelCode],
		[EligibilityRuleSectorSubjectAreaLevel].[MinLevelCode],
		[EligibilityRuleSectorSubjectAreaLevel].[SectorSubjectAreaCode]
	from
		[${ESF_Contract_Reference_Data.FQ}].dbo.[EligibilityRuleSectorSubjectAreaLevel]
	go
	
	truncate table [Reference].[ONS_Postcode]
	insert into
		[Reference].[ONS_Postcode]
	select distinct
		[ONS_Postcode].[doterm],
		[ONS_Postcode].[EffectiveFrom],
		[ONS_Postcode].[EffectiveTo],
		[ONS_Postcode].[lep1],
		[ONS_Postcode].[lep2],
		[ONS_Postcode].[oslaua],
		[ONS_Postcode].[pcds]
	from
		[Input].[LearningDelivery]
		inner merge join 
			[${ONS_Postcode_Directory.databasename}].[dbo].[ONS_Postcode]
				on [ONS_Postcode].[pcds]=[LearningDelivery].[DelLocPostCode]
	go	

	truncate table Reference.AEC_LatestInYearEarningHistory
	insert into Reference.AEC_LatestInYearEarningHistory
	(
		[AppIdentifier]
		,[AppProgCompletedInTheYearInput]
		,[CollectionYear] 
		,[CollectionReturnCode]
		,[DaysInYear]
		,[FworkCode] 
		,[HistoricEffectiveTNPStartDateInput]
		,HistoricEmpIdEndWithinYear
		,HistoricEmpIdStartWithinYear
		,[HistoricLearner1618StartInput]
		,[HistoricPMRAmount]
		,[HistoricTNP1Input]
		,[HistoricTNP2Input] 
		,[HistoricTNP3Input] 
		,[HistoricTNP4Input] 
		,[HistoricTotal1618UpliftPaymentsInTheYearInput]
		,[HistoricVirtualTNP3EndOfTheYearInput]
		,[HistoricVirtualTNP4EndOfTheYearInput]
		,LatestInYear
		,[LearnRefNumber]
		,[ProgrammeStartDateIgnorePathway]
		,[ProgrammeStartDateMatchPathway]
		,[ProgType]
		,[PwayCode]
		,[STDCode] 
		,[TotalProgAimPaymentsInTheYear]
		,[UptoEndDate]
		,[UKPRN]
		,[ULN]
	)
	select
		aec.[AppIdentifier]
		,aec.[AppProgCompletedInTheYearInput]
		,aec.[CollectionYear] 
		,aec.[CollectionReturnCode]
		,aec.[DaysInYear]
		,aec.[FworkCode] 
		,aec.[HistoricEffectiveTNPStartDateInput]
		,aec.HistoricEmpIdEndWithinYear
		,aec.HistoricEmpIdStartWithinYear
		,aec.[HistoricLearner1618StartInput]
		,aec.[HistoricPMRAmount]
		,aec.[HistoricTNP1Input]
		,aec.[HistoricTNP2Input] 
		,aec.[HistoricTNP3Input] 
		,aec.[HistoricTNP4Input] 
		,aec.[HistoricTotal1618UpliftPaymentsInTheYearInput]
		,aec.[HistoricVirtualTNP3EndOfTheYearInput]
		,aec.[HistoricVirtualTNP4EndOfTheYearInput]
		,1
		,aec.[LearnRefNumber]
		,aec.[ProgrammeStartDateIgnorePathway]
		,aec.[ProgrammeStartDateMatchPathway]
		,aec.[ProgType]
		,aec.[PwayCode]
		,aec.[STDCode] 
		,aec.[TotalProgAimPaymentsInTheYear]
		,aec.[UptoEndDate]
		,aec.[UKPRN]
		,aec.[ULN]
	from
		Valid.Learner l
		cross join (select top 1 UKPRN from Valid.LearningProvider) as lp
		join
			[${DAS_EarningsHistoryRD.databasename}].[${DAS_EarningsHistoryRD.schemaname}].AEC_LatestInYearEarningHistory as aec
				on aec.LearnRefNumber = l.LearnRefNumber
				and aec.ULN = l.ULN
				and aec.UKPRN = lp.UKPRN
	go

	truncate table [Reference].[UniqueLearnerNumbers]
insert into
	[Reference].[UniqueLearnerNumbers]
select fromtables.ULN FROM
(
    select
        ULN
    from
        [Input].[LearnerDestinationandProgression]
    union select
        ULN
    from
        [Input].[Learner]
) as [FromTables]
inner merge join
	[${ULN.databasename}].[dbo].[vwULN]
        on [UniqueLearnerNumbers].ULN = [FromTables].[ULN]
go

truncate table [Reference].[vw_ContractAllocation]
insert into
	[Reference].[vw_ContractAllocation]
select distinct
	[vw_ContractAllocation].[contractAllocationNumber],
	[vw_ContractAllocation].[startDate]
from
	[Input].[LearningDelivery]
	join [${FCS-Contracts.databasename}].[dbo].[vw_ContractAllocation]
		on [vw_ContractAllocation].[contractAllocationNumber]=[LearningDelivery].[ConRefNumber]
go

truncate table [Reference].[vw_ContractValidation]
insert into
	[Reference].[vw_ContractValidation]
select
[vw_ContractValidation].[contractAllocationNumber],
[vw_ContractValidation].[fundingStreamPeriodCode],
[vw_ContractValidation].[startDate],
[vw_ContractValidation].[UKPRN]
from
	[Input].[LearningProvider]
		inner join [${FCS-Contracts.databasename}].[dbo].[vw_ContractValidation]
	on [vw_ContractValidation].[UKPRN]=[LearningProvider].[UKPRN]
		and [vw_ContractValidation].[fundingStreamPeriodCode] in 
		(
			'16-18APPS1617',
			'ALLB1617',
			'ALLBC1617',
			'AAC1617',
			'AATO1617',
			'AEBC1617',
			'AEBTO-TOL1617',
			'ESF1420',
			'OLASS1617',
			'16-18NLA1617', 
			'ANLA1617', 
			'1618APPS1617', 
			'1618NLA1617', 
			'ANLA1718', 
			'ASC1617', 
			'LEVY1799', 
			'ASTO1617',
			'16-18APPS1718',
			'16-18NLA1718',
			'ALLBC1718',
			'ALLB1718',
			'AEBTO-TOL1718',
			'AEBC1718'
			,'AAPP1718'
		)
go

truncate table [Reference].[Employers]
insert into
	[Reference].[Employers]
SELECT
[FromTables].[URN]
FROM 
(
	select
		WorkPlaceEmpId 'URN'
	from
		[Input].[LearningDeliveryWorkPlacement]
	union select
		EmpId
	from
		[Input].[LearnerEmploymentStatus]
) as [FromTables]
INNER MERGE JOIN
	[${Employers.databasename}].[dbo].[Employers]
		ON [Employers].[URN]=[FromTables].[URN]
go