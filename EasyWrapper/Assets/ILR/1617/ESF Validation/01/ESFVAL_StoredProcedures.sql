use [$(IntrajobDatabase)]
GO
if object_id('[Rulebase].[ESFVAL_Get_Cases]','p') is not null
	drop procedure [Rulebase].[ESFVAL_Get_Cases]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 26 August 2016 11:06
-- Profile: Test Harness Validation
-- Rulebase Version: ILR ESF Validation 1617, Drop 000, Version 1617.01
-- =====================================================================================================
create procedure [Rulebase].[ESFVAL_Get_Cases] as

	begin
		set nocount on
		select
			CaseData
		from
			[Rulebase].[ESFVAL_Cases]
	end
GO
if object_id('[Rulebase].[ESFVAL_Insert_Cases]','p') is not null
	drop procedure [Rulebase].[ESFVAL_Insert_Cases]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 26 August 2016 11:06
-- Profile: Test Harness Validation
-- Rulebase Version: ILR ESF Validation 1617, Drop 000, Version 1617.01
-- =====================================================================================================
create procedure [Rulebase].[ESFVAL_Insert_Cases] as

	begin
		set nocount on

		insert into
			[Rulebase].[ESFVAL_Cases]
			(
				[Learner_Id],
				CaseData
			)
		select
			ControllingTable.[Learner_Id],
			convert(xml,
				(
					select
						case when '${dcft.runmode}' = 'DS' then 'true' else 'false' end as [@DesktopMode],
						[LearningProvider].[UKPRN] as [@UKPRN],
						(
							select
								[Learner].[DateOfBirth] as [@DateOfBirth],
								[Learner].[LearnRefNumber] as [@LearnRefNumber],
								[Learner].[PriorAttain] as [@PriorAttain],
								(
									select
										[LearningDelivery].[AimSeqNumber] as [@AimSeqNumber],
										[LearningDelivery].[AimType] as [@AimType],
										[LearningDelivery].[CompStatus] as [@CompStatus],
										[LearningDelivery].[ConRefNumber] as [@ConRefNumber],
										[vw_ContractAllocation].[startDate] as [@ConRefStartDate],
										[LearningDelivery].[DelLocPostCode] as [@DelLocPostcode],
										[LearningDelivery].[EmpOutcome] as [@EmpOutcome],
										[LearningDelivery].[FundModel] as [@FundModel],
										[LearningDelivery].[FworkCode] as [@FworkCode],
										[LARS_LearningDelivery].[SectorSubjectAreaTier1] as [@LARS_SectorSubjectAreaTier1],
										[LARS_LearningDelivery].[SectorSubjectAreaTier2] as [@LARS_SectorSubjectAreaTier2],
										[LearningDelivery].[LearnActEndDate] as [@LearnActEndDate],
										[LearningDelivery].[LearnAimRef] as [@LearnAimRef],
										[LearningDelivery].[LearnPlanEndDate] as [@LearnPlanEndDate],
										[LearningDelivery].[LearnStartDate] as [@LearnStartDate],
										[LARS_LearningDelivery].[NotionalNVQLevelv2] as [@NotionalNVQLevelv2],
										[LearningDelivery].[OrigLearnStartDate] as [@OrigLearnStartDate],
										[LearningDelivery].[Outcome] as [@Outcome],
										[LearningDelivery].[OutGrade] as [@OutGrade],
										[LearningDelivery].[ProgType] as [@ProgType],
										[LearningDelivery].[PwayCode] as [@PwayCode],
										case [LARS_LearningDelivery].[UnemployedOnly] when 1 then 'true' when 0 then 'false' end as [@UnemployedOnly],
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
												case [LearningDelivery_ContractAllocation_EligibilityRule].[Benefits] when 1 then 'true' when 0 then 'false' end as [@Benefits],
												[LearningDelivery_ContractAllocation_EligibilityRule].[MaxAge] as [@MaxAge],
												[LearningDelivery_ContractAllocation_EligibilityRule].[MaxLengthOfUnemployment] as [@MaxLengthOfUnemployment],
												[LearningDelivery_ContractAllocation_EligibilityRule].[MaxPriorAttainment] as [@MaxPriorAttainment],
												[LearningDelivery_ContractAllocation_EligibilityRule].[MinAge] as [@MinAge],
												[LearningDelivery_ContractAllocation_EligibilityRule].[MinLengthOfUnemployment] as [@MinLengthOfUnemployment],
												[LearningDelivery_ContractAllocation_EligibilityRule].[MinPriorAttainment] as [@MinPriorAttainment],
												(
													select
														[EligibilityRuleEmploymentStatus].[EmploymentStatusCode] as [@EmploymentStatusCode]
													from
														[$(ESFConRef)].[$(ESFConRef_Schema)].[EligibilityRuleEmploymentStatus]
													where
														[EligibilityRuleEmploymentStatus].[TenderSpecificationReference] = [LearningDelivery_ContractAllocation_EligibilityRule].[TenderSpecificationReference]
														and [EligibilityRuleEmploymentStatus].[LotReference] = [LearningDelivery_ContractAllocation_EligibilityRule].[LotReference]
													for xml path ('EligibilityRuleEmploymentStatus'), type
												),
												(
													select
														[EligibilityRuleLocalAuthority].[LocalAuthorityCode] as [@LocalAuthorityCode]
													from
														[$(ESFConRef)].[$(ESFConRef_Schema)].[EligibilityRuleLocalAuthority]
													where
														[EligibilityRuleLocalAuthority].[TenderSpecificationReference] = [LearningDelivery_ContractAllocation_EligibilityRule].[TenderSpecificationReference]
														and [EligibilityRuleLocalAuthority].[LotReference] = [LearningDelivery_ContractAllocation_EligibilityRule].[LotReference]
													for xml path ('EligibilityRuleLocalAuthority'), type
												),
												(
													select
														[EligibilityRuleLocalEnterprisePartnership].[LocalEnterprisePartnershipCode] as [@LocalEnterprisePartnershipCode]
													from
														[$(ESFConRef)].[$(ESFConRef_Schema)].[EligibilityRuleLocalEnterprisePartnership]
													where
														[EligibilityRuleLocalEnterprisePartnership].[TenderSpecificationReference] = [LearningDelivery_ContractAllocation_EligibilityRule].[TenderSpecificationReference]
														and [EligibilityRuleLocalEnterprisePartnership].[LotReference] = [LearningDelivery_ContractAllocation_EligibilityRule].[LotReference]
													for xml path ('EligibilityRuleLocalEnterprisePartnership'), type
												),
												(
													select
														[EligibilityRuleSectorSubjectAreaLevel].[MaxLevelCode] as [@MaxLevelCode],
														[EligibilityRuleSectorSubjectAreaLevel].[MinLevelCode] as [@MinLevelCode],
														[EligibilityRuleSectorSubjectAreaLevel].[SectorSubjectAreaCode] as [@SectorSubjectAreaCode]
													from
														[$(ESFConRef)].[$(ESFConRef_Schema)].[EligibilityRuleSectorSubjectAreaLevel]
													where
														[EligibilityRuleSectorSubjectAreaLevel].[TenderSpecificationReference] = [LearningDelivery_ContractAllocation_EligibilityRule].[TenderSpecificationReference]
														and [EligibilityRuleSectorSubjectAreaLevel].[LotReference] = [LearningDelivery_ContractAllocation_EligibilityRule].[LotReference]
													for xml path ('EligibilityRuleSectorSubjectAreaLevel'), type
												)
											from
												(
													select
														[EligibilityRule].[Benefits],
														[EligibilityRule].[MaxAge],
														[EligibilityRule].[MaxLengthOfUnemployment],
														[EligibilityRule].[MaxPriorAttainment],
														[EligibilityRule].[MinAge],
														[EligibilityRule].[MinLengthOfUnemployment],
														[EligibilityRule].[MinPriorAttainment],
														[ContractAllocation].[ContractAllocationNumber],
														[EligibilityRule].[TenderSpecificationReference],
														[EligibilityRule].[LotReference]
													from
														[$(ESFConRef)].[$(ESFConRef_Schema)].[EligibilityRule]
														inner join [$(ESFConRef)].[$(ESFConRef_Schema)].[ContractAllocation]
															on [EligibilityRule].[TenderSpecificationReference]=[ContractAllocation].[TenderSpecReference]
															and [EligibilityRule].[LotReference]=[ContractAllocation].[LotReference]
												)  as LearningDelivery_ContractAllocation_EligibilityRule
											where
												[LearningDelivery_ContractAllocation_EligibilityRule].[ContractAllocationNumber]=[LearningDelivery].[ConRefNumber]
											for xml path ('EligibilityRule'), type
										),
										(
											select
												[ONS_Postcode].[doterm] as [@Doterm],
												[ONS_Postcode].[EffectiveFrom] as [@EffectiveFrom],
												[ONS_Postcode].[EffectiveTo] as [@EffectiveTo],
												[ONS_Postcode].[lep1] as [@LEP1],
												[ONS_Postcode].[lep2] as [@LEP2],
												[ONS_Postcode].[oslaua] as [@OSLAUA]
											from
												[$(ONSPostcodes)].[$(ONSPostcodes_Schema)].[ONS_Postcode]
											where
												[ONS_Postcode].[pcds]=[LearningDelivery].[DelLocPostCode]
											for xml path ('ONSPostcode'), type
										)
									from
										[Input].[LearningDelivery]
										left join [$(FCT)].[$(FCT_Schema)].[vw_ContractAllocation]
											on [vw_ContractAllocation].[contractAllocationNumber]=[LearningDelivery].[ConRefNumber]
										left join [$(LARS)].[$(LARS_Schema)].[LARS_LearningDelivery]
											on [LARS_LearningDelivery].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
									where
										[LearningDelivery].[Learner_Id] = [Learner].[Learner_Id]
										and [LearningDelivery].[FundModel]=70
									for xml path ('LearningDelivery'), type
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
										[LearnerEmploymentStatus].[Learner_Id] = [Learner].[Learner_Id]
									for xml path ('LearnerEmploymentStatus'), type
								)
							from
								[Input].[Learner]
							where
								[Learner].[LearnRefNumber] = [ControllingTable].[LearnRefNumber]
							for xml path ('Learner'), type
						)
					from
						[Input].[LearningProvider]
					for xml path ('global'), type
				)
			)
		from
			[Input].[Learner] ControllingTable
			inner join
				(
					select distinct
						[LearningDelivery].[Learner_Id]
					from
						[Input].[LearningDelivery]
					where
						[LearningDelivery].[FundModel]=70
				) [Filter_LearningDelivery]
				on [Filter_LearningDelivery].[Learner_Id]=[ControllingTable].[Learner_Id]
		where
			[ControllingTable].[Learner_Id] in (select Learner_Id from dbo.ValidLearners)
	end
