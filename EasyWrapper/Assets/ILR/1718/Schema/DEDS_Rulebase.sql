if not exists (select * from sys.schemas where name = 'DEDS_Rulebase')
begin
	exec ('create schema DEDS_Rulebase');
end
GO

if object_id('DEDS_Rulebase.TBL_LearningDelivery_PeriodisedValues','v') is not null
begin
	drop view DEDS_Rulebase.TBL_LearningDelivery_PeriodisedValues
end
GO

create view DEDS_Rulebase.TBL_LearningDelivery_PeriodisedValues
as
	select
		g.UKPRN
		,ldpv.[LearnRefNumber]
		,ldpv.[AimSeqNumber]
		,ldpv.[AttributeName]
		,ldpv.[Period_1]
		,ldpv.[Period_2]
		,ldpv.[Period_3]
		,ldpv.[Period_4]
		,ldpv.[Period_5] 
		,ldpv.[Period_6]
		,ldpv.[Period_7]
		,ldpv.[Period_8] 
		,ldpv.[Period_9] 
		,ldpv.[Period_10] 
		,ldpv.[Period_11] 
		,ldpv.[Period_12] 
	from
		Rulebase.TBL_LearningDelivery_PeriodisedValues as ldpv
		cross join (select top 1 UKPRN from Rulebase.TBL_global) as g
GO

if object_id ('DEDS_Rulebase.TBL_LearningDelivery_Period', 'v') is not null
begin
	drop view DEDS_Rulebase.TBL_LearningDelivery_Period
end
GO

create view DEDS_Rulebase.TBL_LearningDelivery_Period
as
	select
		g.UKPRN
		,ldp.[LearnRefNumber]
		,ldp.[AimSeqNumber]
		,ldp.[Period]
		,ldp.[AchPayment]
		,ldp.[CoreGOvContPayment]
		,ldp.[CoreGOvContUncapped]
		,ldp.[InstPerPeriod]
		,ldp.[LearnSuppFund] 
		,ldp.[LearnSuppFundCash] 
		,ldp.[MathEngBalPayment] 
		,ldp.[MathEngBalPct] 
		,ldp.[MathEnGOnProgPayment] 
		,ldp.[MathEnGOnProgPct]
		,ldp.[SmallBusPayment]
		,ldp.[YoungAppFirstPayment]
		,ldp.[YoungAppPayment] 
		,ldp.[YoungAppSecondPayment]
	from
		Rulebase.TBL_LearningDelivery_Period as ldp
		cross join (select top 1 UKPRN from Rulebase.TBL_global) as g
GO

if object_id('DEDS_Rulebase.TBL_LearningDelivery', 'v') is not null
begin
	drop view DEDS_Rulebase.TBL_LearningDelivery
end
GO

create view DEDS_Rulebase.TBL_LearningDelivery
as
	select
		g.UKPRN
		,ld.LearnRefNumber
		,ld.AimSeqNumber 
		,ld.ProgStandardStartDate
		,ld.FundLine 
		,ld.MathEngAimValue
		,ld.PlannedNumOnProgInstalm 
		,ld.LearnSuppFundCash 
		,ld.AdjProgStartDate 
		,ld.LearnSuppFund 
		,ld.MathEnGOnProgPayment 
		,ld.InstPerPeriod 
		,ld.SmallBusPayment 
		,ld.YoungAppSecondPayment 
		,ld.CoreGOvContPayment 
		,ld.YoungAppEligible 
		,ld.SmallBusEligible 
		,ld.MathEnGOnProgPct 
		,ld.AgeStandardStart 
		,ld.YoungAppSecondThresholdDate 
		,ld.EmpIdFirstDayStandard 
		,ld.EmpIdFirstYoungAppDate
		,ld.EmpIdSecondYoungAppDate
		,ld.EmpIdSmallBusDate 
		,ld.YoungAppFirstThresholdDate
		,ld.AchApplicDate 
		,ld.AchEligible 
		,ld.Achieved 
		,ld.AchievementApplicVal
		,ld.AchPayment 
		,ld.ActualNumInstalm
		,ld.CombinedAdjProp 
		,ld.EmpIdAchDate 
		,ld.LearnDelDaysIL
		,ld.LearnDelStandardAccDaysIL 
		,ld.LearnDelStandardPrevAccDaysIL
		,ld.LearnDelStandardTotalDaysIL 
		,ld.ActualDaysIL 
		,ld.MathEngBalPayment
		,ld.MathEngBalPct 
		,ld.MathEngLSFFundStart
		,ld.PlannedTotalDaysIL 
		,ld.MathEngLSFThresholdDays
		,ld.OutstandNumOnProgInstalm
		,ld.SmallBusApplicVal 
		,ld.SmallBusStatusFirstDayStandard 
		,ld.SmallBusStatusThreshold 
		,ld.YoungAppApplicVal 
		,ld.CoreGOvContCapApplicVal 
		,ld.CoreGOvContUncapped 
		,ld.ApplicFundValDate 
		,ld.YoungAppFirstPayment
		,ld.YoungAppPayment	
	from
		Rulebase.TBL_LearningDelivery as ld
		cross join (select top 1 UKPRN from Rulebase.TBL_global) as g
GO

if object_id ('DEDS_Rulebase.TBL_global', 'v') is not null
begin
	drop view DEDS_Rulebase.TBL_global
end
GO

create view DEDS_Rulebase.TBL_global
as
	select
		UKPRN
		,CurFundYr
		,LARSVersion
		,RulebaseVersion
	from
		Rulebase.TBL_global
GO

if object_id('DEDS_Rulebase.TBL_Cases', 'v') is not null
begin
	drop view DEDS_Rulebase.TBL_Cases
end
GO

create view DEDS_Rulebase.TBL_Cases
as
	select
		g.UKPRN
		,c.LearnRefNumber
		,c.CaseData
	from
		Rulebase.TBL_Cases c
		cross join (select top 1 UKPRN from Rulebase.TBL_global) as g
GO

if object_id ('DEDS_Rulebase.SFA_LearningDelivery_PeriodisedValues', 'v') is not null
begin
	drop view DEDS_Rulebase.SFA_LearningDelivery_PeriodisedValues
end
GO

create view DEDS_Rulebase.SFA_LearningDelivery_PeriodisedValues
as
	select
		g.UKPRN
		,spv.[LearnRefNumber]
		,spv.[AimSeqNumber] 
		,spv.[AttributeName] 
		,spv.[Period_1]
		,spv.[Period_2]
		,spv.[Period_3]
		,spv.[Period_4]
		,spv.[Period_5] 
		,spv.[Period_6]
		,spv.[Period_7]
		,spv.[Period_8]
		,spv.[Period_9]
		,spv.[Period_10]
		,spv.[Period_11]
		,spv.[Period_12]
	from
		Rulebase.SFA_LearningDelivery_PeriodisedValues as spv
		cross join (select top 1 UKPRN from Rulebase.SFA_global) as g
GO

if object_id('DEDS_Rulebase.SFA_LearningDelivery_Period', 'v') is not null
begin
	drop view DEDS_Rulebase.SFA_LearningDelivery_Period
end
GO

