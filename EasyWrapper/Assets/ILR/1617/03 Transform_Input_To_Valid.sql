if object_id ('TransformInputToValid_CollectionDetails', 'p') is not null
begin
	exec ('drop procedure TransformInputToValid_CollectionDetails');
end
go

create procedure [dbo].[TransformInputToValid_CollectionDetails] as
	begin
		insert into 
			[Valid].[CollectionDetails]
				(
					[Collection],
					[Year],
					[FilePreparationDate]
				)
		select
			[CollectionDetails].[Collection],
			[CollectionDetails].[Year],
			[CollectionDetails].[FilePreparationDate]
		from
			[Input].[CollectionDetails]
	end

GO

if object_id ('TransformInputToValid_ContactPreference', 'p') is not null
begin 
	exec ('drop procedure TransformInputToValid_ContactPreference');
end
go

create procedure [dbo].[TransformInputToValid_ContactPreference] as
	begin
		insert into 
			[Valid].[ContactPreference]
				(
					[LearnRefNumber],
					[ContPrefType],
					[ContPrefCode]
				)
		select
			[Learner].[LearnRefNumber],
			[ContactPreference].[ContPrefType],
			[ContactPreference].[ContPrefCode]
		from
			[Input].[ContactPreference]
			inner join [Input].[Learner]
				on [ContactPreference].[Learner_Id]=[Learner].[Learner_Id]
	end

GO

if object_id ('TransformInputToValid_DPOutcome', 'p') is not null
begin 
	exec ('drop procedure TransformInputToValid_DPOutcome');
end
go

create procedure [dbo].[TransformInputToValid_DPOutcome] as
	begin
		insert into 
			[Valid].[DPOutcome]
				(
					[LearnRefNumber],
					[OutType],
					[OutCode],
					[OutStartDate],
					[OutEndDate],
					[OutCollDate]
				)
		select
			[LearnerDestinationandProgression].[LearnRefNumber],
			[DPOutcome].[OutType],
			[DPOutcome].[OutCode],
			[DPOutcome].[OutStartDate],
			[DPOutcome].[OutEndDate],
			[DPOutcome].[OutCollDate]
		from
			[Input].[DPOutcome]
			inner join [Input].[LearnerDestinationandProgression]
				on [LearnerDestinationandProgression].[LearnerDestinationandProgression_Id]=[DPOutcome].[LearnerDestinationandProgression_Id]
	end

GO

if object_id ('TransformInputToValid_Learner', 'p') is not null
begin
	exec ('drop procedure TransformInputToValid_Learner');
end
go

