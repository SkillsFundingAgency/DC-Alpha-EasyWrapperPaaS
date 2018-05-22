--DV_Results_Copy
insert into [$(FromILRDatabase)].Rulebase.[DV_global]
(
	UKPRN,
	RulebaseVersion
)
select
	UKPRN, 
	RulebaseVersion
from
	Rulebase.[DV_global]
go

insert into [$(FromILRDatabse)].Rulebase.[DV_Cases]
(
	LearnRefNumber
	,CaseData
)
select
	LearnRefNumber
	,CaseData
from
	Rulebase.[DV_Cases]
go

insert into [$(FromILRDatabase)].Rulebase.[DV_Learner]
(
	LearnRefNumber, 
	Learn_3rdSector, 
	Learn_Active, 
	Learn_ActiveJan, 
	Learn_ActiveNov, 
	Learn_ActiveOct, 
	Learn_Age31Aug, 
	Learn_BasicSkill, 
	Learn_EmpStatFDL, 
	Learn_EmpStatPrior, 
	Learn_FirstFullLevel2, 
	Learn_FirstFullLevel2Ach, 
	Learn_FirstFullLevel3, 
	Learn_FirstFullLevel3Ach, 
	Learn_FullLevel2, 
	Learn_FullLevel2Ach, 
	Learn_FullLevel3, 
	Learn_FullLevel3Ach, 
	Learn_FundAgency, 
	Learn_FundingSource, 
	Learn_FundPrvYr, 
	Learn_ILAcMonth1, 
	Learn_ILAcMonth10, 
	Learn_ILAcMonth11, 
	Learn_ILAcMonth12, 
	Learn_ILAcMonth2, 
	Learn_ILAcMonth3, 
	Learn_ILAcMonth4, 
	Learn_ILAcMonth5, 
	Learn_ILAcMonth6, 
	Learn_ILAcMonth7, 
	Learn_ILAcMonth8, 
	Learn_ILAcMonth9, 
	Learn_ILCurrAcYr, 
	Learn_LargeEmployer, 
	Learn_LenEmp, 
	Learn_LenUnemp, 
	Learn_LrnAimRecords, 
	Learn_ModeAttPlanHrs, 
	Learn_NotionLev, 
	Learn_NotionLevV2, 
	Learn_OLASS, 
	Learn_PrefMethContact, 
	Learn_PrimaryLLDD, 
	Learn_PriorEducationStatus, 
	Learn_UnempBenFDL, 
	Learn_UnempBenPrior, 
	Learn_Uplift1516EFA, 
	Learn_Uplift1516SFA
)
select
	LearnRefNumber, 
	Learn_3rdSector, 
	Learn_Active, 
	Learn_ActiveJan, 
	Learn_ActiveNov, 
	Learn_ActiveOct, 
	Learn_Age31Aug, 
	Learn_BasicSkill, 
	Learn_EmpStatFDL, 
	Learn_EmpStatPrior, 
	Learn_FirstFullLevel2, 
	Learn_FirstFullLevel2Ach, 
	Learn_FirstFullLevel3, 
	Learn_FirstFullLevel3Ach, 
	Learn_FullLevel2, 
	Learn_FullLevel2Ach, 
	Learn_FullLevel3, 
	Learn_FullLevel3Ach, 
	Learn_FundAgency, 
	Learn_FundingSource, 
	Learn_FundPrvYr, 
	Learn_ILAcMonth1, 
	Learn_ILAcMonth10, 
	Learn_ILAcMonth11, 
	Learn_ILAcMonth12, 
	Learn_ILAcMonth2, 
	Learn_ILAcMonth3, 
	Learn_ILAcMonth4, 
	Learn_ILAcMonth5, 
	Learn_ILAcMonth6, 
	Learn_ILAcMonth7, 
	Learn_ILAcMonth8, 
	Learn_ILAcMonth9, 
	Learn_ILCurrAcYr, 
	Learn_LargeEmployer, 
	Learn_LenEmp, 
	Learn_LenUnemp, 
	Learn_LrnAimRecords, 
	Learn_ModeAttPlanHrs, 
	Learn_NotionLev, 
	Learn_NotionLevV2, 
	Learn_OLASS, 
	Learn_PrefMethContact, 
	Learn_PrimaryLLDD, 
	Learn_PriorEducationStatus, 
	Learn_UnempBenFDL, 
	Learn_UnempBenPrior, 
	Learn_Uplift1516EFA, 
	Learn_Uplift1516SFA
from
	Rulebase.[DV_Learner]
go