create view DEDS_Rulebase.SFA_LearningDelivery_Period
as
	select 
		g.UKPRN
		,sp.[LearnRefNumber]
		,sp.[AimSeqNumber]
		,sp.[Period]
		,sp.[AchievePayment] 
		,sp.[AchievePayPct] 
		,sp.[AchievePayPctTrans]
		,sp.[BalancePayment]
		,sp.[BalancePaymentUncapped] 
		,sp.[BalancePct] 
		,sp.[BalancePctTrans] 
		,sp.[EmpOutcomePay] 
		,sp.[EmpOutcomePct] 
		,sp.[EmpOutcomePctTrans]
		,sp.[InstPerPeriod] 
		,sp.[LearnSuppFund] 
		,sp.[LearnSuppFundCash] 
		,sp.[OnProgPayment] 
		,sp.[OnProgPaymentUncapped] 
		,sp.[OnProgPayPct] 
		,sp.[OnProgPayPctTrans]
		,sp.[TransInstPerPeriod]
	from
		Rulebase.SFA_LearningDelivery_Period as sp
		cross join (select top 1 UKPRN from Rulebase.SFA_global) as g
GO

if object_id ('DEDS_Rulebase.SFA_LearningDelivery','v')is not null
begin
	drop view DEDS_Rulebase.SFA_LearningDelivery
end
GO

create view DEDS_Rulebase.SFA_LearningDelivery
as 
	select
		g.UKPRN
		,sld.[LearnRefNumber]
		,sld.[AimSeqNumber] 
		,sld.[AchApplicDate] 
		,sld.[Achieved] 
		,sld.[AchieveElement]
		,sld.[AchievePayElig] 
		,sld.[AchievePayPctPreTrans]
		,sld.[AchPayTransHeldBack] 
		,sld.[ActualDaysIL]
		,sld.[ActualNumInstalm] 
		,sld.[ActualNumInstalmPreTrans]
		,sld.[ActualNumInstalmTrans]
		,sld.[AdjLearnStartDate] 
		,sld.[AdltLearnResp] 
		,sld.[AgeAimStart] 
		,sld.[AimValue] 
		,sld.[AppAdjLearnStartDate] 
		,sld.[AppAgeFact] 
		,sld.[AppATAGTA]
		,sld.[AppCompetency]
		,sld.[AppFuncSkill] 
		,sld.[AppFuncSkill1618AdjFact]
		,sld.[AppKnowl]
		,sld.[AppLearnStartDate]
		,sld.[ApplicEmpFactDate]
		,sld.[ApplicFactDate] 
		,sld.[ApplicFundRateDate] 
		,sld.[ApplicProgWeightFact] 
		,sld.[ApplicUnweightFundRate] 
		,sld.[ApplicWeightFundRate] 
		,sld.[AppNonFund] 
		,sld.[AreaCostFactAdj] 
		,sld.[BalInstalmPreTrans] 
		,sld.[BaseValueUnweight]
		,sld.[CapFactor] 
		,sld.[DisUpFactAdj] 
		,sld.[EmpOutcomePayElig]
		,sld.[EmpOutcomePctHeldBackTrans] 
		,sld.[EmpOutcomePctPreTrans] 
		,sld.[EmpRespOth]
		,sld.[ESOL]
		,sld.[FullyFund]
		,sld.[FundLine] 
		,sld.[FundStart] 
		,sld.[LargeEmployerID] 
		,sld.[LargeEmployerSFAFctr] 
		,sld.[LargeEmployerStatusDate]
		,sld.[LTRCUpliftFctr] 
		,sld.[NonGOvCont] 
		,sld.[OLASSCustody] 
		,sld.[OnProgPayPctPreTrans]
		,sld.[OutstndNumOnProgInstalm] 
		,sld.[OutstndNumOnProgInstalmTrans]
		,sld.[PlannedNumOnProgInstalm]
		,sld.[PlannedNumOnProgInstalmTrans]
		,sld.[PlannedTotalDaysIL]
		,sld.[PlannedTotalDaysILPreTrans] 
		,sld.[PropFundRemain] 
		,sld.[PropFundRemainAch] 
		,sld.[PrscHEAim] 
		,sld.[Residential]
		,sld.[Restart]
		,sld.[SpecResUplift] 
		,sld.[StartPropTrans] 
		,sld.[ThresholdDays] 
		,sld.[Traineeship] 
		,sld.[Trans]
		,sld.[TrnAdjLearnStartDate]
		,sld.[TrnWorkPlaceAim] 
		,sld.[TrnWorkPrepAim] 
		,sld.[UnWeightedRateFromESOL] 
		,sld.[UnweightedRateFromLARS]
		,sld.[WeightedRateFromESOL]
		,sld.[WeightedRateFromLARS] 
	from
		Rulebase.SFA_LearningDelivery as sld
		cross join (select UKPRN from Rulebase.SFA_global) as g
GO

if object_id ('DEDS_Rulebase.SFA_global','v') is not null
begin
	drop view DEDS_Rulebase.SFA_global
end
GO

create view DEDS_Rulebase.SFA_global
as
	select
		g.UKPRN
		,g.CurFundYr
		,g.LARSVersion
		,g.OrgVersion
		,g.PostcodeDisadvantageVersion
		,g.RulebaseVersion
	from
		Rulebase.SFA_global g
GO

if object_id ('DEDS_Rulebase.SFA_Cases','v') is not null
begin
	drop view DEDS_Rulebase.SFA_Cases
end
GO

create view DEDS_Rulebase.SFA_Cases
as
	select
		g.UKPRN
		,sc.LearnRefNumber
		,sc.CaseData
	from
		Rulebase.SFA_Cases as sc
		cross join (select top 1 UKPRN from Rulebase.SFA_global) as g
GO

if object_id ('DEDS_Rulebase.VAL_ValidationError', 'v') is not null
begin
	drop view DEDS_Rulebase.VAL_ValidationError
end
GO

create view DEDS_Rulebase.VAL_ValidationError
as
	select
		g.UKPRN
		,ve.AimSeqNumber
		,ve.ErrorString
		,ve.FieldValues
		,ve.LearnRefNumber
		,ve.RuleId
	from
		Rulebase.VAL_ValidationError as ve
		cross join (select top 1 UKPRN from Rulebase.VAL_global) as g
GO

if object_id ('DEDS_Rulebase.VAL_global','v') is not null
begin
	drop view DEDS_Rulebase.VAL_global
end
GO

create view DEDS_Rulebase.VAL_global
as
	select
		g.UKPRN
		,g.EmployerVersion
		,g.LARSVersion
		,g.OrgVersion
		,g.PostcodeVersion
		,g.RulebaseVersion
	from
		Rulebase.VAL_global as g
GO

if object_id ('DEDS_Rulebase.VAL_Cases','v') is not null
begin
	drop view DEDS_Rulebase.VAL_Cases
end
GO

create view DEDS_Rulebase.VAL_Cases
as
	select
		g.UKPRN
		,vc.Learner_Id
		,vc.CaseData
	from
		Rulebase.VAL_Cases as vc
		cross join (SELECT TOP(1) UKPRN FROM Valid.LearningProvider) as g