create procedure [dbo].[TransformInputToValid_Learner] as
	begin
		insert into 
			[Valid].[Learner]
				(
					[LearnRefNumber],
					[PrevLearnRefNumber],
					[PrevUKPRN],
					[ULN],
					[FamilyName],
					[GivenNames],
					[DateOfBirth],
					[Ethnicity],
					[Sex],
					[LLDDHealthProb],
					[NINumber],
					[PriorAttain],
					[Accom],
					[ALSCost],
					[PlanLearnHours],
					[PlanEEPHours],
					[MathGrade],
					[EngGrade],
					[HomePostcode],
					[CurrentPostcode],
					[LrnFAM_DLA],
					[LrnFAM_ECF],
					[LrnFAM_EDF1],
					[LrnFAM_EDF2],
					[LrnFAM_EHC],
					[LrnFAM_FME],
					[LrnFAM_HNS],
					[LrnFAM_LDA],
					[LrnFAM_LSR1],
					[LrnFAM_LSR2],
					[LrnFAM_LSR3],
					[LrnFAM_LSR4],
					[LrnFAM_MCF],
					[LrnFAM_NLM1],
					[LrnFAM_NLM2],
					[LrnFAM_PPE1],
					[LrnFAM_PPE2],
					[LrnFAM_SEN],
					[ProvSpecMon_A],
					[ProvSpecMon_B]
				)
		select
			[Learner].[LearnRefNumber],
			[Learner].[PrevLearnRefNumber],
			[Learner].[PrevUKPRN],
			[Learner].[ULN],
			[Learner].[FamilyName],
			[Learner].[GivenNames],
			[Learner].[DateOfBirth],
			[Learner].[Ethnicity],
			[Learner].[Sex],
			[Learner].[LLDDHealthProb],
			[Learner].[NINumber],
			[Learner].[PriorAttain],
			[Learner].[Accom],
			[Learner].[ALSCost],
			[Learner].[PlanLearnHours],
			[Learner].[PlanEEPHours],
			[Learner].[MathGrade],
			[Learner].[EngGrade],
			HP.Postcode,
			CP.Postcode,
			[LrnFAM_DLA].[LearnFAMCode],
			[LrnFAM_ECF].[LearnFAMCode],
			[EDF].[EDF1],
			[EDF].[EDF2],
			[LrnFAM_EHC].[LearnFAMCode],
			[LrnFAM_FME].[LearnFAMCode],
			[LrnFAM_HNS].[LearnFAMCode],
			[LrnFAM_LDA].[LearnFAMCode],
			[LSR].[LSR1],
			[LSR].[LSR2],
			[LSR].[LSR3],
			[LSR].[LSR4],
			[LrnFAM_MCF].[LearnFAMCode],
			[NLM].[NLM1],
			[NLM].[NLM2],
			[PPE].[PPE1],
			[PPE].[PPE2],
			[LrnFAM_SEN].[LearnFAMCode],
			[ProvSpecMon_A].[ProvSpecLearnMon],
			[ProvSpecMon_B].[ProvSpecLearnMon]
		from
			[Input].[Learner]
			left join [Input].LearnerContact HP
				on Learner.Learner_Id=HP.Learner_Id
				and HP.LocType=2
				and HP.ContType=1
			left join [Input].LearnerContact CP
				on Learner.Learner_Id=CP.Learner_Id
				and CP.LocType=2
				and CP.ContType=2
			left join [Input].[LearnerFAM] as [LrnFAM_DLA]
				on [LrnFAM_DLA].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_DLA].[LearnFAMType]='DLA'
			left join [Input].[LearnerFAM] as [LrnFAM_ECF]
				on [LrnFAM_ECF].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_ECF].[LearnFAMType]='ECF'
			left join
				(
					select
						[Learner_Id],
						max([EDF1]) as [EDF1],
						max([EDF2]) as [EDF2]
					from
						(
							select
								[Learner_Id],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 1 then LearnFAMCode else null end  as [EDF1],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 2 then LearnFAMCode else null end  as [EDF2]
							from
								[Input].[LearnerFAM]
							where
								[LearnFAMType]='EDF'
						) as [EDFs]
					group by
						[Learner_Id]
				) as [EDF]
				on [EDF].[Learner_Id]=[Learner].[Learner_Id]
			left join [Input].[LearnerFAM] as [LrnFAM_EHC]
				on [LrnFAM_EHC].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_EHC].[LearnFAMType]='EHC'
			left join [Input].[LearnerFAM] as [LrnFAM_FME]
				on [LrnFAM_FME].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_FME].[LearnFAMType]='FME'
			left join [Input].[LearnerFAM] as [LrnFAM_HNS]
				on [LrnFAM_HNS].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_HNS].[LearnFAMType]='HNS'
			left join [Input].[LearnerFAM] as [LrnFAM_LDA]
				on [LrnFAM_LDA].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_LDA].[LearnFAMType]='LDA'
			left join
				(
					select
						[Learner_Id],
						max([LSR1]) as [LSR1],
						max([LSR2]) as [LSR2],
						max([LSR3]) as [LSR3],
						max([LSR4]) as [LSR4]
					from
						(
							select
								[Learner_Id],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 1 then LearnFAMCode else null end  as [LSR1],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 2 then LearnFAMCode else null end  as [LSR2],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 3 then LearnFAMCode else null end  as [LSR3],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 4 then LearnFAMCode else null end  as [LSR4]
							from
								[Input].[LearnerFAM]
							where
								[LearnFAMType]='LSR'
						) as [LSRs]
					group by
						[Learner_Id]
				) as [LSR]
				on [LSR].[Learner_Id]=[Learner].[Learner_Id]
			left join [Input].[LearnerFAM] as [LrnFAM_MCF]
				on [LrnFAM_MCF].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_MCF].[LearnFAMType]='MCF'
			left join
				(
					select
						[Learner_Id],
						max([NLM1]) as [NLM1],
						max([NLM2]) as [NLM2]
					from
						(
							select
								[Learner_Id],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 1 then LearnFAMCode else null end  as [NLM1],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 2 then LearnFAMCode else null end  as [NLM2]
							from
								[Input].[LearnerFAM]
							where
								[LearnFAMType]='NLM'
						) as [NLMs]
					group by
						[Learner_Id]
				) as [NLM]
				on [NLM].[Learner_Id]=[Learner].[Learner_Id]
			left join
				(
					select
						[Learner_Id],
						max([PPE1]) as [PPE1],
						max([PPE2]) as [PPE2]
					from
						(
							select
								[Learner_Id],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 1 then LearnFAMCode else null end  as [PPE1],
								case row_number() over (partition by [Learner_Id] order by [Learner_Id]) when 2 then LearnFAMCode else null end  as [PPE2]
							from
								[Input].[LearnerFAM]
							where
								[LearnFAMType]='PPE'
						) as [PPEs]
					group by
						[Learner_Id]
				) as [PPE]
				on [PPE].[Learner_Id]=[Learner].[Learner_Id]
			left join [Input].[LearnerFAM] as [LrnFAM_SEN]
				on [LrnFAM_SEN].[Learner_Id]=[Learner].[Learner_Id]
				and [LrnFAM_SEN].[LearnFAMType]='SEN'
			left join [Input].[ProviderSpecLearnerMonitoring] as [ProvSpecMon_A]
				on [ProvSpecMon_A].[Learner_Id]=[Learner].[Learner_Id]
				and [ProvSpecMon_A].[ProvSpecLearnMonOccur]='A'
			left join [Input].[ProviderSpecLearnerMonitoring] as [ProvSpecMon_B]
				on [ProvSpecMon_B].[Learner_Id]=[Learner].[Learner_Id]
				and [ProvSpecMon_B].[ProvSpecLearnMonOccur]='B'

	end

