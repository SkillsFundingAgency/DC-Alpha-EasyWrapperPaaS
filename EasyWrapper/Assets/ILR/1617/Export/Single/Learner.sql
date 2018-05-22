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
				LearnerContact.TelNumber,
				LearnerContact.PostCode,
				(
					select 
						PostAdd.AddLine1,
						PostAdd.AddLine2,
						PostAdd.AddLine3,
						PostAdd.AddLine4
					from 
						PostAdd
					where 
						PostAdd.FK_LearnerContact=LearnerContact.PK_LearnerContact 
					for xml auto, type, elements
				)
			from 
				LearnerContact LearnerContact 
			where 
				LearnerContact.FK_Learner=Learner.PK_Learner 
			for xml auto, type, elements
		),
		(
			select 
				ContactPreference.ContPrefType,
				ContactPreference.ContPrefCode 
			from 
				ContactPreference ContactPreference
			where 
				ContactPreference.FK_Learner=Learner.PK_Learner 
			for xml auto, type, elements
		),
		(
			select 
				LLDDandHealthProblem.LLDDCat,
				LLDDandHealthProblem.PrimaryLLDD 
			from 
				LLDDandHealthProblem LLDDandHealthProblem
			where 
				LLDDandHealthProblem.FK_Learner=Learner.PK_Learner 
			for xml auto, type, elements
		),
		(
			select
				LearnerFAM.LearnFAMType,
				LearnerFAM.LearnFAMCode 
			from 
				LearnerFAM LearnerFAM
			where 
				LearnerFAM.FK_Learner=Learner.PK_Learner 
			for xml auto, type, elements
		),
		(
			select 
				ProviderSpecLearnerMonitoring.ProvSpecLearnMonOccur,
				ProviderSpecLearnerMonitoring.ProvSpecLearnMon 
			from 
				ProviderSpecLearnerMonitoring ProviderSpecLearnerMonitoring
			where 
				ProviderSpecLearnerMonitoring.FK_Learner=Learner.PK_Learner 
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
						EmploymentStatusMonitoring EmploymentStatusMonitoring
					where 
						EmploymentStatusMonitoring.FK_LearnerEmploymentStatus=LearnerEmploymentStatus.PK_LearnerEmploymentStatus 
					for xml auto, type, elements
				) 
			from 
				LearnerEmploymentStatus LearnerEmploymentStatus 
			where 
				LearnerEmploymentStatus.FK_Learner=Learner.PK_Learner 
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
						LearnerHEFinancialSupport LearnerHEFinancialSupport
					where 
						LearnerHEFinancialSupport.FK_LearnerHE=LearnerHE.PK_LearnerHE
					for xml auto, type, elements
				) 
			from 
				LearnerHE LearnerHE 
			where 
				LearnerHE.FK_Learner=Learner.PK_Learner 
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
						LearningDeliveryFAM LearningDeliveryFAM
					where 
						LearningDeliveryFAM.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery 
					for xml auto, type, elements
				),
				(
					select 
						cast(LearningDeliveryWorkPlacement.WorkPlaceStartDate as date) WorkPlaceStartDate, 
						cast(LearningDeliveryWorkPlacement.WorkPlaceEndDate as date) WorkPlaceEndDate, 
						LearningDeliveryWorkPlacement.WorkPlaceMode, 
						LearningDeliveryWorkPlacement.WorkPlaceEmpId 
					from 
						LearningDeliveryWorkPlacement LearningDeliveryWorkPlacement
					where 
						LearningDeliveryWorkPlacement.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery 
					for xml auto, type, elements
				),
				(
					select 
						TrailblazerApprenticeshipFinancialRecord.TBFinType,
						TrailblazerApprenticeshipFinancialRecord.TBFinCode,
						cast(TrailblazerApprenticeshipFinancialRecord.TBFinDate as date) TBFinDate,
						TrailblazerApprenticeshipFinancialRecord.TBFinAmount 
					from 
						TrailblazerApprenticeshipFinancialRecord TrailblazerApprenticeshipFinancialRecord
					where 
						TrailblazerApprenticeshipFinancialRecord.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery 
					for xml auto, type, elements
				),
				(
					select 
						ProviderSpecDeliveryMonitoring.ProvSpecDelMonOccur,
						ProviderSpecDeliveryMonitoring.ProvSpecDelMon 
					from 
						ProviderSpecDeliveryMonitoring ProviderSpecDeliveryMonitoring
					where 
						ProviderSpecDeliveryMonitoring.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery 
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
						LearningDeliveryHE LearningDeliveryHE
					where 
						LearningDeliveryHE.FK_LearningDelivery=LearningDelivery.PK_LearningDelivery 
					for xml auto, type, elements
				)
			from 
				LearningDelivery LearningDelivery
			where
				LearningDelivery.FK_Learner=Learner.PK_Learner
			for xml auto, type, elements
		)
	from
		Learner Learner
	for xml path ('Learner')
) as varchar(max)),'')