GO

if object_id ('DEDS_Rulebase.VALDP_ValidationError', 'v') is not null
begin
	drop view DEDS_Rulebase.VALDP_ValidationError
end
GO

create view DEDS_Rulebase.VALDP_ValidationError
as
	select
		g.UKPRN
		,ve.ErrorString
		,ve.FieldValues
		,ve.LearnRefNumber
		,ve.RuleId
	from
		Rulebase.VALDP_ValidationError as ve
		cross join (SELECT TOP(1) UKPRN FROM Valid.LearningProvider) as g
GO

if object_id ('DEDS_Rulebase.VALDP_global', 'v') is not null
begin
	drop view DEDS_Rulebase.VALDP_global
end
GO

create view DEDS_Rulebase.VALDP_global
as
	select
		g.UKPRN
		,g.OrgVersion
		,g.RulebaseVersion
		,g.ULNVersion
	from
		Rulebase.VALDP_global g
GO

if object_id ('DEDS_Rulebase.VALDP_Cases', 'v') is not null
begin
	drop view DEDS_Rulebase.VALDP_Cases
end
GO 

create view DEDS_Rulebase.VALDP_Cases
as
	select
		g.UKPRN
		,vc.LearnerDestinationAndProgression_Id
		,vc.CaseData
	from
		Rulebase.VALDP_Cases as vc
		cross join (select UKPRN from Rulebase.VALDP_global) as g
GO

if object_id ('DEDS_Rulebase.ALB_LearningDelivery_PeriodisedValues') is not null
begin
	drop view DEDS_Rulebase.ALB_LearningDelivery_PeriodisedValues
end
GO
create view DEDS_Rulebase.ALB_LearningDelivery_PeriodisedValues
as
	select
		g.UKPRN
		,apv.[LearnRefNumber]
		,apv.[AimSeqNumber]
		,apv.[AttributeName] 
		,apv.[Period_1]
		,apv.[Period_2]
		,apv.[Period_3]
		,apv.[Period_4]
		,apv.[Period_5] 
		,apv.[Period_6]
		,apv.[Period_7]
		,apv.[Period_8]
		,apv.[Period_9]
		,apv.[Period_10] 
		,apv.[Period_11]
		,apv.[Period_12]
	from
		Rulebase.ALB_LearningDelivery_PeriodisedValues as apv
		cross join (select top 1 UKPRN from Rulebase.ALB_global) as g
GO

if object_id ('DEDS_Rulebase.ALB_LearningDelivery_Period','v') is not null
begin
	drop view DEDS_Rulebase.ALB_LearningDelivery_Period
end
GO

create view DEDS_Rulebase.ALB_LearningDelivery_Period
as
	select
		g.UKPRN
		,ldp.[LearnRefNumber]
		,ldp.[AimSeqNumber]
		,ldp.[Period] 
		,ldp.[ALBCode]
		,ldp.[ALBSupportPayment]
		,ldp.[AreaUpliftBalPayment]
		,ldp.[AreaUpliftOnProgPayment]
	from
		Rulebase.ALB_LearningDelivery_Period as ldp
		cross join (select top 1 UKPRN from Rulebase.ALB_global) as g 
GO

if object_id ('DEDS_Rulebase.ALB_LearningDelivery', 'v') is not null
begin
	drop view DEDS_Rulebase.ALB_LearningDelivery
end
GO

create view DEDS_Rulebase.ALB_LearningDelivery
as
	select
		g.UKPRN
		,ld.[LearnRefNumber] 
		,ld.[AimSeqNumber]
		,ld.[Achieved] 
		,ld.[ActualNumInstalm]
		,ld.[AdvLoan] 
		,ld.[ApplicFactDate]
		,ld.[ApplicProgWeightFact]
		,ld.[AreaCostFactAdj] 
		,ld.[AreaCostInstalment]
		,ld.[FundLine] 
		,ld.[FundStart]
		,ld.[LiabilityDate]
		,ld.[LoanBursAreaUplift] 
		,ld.[LoanBursSupp]
		,ld.[OutstndNumOnProgInstalm]
		,ld.[PlannedNumOnProgInstalm] 
		,ld.[WeightedRate] 
	from
		Rulebase.ALB_LearningDelivery as ld
		cross join (select top 1 UKPRN from Rulebase.ALB_global) as g
GO

if object_id ('DEDS_Rulebase.ALB_Learner_PeriodisedValues', 'v') is not null
begin
	drop view DEDS_Rulebase.ALB_Learner_PeriodisedValues
end
GO

create view DEDS_Rulebase.ALB_Learner_PeriodisedValues
as
	select
		g.UKPRN
		,lpv.[LearnRefNumber]
		,lpv.[AttributeName] 
		,lpv.[Period_1]
		,lpv.[Period_2] 
		,lpv.[Period_3] 
		,lpv.[Period_4] 
		,lpv.[Period_5] 
		,lpv.[Period_6] 
		,lpv.[Period_7]
		,lpv.[Period_8]
		,lpv.[Period_9]
		,lpv.[Period_10]
		,lpv.[Period_11]
		,lpv.[Period_12]
	from
		Rulebase.ALB_Learner_PeriodisedValues as lpv
		cross join (select top 1 UKPRN from Rulebase.ALB_global) as g
GO

if object_id ('DEDS_Rulebase.ALB_Learner_Period','v') is not null
begin
	drop view DEDS_Rulebase.ALB_Learner_Period
end
GO

create view DEDS_Rulebase.ALB_Learner_Period
as
	select
		g.UKPRN
		,lp.LearnRefNumber
		,lp.Period
		,lp.ALBSeqNum
	from
		Rulebase.ALB_Learner_Period as lp
		cross join (select top 1 UKPRN from Rulebase.ALB_global) as g
GO


if object_id ('DEDS_Rulebase.ALB_global', 'v') is not null
begin
	drop view DEDS_Rulebase.ALB_global
end
GO

create view DEDS_Rulebase.ALB_global
as
	select
		g.UKPRN
		,g.LARSVersion
		,g.PostcodeAreaCostVersion
		,g.RulebaseVersion
	from
		Rulebase.ALB_global as g
GO

if object_id ('DEDS_Rulebase.ALB_Cases', 'v') is not null
begin
	drop view DEDS_Rulebase.ALB_Cases
end
GO

create view DEDS_Rulebase.ALB_Cases
as
	select
		g.UKPRN
		,ac.LearnRefNumber
		,ac.CaseData
	from
		Rulebase.ALB_Cases as ac
		cross join (select top 1 UKPRN from Rulebase.ALB_global) as g
GO

if object_id ('DEDS_Rulebase.VAL_LearningDelivery', 'v') is not null
begin 
	drop view DEDS_Rulebase.VAL_LearningDelivery
end
GO

create view DEDS_Rulebase.VAL_LearningDelivery
as
	select
		g.UKPRN
		,vld.AimSeqNumber
	from
		Rulebase.VAL_LearningDelivery as vld
		cross join (select top 1 UKPRN from Rulebase.VAL_global) as g
GO

if object_id ('DEDS_Rulebase.VAL_Learner', 'v') is not null
begin
	drop view DEDS_Rulebase.VAL_Learner