GO

if object_id ('TransformInputToValid_LearnerContact','p') is not null
begin
	exec ('drop procedure TransformInputToValid_LearnerContact');
end
go

create procedure [dbo].[TransformInputToValid_LearnerContact] as
	begin
		insert into 
			[Valid].[LearnerContact]
				(
					[LearnRefNumber],
					[HomePostcode],
					[CurrentPostcode],
					[TelNumber],
					[Email],
					[AddLine1],
					[AddLine2],
					[AddLine3],
					[AddLine4]
				)
		select
			[Learner].[LearnRefNumber],
			[ConjoinedLearnerContact].[HomePostcode],
			[ConjoinedLearnerContact].[CurrentPostcode],
			[ConjoinedLearnerContact].[TelNumber],
			[ConjoinedLearnerContact].[Email],
			[ConjoinedLearnerContact].[AddLine1],
			[ConjoinedLearnerContact].[AddLine2],
			[ConjoinedLearnerContact].[AddLine3],
			[ConjoinedLearnerContact].[AddLine4]
		from
			(
				select
					coalesce(CurrentContact.Learner_Id,PreviousContact.Learner_Id) Learner_Id,
					max(PostAdd.AddLine1) AddLine1,
					max(PostAdd.AddLine2) AddLine2,
					max(PostAdd.AddLine3) AddLine3,
					max(PostAdd.AddLine4) AddLine4,
					max(CurrentContact.Postcode) CurrentPostcode,
					max(PreviousContact.Postcode) HomePostcode,
					max(CurrentContact.Email) Email,
					max(CurrentContact.TelNumber) TelNumber
				from
					(select * from [Input].LearnerContact where ContType=2) CurrentContact
					full outer join [Input].LearnerContact PreviousContact
						on CurrentContact.Learner_Id=PreviousContact.Learner_Id
						and PreviousContact.ContType=1
					full outer join [Input].PostAdd 
						on CurrentContact.LearnerContact_Id=PostAdd.LearnerContact_Id
				group by
					coalesce(CurrentContact.Learner_Id,PreviousContact.Learner_Id)			
			) as [ConjoinedLearnerContact]
			inner join [Input].[Learner]
				on [ConjoinedLearnerContact].[Learner_Id]=[Learner].[Learner_Id]

	end

GO

if object_id('TransformInputToValid_LearnerDestinationandProgression','p') is not null
begin
	exec ('drop procedure TransformInputToValid_LearnerDestinationandProgression');
end
go

create procedure [dbo].[TransformInputToValid_LearnerDestinationandProgression] as
	begin
		insert into 
			[Valid].[LearnerDestinationandProgression]
				(
					[LearnRefNumber],
					[ULN]
				)
		select
			[LearnerDestinationandProgression].[LearnRefNumber],
			[LearnerDestinationandProgression].[ULN]
		from
			[Input].[LearnerDestinationandProgression]
	end

GO

if object_id('TransformInputToValid_LearnerEmploymentStatus', 'p') is not null
begin
	exec ('drop procedure TransformInputToValid_LearnerEmploymentStatus');
end
go

