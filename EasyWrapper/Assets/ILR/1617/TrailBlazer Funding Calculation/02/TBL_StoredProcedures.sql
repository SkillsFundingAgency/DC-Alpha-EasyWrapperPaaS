use [$(IntrajobDatabase)]
GO
if object_id('[Rulebase].[TBL_Get_Cases]','p') is not null
	drop procedure [Rulebase].[TBL_Get_Cases]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 28 July 2016 08:03
-- Profile: 1516 Test Harness Calculation
-- Rulebase Version: ILR Trailblazer Funding Calculation 1617, Drop 000, Version 1617.02
-- =====================================================================================================
create procedure [Rulebase].[TBL_Get_Cases] as

	begin
		set nocount on
		select
			CaseData
		from
			[Rulebase].[TBL_Cases]
	end
GO
if object_id('[Rulebase].[TBL_Insert_Cases]','p') is not null
	drop procedure [Rulebase].[TBL_Insert_Cases]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 28 July 2016 08:03
-- Profile: 1516 Test Harness Calculation
-- Rulebase Version: ILR Trailblazer Funding Calculation 1617, Drop 000, Version 1617.02
-- =====================================================================================================
create procedure [Rulebase].[TBL_Insert_Cases] as

	begin
		set nocount on

		insert into
			[Rulebase].[TBL_Cases]
			(
				[LearnRefNumber],
				CaseData
			)
		select
			ControllingTable.[LearnRefNumber],
			convert(xml,
				(
					select
						[LARS_Current_Version].[CurrentVersion] as [@LARSVersion],
						[LearningProvider].[UKPRN] as [@UKPRN],
						(
							select
								[Learner].[DateOfBirth] as [@DateOfBirth],
								[Learner].[LearnRefNumber] as [@LearnRefNumber],
								(
									select
										[LearningDelivery].[AchDate] as [@AchDate],
										[LearningDelivery].[AimSeqNumber] as [@AimSeqNumber],
										[LearningDelivery].[AimType] as [@AimType],
										[LearningDelivery].[CompStatus] as [@CompStatus],
										[LARS_LearningDelivery].[FrameworkCommonComponent] as [@FrameworkCommonComponent],
										[LearningDelivery].[LearnActEndDate] as [@LearnActEndDate],
										[LearningDelivery].[LearnAimRef] as [@LearnAimRef],
										[LearningDelivery].[LearnPlanEndDate] as [@LearnPlanEndDate],
										[LearningDelivery].[LearnStartDate] as [@LearnStartDate],
										[LearningDelivery].[LrnDelFAM_EEF] as [@LrnDelFAM_EEF],
										[LearningDelivery].[LrnDelFAM_FFI] as [@LrnDelFAM_FFI],
										[LearningDelivery].[LrnDelFAM_LDM1] as [@LrnDelFAM_LDM1],
										[LearningDelivery].[LrnDelFAM_LDM2] as [@LrnDelFAM_LDM2],
										[LearningDelivery].[LrnDelFAM_LDM3] as [@LrnDelFAM_LDM3],
										[LearningDelivery].[LrnDelFAM_LDM4] as [@LrnDelFAM_LDM4],
										[LearningDelivery].[LrnDelFAM_RES] as [@LrnDelFAM_RES],
										[LearningDelivery].[LrnDelFAM_SOF] as [@LrnDelFAM_SOF],
										[LearningDelivery].[LrnDelFAM_SPP] as [@LrnDelFAM_SPP],
										[LearningDelivery].[OrigLearnStartDate] as [@OrigLearnStartDate],
										[LearningDelivery].[OtherFundAdj] as [@OtherFundAdj],
										[LearningDelivery].[Outcome] as [@Outcome],
										[LearningDelivery].[PriorLearnFundAdj] as [@PriorLearnFundAdj],
										[LearningDelivery].[ProgType] as [@ProgType],
										[LearningDelivery].[StdCode] as [@STDCode],
										[LearningDelivery].[WithdrawReason] as [@WithdrawReason],
										(
											select
												[TrailblazerApprenticeshipFinancialRecord].[TBFinAmount] as [@TBFinAmount],
												[TrailblazerApprenticeshipFinancialRecord].[TBFinCode] as [@TBFinCode],
												[TrailblazerApprenticeshipFinancialRecord].[TBFinDate] as [@TBFinDate],
												[TrailblazerApprenticeshipFinancialRecord].[TBFinType] as [@TBFinType]
											from
												[Valid].[TrailblazerApprenticeshipFinancialRecord]
											where
												[TrailblazerApprenticeshipFinancialRecord].[LearnRefNumber] = [LearningDelivery].[LearnRefNumber]
												and [TrailblazerApprenticeshipFinancialRecord].[AimSeqNumber] = [LearningDelivery].[AimSeqNumber]
											for xml path ('TrailblazerApprenticeshipFinancialRecord'), type
										),
										(
											select
												[LearningDeliveryFAM].[LearnDelFAMCode] as [@LearnDelFAMCode],
												[LearningDeliveryFAM].[LearnDelFAMDateFrom] as [@LearnDelFAMDateFrom],
												[LearningDeliveryFAM].[LearnDelFAMDateTo] as [@LearnDelFAMDateTo],
												[LearningDeliveryFAM].[LearnDelFAMType] as [@LearnDelFAMType]
											from
												[Valid].[LearningDeliveryFAM]
											where
												[LearningDeliveryFAM].[LearnRefNumber] = [LearningDelivery].[LearnRefNumber]
												and [LearningDeliveryFAM].[AimSeqNumber] = [LearningDelivery].[AimSeqNumber]
											for xml path ('LearningDeliveryFAM'), type
										),
										(
											select
												[LARS_StandardCommonComponent].[CommonComponent] as [@LARSCommonComponent],
												[LARS_StandardCommonComponent].[EffectiveFrom] as [@LARSEffectiveFrom],
												[LARS_StandardCommonComponent].[EffectiveTo] as [@LARSEffectiveTo],
												[LARS_StandardCommonComponent].[StandardCode] as [@LARSStandardCode]
											from
												[$(LARS)].[$(LARS_Schema)].[LARS_StandardCommonComponent]
											where
												[LARS_StandardCommonComponent].[StandardCode]=[LearningDelivery].[StdCode]
											for xml path ('LARS_StandardCommonComponent'), type
										),
										(
											select
												[LARS_StandardFunding].[FundableWithoutEmployer] as [@FundableWithoutEmployer],
												[LARS_StandardFunding].[1618Incentive] as [@SF1618Incentive],
												[LARS_StandardFunding].[AchievementIncentive] as [@SFAchIncentive],
												[LARS_StandardFunding].[CoreGovContributionCap] as [@SFCoreGovContCap],
												[LARS_StandardFunding].[EffectiveFrom] as [@SFEffectiveFromDate],
												[LARS_StandardFunding].[EffectiveTo] as [@SFEffectiveToDate],
												[LARS_StandardFunding].[SmallBusinessIncentive] as [@SFSmallBusIncentive]
											from
												[$(LARS)].[$(LARS_Schema)].[LARS_StandardFunding]
											where
												[LARS_StandardFunding].[StandardCode]=[LearningDelivery].[StdCode]
												and [LARS_StandardFunding].[FundingCategory]='StandardTblazer'
											for xml path ('LARS_StandardFunding'), type
										)
									from
										[Valid].[LearningDelivery]
										left join [$(LARS)].[$(LARS_Schema)].[LARS_LearningDelivery]
											on [LARS_LearningDelivery].[LearnAimRef]=[LearningDelivery].[LearnAimRef]
									where
										[LearningDelivery].[LearnRefNumber] = [Learner].[LearnRefNumber]
										and [LearningDelivery].[ProgType]=25
										and [LearningDelivery].[FundModel]=81
									for xml path ('LearningDelivery'), type
								),
								(
									select
										[LearnerEmploymentStatus].[DateEmpStatApp] as [@DateEmpStatApp],
										[LearnerEmploymentStatus].[EmpId] as [@EmpId],
										[LearnerEmploymentStatus].[EmpStat] as [@EMPStat],
										[LearnerEmploymentStatus].[EmpStatMon_SEM] as [@EmpStatMon_SEM]
									from
										[Valid].[LearnerEmploymentStatus]
									where
										[LearnerEmploymentStatus].[LearnRefNumber] = [Learner].[LearnRefNumber]
									for xml path ('LearnerEmploymentStatus'), type
								)
							from
								[Valid].[Learner]
							where
								[Learner].[LearnRefNumber] = [ControllingTable].[LearnRefNumber]
							for xml path ('Learner'), type
						)
					from
						[Valid].[LearningProvider]
						cross join [$(LARS)].[$(LARS_Schema)].[LARS_Current_Version]
					for xml path ('global'), type
				)
			)
		from
			[Valid].[Learner] ControllingTable
			inner join
				(
					select distinct
						[LearningDelivery].[LearnRefNumber]
					from
						[Valid].[LearningDelivery]
					where
						[LearningDelivery].[ProgType]=25
						and [LearningDelivery].[FundModel]=81
				) [Filter_LearningDelivery]
				on [Filter_LearningDelivery].[LearnRefNumber]=[ControllingTable].[LearnRefNumber]
	end