end
GO

create view DEDS_Rulebase.VAL_Learner
as
	select
		g.UKPRN
		,vl.LearnRefNumber
	from
		Rulebase.VAL_Learner as vl
		cross join (select top 1 UKPRN from Rulebase.VAL_global) as g
GO

if object_id ('DEDS_Rulebase.EFA_Learner', 'v') is not null
begin
	drop view DEDS_Rulebase.EFA_Learner
end
GO

create view DEDS_Rulebase.EFA_Learner 
as
	select
		g.UKPRN
		,el.[LearnRefNumber]
		,el.[AcadMonthPayment]
		,el.[AcadProg]
		,el.[ActualDaysILCurrYear]
		,el.[AreaCostFact1618Hist] 
		,el.[Block1DisadvUpliftNew] 
		,el.[Block2DisadvElementsNew]
		,el.[ConditionOfFundingEnglish] 
		,el.[ConditionOfFundingMaths] 
		,el.[CoreAimSeqNumber] 
		,el.[FullTimeEquiv] 
		,el.[FundLine]
		,el.[LearnerActEndDate]
		,el.[LearnerPlanEndDate]
		,el.[LearnerStartDate] 
		,el.[NatRate]
		,el.[OnProgPayment] 
		,el.[PlannedDaysILCurrYear] 
		,el.[ProgWeightHist]
		,el.[ProgWeightNew] 
		,el.[PrvDisadvPropnHist]
		,el.[PrvHistLrgProgPropn] 
		,el.[PrvRetentFactHist] 
		,el.[RateBand] 
		,el.[RetentNew]
		,el.[StartFund] 
		,el.[ThresholdDays]
	from
		Rulebase.EFA_Learner as el
		cross join (select top 1 UKPRN from Rulebase.EFA_global) as g
GO

if object_id ('DEDS_Rulebase.EFA_global', 'v') is not null
begin
	drop view DEDS_Rulebase.EFA_global
end
GO

create view DEDS_Rulebase.EFA_global
as
	select
		g.UKPRN
		,g.LARSVersion
		,g.OrgVersion
		,g.PostcodeDisadvantageVersion
		,g.RulebaseVersion
	from
		Rulebase.EFA_global g
GO

if object_id ('DEDS_Rulebase.EFA_Cases', 'v') is not null
begin
	drop view DEDS_Rulebase.EFA_Cases
end
GO

create view DEDS_Rulebase.EFA_Cases
as 
	select
		g.UKPRN
		,ec.LearnRefNumber
		,ec.CaseData
	from
		Rulebase.EFA_Cases as ec
		cross join (select top 1 UKPRN from Rulebase.EFA_global) as g
GO

if object_id ('DEDS_Rulebase.EFA_SFA_Learner_PeriodisedValues', 'v') is not null
begin
	drop view DEDS_Rulebase.EFA_SFA_Learner_PeriodisedValues
end
GO

create view DEDS_Rulebase.EFA_SFA_Learner_PeriodisedValues
as
	select
		g.UKPRN
		,espv.[LearnRefNumber]
		,espv.[AttributeName]
		,espv.[Period_1]
		,espv.[Period_2]
		,espv.[Period_3]
		,espv.[Period_4]
		,espv.[Period_5]
		,espv.[Period_6]
		,espv.[Period_7]
		,espv.[Period_8]
		,espv.[Period_9]
		,espv.[Period_10] 
		,espv.[Period_11] 
		,espv.[Period_12] 
	from
		Rulebase.EFA_SFA_Learner_PeriodisedValues as espv
		cross join (select top 1 UKPRN from Rulebase.EFA_SFA_global) as g
GO

if object_id ('DEDS_Rulebase.EFA_SFA_Learner_Period', 'v') is not null
begin
	drop view DEDS_Rulebase.EFA_SFA_Learner_Period
end
GO

create view DEDS_Rulebase.EFA_SFA_Learner_Period
as
	select
		g.UKPRN
		,esp.LearnRefNumber
		,esp.Period
		,esp.LnrOnProgPay
	from
		Rulebase.EFA_SFA_Learner_Period as esp
		cross join (select top 1 UKPRN from Rulebase.EFA_SFA_global) as g
GO

if object_id ('DEDS_Rulebase.EFA_SFA_global','v') is not null
begin
	drop view DEDS_Rulebase.EFA_SFA_global
end
GO

create view DEDS_Rulebase.EFA_SFA_global
as
	select
		g.UKPRN
		,g.RulebaseVersion
	from
		Rulebase.EFA_SFA_global g
GO

if object_id ('DEDS_Rulebase.EFA_SFA_Cases', 'v') is not null
begin
	drop view DEDS_Rulebase.EFA_SFA_Cases
end
GO

create view DEDS_Rulebase.EFA_SFA_Cases
as
	select
		g.UKPRN
		,esc.LearnRefNumber
		,esc.CaseData
	from
		Rulebase.EFA_SFA_Cases as esc
		cross join (select top 1 UKPRN from Rulebase.EFA_SFA_global) as g
GO

if object_id ('[DEDS_Rulebase].[AEC_Cases]', 'v') is not null
begin
	drop view [DEDS_Rulebase].[AEC_Cases]
end
GO

create view DEDS_Rulebase.AEC_Cases
as
	select
		g.UKPRN
		,c.LearnRefNumber
		,c.CaseData
	from
		Rulebase.[AEC_Cases] as c
		cross join (select top 1 UKPRN from Rulebase.[AEC_global]) as g
GO

if object_id ('[DEDS_Rulebase].[AEC_global]', 'v') is not null
begin
	drop view [DEDS_Rulebase].[AEC_global]
end
GO

create view [DEDS_Rulebase].[AEC_global]
as
	select
		g.UKPRN
		,g.LARSVersion
		,g.RulebaseVersion
		,g.[Year]
	from
		Rulebase.[AEC_global] as g
GO

if object_id ('DEDS_Rulebase.AEC_LearningDelivery', 'v') is not null
begin
	drop view DEDS_Rulebase.[AEC_LearningDelivery]
end
GO