create procedure [dbo].[TransformInputToValid_LearnerEmploymentStatus] as
	begin
		insert into 
			[Valid].[LearnerEmploymentStatus]
				(
					[LearnRefNumber],
					[EmpStat],
					[DateEmpStatApp],
					[EmpId],
					[EmpStatMon_BSI],
					[EmpStatMon_EII],
					[EmpStatMon_LOE],
					[EmpStatMon_LOU],
					[EmpStatMon_PEI],
					[EmpStatMon_SEI],
					[EmpStatMon_SEM]
				)
		select
			[Learner].[LearnRefNumber],
			[LearnerEmploymentStatus].[EmpStat],
			[LearnerEmploymentStatus].[DateEmpStatApp],
			[LearnerEmploymentStatus].[EmpId],
			[EmpStatMon_BSI].[ESMCode],
			[EmpStatMon_EII].[ESMCode],
			[EmpStatMon_LOE].[ESMCode],
			[EmpStatMon_LOU].[ESMCode],
			[EmpStatMon_PEI].[ESMCode],
			[EmpStatMon_SEI].[ESMCode],
			[EmpStatMon_SEM].[ESMCode]
		from
			[Input].[LearnerEmploymentStatus]
			inner join [Input].[Learner]
				on [LearnerEmploymentStatus].[Learner_Id]=[Learner].[Learner_Id]
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_BSI]
				on [EmpStatMon_BSI].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_BSI].[ESMType]='BSI'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_EII]
				on [EmpStatMon_EII].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_EII].[ESMType]='EII'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_LOE]
				on [EmpStatMon_LOE].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_LOE].[ESMType]='LOE'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_LOU]
				on [EmpStatMon_LOU].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_LOU].[ESMType]='LOU'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_PEI]
				on [EmpStatMon_PEI].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_PEI].[ESMType]='PEI'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_RON]
				on [EmpStatMon_RON].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_RON].[ESMType]='RON'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_SEI]
				on [EmpStatMon_SEI].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_SEI].[ESMType]='SEI'
			left join [Input].[EmploymentStatusMonitoring] as [EmpStatMon_SEM]
				on [EmpStatMon_SEM].[LearnerEmploymentStatus_Id]=[LearnerEmploymentStatus].[LearnerEmploymentStatus_Id]
				and [EmpStatMon_SEM].[ESMType]='SEM'

	end

GO

if object_id('TransformInputToValid_LearnerHE', 'p') is not null
begin
	exec ('drop procedure TransformInputToValid_LearnerHE');
end
go

create procedure [dbo].[TransformInputToValid_LearnerHE] as
	begin
		insert into 
			[Valid].[LearnerHE]
				(
					[LearnRefNumber],
					[UCASPERID],
					[TTACCOM]
				)
		select
			[Learner].[LearnRefNumber],
			[LearnerHE].[UCASPERID],
			[LearnerHE].[TTACCOM]
		from
			[Input].[LearnerHE]
			inner join [Input].[Learner]
				on [LearnerHE].[Learner_Id]=[Learner].[Learner_Id]

	end

GO

if object_id ('TransformInputToValid_LearnerHEFinancialSupport', 'p') is not null
begin
	exec ('drop procedure TransformInputToValid_LearnerHEFinancialSupport');
end
go

CREATE procedure [dbo].[TransformInputToValid_LearnerHEFinancialSupport] as
	begin
		insert into 
			[Valid].[LearnerHEFinancialSupport]
				(
					[LearnRefNumber],
					[FINTYPE],
					[FINAMOUNT]
				)
		select
			[Learner].[LearnRefNumber],
			[LearnerHEFinancialSupport].[FINTYPE],
			[LearnerHEFinancialSupport].[FINAMOUNT]
		from
			[Input].[LearnerHEFinancialSupport]
			inner join [Input].[LearnerHE]
				on [LearnerHEFinancialSupport].[LearnerHE_Id]=[LearnerHE].[LearnerHE_Id]
			inner join [Input].[Learner]
				on [Learner].[Learner_Id]=[LearnerHE].[Learner_Id]

	end

GO

if object_id('TransformInputToValid_LearningDelivery', 'p') is not null
begin
	exec ('drop procedure TransformInputToValid_LearningDelivery');
end
go

