select coalesce(cast((select
	Learner.LearnRefNumber,
	Learner.PrevLearnRefNumber,
	Learner.PrevUKPRN,
	Learner.ULN,
	Learner.FamilyName,
	Learner.GivenNames,
	cast(Learner.DateOfBirth as date) as DateOfBirth,
	Learner.Ethnicity,
	Learner.Sex,
	Learner.LLDDHealthProb,
	Learner.NINumber,
	Learner.PriorAttain,
	Learner.Accom,
	Learner.ALSCost,
	Learner.PlanLearnHours,
	Learner.PlanEEPHours,
	Learner.Dest,
	(	select	LearnerContact.LocType,
				LearnerContact.ContType,
				LearnerContact.Email,
				LearnerContact.TelNumber,
				LearnerContact.PostCode,
				(	select	PostAdd.AddLine1,
							PostAdd.AddLine2,
							PostAdd.AddLine3,
							PostAdd.AddLine4 
					from	PostAdd as PostAdd 
					where	PostAdd.LearnRefNumber = LearnerContact.LearnRefNumber 
					and		LearnerContact.LocType = 1 
					for xml auto, type, elements) 
		from	LearnerContact as LearnerContact 
		where	LearnerContact.LearnRefNumber = Learner.LearnRefNumber 
		for xml auto, type, elements),
	(	select	ContactPreference.ContPrefType,
				ContactPreference.ContPrefCode 
		from	ContactPreference as ContactPreference 
		where	ContactPreference.LearnRefNumber = Learner.LearnRefNumber 
		for xml auto, type, elements),
	(	select	LLDDandHealthProblem.LLDDType,
				LLDDandHealthProblem.LLDDCode 
		from	LLDDandHealthProblem as LLDDandHealthProblem 
		where	LLDDandHealthProblem.LearnRefNumber = Learner.LearnRefNumber 
		for xml auto, type, elements),
	(	select	LearnerFAM.LearnFAMType,
				LearnerFAM.LearnFAMCode 
		from	LearnerFAM as LearnerFAM 
		where LearnerFAM.LearnRefNumber	= Learner.LearnRefNumber 
		for xml auto, type, elements),
	(	select	ProviderSpecLearnerMonitoring.ProvSpecLearnMonOccur,
				ProviderSpecLearnerMonitoring.ProvSpecLearnMon 
		from	ProviderSpecLearnerMonitoring as ProviderSpecLearnerMonitoring 
		where	ProviderSpecLearnerMonitoring.LearnRefNumber = Learner.LearnRefNumber 
		for xml auto, type, elements),
	(	select	LearnerEmploymentStatus.EmpStat,
				cast(LearnerEmploymentStatus.DateEmpStatApp as date) as DateEmpStatApp,
				LearnerEmploymentStatus.EmpId,
				(	select	EmploymentStatusMonitoring.ESMType,
							EmploymentStatusMonitoring.ESMCode 
					from	EmploymentStatusMonitoring as EmploymentStatusMonitoring 
					where	EmploymentStatusMonitoring.LearnRefNumber = LearnerEmploymentStatus.LearnRefNumber 
					and		EmploymentStatusMonitoring.DateEmpStatApp = LearnerEmploymentStatus.DateEmpStatApp 
					for xml auto, type, elements) 
		from	LearnerEmploymentStatus as LearnerEmploymentStatus 
		where	LearnerEmploymentStatus.LearnRefNumber = Learner.LearnRefNumber 
		for xml auto, type, elements),
	(	select	LearnerHE.UCASPERID,
				LearnerHE.TTACCOM,
				(	select	LearnerHEFinancialSupport.FINTYPE,
							LearnerHEFinancialSupport.FINAMOUNT 
					from	LearnerHEFinancialSupport as LearnerHEFinancialSupport 
					where	LearnerHEFinancialSupport.LearnRefNumber = LearnerHE.LearnRefNumber 
					for xml auto, type, elements) 
		from	LearnerHE as LearnerHE 
		where	LearnerHE.LearnRefNumber = Learner.LearnRefNumber 
		for xml auto, type, elements),
	(	select	LearningDelivery.LearnAimRef,
				LearningDelivery.AimType,
				LearningDelivery.AimSeqNumber,
				cast(LearningDelivery.LearnStartDate as date) as LearnStartDate,
				cast(LearningDelivery.OrigLearnStartDate as date) as OrigLearnStartDate,
				cast(LearningDelivery.LearnPlanEndDate as date) as LearnPlanEndDate,
				LearningDelivery.FundModel,
				LearningDelivery.ProgType,
				LearningDelivery.FworkCode,
				LearningDelivery.PwayCode,
				LearningDelivery.PartnerUKPRN,
				LearningDelivery.DelLocPostCode,
				LearningDelivery.PriorLearnFundAdj,
				LearningDelivery.OtherFundAdj,
				LearningDelivery.ESFProjDosNumber,
				LearningDelivery.ESFLocProjNumber,
				LearningDelivery.EmpOutcome,
				LearningDelivery.CompStatus,
				cast(LearningDelivery.LearnActEndDate as date) as LearnActEndDate,
				LearningDelivery.WithdrawReason,
				LearningDelivery.Outcome,
				cast(LearningDelivery.AchDate as date) as AchDate,
				LearningDelivery.OutGrade,
				LearningDelivery.SWSupAimId,
				(	select	LearningDeliveryFAM.LearnDelFAMType,
							LearningDeliveryFAM.LearnDelFAMCode,
							cast(LearningDeliveryFAM.LearnDelFAMDateFrom as date) as LearnDelFAMDateFrom,
							cast(LearningDeliveryFAM.LearnDelFAMDateTo as date) as LearnDelFAMDateTo 
					from	LearningDeliveryFAM as LearningDeliveryFAM 
					where	LearningDeliveryFAM.LearnRefNumber = LearningDelivery.LearnRefNumber 
					and		LearningDeliveryFAM.AimSeqNumber = LearningDelivery.AimSeqNumber 
					for xml auto, type, elements),
				(	select	cast(LearningDeliveryWorkPlacement.WorkPlaceStartDate as date) as WorkPlaceStartDate, 
							cast(LearningDeliveryWorkPlacement.WorkPlaceEndDate as date) as WorkPlaceEndDate, 
							LearningDeliveryWorkPlacement.WorkPlaceMode, 
							LearningDeliveryWorkPlacement.WorkPlaceEmpId 
					from	LearningDeliveryWorkPlacement as LearningDeliveryWorkPlacement 
					where	LearningDeliveryWorkPlacement.LearnRefNumber = LearningDelivery.LearnRefNumber 
					and		LearningDeliveryWorkPlacement.AimSeqNumber = LearningDelivery.AimSeqNumber 
					for xml auto, type, elements),
					(	select	ApprenticeshipTrailblazerFinancialDetails.TBFinType,
								ApprenticeshipTrailblazerFinancialDetails.TBFinCode,
								cast(ApprenticeshipTrailblazerFinancialDetails.TBFinDate as date) as TBFinDate,
								ApprenticeshipTrailblazerFinancialDetails.TBFinAmount 
						from	ApprenticeshipTrailblazerFinancialDetails as ApprenticeshipTrailblazerFinancialDetails 
						where	ApprenticeshipTrailblazerFinancialDetails.LearnRefNumber = LearningDelivery.LearnRefNumber 
						and		ApprenticeshipTrailblazerFinancialDetails.AimSeqNumber = LearningDelivery.AimSeqNumber 
						for xml auto, type, elements),
					(	select	ProviderSpecDeliveryMonitoring.ProvSpecDelMonOccur,
								ProviderSpecDeliveryMonitoring.ProvSpecDelMon 
						from	ProviderSpecDeliveryMonitoring as ProviderSpecDeliveryMonitoring 
						where	ProviderSpecDeliveryMonitoring.LearnRefNumber = LearningDelivery.LearnRefNumber 
						and		ProviderSpecDeliveryMonitoring.AimSeqNumber = LearningDelivery.AimSeqNumber 
						for xml auto, type, elements),
					(	select	LearningDeliveryHE.NUMHUS,
								LearningDeliveryHE.SSN,
								LearningDeliveryHE.QUALENT3,
								LearningDeliveryHE.SOC2000,
								LearningDeliveryHE.SEC,
								LearningDeliveryHE.TOTALTS,
								LearningDeliveryHE.UCASAPPID,
								LearningDeliveryHE.TYPEYR,
								LearningDeliveryHE.MODESTUD,
								LearningDeliveryHE.FUNDLEV,
								LearningDeliveryHE.FUNDCOMP,
								cast(LearningDeliveryHE.STULOAD as varchar) as STULOAD,
								LearningDeliveryHE.YEARSTU,
								LearningDeliveryHE.MSTUFEE,
								cast(LearningDeliveryHE.PCOLAB as varchar) as PCOLAB,
								cast(LearningDeliveryHE.PCFLDCS as varchar) as PCFLDCS,
								cast(LearningDeliveryHE.PCSLDCS as varchar) as PCSLDCS,
								cast(LearningDeliveryHE.PCTLDCS as varchar) as PCTLDCS,
								LearningDeliveryHE.SPECFEE,
								LearningDeliveryHE.NETFEE,
								LearningDeliveryHE.DOMICILE,
								LearningDeliveryHE.ELQ 
						from	LearningDeliveryHE as LearningDeliveryHE 
						where	LearningDeliveryHE.LearnRefNumber = LearningDelivery.LearnRefNumber 
						and		LearningDeliveryHE.AimSeqNumber = LearningDelivery.AimSeqNumber 
						for xml auto, type, elements)
		from	LearningDelivery as LearningDelivery
		where	LearningDelivery.LearnRefNumber = Learner.LearnRefNumber
		for xml auto, type, elements)
	from	Learner as Learner
	for xml path ('Learner')) as varchar(max)),'')