GO
if object_id('[Rulebase].[TBL_Insert_global]','p') is not null
	drop procedure [Rulebase].[TBL_Insert_global]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 28 July 2016 08:03
-- Profile: 1516 Test Harness Calculation
-- Rulebase Version: ILR Trailblazer Funding Calculation 1617, Drop 000, Version 1617.02
-- =====================================================================================================

create procedure [Rulebase].[TBL_Insert_global]
	(
		@UKPRN int,
		@CurFundYr varchar(10),
		@LARSVersion varchar(100),
		@RulebaseVersion varchar(10)
	)
as
	begin
		set nocount on
		insert into
			[Rulebase].[TBL_global]
		values (
			@UKPRN,
			@CurFundYr,
			@LARSVersion,
			@RulebaseVersion
		)
	end
go
if object_id('[Rulebase].[TBL_Insert_LearningDelivery]','p') is not null
	drop procedure [Rulebase].[TBL_Insert_LearningDelivery]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 28 July 2016 08:03
-- Profile: 1516 Test Harness Calculation
-- Rulebase Version: ILR Trailblazer Funding Calculation 1617, Drop 000, Version 1617.02
-- =====================================================================================================

create procedure [Rulebase].[TBL_Insert_LearningDelivery]
	(
		@LearnRefNumber varchar(12),
		@AimSeqNumber int,
		@AchApplicDate date,
		@AchEligible bit,
		@Achieved bit,
		@AchievementApplicVal decimal(10,5),
		@AchPayment decimal(10,5),
		@ActualDaysIL int,
		@ActualNumInstalm int,
		@AdjProgStartDate date,
		@AdjStartDate date,
		@AgeStandardStart int,
		@ApplicFundValDate date,
		@CombinedAdjProp decimal(10,5),
		@CoreGovContCapApplicVal decimal(10,5),
		@CoreGovContPayment decimal(10,5),
		@CoreGovContUncapped decimal(10,5),
		@EmpIdAchDate int,
		@EmpIdFirstDayStandard int,
		@EmpIdFirstYoungAppDate int,
		@EmpIdSecondYoungAppDate int,
		@EmpIdSmallBusDate int,
		@FundLine varchar(50),
		@InstPerPeriod int,
		@LDLnrRedDate date,
		@LDRedundancyCashMonths int,
		@LDRedundancyCashRemainingCapped decimal(7,2),
		@LDRedundancyCashRemainingUncapped decimal(7,2),
		@LDRedundancyCashStartDate date,
		@LearnAimRef varchar(8),
		@LearnDelDaysIL int,
		@LearnDelStandardAccDaysIL int,
		@LearnDelStandardPrevAccDaysIL int,
		@LearnDelStandardTotalDaysIL int,
		@LearnSuppFund bit,
		@LearnSuppFundCash decimal(10,5),
		@MathEngAimValue decimal(10,5),
		@MathEngBalPayment decimal(10,5),
		@MathEngBalPct decimal(8,5),
		@MathEngLSFFundStart bit,
		@MathEngLSFThresholdDays int,
		@MathEngOnProgPayment decimal(10,5),
		@MathEngOnProgPct decimal(8,5),
		@OutstandNumOnProgInstalm int,
		@PlannedNumOnProgInstalm int,
		@PlannedTotalDaysIL int,
		@ProgStandardStartDate date,
		@SmallBusApplicVal decimal(10,5),
		@SmallBusEligible bit,
		@SmallBusPayment decimal(10,5),
		@SmallBusStatusFirstDayStandard int,
		@SmallBusStatusThreshold int,
		@SmallBusThresholdDate date,
		@YoungAppApplicVal decimal(10,5),
		@YoungAppEligible bit,
		@YoungAppFirstPayment decimal(10,5),
		@YoungAppFirstThresholdDate date,
		@YoungAppPayment decimal(10,5),
		@YoungAppSecondPayment decimal(10,5),
		@YoungAppSecondThresholdDate date
	)