CREATE procedure [dbo].[TransformInputToValid_LearningDelivery] as
	begin
		insert into 
			[Valid].[LearningDelivery]
				(
					[LearnRefNumber],
					[LearnAimRef],
					[AimType],
					[AimSeqNumber],
					[LearnStartDate],
					[OrigLearnStartDate],
					[LearnPlanEndDate],
					[FundModel],
					[ProgType],
					[FworkCode],
					[PwayCode],
					[StdCode],
					[PartnerUKPRN],
					[DelLocPostCode],
					[AddHours],
					[PriorLearnFundAdj],
					[OtherFundAdj],
					[ConRefNumber],
					[EmpOutcome],
					[CompStatus],
					[LearnActEndDate],
					[WithdrawReason],
					[Outcome],
					[AchDate],
					[OutGrade],
					[SWSupAimId],
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
					[LrnDelFAM_WPP],
					[ProvSpecMon_A],
					[ProvSpecMon_B],
					[ProvSpecMon_C],
					[ProvSpecMon_D]
				)
		select
			[Learner].[LearnRefNumber],
			[LearningDelivery].[LearnAimRef],
			[LearningDelivery].[AimType],
			[LearningDelivery].[AimSeqNumber],
			[LearningDelivery].[LearnStartDate],
			[LearningDelivery].[OrigLearnStartDate],
			[LearningDelivery].[LearnPlanEndDate],
			[LearningDelivery].[FundModel],
			[LearningDelivery].[ProgType],
			[LearningDelivery].[FworkCode],
			[LearningDelivery].[PwayCode],
			[LearningDelivery].[StdCode],
			[LearningDelivery].[PartnerUKPRN],
			[LearningDelivery].[DelLocPostCode],
			[LearningDelivery].[AddHours],
			[LearningDelivery].[PriorLearnFundAdj],
			[LearningDelivery].[OtherFundAdj],
			[LearningDelivery].[ConRefNumber],
			[LearningDelivery].[EmpOutcome],
			[LearningDelivery].[CompStatus],
			[LearningDelivery].[LearnActEndDate],
			[LearningDelivery].[WithdrawReason],
			[LearningDelivery].[Outcome],
			[LearningDelivery].[AchDate],
			[LearningDelivery].[OutGrade],
			[LearningDelivery].[SWSupAimId],
			[LrnDelFAM_ADL].[LearnDelFAMCode],
			[LrnDelFAM_ASL].[LearnDelFAMCode],
			[LrnDelFAM_EEF].[LearnDelFAMCode],
			[LrnDelFAM_FFI].[LearnDelFAMCode],
			[LrnDelFAM_FLN].[LearnDelFAMCode],
			[HEM].[HEM1],
			[HEM].[HEM2],
			[HEM].[HEM3],
			[HHS].[HHS1],
			[HHS].[HHS2],
			[LDM].[LDM1],
			[LDM].[LDM2],
			[LDM].[LDM3],
			[LDM].[LDM4],
			[LrnDelFAM_NSA].[LearnDelFAMCode],
			[LrnDelFAM_POD].[LearnDelFAMCode],
			[LrnDelFAM_RES].[LearnDelFAMCode],
			[LrnDelFAM_SOF].[LearnDelFAMCode],
			[LrnDelFAM_SPP].[LearnDelFAMCode],
			[LrnDelFAM_WPP].[LearnDelFAMCode],
			[ProvSpecMon_A].[ProvSpecDelMon],
			[ProvSpecMon_B].[ProvSpecDelMon],
			[ProvSpecMon_C].[ProvSpecDelMon],
			[ProvSpecMon_D].[ProvSpecDelMon]
		from
			[Input].[LearningDelivery]
			inner join [Input].[Learner]
				on [LearningDelivery].[Learner_Id]=[Learner].[Learner_Id]
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_ADL]
				on [LrnDelFAM_ADL].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_ADL].[LearnDelFAMType]='ADL'
			left join
				(
					select
						[LearningDelivery_Id]
					from
						(
							select
								[LearningDelivery_Id]
							from
								[Input].[LearningDeliveryFAM]
							where
								[LearnDelFAMType]='ALB'
						) as [ALBs]
					group by
						[LearningDelivery_Id]
				) as [ALB]
				on [ALB].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_ASL]
				on [LrnDelFAM_ASL].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_ASL].[LearnDelFAMType]='ASL'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_EEF]
				on [LrnDelFAM_EEF].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_EEF].[LearnDelFAMType]='EEF'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_FFI]
				on [LrnDelFAM_FFI].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_FFI].[LearnDelFAMType]='FFI'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_FLN]
				on [LrnDelFAM_FLN].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_FLN].[LearnDelFAMType]='FLN'
			left join
				(
					select
						[LearningDelivery_Id],
						max([HEM1]) as [HEM1],
						max([HEM2]) as [HEM2],
						max([HEM3]) as [HEM3]
					from
						(
							select
								[LearningDelivery_Id],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 1 then LearnDelFAMCode else null end  as [HEM1],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 2 then LearnDelFAMCode else null end  as [HEM2],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 3 then LearnDelFAMCode else null end  as [HEM3]
							from
								[Input].[LearningDeliveryFAM]
							where
								[LearnDelFAMType]='HEM'
						) as [HEMs]
					group by
						[LearningDelivery_Id]
				) as [HEM]
				on [HEM].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			left join
				(
					select
						[LearningDelivery_Id],
						max([HHS1]) as [HHS1],
						max([HHS2]) as [HHS2]
					from
						(
							select
								[LearningDelivery_Id],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 1 then LearnDelFAMCode else null end  as [HHS1],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 2 then LearnDelFAMCode else null end  as [HHS2]
							from
								[Input].[LearningDeliveryFAM]
							where
								[LearnDelFAMType]='HHS'
						) as [HHSs]
					group by
						[LearningDelivery_Id]
				) as [HHS]
				on [HHS].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			left join
				(
					select
						[LearningDelivery_Id],
						max([LDM1]) as [LDM1],
						max([LDM2]) as [LDM2],
						max([LDM3]) as [LDM3],
						max([LDM4]) as [LDM4]
					from
						(
							select
								[LearningDelivery_Id],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 1 then LearnDelFAMCode else null end  as [LDM1],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 2 then LearnDelFAMCode else null end  as [LDM2],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 3 then LearnDelFAMCode else null end  as [LDM3],
								case row_number() over (partition by [LearningDelivery_Id] order by [LearningDelivery_Id]) when 4 then LearnDelFAMCode else null end  as [LDM4]
							from
								[Input].[LearningDeliveryFAM]
							where
								[LearnDelFAMType]='LDM'
						) as [LDMs]
					group by
						[LearningDelivery_Id]
				) as [LDM]
				on [LDM].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			left join
				(
					select
						[LearningDelivery_Id]
					from
						(
							select
								[LearningDelivery_Id]
							from
								[Input].[LearningDeliveryFAM]
							where
								[LearnDelFAMType]='LSF'
						) as [LSFs]
					group by
						[LearningDelivery_Id]
				) as [LSF]
				on [LSF].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_NSA]
				on [LrnDelFAM_NSA].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_NSA].[LearnDelFAMType]='NSA'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_POD]
				on [LrnDelFAM_POD].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_POD].[LearnDelFAMType]='POD'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_RES]
				on [LrnDelFAM_RES].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_RES].[LearnDelFAMType]='RES'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_SOF]
				on [LrnDelFAM_SOF].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_SOF].[LearnDelFAMType]='SOF'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_SPP]
				on [LrnDelFAM_SPP].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_SPP].[LearnDelFAMType]='SPP'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_TBS]
				on [LrnDelFAM_TBS].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_TBS].[LearnDelFAMType]='TBS'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_WPL]
				on [LrnDelFAM_WPL].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_WPL].[LearnDelFAMType]='WPL'
			left join [Input].[LearningDeliveryFAM] as [LrnDelFAM_WPP]
				on [LrnDelFAM_WPP].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [LrnDelFAM_WPP].[LearnDelFAMType]='WPP'
			left join [Input].[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_A]
				on [ProvSpecMon_A].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [ProvSpecMon_A].[ProvSpecDelMonOccur]='A'
			left join [Input].[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_B]
				on [ProvSpecMon_B].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [ProvSpecMon_B].[ProvSpecDelMonOccur]='B'
			left join [Input].[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_C]
				on [ProvSpecMon_C].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [ProvSpecMon_C].[ProvSpecDelMonOccur]='C'
			left join [Input].[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_D]
				on [ProvSpecMon_D].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
				and [ProvSpecMon_D].[ProvSpecDelMonOccur]='D'

	end