create view DEDS_Rulebase.[AEC_LearningDelivery]
as
	select
		g.UKPRN
		,ald.[LearnRefNumber]
		,ald.[AimSeqNumber]
		,ald.[ActualDaysIL] 
		,ald.[ActualNumInstalm] 
		,ald.[AdjStartDate] 
		,ald.[AgeAtProgStart]
		,ald.[AppAdjLearnStartDate] 
		,ald.[AppAdjLearnStartDateMatchPathway]
		,ald.[ApplicCompDate]
		,ald.[CombinedAdjProp]
		,ald.[Completed] 
		,ald.[FirstIncentiveThresholdDate]
		,ald.[FundStart] 
		,ald.[LDApplic1618FrameworkUpliftBalancingValue]
		,ald.[LDApplic1618FrameworkUpliftCompElement] 
		,ald.[LDApplic1618FRameworkUpliftCompletionValue]
		,ald.[LDApplic1618FrameworkUpliftMonthInstalVal] 
		,ald.[LDApplic1618FrameworkUpliftPrevEarnings] 
		,ald.[LDApplic1618FrameworkUpliftPrevEarningsStage1]
		,ald.[LDApplic1618FrameworkUpliftRemainingAmount] 
		,ald.[LDApplic1618FrameworkUpliftTotalActEarnings] 
		,ald.[LearnAimRef]
		,ald.[LearnDel1618AtStart]
		,ald.[LearnDelAppAccDaysIL]
		,ald.[LearnDelApplicDisadvAmount]
		,ald.[LearnDelApplicEmp1618Incentive]
		,ald.[LearnDelApplicEmpDate] 
		,ald.[LearnDelApplicProv1618FrameworkUplift]
		,ald.[LearnDelApplicProv1618Incentive] 
		,ald.[LearnDelAppPrevAccDaysIL]
		,ald.[LearnDelDaysIL]
		,ald.[LearnDelDisadAmount]
		,ald.[LearnDelEligDisadvPayment]
		,ald.[LearnDelEmpIdFirstAdditionalPaymentThreshold]
		,ald.[LearnDelEmpIdSecondAdditionalPaymentThreshold]
		,ald.[LearnDelHistDaysThisApp] 
		,ald.[LearnDelHistProgEarnings] 
		,ald.[LearnDelInitialFundLineType]
		,ald.[LearnDelMathEng]
		,ald.[MathEngAimValue]
		,ald.[OutstandNumOnProgInstalm]
		,ald.[PlannedNumOnProgInstalm]
		,ald.[PlannedTotalDaysIL]
		,ald.[SecondIncentiveThresholdDate] 
		,ald.[ThresholdDays]
	from
		Rulebase.[AEC_LearningDelivery] as ald
		cross join (select top 1 UKPRN from Rulebase.[AEC_global]) as g
GO

if object_id ('DEDS_Rulebase.AEC_LearningDelivery_Period', 'v') is not null
begin
	drop view DEDS_Rulebase.[AEC_LearningDelivery_Period]
end
GO

create view DEDS_Rulebase.[AEC_LearningDelivery_Period]
as
	select
		g.UKPRN
		,aldp.[LearnRefNumber]
		,aldp.[AimSeqNumber] 
		,aldp.[Period] 
		,aldp.[DisadvFirstPayment]
		,aldp.[DisadvSecondPayment]
		,aldp.[FundLineType] 
		,aldp.[InstPerPeriod] 
		,aldp.[LDApplic1618FrameworkUpliftBalancingPayment] 
		,aldp.[LDApplic1618FrameworkUpliftCompletionPayment]
		,aldp.[LDApplic1618FrameworkUpliftOnProgPayment] 
		,aldp.[LearnDelContType] 
		,aldp.[LearnDelFirstEmp1618Pay]
		,aldp.[LearnDelFirstProv1618Pay]
		,aldp.[LearnDelLevyNonPayInd] 
		,aldp.[LearnDelSecondEmp1618Pay]
		,aldp.[LearnDelSecondProv1618Pay]
		,aldp.[LearnDelSEMContWaiver]
		,aldp.[LearnDelSFAContribPct]
		,aldp.[LearnSuppFund] 
		,aldp.[LearnSuppFundCash]
		,aldp.[MathEngBalPayment]
		,aldp.[MathEngBalPct] 
		,aldp.[MathEngOnProgPayment]
		,aldp.[MathEngOnProgPct]
		,aldp.[ProgrammeAimBalPayment]
		,aldp.[ProgrammeAimCompletionPayment] 
		,aldp.[ProgrammeAimOnProgPayment] 
		,aldp.[ProgrammeAimProgFundIndMaxEmpCont] 
		,aldp.[ProgrammeAimProgFundIndMinCoInvest]
		,aldp.[ProgrammeAimTotProgFund] 
	from
		Rulebase.[AEC_LearningDelivery_Period] as aldp
		cross join (select top 1 UKPRN from Rulebase.[AEC_global]) as g
GO

if object_id ('DEDS_Rulebase.AEC_LearningDelivery_PeriodisedValues') is not null
begin
	drop view DEDS_Rulebase.[AEC_LearningDelivery_PeriodisedValues]
end
GO

create view DEDS_Rulebase.[AEC_LearningDelivery_PeriodisedValues]
as
	select
		g.UKPRN
		,aldpv.[LearnRefNumber]
		,aldpv.[AimSeqNumber]
		,aldpv.[AttributeName]
		,aldpv.[Period_1] 
		,aldpv.[Period_2] 
		,aldpv.[Period_3] 
		,aldpv.[Period_4] 
		,aldpv.[Period_5] 
		,aldpv.[Period_6] 
		,aldpv.[Period_7] 
		,aldpv.[Period_8] 
		,aldpv.[Period_9] 
		,aldpv.[Period_10]
		,aldpv.[Period_11]
		,aldpv.[Period_12]
	from
		Rulebase.[AEC_LearningDelivery_PeriodisedValues] as aldpv
		cross join (select top 1 UKPRN from Rulebase.[AEC_global]) as g
GO

if object_id ('DEDS_Rulebase.AEC_LearningDelivery_PeriodisedTextValues','v') is not null
begin
	drop view DEDS_Rulebase.[AEC_LearningDelivery_PeriodisedTextValues]
end
GO

create view DEDS_Rulebase.[AEC_LearningDelivery_PeriodisedTextValues]
as
	select
		g.UKPRN
		,ldptv.[LearnRefNumber] 
		,ldptv.[AimSeqNumber] 
		,ldptv.[AttributeName]
		,ldptv.[Period_1] 
		,ldptv.[Period_2] 
		,ldptv.[Period_3] 
		,ldptv.[Period_4] 
		,ldptv.[Period_5] 
		,ldptv.[Period_6] 
		,ldptv.[Period_7] 
		,ldptv.[Period_8]
		,ldptv.[Period_9]
		,ldptv.[Period_10]
		,ldptv.[Period_11]
		,ldptv.[Period_12]
	from
		Rulebase.[AEC_LearningDelivery_PeriodisedTextValues] as ldptv
		cross join (select top 1 UKPRN from Rulebase.[AEC_global]) as g
GO

if object_id('[DEDS_Rulebase].[AEC_ApprenticeshipPriceEpisode]','v') is not null
begin
	drop view [DEDS_Rulebase].[AEC_ApprenticeshipPriceEpisode]
end
go