as
	begin
		set nocount on
		insert into
			[Rulebase].[TBL_LearningDelivery]
		values (
			@LearnRefNumber,
			@AimSeqNumber,
			@AchApplicDate,
			@AchEligible,
			@Achieved,
			@AchievementApplicVal,
			@ActualDaysIL,
			@ActualNumInstalm,
			@AdjProgStartDate,
			@AdjStartDate,
			@AgeStandardStart,
			@ApplicFundValDate,
			@CombinedAdjProp,
			@CoreGovContCapApplicVal,
			@EmpIdAchDate,
			@EmpIdFirstDayStandard,
			@EmpIdFirstYoungAppDate,
			@EmpIdSecondYoungAppDate,
			@EmpIdSmallBusDate,
			@FundLine,
			@LDLnrRedDate,
			@LDRedundancyCashMonths,
			@LDRedundancyCashRemainingCapped,
			@LDRedundancyCashRemainingUncapped,
			@LDRedundancyCashStartDate,
			@LearnAimRef,
			@LearnDelDaysIL,
			@LearnDelStandardAccDaysIL,
			@LearnDelStandardPrevAccDaysIL,
			@LearnDelStandardTotalDaysIL,
			@MathEngAimValue,
			@MathEngLSFFundStart,
			@MathEngLSFThresholdDays,
			@OutstandNumOnProgInstalm,
			@PlannedNumOnProgInstalm,
			@PlannedTotalDaysIL,
			@ProgStandardStartDate,
			@SmallBusApplicVal,
			@SmallBusEligible,
			@SmallBusStatusFirstDayStandard,
			@SmallBusStatusThreshold,
			@SmallBusThresholdDate,
			@YoungAppApplicVal,
			@YoungAppEligible,
			@YoungAppFirstThresholdDate,
			@YoungAppSecondThresholdDate
		)
	end