GO

if object_id ('TransformInputToValid_LearningDeliveryFAM', 'p') is not null
begin
	exec ('drop procedure TransformInputToValid_LearningDeliveryFAM');
end
go

create procedure [dbo].[TransformInputToValid_LearningDeliveryFAM] as
	begin
		insert into 
			[Valid].[LearningDeliveryFAM]
				(
					[LearnRefNumber],
					[AimSeqNumber],
					[LearnDelFAMType],
					[LearnDelFAMCode],
					[LearnDelFAMDateFrom],
					[LearnDelFAMDateTo]
				)
		select
			[Learner].[LearnRefNumber],
			[LearningDelivery].[AimSeqNumber],
			[LearningDeliveryFAM].[LearnDelFAMType],
			[LearningDeliveryFAM].[LearnDelFAMCode],
			[LearningDeliveryFAM].[LearnDelFAMDateFrom],
			[LearningDeliveryFAM].[LearnDelFAMDateTo]
		from
			[Input].[LearningDeliveryFAM]
			inner join [Input].[LearningDelivery]
				on [LearningDeliveryFAM].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			inner join [Input].[Learner]
				on [LearningDelivery].[Learner_Id]=[Learner].[Learner_Id]

		where 
			[LearningDeliveryFAM].[LearnDelFAMType] in ('ACT','LSF','ALB')
	end
GO

if object_id('TransformInputToValid_LearningDeliveryHE', 'p') is not null
begin
	exec ('drop procedure TransformInputToValid_LearningDeliveryHE');
end
go