GO
if object_id('[Rulebase].[ESFVAL_Insert_global]','p') is not null
	drop procedure [Rulebase].[ESFVAL_Insert_global]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 26 August 2016 11:07
-- Profile: Test Harness Validation
-- Rulebase Version: ILR ESF Validation 1617, Drop 000, Version 1617.01
-- =====================================================================================================

create procedure [Rulebase].[ESFVAL_Insert_global]
	(
		@UKPRN int,
		@RulebaseVersion varchar(10)
	)
as
	begin
		set nocount on
		insert into
			[Rulebase].[ESFVAL_global]
		values (
			@UKPRN,
			@RulebaseVersion
		)
	end
go
if object_id('[Rulebase].[ESFVAL_Insert_ValidationError]','p') is not null
	drop procedure [Rulebase].[ESFVAL_Insert_ValidationError]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 26 August 2016 11:07
-- Profile: Test Harness Validation
-- Rulebase Version: ILR ESF Validation 1617, Drop 000, Version 1617.01
-- =====================================================================================================

create procedure [Rulebase].[ESFVAL_Insert_ValidationError]
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
			[Rulebase].[ESFVAL_ValidationError]
		values (
			@AimSeqNumber,
			@ErrorString,
			@FieldValues,
			@LearnRefNumber,
			@RuleId
		)
	end
go
