if object_id('[Rulebase].[VAL_Get_Cases]','p') is not null
begin
	drop procedure [Rulebase].[VAL_Get_Cases]
end
go

create procedure [Rulebase].[VAL_Get_Cases] as

	begin
		set nocount on
		select
			CaseData
		from
			[Rulebase].[VAL_Cases]
	end
GO
if object_id('[Rulebase].[VAL_Insert_Cases]','p') is not null
begin
	drop procedure [Rulebase].[VAL_Insert_Cases]
end
GO

create procedure [Rulebase].[VAL_Insert_Cases] as

	begin
		set nocount on

		insert into
			[Rulebase].[VAL_Cases]
			(
				[Learner_Id],
				CaseData
			)
		select
			ControllingTable.[Learner_Id],
			convert(xml,
				(
					select
						cd.FilePreparationDate as [@FilePreparationDate]
						,case when '${dcft.runmode}' = 'DS' then 'true' else 'false' end as [@DesktopMode]
						,lp.UKPRN as [@UKPRN]
						,ocv.CurrentVersion as [@OrgVersion]
						,lv.CurrentVersion as [@LARSVersion]
						,case when [ESF1420Contract].UKPRN is not null then 'true' else 'false' end as [@FCT_ESF1420]
						,[Org_Details].[LegalOrgType] as [@LegalOrgType]
						,case when [LEVY1799Contract].UKPRN  is not null then 'true' else 'false' end as [@FCT_LEVY1799]
						,case when [ANLA1718Contract].UKPRN is not null then 'true' else 'false' end as [@FCT_ANLA1718]
						,case when [16-18NLA1718Contract].UKPRN is not null then 'true' else 'false' end as [@FCT_16-18NLA1718]
						,case when [ALLB1718Contract].UKPRN is not null then 'true' else 'false' end as [@FCT_ALLB1718]
						,case when [ALLBC1718Contract].UKPRN is not null then 'true' else 'false' end as [@FCT_ALLBC1718]
						,case when [AEBC1718Contract].UKPRN is not null then 'true' else 'false' end as [@FCT_AEBC1718]
						,case when [AEBTO-TOL1718Contract].UKPRN is not null then 'true' else 'false' end as [@FCT_AEBTO-TOL1718]
						,case when [16-18APPS1718Contract].UKPRN is not null then 'true' else 'false' end as [@FCT_16-18APPS1718]
						,case when [AAPP1718Contract].UKPRN is not null then 'true' else 'false' end as [@FCT_AAPP1718]
						,(
							select
								l.PrevUKPRN as [@PrevUKPRN]
								,l.LearnRefNumber as [@LearnRefNumber]
								,l.DateOfBirth as [@DateOfBirth]
								,l.Accom as [@Accom]
								,l.FamilyName as [@FamilyName]
								,l.GivenNames as [@GivenNames]
								,l.LLDDHealthProb as [@LLDDHealthProb]
								,l.[NINumber] as [@NINumber]
								,l.PriorAttain as [@PriorAttain]
								,l.Ethnicity as [@Ethnicity]
								,l.PlanEEPHours as [@PlanEEPHours]
								,l.PlanLearnHours as [@PlanLearnHours]
								,l.ULN as [@ULN]
								,case when [UniqueLearnerNumbers2].[ULN] is not null then 'true' else 'false' end as [@ULNLookup]
								,l.Sex as [@Sex]
								,l.EngGrade as [@EngGrade]
								,l.MathGrade as [@MathGrade]
								,l.[AddLine1] as [@AddLine1]
								,l.[ALSCost] as [@ALSCost]
								,l.PMUKPRN as [@PMUKPRN]
								,case when PMUKPRNLookUp.UKPRN is not null then 'true' else 'false' end as [@PMUKPRNLookup]
								,l.Postcode as [@Postcode]
								,case when PCLookup.Postcode is not null then 'true' else 'false' end as [@PostcodeLookUp]
								,l.PostcodePrior as [@PostcodePrior]
								,case when PrevPCLookup.Postcode is not null then 'true' else 'false' end as [@PostCodePriorLookup]
								,case when [Org_PartnerUKPRN].[UKPRN] is not null then 'true' else 'false' end as [@PrevUKPRNLookup]								
								,(
									select
										[LearningDelivery].[AchDate] as [@AchDate],
										[LearningDelivery].[AddHours] as [@AddHours],
										[LearningDelivery].[AimSeqNumber] as [@AimSeqNumber],
										[LearningDelivery].[AimType] as [@AimType],
										[LearningDelivery_LARS_LearningDelivery].[AwardOrgAimRef] as [@AwardOrgAimRef],
										[LearningDelivery].[CompStatus] as [@CompStatus],
										[LearningDelivery].[ConRefNumber] as [@ConRefNumber],
										case when [vw_ContractAllocation].[contractAllocationNumber] is not null then 'true' else 'false' end as [@ConRefNumberValidLookUP],
										[LearningDelivery].[DelLocPostCode] as [@DelLocPostcode],
										case when [Postcodes].[Postcode] is not null then 'true' else 'false' end as [@DelLocPostcodeLookup],
										[LearningDelivery].[EmpOutcome] as [@EmpOutcome],
										[LearningDelivery].[EPAOrgId] as [@EPAOrgId],
										[LARS_FrameworkAims].[EffectiveTo] as [@FrameworkAimEffectiveTo],
										case when [LARS_FrameworkAims].[FworkCode] is not null then 'true' else 'false' end as [@FrameworkAimLookup],
										[LearningDelivery_LARS_LearningDelivery].[FrameworkCommonComponent] as [@FrameworkCommonComponent],
										case when [LearningDelivery_LARS_LearningDelivery_LARS_FrameworkCmnComp].[LearnAimRef] is not null then 'true' else 'false' end as [@FrameworkCommonLookup],
										[LARS_FrameworkAims].[FrameworkComponentType] as [@FrameworkComponentType],
										[LearningDelivery_LARS_Framework_0_Pathway].[EffectiveTo] as [@FrameworkEffectiveTo],
										case when [LearningDelivery_LARS_Framework_No_Pathway].[FworkCode] is not null then 'true' else 'false' end as [@FrameworkLookup],
										[LearningDelivery_LARS_Framework].[EffectiveTo] as [@FrameworkPathwayEffectiveTo],
										case when [LearningDelivery_LARS_Framework].[FworkCode] is not null then 'true' else 'false' end as [@FrameworkPathwayLookup],
										[LearningDelivery].[FundModel] as [@FundModel],
										[LearningDelivery].[FworkCode] as [@FworkCode],
										case when [LARS_LearningDeliveryCategory_TopMostCategory].[CategoryRef] is not null then 'true' else 'false' end as [@LARS_CategoryRef9],
										[LearningDelivery_LARS_LearningDelivery].[EnglPrscID] as [@LARS_EnglPrscID],
										[LearningDelivery_LARS_LearningDelivery].[LearningDeliveryGenre] as [@LARS_LearningDeliveryGenre],
										[LearningDelivery_LARS_LearningDelivery].[LearnDirectClassSystemCode1] as [@LDCS1Code],
										[LearningDelivery_LARS_LearningDelivery].[LearnDirectClassSystemCode2] as [@LDCS2Code],
										[LearningDelivery_LARS_LearningDelivery].[LearnDirectClassSystemCode3] as [@LDCS3Code],
										[LearningDelivery].[LearnActEndDate] as [@LearnActEndDate],
										[LearningDelivery].[LearnAimRef] as [@LearnAimRef],
										case when [LearningDelivery_LARS_LearningDelivery].[LearnAimRef] is not null then 'true' else 'false' end as [@LearnAimRefLookup],
										[LearningDelivery_LARS_LearningDelivery].[LearnAimRefType] as [@LearnAimRefType],
										[LearningDelivery].[LearnPlanEndDate] as [@LearnPlanEndDate],
										[LearningDelivery].[LearnStartDate] as [@LearnStartDate],
										[LearningDelivery_LARS_LearningDelivery].[NotionalNVQLevelv2] as [@NotionalNVQLevelv2],
										[LearningDelivery].[OrigLearnStartDate] as [@OrigLearnStartDate],
										[LearningDelivery].[OtherFundAdj] as [@OtherFundAdj],
										[LearningDelivery].[Outcome] as [@Outcome],
										[LearningDelivery].[OutGrade] as [@OutGrade],
										[LearningDelivery].[PartnerUKPRN] as [@PartnerUKPRN],
										case when [Org_PartnerUKPRN].[UKPRN] is not null then 'true' else 'false' end as [@PartnerUKPRNLookup],
										[LearningDelivery].[PriorLearnFundAdj] as [@PriorLearnFundAdj],
										[LearningDelivery].[ProgType] as [@ProgType],
										[LearningDelivery].[PwayCode] as [@PwayCode],
										[LARS_Section96].[Section96ApprovalStatus] as [@Section96ApprovalStatus],
										[LARS_Section96].[Section96ReviewDate] as [@Section96ReviewDate],
										case when [LARS_Standard].[StandardCode] is not null then 'true' else 'false' end as [@StandardCodeLookup],
										[LARS_Standard].[EffectiveTo] as [@StandardEffectiveTo],
										[LearningDelivery].[StdCode] as [@StdCode],
										[LearningDelivery].[SWSupAimId] as [@SWSupAimId],
										case [LearningDelivery_LARS_LearningDelivery].[UnemployedOnly] when 1 then 'true' when 0 then 'false' end as [@UnemployedOnly],
										[LearningDelivery_LARS_LearningDelivery].[UnitType] as [@UnitType],
										[LearningDelivery].[WithdrawReason] as [@WithdrawReason],
										(
											select
												[LearningDeliveryFAM].[LearnDelFAMCode] as [@LearnDelFAMCode],
												[LearningDeliveryFAM].[LearnDelFAMDateFrom] as [@LearnDelFAMDateFrom],
												[LearningDeliveryFAM].[LearnDelFAMDateTo] as [@LearnDelFAMDateTo],
												[LearningDeliveryFAM].[LearnDelFAMType] as [@LearnDelFAMType]
											from
												[Input].[LearningDeliveryFAM]
											where
												[LearningDeliveryFAM].[LearningDelivery_Id] = [LearningDelivery].[LearningDelivery_Id]
											for xml path ('LearningDeliveryFAM'), type
										),
										(
											select
												[LearningDeliveryHE].[DOMICILE] as [@DOMICILE],
												[LearningDeliveryHE].[ELQ] as [@ELQ],
												[LearningDeliveryHE].[FUNDCOMP] as [@FUNDCOMP],
												[LearningDeliveryHE].[FUNDLEV] as [@FUNDLEV],
												[LearningDeliveryHE].[GROSSFEE] as [@GROSSFEE],
												[LearningDeliveryHE].[HEPostCode] as [@HEPostCode],
												case when [Postcodes].[Postcode] is not null then 'true' else 'false' end as [@HEPostCodeLookup],
												[LearningDeliveryHE].[MODESTUD] as [@MODESTUD],
												[LearningDeliveryHE].[MSTUFEE] as [@MSTUFEE],
												[LearningDeliveryHE].[NETFEE] as [@NETFEE],
												[LearningDeliveryHE].[NUMHUS] as [@NUMHUS],
												[LearningDeliveryHE].[PCFLDCS] as [@PCFLDCS],
												[LearningDeliveryHE].[PCOLAB] as [@PCOLAB],
												[LearningDeliveryHE].[PCSLDCS] as [@PCSLDCS],
												[LearningDeliveryHE].[PCTLDCS] as [@PCTLDCS],
												[LearningDeliveryHE].[QUALENT3] as [@QUALENT3],
												[LearningDeliveryHE].[SEC] as [@SEC],
												[LearningDeliveryHE].[SOC2000] as [@SOC2000],
												[LearningDeliveryHE].[SPECFEE] as [@SPECFEE],
												[LearningDeliveryHE].[SSN] as [@SSN],
												[LearningDeliveryHE].[STULOAD] as [@STULOAD],
												[LearningDeliveryHE].[TYPEYR] as [@TYPEYR],
												[LearningDeliveryHE].[UCASAPPID] as [@UCASAPPID]
											from
												[Input].[LearningDeliveryHE]
												left join [$(Postcodes)].[$(Postcodes_Schema)].[Postcodes]
													on [Postcodes].[Postcode]=[LearningDeliveryHE].[HEPostCode]
											where
												[LearningDeliveryHE].[LearningDelivery_Id] = [LearningDelivery].[LearningDelivery_Id]
											for xml path ('LearningDeliveryHE'), type
										),
										(
											select
												[ProviderSpecDeliveryMonitoring].[ProvSpecDelMon] as [@ProvSpecDelMon],
												[ProviderSpecDeliveryMonitoring].[ProvSpecDelMonOccur] as [@ProvSpecDelMonOccur]
											from
												[Input].[ProviderSpecDeliveryMonitoring]
											where
												[ProviderSpecDeliveryMonitoring].[LearningDelivery_Id] = [LearningDelivery].[LearningDelivery_Id]
											for xml path ('ProviderSpecDeliveryMonitoring'), type
										),
										(
											select
												[LARS_StandardFunding].[CoreGovContributionCap] as [@CoreGovContributionCap],
												[LARS_StandardFunding].[EffectiveFrom] as [@LARSFundEffectiveFrom]
											from
												[$(LARS)].[$(LARS_Schema)].LARS_StandardFunding
											where
												LARS_StandardFunding.StandardCode = LearningDelivery.StdCode
											for xml path('LearningDeliveryLARSStandardFunding'), type
										),
										(
											select
												[LARS_Validity].[ValidityCategory] as [@ValidityCategory],
												[LARS_Validity].[EndDate] as [@ValidityEndDate],
												[LARS_Validity].[LastNewStartDate] as [@ValidityLastNewStartDate],
												[LARS_Validity].[StartDate] as [@ValidityStartDate]
											from
												[$(LARS)].[$(LARS_Schema)].[LARS_Validity]
											where
												[LARS_Validity].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
											for xml path ('LearningDeliveryLARSValidity'), type
										),
										(
											select
												[LearningDeliveryWorkPlacement].[WorkPlaceEmpId] as [@WorkPlaceEmpId],
												case when [Employers].[URN] is not null then 'true' else 'false' end as [@WorkPlaceEmpIdLookup],
												[LearningDeliveryWorkPlacement].[WorkPlaceEndDate] as [@WorkPlaceEndDate],
												[LearningDeliveryWorkPlacement].[WorkPlaceHours] as [@WorkPlaceHours],
												[LearningDeliveryWorkPlacement].[WorkPlaceMode] as [@WorkPlaceMode],
												[LearningDeliveryWorkPlacement].[WorkPlaceStartDate] as [@WorkPlaceStartDate]
											from
												[Input].[LearningDeliveryWorkPlacement]
												left join [$(EDRS)].[$(EDRS_Schema)].[Employers]
													on [Employers].[URN]=[LearningDeliveryWorkPlacement].[WorkPlaceEmpId]
											where
												[LearningDeliveryWorkPlacement].[LearningDelivery_Id] = [LearningDelivery].[LearningDelivery_Id]
											for xml path ('LearningDeliveryWorkPlacement'), type
										),
										(
											select
												[AppFinRecord].[AFinAmount] as [@AFinAmount],
												[AppFinRecord].[AFinCode] as [@AFinCode],
												[AppFinRecord].[AFinDate] as [@AFinDate],
												[AppFinRecord].[AFinType] as [@AFinType]
											from
												[Input].AppFinRecord
											where
												[AppFinRecord].[LearningDelivery_Id] = [LearningDelivery].[LearningDelivery_Id]
											for xml path ('ApprenticeshipFinancialRecord'), type
										),
										(
											select
												case [LARS_AnnualValue].[BasicSkills] when 1 then 'true' when 0 then 'false' end as [@BasicSkills],
												[LARS_AnnualValue].[FullLevel2EntitlementCategory] as [@FullLevel2EntitlementCategory],
												[LARS_AnnualValue].[FullLevel2Percent] as [@FullLevel2Percent],
												[LARS_AnnualValue].[FullLevel3EntitlementCategory] as [@FullLevel3EntitlementCategory],
												[LARS_AnnualValue].[FullLevel3Percent] as [@FullLevel3Percent],
												[LARS_AnnualValue].[BasicSkillsType] as [@LearnDelAnnValBasicSkillsTypeCode],
												[LARS_AnnualValue].[EffectiveFrom] as [@LearnDelAnnValDateFrom],
												[LARS_AnnualValue].[EffectiveTo] as [@LearnDelAnnValDateTo]
											from
												[$(LARS)].[$(LARS_Schema)].[LARS_AnnualValue]
											where
												[LARS_AnnualValue].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
											for xml path ('LearningDeliveryAnnualValue'), type
										),
										(
											select
												[LearningDelivery_LARS_LearningDeliveryCategory_LARS_LearningDeliveryCategory_Children].[CategoryRef] as [@LARSCategoryRef],
												[LearningDelivery_LARS_LearningDeliveryCategory_LARS_LearningDeliveryCategory_Children].[ParentCategoryRef] as [@ParentLARSCategoryRef],
												[LearningDelivery_LARS_LearningDeliveryCategory_LARS_LearningDeliveryCategory_Children].[RootCategoryRef] as [@TopLevelLARSCategoryRef]
											from
												(
													select
														[LARS_LearningDeliveryCategory].[CategoryRef],
														[LARS_LearningDeliveryCategory_Children].[ParentCategoryRef],
														[LARS_LearningDeliveryCategory_Children].[RootCategoryRef],
														[LARS_LearningDeliveryCategory].[LearnAimRef]
													from
														[$(LARS)].[$(LARS_Schema)].[LARS_LearningDeliveryCategory_Children]
														inner join [$(LARS)].[$(LARS_Schema)].[LARS_LearningDeliveryCategory]
															on [LARS_LearningDeliveryCategory_Children].[CategoryRef]=[LARS_LearningDeliveryCategory].[CategoryRef]
												)  as LearningDelivery_LARS_LearningDeliveryCategory_LARS_LearningDeliveryCategory_Children
											where
												[LearningDelivery_LARS_LearningDeliveryCategory_LARS_LearningDeliveryCategory_Children].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
											for xml path ('LearningDeliveryLARSCategory'), type
										)
									from
										[Input].[LearningDelivery]
										left join [$(LARS)].[$(LARS_Schema)].[LARS_LearningDelivery] as [LearningDelivery_LARS_LearningDelivery]
											on [LearningDelivery_LARS_LearningDelivery].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
										left join [$(FCT)].[$(FCT_Schema)].[vw_ContractAllocation]
											on [vw_ContractAllocation].[contractAllocationNumber]=[LearningDelivery].[ConRefNumber]
										left join [$(Postcodes)].[$(Postcodes_Schema)].[Postcodes]
											on [Postcodes].[Postcode]=[LearningDelivery].[DelLocPostCode]
										left join [$(Org)].[$(Org_Schema)].[Org_HMPP_PostCode]
											on [Org_HMPP_PostCode].[HMPPPostCode]=[LearningDelivery].[DelLocPostCode]
										left join [$(LARS)].[$(LARS_Schema)].[LARS_FrameworkAims]
											on [LARS_FrameworkAims].[FworkCode]=[LearningDelivery].[FworkCode]
											and [LARS_FrameworkAims].[ProgType]=[LearningDelivery].[ProgType]
											and [LARS_FrameworkAims].[PwayCode]=[LearningDelivery].[PwayCode]
											and [LARS_FrameworkAims].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
										left join [$(LARS)].[$(LARS_Schema)].[LARS_Framework] as [LearningDelivery_LARS_Framework_0_Pathway]
											on [LearningDelivery_LARS_Framework_0_Pathway].[FworkCode]=[LearningDelivery].[FworkCode]
											and [LearningDelivery_LARS_Framework_0_Pathway].[ProgType]=[LearningDelivery].[ProgType]
											and [LearningDelivery_LARS_Framework_0_Pathway].[PwayCode]=0
										left join
											(
												select distinct
														[LARS_Framework].[FworkCode],
														[LARS_Framework].[ProgType]
												from
													[$(LARS)].[$(LARS_Schema)].[LARS_Framework]
											) as [LearningDelivery_LARS_Framework_No_Pathway]
											on [LearningDelivery_LARS_Framework_No_Pathway].[FworkCode]=[LearningDelivery].[FworkCode]
											and [LearningDelivery_LARS_Framework_No_Pathway].[ProgType]=[LearningDelivery].[ProgType]
										left join [$(LARS)].[$(LARS_Schema)].[LARS_Framework] as [LearningDelivery_LARS_Framework]
											on [LearningDelivery_LARS_Framework].[FworkCode]=[LearningDelivery].[FworkCode]
											and [LearningDelivery_LARS_Framework].[ProgType]=[LearningDelivery].[ProgType]
											and [LearningDelivery_LARS_Framework].[PwayCode]=[LearningDelivery].[PwayCode]
										left join [$(LARS)].[$(LARS_Schema)].[LARS_LearningDeliveryCategory_TopMostCategory]
											on [LARS_LearningDeliveryCategory_TopMostCategory].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
											and [LARS_LearningDeliveryCategory_TopMostCategory].[CategoryRef]=9
										left join [$(Org)].[$(Org_Schema)].[Org_PartnerUKPRN]
											on [Org_PartnerUKPRN].[UKPRN]=[LearningDelivery].[PartnerUKPRN]
										left join [$(LARS)].[$(LARS_Schema)].[LARS_Section96]
											on [LARS_Section96].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
										left join [$(LARS)].[$(LARS_Schema)].[LARS_Standard]
											on [LARS_Standard].[StandardCode]=[LearningDelivery].[StdCode]
										left join
											(
												select
													[LARS_LearningDelivery].[LearnAimRef],
													[LARS_FrameworkCmnComp].[FworkCode],
													[LARS_FrameworkCmnComp].[ProgType],
													[LARS_FrameworkCmnComp].[PwayCode],
													[LARS_FrameworkCmnComp].[CommonComponent]
												from
													[$(LARS)].[$(LARS_Schema)].[LARS_FrameworkCmnComp]
													inner join [$(LARS)].[$(LARS_Schema)].[LARS_LearningDelivery]
														on [LARS_FrameworkCmnComp].[CommonComponent]=[LARS_LearningDelivery].[FrameworkCommonComponent]
											)  as LearningDelivery_LARS_LearningDelivery_LARS_FrameworkCmnComp
												on [LearningDelivery_LARS_LearningDelivery_LARS_FrameworkCmnComp].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
												and [LearningDelivery_LARS_LearningDelivery_LARS_FrameworkCmnComp].[FworkCode]=[LearningDelivery].[FworkCode]
												and [LearningDelivery_LARS_LearningDelivery_LARS_FrameworkCmnComp].[ProgType]=[LearningDelivery].[ProgType]
												and [LearningDelivery_LARS_LearningDelivery_LARS_FrameworkCmnComp].[PwayCode]=[LearningDelivery].[PwayCode]
									where
										[LearningDelivery].[Learner_Id] = l.[Learner_Id]
									for xml path ('LearningDelivery'), type
								),
								(
									select
										[LearnerFAM].[LearnFAMCode] as [@LearnFAMCode],
										[LearnerFAM].[LearnFAMType] as [@LearnFAMType]
									from
										[Input].[LearnerFAM]
									where
										[LearnerFAM].[Learner_Id] = l.[Learner_Id]
									for xml path ('LearnerFAM'), type
								),
								(
									select
										[LearnerEmploymentStatus].[DateEmpStatApp] as [@DateEmpStatApp],
										[LearnerEmploymentStatus].[EmpId] as [@EmpId],
										case when [Employers].[URN] is not null then 'true' else 'false' end as [@EmpIdLookup],
										[LearnerEmploymentStatus].[EmpStat] as [@EmpStat],
										(
											select
												[EmploymentStatusMonitoring].[ESMCode] as [@ESMCode],
												[EmploymentStatusMonitoring].[ESMType] as [@ESMType]
											from
												[Input].[EmploymentStatusMonitoring]
											where
												[EmploymentStatusMonitoring].[LearnerEmploymentStatus_Id] = [LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
											for xml path ('EmploymentStatusMonitoring'), type
										)
									from
										[Input].[LearnerEmploymentStatus]
										left join [$(EDRS)].[$(EDRS_Schema)].[Employers]
											on [Employers].[URN]=[LearnerEmploymentStatus].[EmpId]
									where
										[LearnerEmploymentStatus].[Learner_Id] = l.[Learner_Id]
									for xml path ('LearnerEmploymentStatus'), type
								),
								(
									select
										[ContactPreference].[ContPrefCode] as [@ContPrefCode],
										[ContactPreference].[ContPrefType] as [@ContPrefType]
									from
										[Input].[ContactPreference]
									where
										[ContactPreference].[Learner_Id] = l.[Learner_Id]
									for xml path ('ContactPreference'), type
								),
								(
									select
										[LLDDandHealthProblem].[LLDDCat] as [@LLDDCat],
										[LLDDandHealthProblem].[PrimaryLLDD] as [@PrimaryLLDD]
									from
										[Input].[LLDDandHealthProblem]
									where
										[LLDDandHealthProblem].[Learner_Id] = l.[Learner_Id]
									for xml path ('LLDDandHealthProblem'), type
								),
								(
									select
										[LearnerHE].[TTACCOM] as [@TTACCOM],
										[LearnerHE].[UCASPERID] as [@UCASPERID],
										(
											select
												[LearnerHEFinancialSupport].[FINTYPE] as [@FINTYPE]
											from
												[Input].[LearnerHEFinancialSupport]
											where
												[LearnerHEFinancialSupport].[LearnerHE_Id] = [LearnerHE].[LearnerHE_Id]
											for xml path ('LearnerHEFinancialSupport'), type
										)
									from
										[Input].[LearnerHE]
									where
										[LearnerHE].[Learner_Id] = l.[Learner_Id]
									for xml path ('LearnerHE'), type
								),
								(
									select
										[ProviderSpecLearnerMonitoring].[ProvSpecLearnMonOccur] as [@ProvSpecLearnMonOccur]
									from
										[Input].[ProviderSpecLearnerMonitoring]
									where
										[ProviderSpecLearnerMonitoring].[Learner_Id] = l.[Learner_Id]
									for xml path ('ProviderSpecLearnerMonitoring'), type
								),
								(
									select
										[LearnerDestinationandProgression].[LearnRefNumber] as [@DP_LearnRefNumber],
										[LearnerDestinationandProgression].[ULN] as [@DP_ULN],
										(
											select
												[DPOutcome].[OutCode] as [@OutCode],
												[DPOutcome].[OutStartDate] as [@OutStartDate],
												[DPOutcome].[OutType] as [@OutType]
											from
												[Input].[DPOutcome]
											where
												[DPOutcome].[LearnerDestinationAndProgression_Id] = [LearnerDestinationandProgression].[LearnerDestinationAndProgression_Id]
											for xml path ('DPOutcome'), type
										)
									from
										[Input].[LearnerDestinationandProgression]
									where
										 [LearnerDestinationandProgression].[LearnRefNumber]=l.[LearnRefNumber]
									for xml path ('LearnerDestinationAndProgression'), type
								)
							from
								[Input].[Learner] as l
								left join [$(Org)].[$(Org_Schema)].[Org_PartnerUKPRN]
									on [Org_PartnerUKPRN].[UKPRN]=l.[PrevUKPRN]
								left join [$(ULN)].[$(ULN_Schema)].[UniqueLearnerNumbers2]
									on [UniqueLearnerNumbers2].[ULN]=l.[ULN]
								left join
								(
									select
										UKPRN
									from
										[$(Org)].[$(Org_Schema)].Org_PartnerUKPRN
								) as PMUKPRNLookUp
									on PMUKPRNLookUp.UKPRN = l.PMUKPRN
								left join
								(
									select
										Postcode
									from
										[$(Postcodes)].[$(Postcodes_Schema)].Postcodes
								) as PCLookup
									on PCLookup.Postcode = l.Postcode
								left join
								(
									select 
										Postcode
									from
										[$(Postcodes)].[$(Postcodes_Schema)].Postcodes
								) as PrevPCLookup
									on PrevPCLookup.Postcode = l.PostcodePrior
							where
								l.[LearnRefNumber] = globalLearner.[LearnRefNumber]
							for xml path ('Learner'), type
						)
					from
						Input.Learner as globalLearner
						cross join [Input].[LearningProvider] as lp
						cross join 
						(
							select top 1
								concat(
									cast(MajorNumber as varchar(5)),
										'.',
										cast(MinorNumber as varchar(5)),
										'.',
										cast(MaintenanceNumber as varchar(5))
								) as [CurrentVersion]
							from
								[$(LARS)].[$(LARS_Schema)].[LARS_Version]
							order by
								MajorNumber desc,
								MinorNumber desc
						) as lv
						cross join [Input].[CollectionDetails] as cd
						cross join [$(Org)].[$(Org_Schema)].[Org_Current_Version] as ocv			
						left join
						(
							select distinct
								UKPRN
								,fundingStreamPeriodCode
							from 
								[$(FCT)].[$(FCT_Schema)].[vw_ContractValidation]
						) as [1618APPS1718]
							on [1618APPS1718].UKPRN = lp.UKPRN
							and [1618APPS1718].fundingStreamPeriodCode = '1618APPS1718'		
						left join
						(
							select distinct
								[cv].UKPRN
								,cv.fundingStreamPeriodCode
							from
								[$(FCT)].[$(FCT_Schema)].vw_ContractValidation as cv
						) as [16-18APPS1718Contract]
							on [16-18APPS1718Contract].UKPRN = lp.UKPRN
							and [16-18APPS1718Contract].fundingStreamPeriodCode = '16-18APPS1718'
						left join
						(
							select distinct
								[cv].UKPRN
								,cv.fundingStreamPeriodCode
							from
								[$(FCT)].[$(FCT_Schema)].vw_ContractValidation as cv
						) as [16-18NLA1718Contract]
							on [16-18NLA1718Contract].UKPRN = lp.UKPRN
							and [16-18NLA1718Contract].fundingStreamPeriodCode = '16-18NLA1718'
						left join
						(
							select distinct
								[cv].UKPRN
								,cv.fundingStreamPeriodCode
							from
								[$(FCT)].[$(FCT_Schema)].vw_ContractValidation as cv
						) as [AAPP1718Contract]
							on [AAPP1718Contract].UKPRN = lp.UKPRN
							and [AAPP1718Contract].fundingStreamPeriodCode = 'AAP1718'
						left join
						(
							select distinct
								[cv].UKPRN
								,cv.fundingStreamPeriodCode
							from
								[$(FCT)].[$(FCT_Schema)].vw_ContractValidation as cv
						) as [AEBC1718Contract]
							on [AEBC1718Contract].UKPRN = lp.UKPRN
							and [AEBC1718Contract].fundingStreamPeriodCode = 'AEBC1718'
						left join
						(
							select distinct
								[cv].UKPRN
								,cv.fundingStreamPeriodCode
							from
								[$(FCT)].[$(FCT_Schema)].vw_ContractValidation as cv
						) as [AEBTO-TOL1718Contract]
							on [AEBTO-TOL1718Contract].UKPRN = lp.UKPRN
							and [AEBTO-TOL1718Contract].fundingStreamPeriodCode = 'AEBTO-TOL1718'
						left join
						(
							select distinct
								[cv].UKPRN
								,cv.fundingStreamPeriodCode
							from
								[$(FCT)].[$(FCT_Schema)].vw_ContractValidation as cv
						) as [ALLB1718Contract]
							on [ALLB1718Contract].UKPRN = lp.UKPRN
							and [ALLB1718Contract].fundingStreamPeriodCode = 'ALLB1718'
						left join
						(
							select distinct
								[cv].UKPRN
								,cv.fundingStreamPeriodCode
							from
								[$(FCT)].[$(FCT_Schema)].vw_ContractValidation as cv
						) as [ALLBC1718Contract]
							on [ALLBC1718Contract].UKPRN = lp.UKPRN
							and [ALLBC1718Contract].fundingStreamPeriodcode = 'ALLBC1718'
						left join
						(
							select distinct
								[cv].UKPRN
								,cv.fundingStreamPeriodCode
							from
								[$(FCT)].[$(FCT_Schema)].vw_ContractValidation as cv
						) as [ANLA1718Contract]
							on [ANLA1718Contract].UKPRN = lp.UKPRN
							and [ANLA1718Contract].fundingStreamPeriodCode = 'ANLA1718'
						left join
						(
							select distinct
								[cv].UKPRN
								,cv.fundingStreamPeriodCode
							from
								[$(FCT)].[$(FCT_Schema)].vw_ContractValidation as cv
						) as [ESF1420Contract]
							on [ESF1420Contract].UKPRN = lp.UKPRN
							and [ESF1420Contract].fundingStreamPeriodCode = 'ESF1420'
						left join
						(
							select distinct
								[cv].UKPRN
								,cv.fundingStreamPeriodCode
							from
								[$(FCT)].[$(FCT_Schema)].vw_ContractValidation as cv
						) as [LEVY1799Contract] 
							on [LEVY1799Contract].UKPRN = lp.UKPRN
							and [LEVY1799Contract].fundingStreamPeriodCode = 'LEVY1799'

						left join [$(Org)].[$(Org_Schema)].[Org_Details]
							on [Org_Details].[UKPRN]=lp.[UKPRN]
					where
						globalLearner.Learner_Id = ControllingTable.Learner_Id
					for xml path ('global'), type
				)
			)
		from
			(
				select distinct
					Learner_Id
				from
					Input.Learner
			) as ControllingTable
		--where
		--	[ControllingTable].[Learner_Id] in (select Learner_Id from dbo.ValidLearners)
	end
GO
if object_id('[Rulebase].[VAL_Insert_global]','p') is not null
	drop procedure [Rulebase].[VAL_Insert_global]
GO

create procedure [Rulebase].[VAL_Insert_global]
	(
		@EmployerVersion varchar(50),
		@LARSVersion varchar(50),
		@OrgVersion varchar(50),
		@PostcodeVersion varchar(50),
		@RulebaseVersion varchar(10),
		@UKPRN int
	)
as
	begin
		set nocount on
		insert into
			[Rulebase].[VAL_global]
			(
				UKPRN
				,EmployerVersion
				,LARSVersion
				,OrgVersion
				,PostcodeVersion
				,RulebaseVersion
			)
		values (
			@UKPRN,
			@EmployerVersion,
			@LARSVersion,
			@OrgVersion,
			@PostcodeVersion,
			@RulebaseVersion
		)
	end
go
if object_id('[Rulebase].[VAL_Insert_Learner]','p') is not null
	drop procedure [Rulebase].[VAL_Insert_Learner]
GO

create procedure [Rulebase].[VAL_Insert_Learner]
	(
		@LearnRefNumber varchar(12)
	)
as
	begin
		set nocount on
	end
go
if object_id('[Rulebase].[VAL_Insert_LearningDelivery]','p') is not null
	drop procedure [Rulebase].[VAL_Insert_LearningDelivery]
GO

create procedure [Rulebase].[VAL_Insert_LearningDelivery]
	(
		@LearnRefNumber varchar(12),
		@AimSeqNumber int
	)
as
	begin
		set nocount on
	end
go
if object_id('[Rulebase].[VAL_Insert_ValidationError]','p') is not null
	drop procedure [Rulebase].[VAL_Insert_ValidationError]
GO

create procedure [Rulebase].[VAL_Insert_ValidationError]
	(		
		@ErrorString varchar(2000)
	)
as
	begin
		set nocount on
		declare @xml xml = convert(xml,'<Values><value>' + replace(replace(@ErrorString,'&','&amp;'),'|', '</value><value>') + '</value></Values>')
		declare @LearnRefNumber varchar(100) = @xml.value('/Values[1]/value[1]','varchar(100)')
		declare @AimSeqNumber varchar(18) = @xml.value('/Values[1]/value[2]','varchar(18)')
		declare @RuleId varchar(50) = @xml.value('/Values[1]/value[3]','varchar(50)')
		declare @FieldValues varchar(2000) = @xml.value('/Values[1]/value[4]','varchar(2000)')
		insert into
			[Rulebase].[VAL_ValidationError]
			(
				AimSeqNumber,
				ErrorString,
				FieldValues,
				LearnRefNumber,
				RuleId
			)
		values (
			@AimSeqNumber,
			@ErrorString,
			@FieldValues,
			@LearnRefNumber,
			@RuleId
		)
	end
go
