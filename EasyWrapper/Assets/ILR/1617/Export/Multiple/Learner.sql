select coalesce(cast((
	select
		Learner.LearnRefNumber,
		Learner.PrevLearnRefNumber,
		Learner.PrevUKPRN,
		Learner.ULN,
		Learner.FamilyName,
		Learner.GivenNames,
		cast(Learner.DateOfBirth as date) DateOfBirth,
		Learner.Ethnicity,
		Learner.Sex,
		Learner.LLDDHealthProb,
		Learner.NINumber,
		Learner.PriorAttain,
		Learner.Accom,
		Learner.ALSCost,
		Learner.PlanLearnHours,
		Learner.PlanEEPHours,
		Learner.MathGrade,
		Learner.EngGrade,
		(
			select 
				LearnerContact.LocType,
				LearnerContact.ContType,
				LearnerContact.Email,
				replace(LearnerContact.TelNumber,' ','') TelNumber,
				LearnerContact.PostCode,
				(
					select 
						PostAdd.AddLine1,
						PostAdd.AddLine2,
						PostAdd.AddLine3,
						PostAdd.AddLine4
					from 
						ILR1617.LearnerContact PostAdd
					where 
						PostAdd.UKPRN=$(UKPRN) 
						and PostAdd.LearnRefNumber=LearnerContact.LearnRefNumber 
						and PostAdd.LocType=LearnerContact.LocType
						and PostAdd.LocType=1
					for xml auto, type, elements
				)
			from 
				ILR1617.LearnerContact LearnerContact 
			where 
				LearnerContact.UKPRN=$(UKPRN) 
				and LearnerContact.LearnRefNumber=Learner.LearnRefNumber 
			for xml auto, type, elements
		),
		(
			select 
				ContactPreference.ContPrefType,
				ContactPreference.ContPrefCode 
			from 
				ILR1617.ContactPreference ContactPreference
			where 
				ContactPreference.UKPRN=$(UKPRN) 
				and ContactPreference.LearnRefNumber=Learner.LearnRefNumber 
			for xml auto, type, elements
		),
		(
			select 
				LLDDandHealthProblem.LLDDCat,
				LLDDandHealthProblem.PrimaryLLDD 
			from 
				ILR1617.LLDDandHealthProblem LLDDandHealthProblem
			where 
				LLDDandHealthProblem.UKPRN=$(UKPRN) 
				and LLDDandHealthProblem.LearnRefNumber=Learner.LearnRefNumber 
			for xml auto, type, elements
		),
		(
			select
				LearnerFAM.LearnFAMType,
				LearnerFAM.LearnFAMCode 
			from 
				ILR1617.LearnerFAM LearnerFAM
			where 
				LearnerFAM.UKPRN=$(UKPRN) 
				and LearnerFAM.LearnRefNumber=Learner.LearnRefNumber 
			for xml auto, type, elements
		),
		(
			select 
				ProviderSpecLearnerMonitoring.ProvSpecLearnMonOccur,
				ProviderSpecLearnerMonitoring.ProvSpecLearnMon 
			from 
				ILR1617.ProviderSpecLearnerMonitoring ProviderSpecLearnerMonitoring
			where 
				ProviderSpecLearnerMonitoring.UKPRN=$(UKPRN) 
				and ProviderSpecLearnerMonitoring.LearnRefNumber=Learner.LearnRefNumber 
			for xml auto, type, elements
		),
		(
			select 
				LearnerEmploymentStatus.EmpStat,
				cast(LearnerEmploymentStatus.DateEmpStatApp as date) DateEmpStatApp,
				LearnerEmploymentStatus.EmpId,
				(
					select 
						EmploymentStatusMonitoring.ESMType,
						EmploymentStatusMonitoring.ESMCode 
					from 
						ILR1617.EmploymentStatusMonitoring EmploymentStatusMonitoring
					where 
						EmploymentStatusMonitoring.UKPRN=$(UKPRN) 
						and EmploymentStatusMonitoring.LearnRefNumber=LearnerEmploymentStatus.LearnRefNumber 
						and EmploymentStatusMonitoring.DateEmpStatApp=LearnerEmploymentStatus.DateEmpStatApp 
					for xml auto, type, elements
				) 
			from 
				ILR1617.LearnerEmploymentStatus LearnerEmploymentStatus 
			where 
				LearnerEmploymentStatus.UKPRN=$(UKPRN) 
				and LearnerEmploymentStatus.LearnRefNumber=Learner.LearnRefNumber 
			for xml auto, type, elements
		),
		(
			select 
				LearnerHE.UCASPERID,
				LearnerHE.TTACCOM,
				(
					select 
						LearnerHEFinancialSupport.FINTYPE,
						LearnerHEFinancialSupport.FINAMOUNT 
					from 
						ILR1617.LearnerHEFinancialSupport LearnerHEFinancialSupport
					where 
						LearnerHEFinancialSupport.UKPRN=$(UKPRN) 
						and LearnerHEFinancialSupport.LearnRefNumber=LearnerHE.LearnRefNumber 
					for xml auto, type, elements
				) 
			from 
				ILR1617.LearnerHE LearnerHE 
			where 
				LearnerHE.UKPRN=$(UKPRN)
				and LearnerHE.LearnRefNumber=Learner.LearnRefNumber 
			for xml auto, type, elements
		),
		(
			select 
				LearningDelivery.LearnAimRef,
				LearningDelivery.AimType,
				LearningDelivery.AimSeqNumber,
				cast(LearningDelivery.LearnStartDate as date) LearnStartDate,
				cast(LearningDelivery.OrigLearnStartDate as date) OrigLearnStartDate,
				cast(LearningDelivery.LearnPlanEndDate as date) LearnPlanEndDate,
				LearningDelivery.FundModel,
				LearningDelivery.ProgType,
				LearningDelivery.FworkCode,
				LearningDelivery.PwayCode,
				LearningDelivery.StdCode,
				LearningDelivery.PartnerUKPRN,
				LearningDelivery.DelLocPostCode,
				LearningDelivery.AddHours,
				LearningDelivery.PriorLearnFundAdj,
				LearningDelivery.OtherFundAdj,
				LearningDelivery.ConRefNumber,
				LearningDelivery.EmpOutcome,
				LearningDelivery.CompStatus,
				cast(LearningDelivery.LearnActEndDate as date) LearnActEndDate,
				LearningDelivery.WithdrawReason,
				LearningDelivery.Outcome,
				cast(LearningDelivery.AchDate as date) AchDate,
				LearningDelivery.OutGrade,
				LearningDelivery.SWSupAimId,
				(
					select 
						LearningDeliveryFAM.LearnDelFAMType,
						LearningDeliveryFAM.LearnDelFAMCode,
						cast(LearningDeliveryFAM.LearnDelFAMDateFrom as date) LearnDelFAMDateFrom,
						cast(LearningDeliveryFAM.LearnDelFAMDateTo as date) LearnDelFAMDateTo 
					from 
						ILR1617.LearningDeliveryFAM LearningDeliveryFAM
					where 
						LearningDeliveryFAM.UKPRN=$(UKPRN) 
						and LearningDeliveryFAM.LearnRefNumber=LearningDelivery.LearnRefNumber 
						and LearningDeliveryFAM.AimSeqNumber=LearningDelivery.AimSeqNumber 
					for xml auto, type, elements
				),
				(
					select 
						cast(LearningDeliveryWorkPlacement.WorkPlaceStartDate as date) WorkPlaceStartDate, 
						cast(LearningDeliveryWorkPlacement.WorkPlaceEndDate as date) WorkPlaceEndDate, 
						LearningDeliveryWorkPlacement.WorkPlaceMode, 
						LearningDeliveryWorkPlacement.WorkPlaceEmpId 
					from 
						ILR1617.LearningDeliveryWorkPlacement LearningDeliveryWorkPlacement
					where 
						LearningDeliveryWorkPlacement.UKPRN=$(UKPRN) and 
						LearningDeliveryWorkPlacement.LearnRefNumber=LearningDelivery.LearnRefNumber 
						and LearningDeliveryWorkPlacement.AimSeqNumber=LearningDelivery.AimSeqNumber 
					for xml auto, type, elements
				),
				(
					select 
						TrailblazerApprenticeshipFinancialRecord.TBFinType,
						TrailblazerApprenticeshipFinancialRecord.TBFinCode,
						cast(TrailblazerApprenticeshipFinancialRecord.TBFinDate as date) TBFinDate,
						TrailblazerApprenticeshipFinancialRecord.TBFinAmount 
					from 
						ILR1617.TrailblazerApprenticeshipFinancialRecord TrailblazerApprenticeshipFinancialRecord
					where 
						TrailblazerApprenticeshipFinancialRecord.UKPRN=$(UKPRN) 
						and TrailblazerApprenticeshipFinancialRecord.LearnRefNumber=LearningDelivery.LearnRefNumber 
						and TrailblazerApprenticeshipFinancialRecord.AimSeqNumber=LearningDelivery.AimSeqNumber 
					for xml auto, type, elements
				),
				(
					select 
						ProviderSpecDeliveryMonitoring.ProvSpecDelMonOccur,
						ProviderSpecDeliveryMonitoring.ProvSpecDelMon 
					from 
						ILR1617.ProviderSpecDeliveryMonitoring ProviderSpecDeliveryMonitoring
					where 
						ProviderSpecDeliveryMonitoring.UKPRN=$(UKPRN) 
						and ProviderSpecDeliveryMonitoring.LearnRefNumber=LearningDelivery.LearnRefNumber 
						and ProviderSpecDeliveryMonitoring.AimSeqNumber=LearningDelivery.AimSeqNumber 
					for xml auto, type, elements	
				),
				(
					select 
						LearningDeliveryHE.NUMHUS,
						LearningDeliveryHE.SSN,
						LearningDeliveryHE.QUALENT3,
						LearningDeliveryHE.SOC2000,
						LearningDeliveryHE.SEC,
						LearningDeliveryHE.UCASAPPID,
						LearningDeliveryHE.TYPEYR,
						LearningDeliveryHE.MODESTUD,
						LearningDeliveryHE.FUNDLEV,
						LearningDeliveryHE.FUNDCOMP,
						cast(LearningDeliveryHE.STULOAD as varchar) STULOAD,
						LearningDeliveryHE.YEARSTU,
						LearningDeliveryHE.MSTUFEE,
						cast(LearningDeliveryHE.PCOLAB as varchar) PCOLAB,
						cast(LearningDeliveryHE.PCFLDCS as varchar) PCFLDCS,
						cast(LearningDeliveryHE.PCSLDCS as varchar) PCSLDCS,
						cast(LearningDeliveryHE.PCTLDCS as varchar) PCTLDCS,
						LearningDeliveryHE.SPECFEE,
						LearningDeliveryHE.NETFEE,
						LearningDeliveryHE.GROSSFEE,
						LearningDeliveryHE.DOMICILE,
						LearningDeliveryHE.ELQ,
						LearningDeliveryHE.HEPostCode 
					from 
						ILR1617.LearningDeliveryHE LearningDeliveryHE
					where 
						LearningDeliveryHE.UKPRN=$(UKPRN) 
						and LearningDeliveryHE.LearnRefNumber=LearningDelivery.LearnRefNumber 
						and LearningDeliveryHE.AimSeqNumber=LearningDelivery.AimSeqNumber 
					for xml auto, type, elements
				)
			from 
				ILR1617.LearningDelivery LearningDelivery
			where
				LearningDelivery.UKPRN=$(UKPRN) 
				and LearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			for xml auto, type, elements
		)
	from
		ILR1617.Learner Learner
	where 
		Learner.UKPRN=$(UKPRN)
		and exists 
			(
				select top 1
					UKPRN
				from
					ILR1617.LearningDelivery
				where
					LearningDelivery.UKPRN=$(UKPRN)
					and LearningDelivery.LearnRefNumber=Learner.LearnRefNumber
			)
	for xml path ('Learner')
) as varchar(max)),'')