create procedure [dbo].[TransformInputToValid_LearningDeliveryHE] as
	begin
		insert into 
			[Valid].[LearningDeliveryHE]
				(
					[LearnRefNumber],
					[AimSeqNumber],
					[NUMHUS],
					[SSN],
					[QUALENT3],
					[SOC2000],
					[SEC],
					[UCASAPPID],
					[TYPEYR],
					[MODESTUD],
					[FUNDLEV],
					[FUNDCOMP],
					[STULOAD],
					[YEARSTU],
					[MSTUFEE],
					[PCOLAB],
					[PCFLDCS],
					[PCSLDCS],
					[PCTLDCS],
					[SPECFEE],
					[NETFEE],
					[GROSSFEE],
					[DOMICILE],
					[ELQ],
					[HEPostCode]
				)
		select
			[Learner].[LearnRefNumber],
			[LearningDelivery].[AimSeqNumber],
			[LearningDeliveryHE].[NUMHUS],
			[LearningDeliveryHE].[SSN],
			[LearningDeliveryHE].[QUALENT3],
			[LearningDeliveryHE].[SOC2000],
			[LearningDeliveryHE].[SEC],
			[LearningDeliveryHE].[UCASAPPID],
			[LearningDeliveryHE].[TYPEYR],
			[LearningDeliveryHE].[MODESTUD],
			[LearningDeliveryHE].[FUNDLEV],
			[LearningDeliveryHE].[FUNDCOMP],
			[LearningDeliveryHE].[STULOAD],
			[LearningDeliveryHE].[YEARSTU],
			[LearningDeliveryHE].[MSTUFEE],
			[LearningDeliveryHE].[PCOLAB],
			[LearningDeliveryHE].[PCFLDCS],
			[LearningDeliveryHE].[PCSLDCS],
			[LearningDeliveryHE].[PCTLDCS],
			[LearningDeliveryHE].[SPECFEE],
			[LearningDeliveryHE].[NETFEE],
			[LearningDeliveryHE].[GROSSFEE],
			[LearningDeliveryHE].[DOMICILE],
			[LearningDeliveryHE].[ELQ],
			[LearningDeliveryHE].[HEPostCode]
		from
			[Input].[LearningDeliveryHE]
			inner join [Input].[LearningDelivery]
				on [LearningDeliveryHE].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			inner join [Input].[Learner]
				on [LearningDelivery].[Learner_Id]=[Learner].[Learner_Id]

	end
GO

if object_id('TransformInputToValid_LearningDeliveryWorkPlacement', 'p') is not null
begin
	exec ('drop procedure TransformInputToValid_LearningDeliveryWorkPlacement');
end
go

create procedure [dbo].[TransformInputToValid_LearningDeliveryWorkPlacement] as
	begin
		insert into 
			[Valid].[LearningDeliveryWorkPlacement]
				(
					[LearnRefNumber],
					[AimSeqNumber],
					[WorkPlaceStartDate],
					[WorkPlaceEndDate],
					[WorkPlaceMode],
					[WorkPlaceEmpId]
				)
		select
			[Learner].[LearnRefNumber],
			[LearningDelivery].[AimSeqNumber],
			[LearningDeliveryWorkPlacement].[WorkPlaceStartDate],
			[LearningDeliveryWorkPlacement].[WorkPlaceEndDate],
			[LearningDeliveryWorkPlacement].[WorkPlaceMode],
			[LearningDeliveryWorkPlacement].[WorkPlaceEmpId]
		from
			[Input].[LearningDeliveryWorkPlacement]
			inner join [Input].[LearningDelivery]
				on [LearningDeliveryWorkPlacement].[LearningDelivery_Id]=[LearningDelivery].[LearningDelivery_Id]
			inner join [Input].[Learner]
				on [LearningDelivery].[Learner_Id]=[Learner].[Learner_Id]

	end
GO

if object_id('TransformInputToValid_LearningProvider', 'p') is not null
begin
	exec ('drop procedure TransformInputToValid_LearningProvider');
end
go

create procedure [dbo].[TransformInputToValid_LearningProvider] as
	begin
		insert into 
			[Valid].[LearningProvider]
				(
					[UKPRN]
				)
		select
			[LearningProvider].[UKPRN]
		from
			[Input].[LearningProvider]
	end
GO

if object_id('TransformInputToValid_LLDDandHealthProblem', 'p') is  not null
begin
	exec ('drop procedure TransformInputToValid_LLDDandHealthProblem');
end
go

create procedure [dbo].[TransformInputToValid_LLDDandHealthProblem] as
	begin
		insert into 
			[Valid].[LLDDandHealthProblem]
				(
					[LearnRefNumber],
					[LLDDCat],
					[PrimaryLLDD]
				)
		select
			[Learner].[LearnRefNumber],
			[LLDDandHealthProblem].[LLDDCat],
			[LLDDandHealthProblem].[PrimaryLLDD]
		from
			[Input].[LLDDandHealthProblem]
			inner join [Input].[Learner]
				on [LLDDandHealthProblem].[Learner_Id]=[Learner].[Learner_Id]

	end