create view DEDS_Rulebase.AEC_ApprenticeshipPriceEpisode
as
	select
		g.UKPRN
		,aape.LearnRefNumber
		,aape.PriceEpisodeIdentifier
		,aape.TNP4 
		,aape.TNP1 
		,aape.EpisodeStartDate
		,aape.TNP2 
		,aape.TNP3 
		,aape.PriceEpisodeUpperBandLimit
		,aape.PriceEpisodePlannedEndDate 
		,aape.PriceEpisodeActualEndDate
		,aape.PriceEpisodeTotalTNPPrice
		,aape.PriceEpisodeUpperLimitAdjustment
		,aape.PriceEpisodePlannedInstalments
		,aape.PriceEpisodeActualInstalments 
		,aape.PriceEpisodeInstalmentsThisPeriod
		,aape.PriceEpisodeCompletionElement
		,aape.PriceEpisodePreviousEarnings 
		,aape.PriceEpisodeInstalmentValue
		,aape.PriceEpisodeOnProgPayment
		,aape.PriceEpisodeTotalEarnings
		,aape.PriceEpisodeBalanceValue 
		,aape.PriceEpisodeBalancePayment 
		,aape.PriceEpisodeCompleted 
		,aape.PriceEpisodeCompletionPayment 
		,aape.PriceEpisodeRemainingTNPAmount 
		,aape.PriceEpisodeRemainingAmountWithinUpperLimit 
		,aape.PriceEpisodeCappedRemainingTNPAmount
		,aape.PriceEpisodeExpectedTotalMonthlyValue 
		,aape.PriceEpisodeAimSeqNumber 
		,aape.PriceEpisodeFirstDisadvantagePayment
		,aape.PriceEpisodeSecondDisadvantagePayment
		,aape.PriceEpisodeApplic1618FrameworkUpliftBalancing 
		,aape.PriceEpisodeApplic1618FrameworkUpliftCompletionPayment 
		,aape.PriceEpisodeApplic1618FrameworkUpliftOnProgPayment
		,aape.PriceEpisodeSecondProv1618Pay 
		,aape.PriceEpisodeFirstEmp1618Pay 
		,aape.PriceEpisodeSecondEmp1618Pay 
		,aape.PriceEpisodeFirstProv1618Pay 
		,aape.PriceEpisodeLSFCash 
		,aape.PriceEpisodeFundLineType 
		,aape.PriceEpisodeSFAContribPct
		,aape.PriceEpisodeLevyNonPayInd 
		,aape.EpisodeEffectiveTNPStartDate
		,aape.PriceEpisodeFirstAdditionalPaymentThresholdDate 
		,aape.PriceEpisodeSecondAdditionalPaymentThresholdDate
		,aape.PriceEpisodeContractType 
		,aape.PriceEpisodePreviousEarningsSameProvider
		,aape.PriceEpisodeTotProgFunding
		,aape.PriceEpisodeProgFundIndMinCoInvest
		,aape.PriceEpisodeProgFundIndMaxEmpCont 
		,aape.PriceEpisodeTotalPMRs
		,aape.PriceEpisodeCumulativePMRs 
		,aape.PriceEpisodeCompExemCode 
	from
		Rulebase.[AEC_ApprenticeshipPriceEpisode] as aape
		cross join (select top 1 UKPRN from Rulebase.[AEC_global]) as g
GO

if object_id ('DEDS_Rulebase.AEC_ApprenticeshipPriceEpisode_Period', 'v') is not null
begin
	drop view DEDS_Rulebase.[AEC_ApprenticeshipPriceEpisode_Period]
end
GO

create view DEDS_Rulebase.[AEC_ApprenticeshipPriceEpisode_Period]
as
	select
		g.UKPRN
		,apep.[LearnRefNumber]
		,apep.[PriceEpisodeIdentifier]
		,apep.[Period] 
		,apep.[PriceEpisodeApplic1618FrameworkUpliftBalancing] 
		,apep.[PriceEpisodeApplic1618FrameworkUpliftCompletionPayment]
		,apep.[PriceEpisodeApplic1618FrameworkUpliftOnProgPayment] 
		,apep.[PriceEpisodeBalancePayment] 
		,apep.[PriceEpisodeBalanceValue] 
		,apep.[PriceEpisodeCompletionPayment]
		,apep.[PriceEpisodeFirstDisadvantagePayment]
		,apep.[PriceEpisodeFirstEmp1618Pay] 
		,apep.[PriceEpisodeFirstProv1618Pay]
		,apep.[PriceEpisodeInstalmentsThisPeriod]
		,apep.[PriceEpisodeLevyNonPayInd] 
		,apep.[PriceEpisodeLSFCash]
		,apep.[PriceEpisodeOnProgPayment]
		,apep.[PriceEpisodeProgFundIndMaxEmpCont] 
		,apep.[PriceEpisodeProgFundIndMinCoInvest]
		,apep.[PriceEpisodeSecondDisadvantagePayment]
		,apep.[PriceEpisodeSecondEmp1618Pay] 
		,apep.[PriceEpisodeSecondProv1618Pay]
		,apep.[PriceEpisodeSFAContribPct] 
		,apep.[PriceEpisodeTotProgFunding]
	from
		Rulebase.[AEC_ApprenticeshipPriceEpisode_Period] as apep
		cross join (select top 1 UKPRN from Rulebase.[AEC_global]) as g
GO

if object_id ('DEDS_Rulebase.AEC_ApprenticeshipPriceEpisode_PeriodisedValues','v') is not null
begin
	drop view DEDS_Rulebase.[AEC_ApprenticeshipPriceEpisode_PeriodisedValues]
end
go

create view DEDS_Rulebase.[AEC_ApprenticeshipPriceEpisode_PeriodisedValues]
as
	select
		g.UKPRN
		,apepv.[LearnRefNumber]
		,apepv.[PriceEpisodeIdentifier]
		,apepv.[AttributeName] 
		,apepv.[Period_1] 
		,apepv.[Period_2] 
		,apepv.[Period_3] 
		,apepv.[Period_4] 
		,apepv.[Period_5]
		,apepv.[Period_6]
		,apepv.[Period_7]
		,apepv.[Period_8]
		,apepv.[Period_9]
		,apepv.[Period_10]
		,apepv.[Period_11]
		,apepv.[Period_12]
	from
		Rulebase.[AEC_ApprenticeshipPriceEpisode_PeriodisedValues] as apepv
		cross join (select top 1 UKPRN from Rulebase.[AEC_global]) as g
GO

if object_id ('DEDS_Rulebase.AEC_HistoricEarningOutput','v') is not null
begin
	drop view DEDS_Rulebase.[AEC_HistoricEarningOutput]
end
GO

create view DEDS_Rulebase.[AEC_HistoricEarningOutput]
as
	select
		g.UKPRN
		,heo.[LearnRefNumber] 
		,heo.[AppIdentifierOutput]
		,heo.[AppProgCompletedInTheYearOutput]
		,heo.[HistoricDaysInYearOutput] 
		,heo.[HistoricEffectiveTNPStartDateOutput]
		,heo.[HistoricEmpIdEndWithinYearOutput]
		,heo.[HistoricEmpIdStartWithinYearOutput] 
		,heo.[HistoricFworkCodeOutput] 
		,heo.[HistoricLearner1618AtStartOutput]
		,heo.[HistoricPMRAmountOutput] 
		,heo.[HistoricProgrammeStartDateIgnorePathwayOutput]
		,heo.[HistoricProgrammeStartDateMatchPathwayOutput] 
		,heo.[HistoricProgTypeOutput] 
		,heo.[HistoricPwayCodeOutput] 
		,heo.[HistoricSTDCodeOutput] 
		,heo.[HistoricTNP1Output] 
		,heo.[HistoricTNP2Output] 
		,heo.[HistoricTNP3Output] 
		,heo.[HistoricTNP4Output] 
		,heo.[HistoricTotal1618UpliftPaymentsInTheYear]
		,heo.[HistoricTotalProgAimPaymentsInTheYear] 
		,heo.[HistoricULNOutput] 
		,heo.[HistoricUptoEndDateOutput] 
		,heo.[HistoricVirtualTNP3EndofThisYearOutput]
		,heo.[HistoricVirtualTNP4EndofThisYearOutput]
	from
		Rulebase.[AEC_HistoricEarningOutput] as heo
		cross join (select top 1 UKPRN from Rulebase.[AEC_global]) as g
