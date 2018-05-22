-- this is the 17/18 NON identity version of the sql
select coalesce(
cast((select
	Learner.LearnRefNumber,
	Learner.PrevLearnRefNumber,
	Learner.PrevUKPRN,
	Learner.PMUKPRN,
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
	Learner.MathGrade ,
	Learner.EngGrade ,
	Learner.PostcodePrior,
	Learner.Postcode,
	Learner.AddLine1,
	Learner.AddLine2,
	Learner.AddLine3,
	Learner.AddLine4,
	Learner.TelNo,
	Learner.Email,
	(	select	ContactPreference.ContPrefType,
				ContactPreference.ContPrefCode 
		from	Valid.ContactPreference as ContactPreference
		where	ContactPreference.LearnRefNumber = Learner.LearnRefNumber
				and ContactPreference.UKPRN = Learner.UKPRN
		for xml auto, type, elements),
	(	select	LLDDandHealthProblem.LLDDCat,
				LLDDandHealthProblem.PrimaryLLDD 
		from	Valid.LLDDandHealthProblem as LLDDandHealthProblem
		where	LLDDandHealthProblem.LearnRefNumber = Learner.LearnRefNumber
				and LLDDandHealthProblem.UKPRN = Learner.UKPRN
		for xml auto, type, elements),
	(	select	LearnerFAM.LearnFAMType,
				LearnerFAM.LearnFAMCode 
		from	Valid.LearnerFAM as LearnerFAM
		where	LearnerFAM.LearnRefNumber = Learner.LearnRefNumber
				and LearnerFAM.UKPRN = Learner.UKPRN 
		for xml auto, type, elements),
	(	select	ProviderSpecLearnerMonitoring.ProvSpecLearnMonOccur,
				ProviderSpecLearnerMonitoring.ProvSpecLearnMon 
		from	Valid.ProviderSpecLearnerMonitoring as ProviderSpecLearnerMonitoring
		where	ProviderSpecLearnerMonitoring.LearnRefNumber = Learner.LearnRefNumber
		and		ProviderSpecLearnerMonitoring.UKPRN = Learner.UKPRN
		for xml auto, type, elements),
	(	select	LearnerEmploymentStatus.EmpStat,
				cast(LearnerEmploymentStatus.DateEmpStatApp as date) as DateEmpStatApp,
				LearnerEmploymentStatus.EmpId,
				(	select	EmploymentStatusMonitoring.ESMType,
							EmploymentStatusMonitoring.ESMCode 
					from	Valid.EmploymentStatusMonitoring as EmploymentStatusMonitoring
					where	EmploymentStatusMonitoring.LearnRefNumber = LearnerEmploymentStatus.LearnRefNumber 
					and		EmploymentStatusMonitoring.DateEmpStatApp = LearnerEmploymentStatus.DateEmpStatApp 
					and		EmploymentStatusMonitoring.UKPRN = LearnerEmploymentStatus.UKPRN
					for xml auto, type, elements) 
		from	Valid.LearnerEmploymentStatus as LearnerEmploymentStatus 
		where	LearnerEmploymentStatus.LearnRefNumber = Learner.LearnRefNumber 
		and		LearnerEmploymentStatus.UKPRN = Learner.UKPRN
		for xml auto, type, elements),
	(	select	LearnerHE.UCASPERID,
				LearnerHE.TTACCOM,
				(	select	LearnerHEFinancialSupport.FINTYPE,
							LearnerHEFinancialSupport.FINAMOUNT 
					from	Valid.LearnerHEFinancialSupport as LearnerHEFinancialSupport
					where	LearnerHEFinancialSupport.LearnRefNumber = LearnerHE.LearnRefNumber
					and		LearnerHEFinancialSupport.UKPRN = LearnerHE.UKPRN 
					for xml auto, type, elements) 
		from	Valid.LearnerHE as LearnerHE 
		where	LearnerHE.LearnRefNumber = Learner.LearnRefNumber 
		and		LearnerHE.UKPRN = Learner.UKPRN
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
				LearningDelivery.StdCode,
				LearningDelivery.PartnerUKPRN,
				LearningDelivery.DelLocPostCode,
				LearningDelivery.AddHours,
				LearningDelivery.PriorLearnFundAdj,
				LearningDelivery.OtherFundAdj,
				LearningDelivery.ConRefNumber,
				LearningDelivery.EPAOrgID,
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
					from	Valid.LearningDeliveryFAM as LearningDeliveryFAM
					where	LearningDeliveryFAM.LearnRefNumber = LearningDelivery.LearnRefNumber 
					and		LearningDeliveryFAM.AimSeqNumber = LearningDelivery.AimSeqNumber 
					and		LearningDeliveryFAM.UKPRN = LearningDelivery.UKPRN
					for xml auto, type, elements),
				(	select	cast(LearningDeliveryWorkPlacement.WorkPlaceStartDate as date) as WorkPlaceStartDate, 
							cast(LearningDeliveryWorkPlacement.WorkPlaceEndDate as date) as WorkPlaceEndDate, 
							LearningDeliveryWorkPlacement.WorkPlaceHours, 
							LearningDeliveryWorkPlacement.WorkPlaceMode, 
							LearningDeliveryWorkPlacement.WorkPlaceEmpId 
					from	Valid.LearningDeliveryWorkPlacement as LearningDeliveryWorkPlacement
					where	LearningDeliveryWorkPlacement.LearnRefNumber = LearningDelivery.LearnRefNumber 
					and		LearningDeliveryWorkPlacement.AimSeqNumber = LearningDelivery.AimSeqNumber 
					and		LearningDeliveryWorkPlacement.UKPRN = LearningDelivery.UKPRN
					for xml auto, type, elements),
				(	select	AppFinRecord.AFinType,
							AppFinRecord.AFinCode,
							cast(AppFinRecord.AFinDate as date) as AFinDate,
							AppFinRecord.AFinAmount 
					from	Valid.AppFinRecord as AppFinRecord
					where	AppFinRecord.LearnRefNumber = LearningDelivery.LearnRefNumber 
					and		AppFinRecord.AimSeqNumber = LearningDelivery.AimSeqNumber 
					and		AppFinRecord.UKPRN = LearningDelivery.UKPRN
					for xml auto, type, elements),
				(	select	ProviderSpecDeliveryMonitoring.ProvSpecDelMonOccur,
							ProviderSpecDeliveryMonitoring.ProvSpecDelMon 
					from	Valid.ProviderSpecDeliveryMonitoring as ProviderSpecDeliveryMonitoring
					where	ProviderSpecDeliveryMonitoring.LearnRefNumber = LearningDelivery.LearnRefNumber 
					and		ProviderSpecDeliveryMonitoring.AimSeqNumber = LearningDelivery.AimSeqNumber
					and		ProviderSpecDeliveryMonitoring.UKPRN = LearningDelivery.UKPRN 
					for xml auto, type, elements),
				(	select	LearningDeliveryHE.NUMHUS,
							LearningDeliveryHE.SSN,
							LearningDeliveryHE.QUALENT3,
							LearningDeliveryHE.SOC2000,
							LearningDeliveryHE.SEC,
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
							LearningDeliveryHE.GROSSFEE,
							LearningDeliveryHE.DOMICILE,
							LearningDeliveryHE.ELQ,
							LearningDeliveryHE.HEPostCode 
					from	Valid.LearningDeliveryHE LearningDeliveryHE
					where	LearningDeliveryHE.LearnRefNumber = LearningDelivery.LearnRefNumber 
					and		LearningDeliveryHE.AimSeqNumber = LearningDelivery.AimSeqNumber 
					and		LearningDeliveryHE.UKPRN = LearningDelivery.UKPRN
					for xml auto, type, elements)
		from	Valid.LearningDelivery LearningDelivery
		where	LearningDelivery.LearnRefNumber = Learner.LearnRefNumber
		and		LearningDelivery.UKPRN = Learner.UKPRN
		for xml auto, type, elements)
	from	Valid.Learner as Learner
	where	Learner.UKPRN = ${ukprn}
	for xml path ('Learner')) as varchar(max)),'')