GO

if object_id('TransformInputToValid_Source', 'p') is not null
begin
	exec ('drop procedure TransformInputToValid_Source');
end
go

create procedure [dbo].[TransformInputToValid_Source] as
	begin
		insert into 
			[Valid].[Source]
				(
					[ProtectiveMarking],
					[UKPRN],
					[SoftwareSupplier],
					[SoftwarePackage],
					[Release],
					[SerialNo],
					[DateTime],
					[ReferenceData],
					[ComponentSetVersion]
				)
		select
			[Source].[ProtectiveMarking],
			[Source].[UKPRN],
			[Source].[SoftwareSupplier],
			[Source].[SoftwarePackage],
			[Source].[Release],
			[Source].[SerialNo],
			[Source].[DateTime],
			[Source].[ReferenceData],
			[Source].[ComponentSetVersion]
		from
			[Input].[Source]
	end
GO

if object_id('TransformInputToValid_SourceFile', 'p') is not null
begin 
	exec ('drop procedure TransformInputToValid_SourceFile');	
end
go

create procedure [dbo].[TransformInputToValid_SourceFile] as
	begin
		insert into 
			[Valid].[SourceFile]
				(
					[SourceFileName],
					[FilePreparationDate],
					[SoftwareSupplier],
					[SoftwarePackage],
					[Release],
					[SerialNo],
					[DateTime]
				)
		select
			[SourceFile].[SourceFileName],
			[SourceFile].[FilePreparationDate],
			[SourceFile].[SoftwareSupplier],
			[SourceFile].[SoftwarePackage],
			[SourceFile].[Release],
			[SourceFile].[SerialNo],
			[SourceFile].[DateTime]
		from
			[Input].[SourceFile]
	end
GO

if object_id('TransformInputToValid_TrailblazerApprenticeshipFinancialRecord') is not null
begin
	exec ('drop procedure TransformInputtoValid_TrailblazerApprenticeshipFinancialRecord');
end
go

CREATE procedure [dbo].[TransformInputToValid_TrailblazerApprenticeshipFinancialRecord] as
	begin
		insert into 
			[Valid].[TrailblazerApprenticeshipFinancialRecord]
				(
					[LearnRefNumber],
					[AimSeqNumber],
					[TBFinType],
					[TBFinCode],
					[TBFinDate],
					[TBFinAmount]
				)
		select
			[Learner].[LearnRefNumber],
			[LearningDelivery].[AimSeqNumber],
			[TrailblazerApprenticeshipFinancialRecord].[TBFinType],
			[TrailblazerApprenticeshipFinancialRecord].[TBFinCode],
			[TrailblazerApprenticeshipFinancialRecord].[TBFinDate],
			[TrailblazerApprenticeshipFinancialRecord].[TBFinAmount]
		from
			[Input].[TrailblazerApprenticeshipFinancialRecord]
			inner join [Input].[LearningDelivery]
				on [LearningDelivery].[LearningDelivery_Id]=[TrailblazerApprenticeshipFinancialRecord].[LearningDelivery_Id]
			inner join [Input].[Learner]
				on [Learner].[Learner_Id]=[LearningDelivery].[Learner_Id]

	end
go

if object_id ('TransformInputToValid', 'p') is not null
begin
	exec ('drop procedure [TransformInputToValid]');
end
go

create procedure [dbo].[TransformInputToValid] as
	begin
		exec dbo.TransformInputToValid_CollectionDetails
		exec dbo.TransformInputToValid_Source
		exec dbo.TransformInputToValid_LearnerDestinationandProgression
		exec dbo.TransformInputToValid_DPOutcome
		exec dbo.TransformInputToValid_SourceFile
		exec dbo.TransformInputToValid_LearningProvider
		exec dbo.TransformInputToValid_Learner
		exec dbo.TransformInputToValid_ContactPreference
		exec dbo.TransformInputToValid_LLDDandHealthProblem
		exec dbo.TransformInputToValid_LearnerEmploymentStatus
		exec dbo.TransformInputToValid_LearnerHE
		exec dbo.TransformInputToValid_LearnerHEFinancialSupport
		exec dbo.TransformInputToValid_LearningDelivery
		exec dbo.TransformInputToValid_LearningDeliveryFAM
		exec dbo.TransformInputToValid_LearningDeliveryWorkPlacement
		exec dbo.TransformInputToValid_TrailblazerApprenticeshipFinancialRecord
		exec dbo.TransformInputToValid_LearningDeliveryHE
		exec dbo.TransformInputToValid_LearnerContact
	end

GO