use [Intrajob_1516]
GO
if object_id('[Rulebase].[VALFD_Get_Cases]','p') is not null
	drop procedure [Rulebase].[VALFD_Get_Cases]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 21 July 2015 10:40
-- Profile: 1516 Test Harness Validation
-- Rulebase Version: DCSS 1516 Validation FD 1516, Drop 000, Version 1516.04
-- =====================================================================================================
create procedure [Rulebase].[VALFD_Get_Cases] as

	begin
		set nocount on
		select
			CaseData
		from
			[Rulebase].[VALFD_Cases]
	end
GO
if object_id('[Rulebase].[VALFD_Insert_Cases]','p') is not null
	drop procedure [Rulebase].[VALFD_Insert_Cases]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 21 July 2015 10:40
-- Profile: 1516 Test Harness Validation
-- Rulebase Version: DCSS 1516 Validation FD 1516, Drop 000, Version 1516.04
-- =====================================================================================================
create procedure [Rulebase].[VALFD_Insert_Cases] as

	begin
		set nocount on

		insert into
			[Rulebase].[VALFD_Cases]
			(
				[Learner_Id],
				CaseData
			)
		select
			ControllingTable.[Learner_Id],
			convert(xml,
				(
					select
						[LearningProvider].[UKPRN] as [@UKPRN],
						(
						select
							[Learner].[Accom] as [@Accom],
							[Learner].[ALSCost] as [@ALSCost],
							[Learner].[EngGrade] as [@EngGrade],
							[Learner].[Ethnicity] as [@Ethnicity],
							[Learner].[FamilyName] as [@FamilyName],
							[Learner].[GivenNames] as [@GivenNames],
							[Learner].[LearnRefNumber] as [@LearnRefNumber],
							[Learner].[LLDDHealthProb] as [@LLDDHealthProb],
							[Learner].[MathGrade] as [@MathGrade],
							[Learner].[NINumber] as [@NINumber],
							[Learner].[PlanEEPHours] as [@PlanEEPHours],
							[Learner].[PlanLearnHours] as [@PlanLearnHours],
							[Learner].[PrevLearnRefNumber] as [@PrevLearnRefNumber],
							[Learner].[PrevUKPRN] as [@PrevUKPRN],
							[Learner].[PriorAttain] as [@PriorAttain],
							[Learner].[Sex] as [@Sex],
							[Learner].[ULN] as [@ULN],
							(
							select
								[LearningDelivery].[AddHours] as [@AddHours],
								[LearningDelivery].[AimSeqNumber] as [@AimSeqNumber],
								[LearningDelivery].[AimType] as [@AimType],
								[LearningDelivery].[CompStatus] as [@CompStatus],
								[LearningDelivery].[ConRefNumber] as [@ConRefNumber],
								[LearningDelivery].[DelLocPostCode] as [@DelLocPostcode],
								[LearningDelivery].[EmpOutcome] as [@EmpOutcome],
								[LearningDelivery].[FundModel] as [@FundModel],
								[LearningDelivery].[FworkCode] as [@FworkCode],
								[LearningDelivery].[LearnAimRef] as [@LearnAimRef],
								[LearningDelivery].[LearnPlanEndDate] as [@LearnPlanEndDate],
								[LearningDelivery].[LearnStartDate] as [@LearnStartDate],
								[LearningDelivery].[OtherFundAdj] as [@OtherFundAdj],
								[LearningDelivery].[Outcome] as [@Outcome],
								[LearningDelivery].[OutGrade] as [@OutGrade],
								[LearningDelivery].[PartnerUKPRN] as [@PartnerUKPRN],
								[LearningDelivery].[PriorLearnFundAdj] as [@PriorLearnFundAdj],
								[LearningDelivery].[ProgType] as [@ProgType],
								[LearningDelivery].[PwayCode] as [@PwayCode],
								[LearningDelivery].[SWSupAimId] as [@SWSupAimId],
								[LearningDelivery].[WithdrawReason] as [@WithdrawReason],
								(
								select
									[LearningDeliveryFAM].[LearnDelFAMCode] as [@LearnDelFAMCode],
									[LearningDeliveryFAM].[LearnDelFAMType] as [@LearnDelFAMType]
								from
									[Intrajob_1516].[Input].[LearningDeliveryFAM]
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
									[LearningDeliveryHE].[UCASAPPID] as [@UCASAPPID],
									[LearningDeliveryHE].[YEARSTU] as [@YEARSTU]
								from
									[Intrajob_1516].[Input].[LearningDeliveryHE]
								where
									[LearningDeliveryHE].[LearningDelivery_Id] = [LearningDelivery].[LearningDelivery_Id]
								for xml path ('LearningDeliveryHE'), type
								),
								(
								select
									[ProviderSpecDeliveryMonitoring].[ProvSpecDelMon] as [@ProvSpecDelMon],
									[ProviderSpecDeliveryMonitoring].[ProvSpecDelMonOccur] as [@ProvSpecDelMonOccur]
								from
									[Intrajob_1516].[Input].[ProviderSpecDeliveryMonitoring]
								where
									[ProviderSpecDeliveryMonitoring].[LearningDelivery_Id] = [LearningDelivery].[LearningDelivery_Id]
								for xml path ('ProviderSpecDeliveryMonitoring'), type
								),
								(
								select
									[LearningDeliveryWorkPlacement].[WorkPlaceEmpId] as [@WorkPlaceEmpId],
									[LearningDeliveryWorkPlacement].[WorkPlaceMode] as [@WorkPlaceMode],
									[LearningDeliveryWorkPlacement].[WorkPlaceStartDate] as [@WorkPlaceStartDate]
								from
									[Intrajob_1516].[Input].[LearningDeliveryWorkPlacement]
								where
									[LearningDeliveryWorkPlacement].[LearningDelivery_Id] = [LearningDelivery].[LearningDelivery_Id]
								for xml path ('LearningDeliveryWorkPlacement'), type
								),
								(
								select
									[TrailblazerApprenticeshipFinancialRecord].[TBFinAmount] as [@TBFinAmount],
									[TrailblazerApprenticeshipFinancialRecord].[TBFinCode] as [@TBFinCode],
									[TrailblazerApprenticeshipFinancialRecord].[TBFinDate] as [@TBFinDate],
									[TrailblazerApprenticeshipFinancialRecord].[TBFinType] as [@TBFinType]
								from
									[Intrajob_1516].[Input].[TrailblazerApprenticeshipFinancialRecord]
								where
									[TrailblazerApprenticeshipFinancialRecord].[LearningDelivery_Id] = [LearningDelivery].[LearningDelivery_Id]
								for xml path ('TrailblazerApprenticeshipFinancialRecord'), type
								)
							from
								[Intrajob_1516].[Input].[LearningDelivery]
							where
								[LearningDelivery].[Learner_Id] = [Learner].[Learner_Id]
							for xml path ('LearningDelivery'), type
							),
							(
							select
								[LearnerFAM].[LearnFAMCode] as [@LearnFAMCode],
								[LearnerFAM].[LearnFAMType] as [@LearnFAMType]
							from
								[Intrajob_1516].[Input].[LearnerFAM]
							where
								[LearnerFAM].[Learner_Id] = [Learner].[Learner_Id]
							for xml path ('LearnerFAM'), type
							),
							(
							select
								[LearnerEmploymentStatus].[DateEmpStatApp] as [@DateEmpStatApp],
								[LearnerEmploymentStatus].[EmpId] as [@EmpId],
								[LearnerEmploymentStatus].[EmpStat] as [@EmpStat],
								(
								select
									[EmploymentStatusMonitoring].[ESMCode] as [@ESMCode],
									[EmploymentStatusMonitoring].[ESMType] as [@ESMType]
								from
									[Intrajob_1516].[Input].[EmploymentStatusMonitoring]
								where
									[EmploymentStatusMonitoring].[LearnerEmploymentStatus_Id] = [LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
								for xml path ('EmploymentStatusMonitoring'), type
								)
							from
								[Intrajob_1516].[Input].[LearnerEmploymentStatus]
							where
								[LearnerEmploymentStatus].[Learner_Id] = [Learner].[Learner_Id]
							for xml path ('LearnerEmploymentStatus'), type
							),
							(
							select
								[LearnerContact].[ContType] as [@ContType],
								[LearnerContact].[Email] as [@Email],
								[LearnerContact].[LocType] as [@LocType],
								[LearnerContact].[PostCode] as [@Postcode],
								[LearnerContact].[TelNumber] as [@TelNumber],
								(
								select
									[PostAdd].[AddLine1] as [@AddLine1],
									[PostAdd].[AddLine2] as [@AddLine2],
									[PostAdd].[AddLine3] as [@AddLine3],
									[PostAdd].[AddLine4] as [@AddLine4]
								from
									[Intrajob_1516].[Input].[PostAdd]
								where
									[PostAdd].[LearnerContact_Id] = [LearnerContact].[LearnerContact_Id]
								for xml path ('PostAdd'), type
								)
							from
								[Intrajob_1516].[Input].[LearnerContact]
							where
								[LearnerContact].[Learner_Id] = [Learner].[Learner_Id]
							for xml path ('LearnerContact'), type
							),
							(
							select
								[ContactPreference].[ContPrefCode] as [@ContPrefCode],
								[ContactPreference].[ContPrefType] as [@ContPrefType]
							from
								[Intrajob_1516].[Input].[ContactPreference]
							where
								[ContactPreference].[Learner_Id] = [Learner].[Learner_Id]
							for xml path ('ContactPreference'), type
							),
							(
							select
								[LLDDandHealthProblem].[LLDDCat] as [@LLDDCat],
								[LLDDandHealthProblem].[PrimaryLLDD] as [@PrimaryLLDD]
							from
								[Intrajob_1516].[Input].[LLDDandHealthProblem]
							where
								[LLDDandHealthProblem].[Learner_Id] = [Learner].[Learner_Id]
							for xml path ('LLDDandHealthProblem'), type
							),
							(
							select
								[LearnerHE].[TTACCOM] as [@TTACCOM],
								[LearnerHE].[UCASPERID] as [@UCASPERID],
								(
								select
									[LearnerHEFinancialSupport].[FINAMOUNT] as [@FINAMOUNT],
									[LearnerHEFinancialSupport].[FINTYPE] as [@FINTYPE]
								from
									[Intrajob_1516].[Input].[LearnerHEFinancialSupport]
								where
									[LearnerHEFinancialSupport].[LearnerHE_Id] = [LearnerHE].[LearnerHE_Id]
								for xml path ('LearnerHEFinancialSupport'), type
								)
							from
								[Intrajob_1516].[Input].[LearnerHE]
							where
								[LearnerHE].[Learner_Id] = [Learner].[Learner_Id]
							for xml path ('LearnerHE'), type
							),
							(
							select
								[ProviderSpecLearnerMonitoring].[ProvSpecLearnMon] as [@ProvSpecLearnMon],
								[ProviderSpecLearnerMonitoring].[ProvSpecLearnMonOccur] as [@ProvSpecLearnMonOccur]
							from
								[Intrajob_1516].[Input].[ProviderSpecLearnerMonitoring]
							where
								[ProviderSpecLearnerMonitoring].[Learner_Id] = [Learner].[Learner_Id]
							for xml path ('ProviderSpecLearnerMonitoring'), type
							)
						from
							[Intrajob_1516].[Input].[Learner]
						where
							[Learner].[Learner_Id] = [ControllingTable].[Learner_Id]
						for xml path ('Learner'), type
						)
					from
						[Intrajob_1516].[Input].[LearningProvider]
					for xml path ('global'), type
				)
			)
		from
			[Input].[Learner] ControllingTable
	end
GO
if object_id('[Rulebase].[VALFD_Insert_global]','p') is not null
	drop procedure [Rulebase].[VALFD_Insert_global]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 21 July 2015 10:40
-- Profile: 1516 Test Harness Validation
-- Rulebase Version: DCSS 1516 Validation FD 1516, Drop 000, Version 1516.04
-- =====================================================================================================
create procedure [Rulebase].[VALFD_Insert_global]
	(
		@UKPRN int,
		@RulebaseVersion varchar(10)
	)
as
	begin
		set nocount on
		insert into
			[Rulebase].[VALFD_global]
		values (
			@UKPRN,
			@RulebaseVersion
		)
	end
GO
if object_id('[Rulebase].[VALFD_Insert_ValidationError]','p') is not null
	drop procedure [Rulebase].[VALFD_Insert_ValidationError]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 21 July 2015 10:40
-- Profile: 1516 Test Harness Validation
-- Rulebase Version: DCSS 1516 Validation FD 1516, Drop 000, Version 1516.04
-- =====================================================================================================
create procedure [Rulebase].[VALFD_Insert_ValidationError]
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
			[Rulebase].[VALFD_ValidationError]
		values (
			@AimSeqNumber,
			@ErrorString,
			@FieldValues,
			@LearnRefNumber,
			@RuleId
		)
	end
GO