GO

-- ESF validation views
if object_id ('DEDS_Rulebase.ESFVAL_Cases', 'v') is not null
begin
	drop view DEDS_Rulebase.ESFVAL_Cases
end
GO

create view DEDS_Rulebase.ESFVAL_Cases
as
	select
		g.UKPRN
		,evc.Learner_Id
		,evc.CaseData
	from
		Rulebase.ESFVAL_Cases as evc
		cross join (select top 1 UKPRN from Rulebase.ESFVAL_global) as g
GO

if object_id ('DEDS_Rulebase.ESFVAL_global','v') is not null
begin
	drop view DEDS_Rulebase.ESFVAL_global
end
GO

create view DEDS_Rulebase.ESFVAL_global
as
	select
		g.UKPRN
		,g.RulebaseVersion
	from
		Rulebase.ESFVAL_global g
GO

if object_id ('DEDS_Rulebase.ESFVAL_ValidationError', 'v') is not null
begin
	drop view DEDS_Rulebase.ESFVAL_ValidationError
end
GO

create view DEDS_Rulebase.ESFVAL_ValidationError
as
	select
		g.UKPRN
		,ve.AimSeqNumber
		,ve.ErrorString
		,ve.FieldValues
		,ve.LearnRefNumber
		,ve.RuleId
	from
		Rulebase.ESFVAL_ValidationError as ve
		cross join (SELECT TOP(1) UKPRN FROM Rulebase.ESFVAL_global) as g
GO

if object_id('[DEDS_Rulebase].[DV_Cases]','v') is not null
begin
	drop view [DEDS_Rulebase].[DV_Cases]
end
go

create view [DEDS_Rulebase].[DV_Cases]
as
	select
		g.UKPRN
		,c.[LearnRefNumber]
		,c.[CaseData]
	from
		Rulebase.DV_Cases as c
		cross join (select top 1 UKPRN from Rulebase.DV_global) as g
go

if object_id('[DEDS_Rulebase].[DV_global]','v') is not null
begin
	drop view [DEDS_Rulebase].[DV_global]
end
go

create view [DEDS_Rulebase].[DV_global]
as
	select
		[UKPRN]
		,[RulebaseVersion]
	from
		Rulebase.DV_global
go

if object_id('[DEDS_Rulebase].[DV_Learner]','v') is not null
begin
	drop view [DEDS_Rulebase].[DV_Learner]
end
go

create view [DEDS_Rulebase].[DV_Learner]
as
	select
		g.UKPRN
		,l.[LearnRefNumber]
		,l.[Learn_3rdSector]
		,l.[Learn_Active]
		,l.[Learn_ActiveJan]
		,l.[Learn_ActiveNov]
		,l.[Learn_ActiveOct]
		,l.[Learn_Age31Aug] 
		,l.[Learn_BasicSkill]
		,l.[Learn_EmpStatFDL]
		,l.[Learn_EmpStatPrior]
		,l.[Learn_FirstFullLevel2]
		,l.[Learn_FirstFullLevel2Ach]
		,l.[Learn_FirstFullLevel3]
		,l.[Learn_FirstFullLevel3Ach]
		,l.[Learn_FullLevel2] 
		,l.[Learn_FullLevel2Ach]
		,l.[Learn_FullLevel3] 
		,l.[Learn_FullLevel3Ach]
		,l.[Learn_FundAgency] 
		,l.[Learn_FundingSource]
		,l.[Learn_FundPrvYr] 
		,l.[Learn_ILAcMonth1]
		,l.[Learn_ILAcMonth10]
		,l.[Learn_ILAcMonth11]
		,l.[Learn_ILAcMonth12]
		,l.[Learn_ILAcMonth2] 
		,l.[Learn_ILAcMonth3] 
		,l.[Learn_ILAcMonth4] 
		,l.[Learn_ILAcMonth5] 
		,l.[Learn_ILAcMonth6] 
		,l.[Learn_ILAcMonth7] 
		,l.[Learn_ILAcMonth8] 
		,l.[Learn_ILAcMonth9] 
		,l.[Learn_ILCurrAcYr] 
		,l.[Learn_LargeEmployer]
		,l.[Learn_LenEmp] 
		,l.[Learn_LenUnemp]
		,l.[Learn_LrnAimRecords] 
		,l.[Learn_ModeAttPlanHrs]
		,l.[Learn_NotionLev]
		,l.[Learn_NotionLevV2]
		,l.[Learn_OLASS] 
		,l.[Learn_PrefMethContact]
		,l.[Learn_PrimaryLLDD] 
		,l.[Learn_PriorEducationStatus]
		,l.[Learn_UnempBenFDL]
		,l.[Learn_UnempBenPrior]
		,l.[Learn_Uplift1516EFA]
		,l.[Learn_Uplift1516SFA]
	from
		Rulebase.DV_Learner as l
		cross join (select top 1 UKPRN from Rulebase.DV_global) as g
go

if object_id('[DEDS_Rulebase].[DV_LearningDelivery]','v') is not null
begin
	drop view [DEDS_Rulebase].[DV_LearningDelivery]
end
go

