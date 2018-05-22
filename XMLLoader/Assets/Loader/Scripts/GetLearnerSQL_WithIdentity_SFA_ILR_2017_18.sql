-- this is the 17/18 identity version of the sql
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
		from	ContactPreference as ContactPreference
		where	ContactPreference.FK_Learner = Learner.PK_Learner 
		for xml auto, type, elements),
	(	select	LLDDandHealthProblem.LLDDCat,
				LLDDandHealthProblem.PrimaryLLDD 
		from	LLDDandHealthProblem as LLDDandHealthProblem
		where	LLDDandHealthProblem.FK_Learner = Learner.PK_Learner 
		for xml auto, type, elements),
	(	select	LearnerFAM.LearnFAMType,
				LearnerFAM.LearnFAMCode 
		from	LearnerFAM as LearnerFAM
		where	LearnerFAM.FK_Learner = Learner.PK_Learner 
		for xml auto, type, elements),
	(	select	ProviderSpecLearnerMonitoring.ProvSpecLearnMonOccur,
				ProviderSpecLearnerMonitoring.ProvSpecLearnMon 
		from	ProviderSpecLearnerMonitoring as ProviderSpecLearnerMonitoring
		where	ProviderSpecLearnerMonitoring.FK_Learner = Learner.PK_Learner 
		for xml auto, type, elements),
	(	select	LearnerEmploymentStatus.EmpStat,
				cast(LearnerEmploymentStatus.DateEmpStatApp as date) as DateEmpStatApp,
				LearnerEmploymentStatus.EmpId,
				(	select	EmploymentStatusMonitoring.ESMType,
							EmploymentStatusMonitoring.ESMCode 
					from	EmploymentStatusMonitoring as EmploymentStatusMonitoring
					where	EmploymentStatusMonitoring.FK_LearnerEmploymentStatus = LearnerEmploymentStatus.PK_LearnerEmploymentStatus
					for xml auto, type, elements) 
		from	LearnerEmploymentStatus as LearnerEmploymentStatus 
		where	LearnerEmploymentStatus.FK_Learner=Learner.PK_Learner 
		for xml auto, type, elements),
	(	select	LearnerHE.UCASPERID,
				LearnerHE.TTACCOM,
				(	select	LearnerHEFinancialSupport.FINTYPE,
							LearnerHEFinancialSupport.FINAMOUNT 
					from	LearnerHEFinancialSupport as LearnerHEFinancialSupport
					where	LearnerHEFinancialSupport.FK_LearnerHE = LearnerHE.PK_LearnerHE 
					for xml auto, type, elements) 
		from	LearnerHE as LearnerHE 
		where	LearnerHE.FK_Learner = Learner.PK_Learner 
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
					from	LearningDeliveryFAM as LearningDeliveryFAM
					where	LearningDeliveryFAM.FK_LearningDelivery = LearningDelivery.PK_LearningDelivery 
					for xml auto, type, elements),
				(	select	cast(LearningDeliveryWorkPlacement.WorkPlaceStartDate as date) as WorkPlaceStartDate, 
							cast(LearningDeliveryWorkPlacement.WorkPlaceEndDate as date) as WorkPlaceEndDate, 
							LearningDeliveryWorkPlacement.WorkPlaceHours, 
							LearningDeliveryWorkPlacement.WorkPlaceMode, 
							LearningDeliveryWorkPlacement.WorkPlaceEmpId 
					from	LearningDeliveryWorkPlacement as LearningDeliveryWorkPlacement
					where	LearningDeliveryWorkPlacement.FK_LearningDelivery = LearningDelivery.PK_LearningDelivery 
					for xml auto, type, elements),
				(	select	AppFinRecord.AFinType,
							AppFinRecord.AFinCode,
							cast(AppFinRecord.AFinDate as date) as AFinDate,
							AppFinRecord.AFinAmount 
					from	AppFinRecord as AppFinRecord
					where	AppFinRecord.FK_LearningDelivery = LearningDelivery.PK_LearningDelivery 
					for xml auto, type, elements),
				(	select	ProviderSpecDeliveryMonitoring.ProvSpecDelMonOccur,
							ProviderSpecDeliveryMonitoring.ProvSpecDelMon 
					from	ProviderSpecDeliveryMonitoring as ProviderSpecDeliveryMonitoring
					where	ProviderSpecDeliveryMonitoring.FK_LearningDelivery = LearningDelivery.PK_LearningDelivery 
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
					from	LearningDeliveryHE as LearningDeliveryHE
					where	LearningDeliveryHE.FK_LearningDelivery = LearningDelivery.PK_LearningDelivery 
					for xml auto, type, elements)
		from	LearningDelivery as LearningDelivery
		where	LearningDelivery.FK_Learner = Learner.PK_Learner
		for xml auto, type, elements)
	from	Learner as Learner
	for xml path ('Learner')) as varchar(max)),'')