insert into [$(FromILRDatabase)].[Rulebase].[DV_LearningDelivery]
(
	LearnRefNumber, 
	AimSeqNumber, 
	LearnDel_AccToApp, 
	LearnDel_AccToAppEmpDate, 
	LearnDel_AccToAppEmpStat, 
	LearnDel_AchFullLevel2Pct, 
	LearnDel_AchFullLevel3Pct, 
	LearnDel_Achieved, 
	LearnDel_AchievedIY, 
	LearnDel_AcMonthYTD, 
	LearnDel_ActDaysILAfterCurrAcYr, 
	LearnDel_ActDaysILCurrAcYr, 
	LearnDel_ActEndDateOnAfterJan1, 
	LearnDel_ActEndDateOnAfterNov1, 
	LearnDel_ActEndDateOnAfterOct1, 
	LearnDel_ActiveIY, 
	LearnDel_ActiveJan, 
	LearnDel_ActiveNov, 
	LearnDel_ActiveOct, 
	LearnDel_ActTotalDaysIL, 
	LearnDel_AdvLoan, 
	LearnDel_AgeAimOrigStart, 
	LearnDel_AgeAtStart, 
	LearnDel_App, 
	LearnDel_App1618Fund, 
	LearnDel_App1925Fund, 
	LearnDel_AppAimType, 
	LearnDel_AppKnowl, 
	LearnDel_AppMainAim, 
	LearnDel_AppNonFund, 
	LearnDel_BasicSkills, 
	LearnDel_BasicSkillsParticipation, 
	LearnDel_BasicSkillsType, 
	LearnDel_CarryIn, 
	LearnDel_ClassRm, 
	LearnDel_CompAimApp, 
	LearnDel_CompAimProg, 
	LearnDel_Completed, 
	LearnDel_CompletedIY, 
	LearnDel_CompleteFullLevel2Pct, 
	LearnDel_CompleteFullLevel3Pct, 
	LearnDel_EFACoreAim, 
	LearnDel_Emp6MonthAimStart, 
	LearnDel_Emp6MonthProgStart, 
	LearnDel_EmpDateBeforeFDL, 
	LearnDel_EmpDatePriorFDL, 
	LearnDel_EmpID, 
	LearnDel_Employed, 
	LearnDel_EmpStatFDL, 
	LearnDel_EmpStatPrior, 
	LearnDel_EmpStatPriorFDL, 
	LearnDel_EnhanAppFund, 
	LearnDel_FullLevel2AchPct, 
	LearnDel_FullLevel2ContPct, 
	LearnDel_FullLevel3AchPct, 
	LearnDel_FullLevel3ContPct, 
	LearnDel_FuncSkills, 
	LearnDel_FundAgency, 
	LearnDel_FundingLineType, 
	LearnDel_FundingSource, 
	LearnDel_FundPrvYr, 
	LearnDel_FundStart, 
	LearnDel_GCE, 
	LearnDel_GCSE, 
	LearnDel_ILAcMonth1, 
	LearnDel_ILAcMonth10, 
	LearnDel_ILAcMonth11, 
	LearnDel_ILAcMonth12, 
	LearnDel_ILAcMonth2, 
	LearnDel_ILAcMonth3, 
	LearnDel_ILAcMonth4, 
	LearnDel_ILAcMonth5, 
	LearnDel_ILAcMonth6, 
	LearnDel_ILAcMonth7, 
	LearnDel_ILAcMonth8, 
	LearnDel_ILAcMonth9, 
	LearnDel_ILCurrAcYr, 
	LearnDel_IYActEndDate, 
	LearnDel_IYPlanEndDate, 
	LearnDel_IYStartDate, 
	LearnDel_KeySkills, 
	LearnDel_LargeEmpDiscountId, 
	LearnDel_LargeEmployer, 
	LearnDel_LastEmpDate, 
	LearnDel_LeaveMonth, 
	LearnDel_LenEmp, 
	LearnDel_LenUnemp, 
	LearnDel_LoanBursFund, 
	LearnDel_NotionLevel, 
	LearnDel_NotionLevelV2, 
	LearnDel_NumHEDatasets, 
	LearnDel_OccupAim, 
	LearnDel_OLASS, 
	LearnDel_OLASSCom, 
	LearnDel_OLASSCus, 
	LearnDel_OrigStartDate, 
	LearnDel_PlanDaysILAfterCurrAcYr, 
	LearnDel_PlanDaysILCurrAcYr, 
	LearnDel_PlanEndBeforeAug1, 
	LearnDel_PlanEndOnAfterJan1, 
	LearnDel_PlanEndOnAfterNov1, 
	LearnDel_PlanEndOnAfterOct1, 
	LearnDel_PlanTotalDaysIL, 
	LearnDel_PriorEducationStatus, 
	LearnDel_Prog, 
	LearnDel_ProgAimAch, 
	LearnDel_ProgAimApp, 
	LearnDel_ProgCompleted, 
	LearnDel_ProgCompletedIY, 
	LearnDel_ProgStartDate, 
	LearnDel_QCF, 
	LearnDel_QCFCert, 
	LearnDel_QCFDipl, 
	LearnDel_QCFType, 
	LearnDel_RegAim, 
	LearnDel_SecSubAreaTier1, 
	LearnDel_SecSubAreaTier2, 
	LearnDel_SFAApproved, 
	LearnDel_SourceFundEFA, 
	LearnDel_SourceFundSFA, 
	LearnDel_StartBeforeApr1, 
	LearnDel_StartBeforeAug1, 
	LearnDel_StartBeforeDec1, 
	LearnDel_StartBeforeFeb1, 
	LearnDel_StartBeforeJan1, 
	LearnDel_StartBeforeJun1, 
	LearnDel_StartBeforeMar1, 
	LearnDel_StartBeforeMay1, 
	LearnDel_StartBeforeNov1, 
	LearnDel_StartBeforeOct1, 
	LearnDel_StartBeforeSep1, 
	LearnDel_StartIY, 
	LearnDel_StartJan1, 
	LearnDel_StartMonth, 
	LearnDel_StartNov1, 
	LearnDel_StartOct1, 
	LearnDel_SuccRateStat, 
	LearnDel_TrainAimType, 
	LearnDel_TransferDiffProvider, 
	LearnDel_TransferDiffProviderGovStrat, 
	LearnDel_TransferProvider, 
	LearnDel_UfIProv, 
	LearnDel_UnempBenFDL, 
	LearnDel_UnempBenPrior, 
	LearnDel_Withdrawn, 
	LearnDel_WorkplaceLocPostcode, 
	Prog_AccToApp, 
	Prog_Achieved, 
	Prog_AchievedIY, 
	Prog_ActEndDate, 
	Prog_ActiveIY, 
	Prog_AgeAtStart, 
	Prog_EarliestAim, 
	Prog_Employed, 
	Prog_FundPrvYr, 
	Prog_ILCurrAcYear, 
	Prog_LatestAim,
	Prog_SourceFundEFA, 
	Prog_SourceFundSFA
)
select
	LearnRefNumber, 
	AimSeqNumber, 
	LearnDel_AccToApp, 
	LearnDel_AccToAppEmpDate, 
	LearnDel_AccToAppEmpStat, 
	LearnDel_AchFullLevel2Pct, 
	LearnDel_AchFullLevel3Pct, 
	LearnDel_Achieved, 
	LearnDel_AchievedIY, 
	LearnDel_AcMonthYTD, 
	LearnDel_ActDaysILAfterCurrAcYr, 
	LearnDel_ActDaysILCurrAcYr, 
	LearnDel_ActEndDateOnAfterJan1, 
	LearnDel_ActEndDateOnAfterNov1, 
	LearnDel_ActEndDateOnAfterOct1, 
	LearnDel_ActiveIY, 
	LearnDel_ActiveJan, 
	LearnDel_ActiveNov, 
	LearnDel_ActiveOct, 
	LearnDel_ActTotalDaysIL, 
	LearnDel_AdvLoan, 
	LearnDel_AgeAimOrigStart, 
	LearnDel_AgeAtStart, 
	LearnDel_App, 
	LearnDel_App1618Fund, 
	LearnDel_App1925Fund, 
	LearnDel_AppAimType, 
	LearnDel_AppKnowl, 
	LearnDel_AppMainAim, 
	LearnDel_AppNonFund, 
	LearnDel_BasicSkills, 
	LearnDel_BasicSkillsParticipation, 
	LearnDel_BasicSkillsType, 
	LearnDel_CarryIn, 
	LearnDel_ClassRm, 
	LearnDel_CompAimApp, 
	LearnDel_CompAimProg, 
	LearnDel_Completed, 
	LearnDel_CompletedIY, 
	LearnDel_CompleteFullLevel2Pct, 
	LearnDel_CompleteFullLevel3Pct, 
	LearnDel_EFACoreAim, 
	LearnDel_Emp6MonthAimStart, 
	LearnDel_Emp6MonthProgStart, 
	LearnDel_EmpDateBeforeFDL, 
	LearnDel_EmpDatePriorFDL, 
	LearnDel_EmpID, 
	LearnDel_Employed, 
	LearnDel_EmpStatFDL, 
	LearnDel_EmpStatPrior, 
	LearnDel_EmpStatPriorFDL, 
	LearnDel_EnhanAppFund, 
	LearnDel_FullLevel2AchPct, 
	LearnDel_FullLevel2ContPct, 
	LearnDel_FullLevel3AchPct, 
	LearnDel_FullLevel3ContPct, 
	LearnDel_FuncSkills, 
	LearnDel_FundAgency, 
	LearnDel_FundingLineType, 
	LearnDel_FundingSource, 
	LearnDel_FundPrvYr, 
	LearnDel_FundStart, 
	LearnDel_GCE, 
	LearnDel_GCSE, 
	LearnDel_ILAcMonth1, 
	LearnDel_ILAcMonth10, 
	LearnDel_ILAcMonth11, 
	LearnDel_ILAcMonth12, 
	LearnDel_ILAcMonth2, 
	LearnDel_ILAcMonth3, 
	LearnDel_ILAcMonth4, 
	LearnDel_ILAcMonth5, 
	LearnDel_ILAcMonth6, 
	LearnDel_ILAcMonth7, 
	LearnDel_ILAcMonth8, 
	LearnDel_ILAcMonth9, 
	LearnDel_ILCurrAcYr, 
	LearnDel_IYActEndDate, 
	LearnDel_IYPlanEndDate, 
	LearnDel_IYStartDate, 
	LearnDel_KeySkills, 
	LearnDel_LargeEmpDiscountId, 
	LearnDel_LargeEmployer, 
	LearnDel_LastEmpDate, 
	LearnDel_LeaveMonth, 
	LearnDel_LenEmp, 
	LearnDel_LenUnemp, 
	LearnDel_LoanBursFund, 
	LearnDel_NotionLevel, 
	LearnDel_NotionLevelV2, 
	LearnDel_NumHEDatasets, 
	LearnDel_OccupAim, 
	LearnDel_OLASS, 
	LearnDel_OLASSCom, 
	LearnDel_OLASSCus, 
	LearnDel_OrigStartDate, 
	LearnDel_PlanDaysILAfterCurrAcYr, 
	LearnDel_PlanDaysILCurrAcYr, 
	LearnDel_PlanEndBeforeAug1, 
	LearnDel_PlanEndOnAfterJan1, 
	LearnDel_PlanEndOnAfterNov1, 
	LearnDel_PlanEndOnAfterOct1, 
	LearnDel_PlanTotalDaysIL, 
	LearnDel_PriorEducationStatus, 
	LearnDel_Prog, 
	LearnDel_ProgAimAch, 
	LearnDel_ProgAimApp, 
	LearnDel_ProgCompleted, 
	LearnDel_ProgCompletedIY, 
	LearnDel_ProgStartDate, 
	LearnDel_QCF, 
	LearnDel_QCFCert, 
	LearnDel_QCFDipl, 
	LearnDel_QCFType, 
	LearnDel_RegAim, 
	LearnDel_SecSubAreaTier1, 
	LearnDel_SecSubAreaTier2, 
	LearnDel_SFAApproved, 
	LearnDel_SourceFundEFA, 
	LearnDel_SourceFundSFA, 
	LearnDel_StartBeforeApr1, 
	LearnDel_StartBeforeAug1, 
	LearnDel_StartBeforeDec1, 
	LearnDel_StartBeforeFeb1, 
	LearnDel_StartBeforeJan1, 
	LearnDel_StartBeforeJun1, 
	LearnDel_StartBeforeMar1, 
	LearnDel_StartBeforeMay1, 
	LearnDel_StartBeforeNov1, 
	LearnDel_StartBeforeOct1, 
	LearnDel_StartBeforeSep1, 
	LearnDel_StartIY, 
	LearnDel_StartJan1, 
	LearnDel_StartMonth, 
	LearnDel_StartNov1, 
	LearnDel_StartOct1, 
	LearnDel_SuccRateStat, 
	LearnDel_TrainAimType, 
	LearnDel_TransferDiffProvider, 
	LearnDel_TransferDiffProviderGovStrat, 
	LearnDel_TransferProvider, 
	LearnDel_UfIProv, 
	LearnDel_UnempBenFDL, 
	LearnDel_UnempBenPrior, 
	LearnDel_Withdrawn, 
	LearnDel_WorkplaceLocPostcode, 
	Prog_AccToApp, 
	Prog_Achieved, 
	Prog_AchievedIY, 
	Prog_ActEndDate, 
	Prog_ActiveIY, 
	Prog_AgeAtStart, 
	Prog_EarliestAim, 
	Prog_Employed, 
	Prog_FundPrvYr, 
	Prog_ILCurrAcYear, 
	Prog_LatestAim,
	Prog_SourceFundEFA, 
	Prog_SourceFundSFA
from
	Rulebase.[DV_LearningDelivery]
go