create view [DEDS_Rulebase].[DV_LearningDelivery]
as
	select
		g.UKPRN
		,ld.[LearnRefNumber]
		,ld.[AimSeqNumber] 
		,ld.[LearnDel_AccToApp]
		,ld.[LearnDel_AccToAppEmpDate]
		,ld.[LearnDel_AccToAppEmpStat]
		,ld.[LearnDel_AchFullLevel2Pct] 
		,ld.[LearnDel_AchFullLevel3Pct] 
		,ld.[LearnDel_Achieved]
		,ld.[LearnDel_AchievedIY]
		,ld.[LearnDel_AcMonthYTD] 
		,ld.[LearnDel_ActDaysILAfterCurrAcYr]
		,ld.[LearnDel_ActDaysILCurrAcYr]
		,ld.[LearnDel_ActEndDateOnAfterJan1]
		,ld.[LearnDel_ActEndDateOnAfterNov1]
		,ld.[LearnDel_ActEndDateOnAfterOct1]
		,ld.[LearnDel_ActiveIY]
		,ld.[LearnDel_ActiveJan]
		,ld.[LearnDel_ActiveNov]
		,ld.[LearnDel_ActiveOct]
		,ld.[LearnDel_ActTotalDaysIL]
		,ld.[LearnDel_AdvLoan]
		,ld.[LearnDel_AgeAimOrigStart]
		,ld.[LearnDel_AgeAtStart]
		,ld.[LearnDel_App]
		,ld.[LearnDel_App1618Fund]
		,ld.[LearnDel_App1925Fund]
		,ld.[LearnDel_AppAimType]
		,ld.[LearnDel_AppKnowl]
		,ld.[LearnDel_AppMainAim]
		,ld.[LearnDel_AppNonFund]
		,ld.[LearnDel_BasicSkills]
		,ld.[LearnDel_BasicSkillsParticipation]
		,ld.[LearnDel_BasicSkillsType]
		,ld.[LearnDel_CarryIn]
		,ld.[LearnDel_ClassRm]
		,ld.[LearnDel_CompAimApp]
		,ld.[LearnDel_CompAimProg]
		,ld.[LearnDel_Completed]
		,ld.[LearnDel_CompletedIY]
		,ld.[LearnDel_CompleteFullLevel2Pct]
		,ld.[LearnDel_CompleteFullLevel3Pct]
		,ld.[LearnDel_EFACoreAim]
		,ld.[LearnDel_Emp6MonthAimStart]
		,ld.[LearnDel_Emp6MonthProgStart]
		,ld.[LearnDel_EmpDateBeforeFDL]
		,ld.[LearnDel_EmpDatePriorFDL] 
		,ld.[LearnDel_EmpID]
		,ld.[LearnDel_Employed]
		,ld.[LearnDel_EmpStatFDL]
		,ld.[LearnDel_EmpStatPrior]
		,ld.[LearnDel_EmpStatPriorFDL]
		,ld.[LearnDel_EnhanAppFund]
		,ld.[LearnDel_FullLevel2AchPct]
		,ld.[LearnDel_FullLevel2ContPct]
		,ld.[LearnDel_FullLevel3AchPct] 
		,ld.[LearnDel_FullLevel3ContPct]
		,ld.[LearnDel_FuncSkills]
		,ld.[LearnDel_FundAgency]
		,ld.[LearnDel_FundingLineType] 
		,ld.[LearnDel_FundingSource]
		,ld.[LearnDel_FundPrvYr]
		,ld.[LearnDel_FundStart]
		,ld.[LearnDel_GCE]
		,ld.[LearnDel_GCSE]
		,ld.[LearnDel_ILAcMonth1]
		,ld.[LearnDel_ILAcMonth10]
		,ld.[LearnDel_ILAcMonth11]
		,ld.[LearnDel_ILAcMonth12]
		,ld.[LearnDel_ILAcMonth2]
		,ld.[LearnDel_ILAcMonth3]
		,ld.[LearnDel_ILAcMonth4]
		,ld.[LearnDel_ILAcMonth5]
		,ld.[LearnDel_ILAcMonth6]
		,ld.[LearnDel_ILAcMonth7]
		,ld.[LearnDel_ILAcMonth8]
		,ld.[LearnDel_ILAcMonth9]
		,ld.[LearnDel_ILCurrAcYr]
		,ld.[LearnDel_IYActEndDate]
		,ld.[LearnDel_IYPlanEndDate]
		,ld.[LearnDel_IYStartDate]
		,ld.[LearnDel_KeySkills]
		,ld.[LearnDel_LargeEmpDiscountId]
		,ld.[LearnDel_LargeEmployer]
		,ld.[LearnDel_LastEmpDate]
		,ld.[LearnDel_LeaveMonth]
		,ld.[LearnDel_LenEmp]
		,ld.[LearnDel_LenUnemp]
		,ld.[LearnDel_LoanBursFund]
		,ld.[LearnDel_NotionLevel]
		,ld.[LearnDel_NotionLevelV2]
		,ld.[LearnDel_NumHEDatasets]
		,ld.[LearnDel_OccupAim]
		,ld.[LearnDel_OLASS]
		,ld.[LearnDel_OLASSCom]
		,ld.[LearnDel_OLASSCus]
		,ld.[LearnDel_OrigStartDate] 
		,ld.[LearnDel_PlanDaysILAfterCurrAcYr]
		,ld.[LearnDel_PlanDaysILCurrAcYr]
		,ld.[LearnDel_PlanEndBeforeAug1]
		,ld.[LearnDel_PlanEndOnAfterJan1]
		,ld.[LearnDel_PlanEndOnAfterNov1]
		,ld.[LearnDel_PlanEndOnAfterOct1]
		,ld.[LearnDel_PlanTotalDaysIL]
		,ld.[LearnDel_PriorEducationStatus]
		,ld.[LearnDel_Prog]
		,ld.[LearnDel_ProgAimAch]
		,ld.[LearnDel_ProgAimApp]
		,ld.[LearnDel_ProgCompleted]
		,ld.[LearnDel_ProgCompletedIY]
		,ld.[LearnDel_ProgStartDate] 
		,ld.[LearnDel_QCF]
		,ld.[LearnDel_QCFCert]
		,ld.[LearnDel_QCFDipl]
		,ld.[LearnDel_QCFType]
		,ld.[LearnDel_RegAim]
		,ld.[LearnDel_SecSubAreaTier1] 
		,ld.[LearnDel_SecSubAreaTier2] 
		,ld.[LearnDel_SFAApproved]
		,ld.[LearnDel_SourceFundEFA]
		,ld.[LearnDel_SourceFundSFA]
		,ld.[LearnDel_StartBeforeApr1]
		,ld.[LearnDel_StartBeforeAug1]
		,ld.[LearnDel_StartBeforeDec1]
		,ld.[LearnDel_StartBeforeFeb1]
		,ld.[LearnDel_StartBeforeJan1]
		,ld.[LearnDel_StartBeforeJun1]
		,ld.[LearnDel_StartBeforeMar1]
		,ld.[LearnDel_StartBeforeMay1]
		,ld.[LearnDel_StartBeforeNov1]
		,ld.[LearnDel_StartBeforeOct1]
		,ld.[LearnDel_StartBeforeSep1]
		,ld.[LearnDel_StartIY]
		,ld.[LearnDel_StartJan1]
		,ld.[LearnDel_StartMonth]
		,ld.[LearnDel_StartNov1]
		,ld.[LearnDel_StartOct1]
		,ld.[LearnDel_SuccRateStat]
		,ld.[LearnDel_TrainAimType]
		,ld.[LearnDel_TransferDiffProvider]
		,ld.[LearnDel_TransferDiffProviderGovStrat]
		,ld.[LearnDel_TransferProvider]
		,ld.[LearnDel_UfIProv]
		,ld.[LearnDel_UnempBenFDL]
		,ld.[LearnDel_UnempBenPrior]
		,ld.[LearnDel_Withdrawn]
		,ld.[LearnDel_WorkplaceLocPostcode] 
		,ld.[Prog_AccToApp]
		,ld.[Prog_Achieved]
		,ld.[Prog_AchievedIY]
		,ld.[Prog_ActEndDate] 
		,ld.[Prog_ActiveIY]
		,ld.[Prog_AgeAtStart]
		,ld.[Prog_EarliestAim]
		,ld.[Prog_Employed]
		,ld.[Prog_FundPrvYr]
		,ld.[Prog_ILCurrAcYear]
		,ld.[Prog_LatestAim]
		,ld.[Prog_SourceFundEFA]
		,ld.[Prog_SourceFundSFA] 
	from
		Rulebase.DV_LearningDelivery as ld
		cross join (select top 1 UKPRN from Rulebase.DV_global) as g
go