go
if object_id('[Rulebase].[TBL_Insert_LearningDelivery_PeriodisedValues]','p') is not null
	drop procedure [Rulebase].[TBL_Insert_LearningDelivery_PeriodisedValues]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 28 July 2016 08:03
-- Profile: 1516 Test Harness Calculation
-- Rulebase Version: ILR Trailblazer Funding Calculation 1617, Drop 000, Version 1617.02
-- =====================================================================================================
create procedure [Rulebase].[TBL_Insert_LearningDelivery_PeriodisedValues]
	(
		@LearnRefNumber varchar(12),
		@AimSeqNumber int,
		@AttributeName varchar(100),
		@Period_1 decimal(15,5),
		@Period_2 decimal(15,5),
		@Period_3 decimal(15,5),
		@Period_4 decimal(15,5),
		@Period_5 decimal(15,5),
		@Period_6 decimal(15,5),
		@Period_7 decimal(15,5),
		@Period_8 decimal(15,5),
		@Period_9 decimal(15,5),
		@Period_10 decimal(15,5),
		@Period_11 decimal(15,5),
		@Period_12 decimal(15,5)
	)
as
	begin
		set nocount on
		insert into
			[Rulebase].[TBL_LearningDelivery_PeriodisedValues]
				(
					LearnRefNumber,
					AimSeqNumber,
					AttributeName,
					Period_1,
					Period_2,
					Period_3,
					Period_4,
					Period_5,
					Period_6,
					Period_7,
					Period_8,
					Period_9,
					Period_10,
					Period_11,
					Period_12
				)
		values
			(
				@LearnRefNumber,
				@AimSeqNumber,
				@AttributeName,
				@Period_1,
				@Period_2,
				@Period_3,
				@Period_4,
				@Period_5,
				@Period_6,
				@Period_7,
				@Period_8,
				@Period_9,
				@Period_10,
				@Period_11,
				@Period_12
			)
	end
