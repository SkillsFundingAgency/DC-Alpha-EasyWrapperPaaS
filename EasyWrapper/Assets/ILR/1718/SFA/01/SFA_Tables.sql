-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 17 May 2017 08:41
-- Profile: DCSS Calculation
-- Rulebase Version: ILR SFA Calculation 1718, Version 1718.01
-- =====================================================================================================
if not exists(select schema_id from sys.schemas where name='Rulebase')
	exec('create schema Rulebase')
go
if object_id('[Rulebase].[SFA_Cases]','u') is not null
	drop table [Rulebase].[SFA_Cases]
create table [Rulebase].[SFA_Cases]
	(
		[LearnRefNumber] varchar(12),
		[CaseData] [xml] not null
	)
go
if object_id('[Rulebase].[SFA_global]','u') is not null
	drop table [Rulebase].[SFA_global]
create table [Rulebase].[SFA_global]
	(
		[UKPRN] varchar(8),
		[CurFundYr] varchar(9),
		[LARSVersion] varchar(100),
		[OrgVersion] varchar(100),
		[PostcodeDisadvantageVersion] varchar(50),
		[RulebaseVersion] varchar(10)
	)
go
if object_id('[Rulebase].[SFA_LearningDelivery]','u') is not null
	drop table [Rulebase].[SFA_LearningDelivery]
create table [Rulebase].[SFA_LearningDelivery]
	(
		[LearnRefNumber] varchar(12),
		[AimSeqNumber] int,
		[AchApplicDate] date,
		[Achieved] bit,
		[AchieveElement] decimal(10,5),
		[AchievePayElig] bit,
		[AchievePayPctPreTrans] decimal(10,5),
		[AchPayTransHeldBack] decimal(10,5),
		[ActualDaysIL] int,
		[ActualNumInstalm] int,
		[ActualNumInstalmPreTrans] int,
		[ActualNumInstalmTrans] int,
		[AdjLearnStartDate] date,
		[AdltLearnResp] bit,
		[AgeAimStart] int,
		[AimValue] decimal(10,5),
		[AppAdjLearnStartDate] date,
		[AppAgeFact] decimal(10,5),
		[AppATAGTA] bit,
		[AppCompetency] bit,
		[AppFuncSkill] bit,
		[AppFuncSkill1618AdjFact] decimal(10,5),
		[AppKnowl] bit,
		[AppLearnStartDate] date,
		[ApplicEmpFactDate] date,
		[ApplicFactDate] date,
		[ApplicFundRateDate] date,
		[ApplicProgWeightFact] varchar(1),
		[ApplicUnweightFundRate] decimal(10,5),
		[ApplicWeightFundRate] decimal(10,5),
		[AppNonFund] bit,
		[AreaCostFactAdj] decimal(10,5),
		[BalInstalmPreTrans] int,
		[BaseValueUnweight] decimal(10,5),
		[CapFactor] decimal(10,5),
		[DisUpFactAdj] decimal(10,4),
		[EmpOutcomePayElig] bit,
		[EmpOutcomePctHeldBackTrans] decimal(10,5),
		[EmpOutcomePctPreTrans] decimal(10,5),
		[EmpRespOth] bit,
		[ESOL] bit,
		[FullyFund] bit,
		[FundLine] varchar(100),
		[FundStart] bit,
		[LargeEmployerID] int,
		[LargeEmployerSFAFctr] decimal(10,2),
		[LargeEmployerStatusDate] date,
		[LTRCUpliftFctr] decimal(10,5),
		[NonGovCont] decimal(10,5),
		[OLASSCustody] bit,
		[OnProgPayPctPreTrans] decimal(10,5),
		[OutstndNumOnProgInstalm] int,
		[OutstndNumOnProgInstalmTrans] int,
		[PlannedNumOnProgInstalm] int,
		[PlannedNumOnProgInstalmTrans] int,
		[PlannedTotalDaysIL] int,
		[PlannedTotalDaysILPreTrans] int,
		[PropFundRemain] decimal(10,2),
		[PropFundRemainAch] decimal(10,2),
		[PrscHEAim] bit,
		[Residential] bit,
		[Restart] bit,
		[SpecResUplift] decimal(10,5),
		[StartPropTrans] decimal(10,5),
		[ThresholdDays] int,
		[Traineeship] bit,
		[Trans] bit,
		[TrnAdjLearnStartDate] date,
		[TrnWorkPlaceAim] bit,
		[TrnWorkPrepAim] bit,
		[UnWeightedRateFromESOL] decimal(10,5),
		[UnweightedRateFromLARS] decimal(10,5),
		[WeightedRateFromESOL] decimal(10,5),
		[WeightedRateFromLARS] decimal(10,5)
		primary key clustered
		(
			[LearnRefNumber] asc,
			[AimSeqNumber] asc
		)
	)
go
if object_id('[Rulebase].[SFA_LearningDelivery_Period]','u') is not null
	drop table [Rulebase].[SFA_LearningDelivery_Period]
create table [Rulebase].[SFA_LearningDelivery_Period]
	(
		[LearnRefNumber] varchar(12),
		[AimSeqNumber] int,
		[Period] int,
		[AchievePayment] decimal(10,5),
		[AchievePayPct] decimal(10,5),
		[AchievePayPctTrans] decimal(10,5),
		[BalancePayment] decimal(10,5),
		[BalancePaymentUncapped] decimal(10,5),
		[BalancePct] decimal(10,5),
		[BalancePctTrans] decimal(10,5),
		[EmpOutcomePay] decimal(10,5),
		[EmpOutcomePct] decimal(10,5),
		[EmpOutcomePctTrans] decimal(10,5),
		[InstPerPeriod] int,
		[LearnSuppFund] bit,
		[LearnSuppFundCash] decimal(10,5),
		[OnProgPayment] decimal(10,5),
		[OnProgPaymentUncapped] decimal(10,5),
		[OnProgPayPct] decimal(10,5),
		[OnProgPayPctTrans] decimal(10,5),
		[TransInstPerPeriod] int,
		primary key clustered
		(
			[LearnRefNumber] asc,
			[AimSeqNumber] asc,
			[Period] asc
		)
	)
go
if object_id('[Rulebase].[SFA_LearningDelivery_PeriodisedValues]','u') is not null
	drop table [Rulebase].[SFA_LearningDelivery_PeriodisedValues]
create table [Rulebase].[SFA_LearningDelivery_PeriodisedValues]
	(
		[LearnRefNumber] varchar(12),
		[AimSeqNumber] int,
		[AttributeName] [varchar](100) not null,
		[Period_1] [decimal](15,5),
		[Period_2] [decimal](15,5),
		[Period_3] [decimal](15,5),
		[Period_4] [decimal](15,5),
		[Period_5] [decimal](15,5),
		[Period_6] [decimal](15,5),
		[Period_7] [decimal](15,5),
		[Period_8] [decimal](15,5),
		[Period_9] [decimal](15,5),
		[Period_10] [decimal](15,5),
		[Period_11] [decimal](15,5),
		[Period_12] [decimal](15,5),
		primary key clustered
		(
			[LearnRefNumber] asc,
			[AimSeqNumber] asc,
			[AttributeName] asc
		)
	)
go