GO
if object_id('[Rulebase].[TBL_PivotTemporals_LearningDelivery]','p') is not null
	drop procedure [Rulebase].[TBL_PivotTemporals_LearningDelivery]
GO
-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 28 July 2016 08:04
-- Profile: 1516 Test Harness Calculation
-- Rulebase Version: ILR Trailblazer Funding Calculation 1617, Drop 000, Version 1617.02
-- =====================================================================================================
create procedure [Rulebase].[TBL_PivotTemporals_LearningDelivery] as
	begin
		truncate table [Rulebase].[TBL_LearningDelivery_Period]
		insert into
			[Rulebase].[TBL_LearningDelivery_Period]
		select
			LearnRefNumber,
			AimSeqNumber,
			Period,
			max(case AttributeName when 'AchPayment' then Value else null end) AchPayment,
			max(case AttributeName when 'CoreGovContPayment' then Value else null end) CoreGovContPayment,
			max(case AttributeName when 'CoreGovContUncapped' then Value else null end) CoreGovContUncapped,
			max(case AttributeName when 'InstPerPeriod' then Value else null end) InstPerPeriod,
			max(case AttributeName when 'LearnSuppFund' then Value else null end) LearnSuppFund,
			max(case AttributeName when 'LearnSuppFundCash' then Value else null end) LearnSuppFundCash,
			max(case AttributeName when 'MathEngBalPayment' then Value else null end) MathEngBalPayment,
			max(case AttributeName when 'MathEngBalPct' then Value else null end) MathEngBalPct,
			max(case AttributeName when 'MathEngOnProgPayment' then Value else null end) MathEngOnProgPayment,
			max(case AttributeName when 'MathEngOnProgPct' then Value else null end) MathEngOnProgPct,
			max(case AttributeName when 'SmallBusPayment' then Value else null end) SmallBusPayment,
			max(case AttributeName when 'YoungAppFirstPayment' then Value else null end) YoungAppFirstPayment,
			max(case AttributeName when 'YoungAppPayment' then Value else null end) YoungAppPayment,
			max(case AttributeName when 'YoungAppSecondPayment' then Value else null end) YoungAppSecondPayment
		from
			(
				select
					LearnRefNumber,
					AimSeqNumber,
					AttributeName,
					cast(substring(PeriodValue.Period,8,2) as int) Period,
					PeriodValue.Value
				from
					[Rulebase].[TBL_LearningDelivery_PeriodisedValues]
					unpivot (Value for Period in (Period_1,Period_2,Period_3,Period_4,Period_5,Period_6,Period_7,Period_8,Period_9,Period_10,Period_11,Period_12)) as PeriodValue
			) Bob
		group by
			LearnRefNumber,
			AimSeqNumber,
			Period
	end
GO
