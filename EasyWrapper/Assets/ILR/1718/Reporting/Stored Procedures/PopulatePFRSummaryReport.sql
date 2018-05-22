IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Report].[PopulatePFRSummaryReport]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Report].[PopulatePFRSummaryReport]
GO

CREATE PROCEDURE [Report].[PopulatePFRSummaryReport]
AS
BEGIN
	DECLARE @CollectionPeriod DATE = (SELECT
		CASE '${dcft.runmode}'
			WHEN 'DS' THEN
				(SELECT TOP 1 ISNULL([FilePreparationDate], CONVERT(DATE, GETDATE())) FROM [Valid].[CollectionDetails])
			ELSE CONVERT(DATE, GETDATE()) END);
	
	DECLARE @CollectionPeriodInt INT = (SELECT ISNULL((SELECT CAST(RIGHT(CollectionReturnCode, LEN(CollectionReturnCode)-1) AS INT) 
	 FROM [Reference].[CollectionCalendar] WHERE @CollectionPeriod BETWEEN [ProposedOpenDate] AND [ProposedClosedDate]),12));

	-- Clear previous report data - needed by FIS
	TRUNCATE TABLE [Report].[FundingSummary_1618]
	TRUNCATE TABLE [Report].[FundingSummary_Total1618]
	TRUNCATE TABLE [Report].[FundingSummary_1618Traineeships]
	TRUNCATE TABLE [Report].[FundingSummary_Total1618Traineeships]
	TRUNCATE TABLE [Report].[FundingSummary_1923]
	TRUNCATE TABLE [Report].[FundingSummary_Total1923]
	TRUNCATE TABLE [Report].[FundingSummary_24Plus]
	TRUNCATE TABLE [Report].[FundingSummary_Total24Plus]
	TRUNCATE TABLE [Report].[FundingSummary_1924Traineeships]
	TRUNCATE TABLE [Report].[FundingSummary_Total1924Traineeships]
	TRUNCATE TABLE [Report].[FundingSummary_AebOther]
	TRUNCATE TABLE [Report].[FundingSummary_TotalAebOther]
	TRUNCATE TABLE [Report].[FundingSummary_24PlusAdvLoansBursary]
	TRUNCATE TABLE [Report].[FundingSummary_Total24PlusAdvLoansBursary]
	TRUNCATE TABLE [Report].[FundingSummary_AdultOLASS]
	TRUNCATE TABLE [Report].[FundingSummary_TotalAdultOLASS]
	TRUNCATE TABLE [Report].[FundingSummary_1618Trailblazers]
	TRUNCATE TABLE [Report].[FundingSummary_Total1618Trailblazers]
	TRUNCATE TABLE [Report].[FundingSummary_1923Trailblazers]
	TRUNCATE TABLE [Report].[FundingSummary_Total1923Trailblazers]
	TRUNCATE TABLE [Report].[FundingSummary_24PlusTrailblazers]
	TRUNCATE TABLE [Report].[FundingSummary_Total24PlusTrailblazers]
	TRUNCATE TABLE [Report].[FundingSummary_Total1618Budget]
	TRUNCATE TABLE [Report].[FundingSummary_TotalAdultAppBudget]
	TRUNCATE TABLE [Report].[FundingSummary_TotalNonAppBudget]
	TRUNCATE TABLE [Report].[FundingSummary_TotalAdultBudget]
	TRUNCATE TABLE [Report].[FundingSummary_ExceptionalLearningSupport]
	TRUNCATE TABLE [Report].[FundingSummary_LineTotalsOLASSEASCancellationCosts]

	TRUNCATE TABLE [REPORT].[FundingSummary_1618LevyContractedApprenticeships]
	TRUNCATE TABLE [REPORT].[FundingSummary_AdultLevyContractedApprenticeships]
	TRUNCATE TABLE [REPORT].[FundingSummary_Total1618LevyContractedApprenticeships]
	TRUNCATE TABLE [REPORT].[FundingSummary_TotalAdultLevyContractedApprenticeships]
	TRUNCATE TABLE [Report].[FundingSummary_TotalLevyBudget]

	TRUNCATE TABLE [REPORT].[FundingSummary_1618NonLevyContractedApprenticeships]	
	TRUNCATE TABLE [REPORT].[FundingSummary_AdultNonLevyContractedApprenticeships]	
	TRUNCATE TABLE [REPORT].[FundingSummary_Total1618NonLevyContractedApprenticeships]	
	TRUNCATE TABLE [REPORT].[FundingSummary_TotalAdultNonLevyContractedApprenticeships]	
	TRUNCATE TABLE [Report].[FundingSummary_TotalNonLevyBudget]

	-- Populate [Report] schema tables
	INSERT INTO [Report].[FundingSummary_1618]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT *
			FROM
			(SELECT 'ILR 16-18 Apprenticeship Frameworks Programme Funding' as SubGroupHeader,1 as SortOrder,'LineTotals1618Apprenticeship' as DataSetName, * FROM dbo.GetSFAFundingForType('16-18 Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'ILR 16-18 Apprenticeship Frameworks Learning Support' as SubGroupHeader,2 as SortOrder,'LineTotals1618Apprenticeship' as DataSetName, * FROM dbo.GetLSFFundingForType('16-18 Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-18 Apprenticeship Frameworks Audit Adjustments' as SubGroupHeader,4 as SortOrder,'LineTotals1618Apprenticeship' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 16-18 Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-18 Apprenticeship Frameworks Authorised Claims' as SubGroupHeader,5 as SortOrder,'LineTotals1618Apprenticeship' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 16-18 Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-18 Apprenticeship Frameworks Excess Learning Support' as SubGroupHeader,6 as SortOrder,'LineTotals1618Apprenticeship' as DataSetName, * FROM dbo.GetEASFunding('Excess Learning Support: 16-18 Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-18 Apprenticeship Frameworks Learner Support' as SubGroupHeader,7 as SortOrder,'LineTotals1618Apprenticeship' as DataSetName, * FROM dbo.GetEASFunding('Learner Support: 16-18 Apprenticeships', @CollectionPeriodInt)) AS a

	INSERT INTO [Report].[FundingSummary_Total1618]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT * 
			FROM 
			(SELECT 'Total 16-18 Apprenticeship Frameworks for starts before 1 May 2017' as SubGroupHeader,9 as SortOrder,'LineTotals1618Apprenticeship' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
			sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
			From Report.FundingSummary_1618) TOTAL

	INSERT INTO [Report].[FundingSummary_1618Traineeships]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT *
			FROM 
			(SELECT 'ILR 16-18 Traineeships Programme Funding' as SubGroupHeader,1 as SortOrder,'LineTotals1618Traineeships' as DataSetName, * FROM dbo.GetEFAFundingForType('16-18 Traineeships (Non-EFA)', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-18 Traineeships Audit Adjustments' as SubGroupHeader,3 as SortOrder,'LineTotals1618Traineeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 16-18 Traineeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-18 Traineeships Authorised Claims' as SubGroupHeader,4 as SortOrder,'LineTotals1618Traineeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 16-18 Traineeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-18 Traineeships Excess Learning Support' as SubGroupHeader,5 as SortOrder,'LineTotals1618Traineeships' as DataSetName, * FROM dbo.GetEASFunding('Excess Learning Support: 16-18 Traineeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-19 Traineeships Bursary Vulnerable Student Bursary' as SubGroupHeader,6 as SortOrder,'LineTotals1618Traineeships' as DataSetName, * FROM dbo.GetEASFunding('Vulnerable Bursary: 16-19 Traineeships Bursary', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-19 Traineeships Bursary Free Meals' as SubGroupHeader,7 as SortOrder,'LineTotals1618Traineeships' as DataSetName, * FROM dbo.GetEASFunding('Free Meals: 16-19 Traineeships Bursary', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-19 Traineeships Bursary Discretionary Bursary' as SubGroupHeader,8 as SortOrder,'LineTotals1618Traineeships' as DataSetName, * FROM dbo.GetEASFunding('Discretionary Bursary: 16-19 Traineeships Bursary', @CollectionPeriodInt)) A

	INSERT INTO [Report].[FundingSummary_Total1618Traineeships]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT * 
			FROM 
			(SELECT 'Total 16-18 Traineeships' as SubGroupHeader,10 as SortOrder,'LineTotals1618Traineeships' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
			sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
			From Report.FundingSummary_1618Traineeships) TOTAL

	INSERT INTO [Report].[FundingSummary_1923]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT *
			FROM
			(SELECT 'ILR 19-23 Apprenticeship Frameworks Programme Funding' as SubGroupHeader,1 as SortOrder,'LineTotals1923Apprenticeship' as DataSetName, * FROM dbo.GetSFAFundingForType('19-23 Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'ILR 19-23 Apprenticeship Frameworks Learning Support' as SubGroupHeader,2 as SortOrder,'LineTotals1923Apprenticeship' as DataSetName, * FROM dbo.GetLSFFundingForType('19-23 Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'EAS 19-23 Apprenticeship Frameworks Audit Adjustments' as SubGroupHeader,4 as SortOrder,'LineTotals1923Apprenticeship' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 19-23 Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 19-23 Apprenticeship Frameworks Authorised Claims' as SubGroupHeader,5 as SortOrder,'LineTotals1923Apprenticeship' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 19-23 Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 19-23 Apprenticeship Frameworks Excess Learning Support' as SubGroupHeader,6 as SortOrder,'LineTotals1923Apprenticeship' as DataSetName, * FROM dbo.GetEASFunding('Excess Learning Support: 19-23 Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 19-23 Apprenticeship Frameworks Learner Support' as SubGroupHeader,7 as SortOrder,'LineTotals1923Apprenticeship' as DataSetName, * FROM dbo.GetEASFunding('Learner Support: 19-23 Apprenticeships', @CollectionPeriodInt)) AS a

	INSERT INTO [Report].[FundingSummary_Total1923]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT * 
			FROM 
			(SELECT 'Total 19-23 Apprenticeship Frameworks' as SubGroupHeader,9 as SortOrder,'LineTotals1923Apprenticeship' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
			sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
			From Report.FundingSummary_1923) TOTAL

	INSERT INTO [Report].[FundingSummary_24Plus]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT *
			FROM
			(SELECT 'ILR 24+ Apprenticeship Frameworks Programme Funding' as SubGroupHeader,1 as SortOrder,'LineTotals24PlusApprenticeship' as DataSetName, * FROM dbo.GetSFAFundingForType('24+ Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'ILR 24+ Apprenticeship Frameworks Learning Support' as SubGroupHeader,2 as SortOrder,'LineTotals24PlusApprenticeship' as DataSetName, * FROM dbo.GetLSFFundingForType('24+ Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'EAS 24+ Apprenticeship Frameworks Audit Adjustments' as SubGroupHeader,4 as SortOrder,'LineTotals24PlusApprenticeship' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 24+ Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 24+ Apprenticeship Frameworks Authorised Claims' as SubGroupHeader,5 as SortOrder,'LineTotals24PlusApprenticeship' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 24+ Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 24+ Apprenticeship Frameworks Excess Learning Support' as SubGroupHeader,6 as SortOrder,'LineTotals24PlusApprenticeship' as DataSetName, * FROM dbo.GetEASFunding('Excess Learning Support: 24+ Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 24+ Apprenticeship Frameworks Learner Support' as SubGroupHeader,7 as SortOrder,'LineTotals24PlusApprenticeship' as DataSetName, * FROM dbo.GetEASFunding('Learner Support: 24+ Apprenticeships', @CollectionPeriodInt)) AS a

	INSERT INTO [Report].[FundingSummary_Total24Plus]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT * 
			FROM 
			(SELECT 'Total 24+ Apprenticeship Frameworks' as SubGroupHeader,9 as SortOrder,'LineTotals24PlusApprenticeship' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
			sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
			From Report.FundingSummary_24Plus) TOTAL

	INSERT INTO [Report].[FundingSummary_1924Traineeships]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT *
			FROM
			(SELECT 'ILR 19-24 Traineeships Programme Funding' as SubGroupHeader,1 as SortOrder,'LineTotals1924Traineeships' as DataSetName, * FROM dbo.GetSFAFundingForType('19-24 Traineeship', @CollectionPeriodInt) UNION
			SELECT 'ILR 19-24 Traineeships (EFA Model) Programme Funding' as SubGroupHeader,2 as SortOrder,'LineTotals1924Traineeships' as DataSetName, * FROM dbo.GetEFAFundingForType('19+ Traineeships (Non-EFA)', @CollectionPeriodInt) UNION
			SELECT 'ILR 19-24 Traineeships Learning Support' as SubGroupHeader,3 as SortOrder,'LineTotals1924Traineeships' as DataSetName, * FROM dbo.GetLSFFundingForType('19-24 Traineeship', @CollectionPeriodInt) UNION
			SELECT 'EAS 19-24 Traineeships Audit Adjustments' as SubGroupHeader,5 as SortOrder,'LineTotals1924Traineeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 19-24 Traineeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 19-24 Traineeships Authorised Claims' as SubGroupHeader,6 as SortOrder,'LineTotals1924Traineeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 19-24 Traineeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 19-24 Traineeships Excess Learning Support' as SubGroupHeader,7 as SortOrder,'LineTotals1924Traineeships' as DataSetName, * FROM dbo.GetEASFunding('Excess Learning Support: 19-24 Traineeships', @CollectionPeriodInt)UNION
			SELECT 'EAS 19-24 Traineeships Learner Support' as SubGroupHeader,8 as SortOrder,'LineTotals1924Traineeships' as DataSetName, * FROM dbo.GetEASFunding('Learner Support: 19-24 Traineeships', @CollectionPeriodInt) ) AS a

	INSERT INTO [Report].[FundingSummary_Total1924Traineeships]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT * 
			FROM 
			(SELECT 'Total 19-24 Traineeships' as SubGroupHeader,10 as SortOrder,'LineTotals1924Traineeships' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
			sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
			From Report.FundingSummary_1924Traineeships) TOTAL



	/********************************************************************************************************************************************************************/
			--Levy Contracted Apprenticeships Budget for starts on or after 1 May 2017
	/********************************************************************************************************************************************************************/
	
	--16-18 Levy Contracted Apprenticeships
	INSERT INTO [Report].[FundingSummary_1618LevyContractedApprenticeships]
	(SubGroupHeader, SortOrder, DataSetName, YTDCalc, TotalCalc, AugToMar, AprToJul, FundCalcAug, FundCalcSep, FundCalcOct, FundCalcNov, FundCalcDec, FundCalcJan, FundCalcFeb, FundCalcMar, FundCalcApr, FundCalcMay, FundCalcJun, FundCalcJul)
	SELECT * 
			FROM 
	(SELECT 'ILR 16-18 Levy Contracted Apprenticeships Programme Aim Indicative Earnings'as SubGroupHeader,1 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'ProgrammeAimOnProgPayment,ProgrammeAimBalPayment,ProgrammeAimCompletionPayment') UNION
	SELECT 'ILR 16-18 Levy Contracted Apprenticeships Maths and English Programme Funding'as SubGroupHeader,2 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'MathEngOnProgPayment,MathEngBalPayment') UNION
	SELECT 'ILR 16-18 Levy Contracted Apprenticeships Framework Uplift'as SubGroupHeader,3 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'LDApplic1618FrameworkUpliftBalancingPayment,LDApplic1618FrameworkUpliftCompletionPayment,LDApplic1618FrameworkUpliftOnProgPayment') UNION
	SELECT 'ILR 16-18 Levy Contracted Apprenticeships Disadvantage Payments'as SubGroupHeader,4 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'DisadvFirstPayment,DisadvSecondPayment') UNION
	SELECT 'ILR 16-18 Levy Contracted Apprenticeships Additional Payments for Providers'as SubGroupHeader,5 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'LearnDelFirstProv1618Pay,LearnDelSecondProv1618Pay') UNION
	SELECT 'ILR 16-18 Levy Contracted Apprenticeships Additional Payments for Employers'as SubGroupHeader,6 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'LearnDelFirstEmp1618Pay,LearnDelSecondEmp1618Pay') UNION
	SELECT 'ILR 16-18 Levy Contracted Apprenticeships Learning Support'as SubGroupHeader,7 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'LearnSuppFundCash')
	UNION
	SELECT 'EAS 16-18 Levy Contracted Apprenticeships Training Audit Adjustments' as SubGroupHeader,9 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 16-18 Levy Apprenticeships - Training', @CollectionPeriodInt) UNION
	SELECT 'EAS 16-18 Levy Contracted Apprenticeships Training Authorised Claims' as SubGroupHeader,10 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 16-18 Levy Apprenticeships - Training', @CollectionPeriodInt) UNION
	SELECT 'EAS 16-18 Levy Contracted Apprenticeships Additional Payments for Providers Audit Adjustments' as SubGroupHeader,11 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 16-18 Levy Apprenticeships - Provider', @CollectionPeriodInt) UNION
	SELECT 'EAS 16-18 Levy Contracted Apprenticeships Additional Payments for Providers Authorised Claims ' as SubGroupHeader,12 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 16-18 Levy Apprenticeships - Provider', @CollectionPeriodInt) UNION
	SELECT 'EAS 16-18 Levy Contracted Apprenticeships Additional Payments for Providers Learner Support' as SubGroupHeader,13 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Excess Learning Support: 16-18 Levy Apprenticeships - Provider', @CollectionPeriodInt) UNION
	SELECT 'EAS 16-18 Levy Contracted Apprenticeships Additional Payments for Employers Audit Adjustments ' as SubGroupHeader,14 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 16-18 Levy Apprenticeships - Employer', @CollectionPeriodInt) UNION
	SELECT 'EAS 16-18 Levy Contracted Apprenticeships Additional Payments for Employers Authorised Claims' as SubGroupHeader,15 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 16-18 Levy Apprenticeships - Employer', @CollectionPeriodInt)
	) AS [1618LevyContractedApprenticeships]

	--16-18 Levy Contracted Apprenticeships Totals
	INSERT INTO [Report].[FundingSummary_Total1618LevyContractedApprenticeships]
	(SubGroupHeader, SortOrder, DataSetName, YTDCalc, TotalCalc, AugToMar, AprToJul, FundCalcAug, FundCalcSep, FundCalcOct, FundCalcNov, FundCalcDec, FundCalcJan, FundCalcFeb, FundCalcMar, FundCalcApr, FundCalcMay, FundCalcJun, FundCalcJul)
	SELECT * 
				FROM 
				(SELECT 'Total 16-18 Levy Contracted Apprenticeships' as SubGroupHeader,17 as SortOrder,'LineTotals1618LevyContractedApprenticeships' as DataSetName,
				SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
				sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
				sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
				From [Report].[FundingSummary_1618LevyContractedApprenticeships]) TOTAL     
	

	--Adult Levy Contracted Apprenticeships
	INSERT INTO [Report].[FundingSummary_AdultLevyContractedApprenticeships]
	(SubGroupHeader, SortOrder, DataSetName, YTDCalc, TotalCalc, AugToMar, AprToJul, FundCalcAug, FundCalcSep, FundCalcOct, FundCalcNov, FundCalcDec, FundCalcJan, FundCalcFeb, FundCalcMar, FundCalcApr, FundCalcMay, FundCalcJun, FundCalcJul)
	SELECT * 
			FROM 
	(SELECT 'ILR Adult Levy Contracted Apprenticeships Programme Aim Indicative Earnings'as SubGroupHeader,1 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'ProgrammeAimOnProgPayment,ProgrammeAimBalPayment,ProgrammeAimCompletionPayment') UNION
	SELECT 'ILR Adult Levy Contracted Apprenticeships Maths and English Programme Funding'as SubGroupHeader,2 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'MathEngOnProgPayment,MathEngBalPayment') UNION
	SELECT 'ILR Adult Levy Contracted Apprenticeships Framework Uplift'as SubGroupHeader,3 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'LDApplic1618FrameworkUpliftBalancingPayment,LDApplic1618FrameworkUpliftCompletionPayment,LDApplic1618FrameworkUpliftOnProgPayment') UNION
	SELECT 'ILR Adult Levy Contracted Apprenticeships Disadvantage Payments'as SubGroupHeader,4 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'DisadvFirstPayment,DisadvSecondPayment') UNION
	SELECT 'ILR Adult Levy Contracted Apprenticeships Additional Payments for Providers'as SubGroupHeader,5 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'LearnDelFirstProv1618Pay,LearnDelSecondProv1618Pay') UNION
	SELECT 'ILR Adult Levy Contracted Apprenticeships Additional Payments for Employers'as SubGroupHeader,6 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'LearnDelFirstEmp1618Pay,LearnDelSecondEmp1618Pay') UNION
	SELECT 'ILR Adult Levy Contracted Apprenticeships Learning Support'as SubGroupHeader,7 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Levy Contract',@CollectionPeriodInt,'LearnSuppFundCash')
	UNION	
	SELECT 'EAS Adult Levy Contracted Apprenticeships Training Audit Adjustments' as SubGroupHeader,9 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: Adult Levy Apprenticeships - Training', @CollectionPeriodInt) UNION
	SELECT 'EAS Adult Levy Contracted Apprenticeships Training Authorised Claims' as SubGroupHeader,10 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: Adult Levy Apprenticeships - Training', @CollectionPeriodInt) UNION
	SELECT 'EAS Adult Levy Contracted Apprenticeships Additional Payments for Providers Audit Adjustments' as SubGroupHeader,11 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: Adult Levy Apprenticeships - Provider', @CollectionPeriodInt) UNION
	SELECT 'EAS Adult Levy Contracted Apprenticeships Additional Payments for Providers Authorised Claims ' as SubGroupHeader,12 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: Adult Levy Apprenticeships - Provider', @CollectionPeriodInt) UNION
	SELECT 'EAS Adult Levy Contracted Apprenticeships Additional Payments for Providers Learner Support' as SubGroupHeader,13 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Excess Learning Support: Adult Levy Apprenticeships - Provider', @CollectionPeriodInt) UNION
	SELECT 'EAS Adult Levy Contracted Apprenticeships Additional Payments for Employers Audit Adjustments ' as SubGroupHeader,14 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: Adult Levy Apprenticeships - Employer', @CollectionPeriodInt) UNION
	SELECT 'EAS Adult Levy Contracted Apprenticeships Additional Payments for Employers Authorised Claims' as SubGroupHeader,15 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: Adult Levy Apprenticeships - Employer', @CollectionPeriodInt)
	) AS [AdultLevyContractedApprenticeships]

	--Adult Levy Contracted Apprenticeships Totals
	INSERT INTO [Report].[FundingSummary_TotalAdultLevyContractedApprenticeships]
	(SubGroupHeader, SortOrder, DataSetName, YTDCalc, TotalCalc, AugToMar, AprToJul, FundCalcAug, FundCalcSep, FundCalcOct, FundCalcNov, FundCalcDec, FundCalcJan, FundCalcFeb, FundCalcMar, FundCalcApr, FundCalcMay, FundCalcJun, FundCalcJul)
	SELECT * 
				FROM 
				(SELECT 'Total Adult Levy Contracted Apprenticeships' as SubGroupHeader,17 as SortOrder,'LineTotalsAdultLevyContractedApprenticeships' as DataSetName,
				SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
				sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
				sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
				From [Report].[FundingSummary_AdultLevyContractedApprenticeships]) TOTAL     

	--Total Levy Budget
	INSERT INTO [Report].[FundingSummary_TotalLevyBudget]
         (SubGroupHeader, SortOrder, DataSetName, YTDCalc, TotalCalc, AugToMar, AprToJul, FundCalcAug, FundCalcSep, FundCalcOct, FundCalcNov, FundCalcDec, FundCalcJan, FundCalcFeb, FundCalcMar, FundCalcApr, FundCalcMay, FundCalcJun, FundCalcJul)

	SELECT 'Total Levy Contracted Apprenticeships Budget for starts on or after 1 May 2017' as SubGroupHeader,1 as SortOrder,'LineTotalsLevyBudget' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,
			sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul FROM (
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_Total1618LevyContractedApprenticeships UNION
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_TotalAdultLevyContractedApprenticeships) as a	
	


	/********************************************************************************************************************************************************************/
			--Non-Levy Contracted Apprenticeships Budget for starts on or after 1 May 2017
	/********************************************************************************************************************************************************************/
	
	--16-18 Non-Levy Contracted Apprenticeships
	INSERT INTO [Report].[FundingSummary_1618NonLevyContractedApprenticeships]
	(SubGroupHeader, SortOrder, DataSetName, YTDCalc, TotalCalc, AugToMar, AprToJul, FundCalcAug, FundCalcSep, FundCalcOct, FundCalcNov, FundCalcDec, FundCalcJan, FundCalcFeb, FundCalcMar, FundCalcApr, FundCalcMay, FundCalcJun, FundCalcJul)
	SELECT * 
			FROM 
	(SELECT 'ILR 16-18 Non-Levy Contracted Apprenticeships Programme Aim Indicative Earnings'as SubGroupHeader,1 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'ProgrammeAimOnProgPayment,ProgrammeAimBalPayment,ProgrammeAimCompletionPayment') UNION
	SELECT '...of which Indicative Co-Investment Earnings'as SubGroupHeader,2 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'ProgrammeAimProgFundIndMinCoInvest') UNION
	SELECT 'ILR 16-18 Non-Levy Contracted Apprenticeships Maths and English Programme Funding'as SubGroupHeader,3 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'MathEngOnProgPayment,MathEngBalPayment') UNION
	SELECT 'ILR 16-18 Non-Levy Contracted Apprenticeships Framework Uplift'as SubGroupHeader,4 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'LDApplic1618FrameworkUpliftBalancingPayment,LDApplic1618FrameworkUpliftCompletionPayment,LDApplic1618FrameworkUpliftOnProgPayment') UNION
	SELECT 'ILR 16-18 Non-Levy Contracted Apprenticeships Disadvantage Payments'as SubGroupHeader,5 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'DisadvFirstPayment,DisadvSecondPayment') UNION
	SELECT 'ILR 16-18 Non-Levy Contracted Apprenticeships Additional Payments for Providers'as SubGroupHeader,6 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'LearnDelFirstProv1618Pay,LearnDelSecondProv1618Pay') UNION
	SELECT 'ILR 16-18 Non-Levy Contracted Apprenticeships Additional Payments for Employers'as SubGroupHeader,7 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'LearnDelFirstEmp1618Pay,LearnDelSecondEmp1618Pay') UNION
	SELECT 'ILR 16-18 Non-Levy Contracted Apprenticeships Learning Support'as SubGroupHeader,8 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('16-18 Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'LearnSuppFundCash')
	UNION	
	SELECT 'EAS 16-18 Non-Levy Contracted Apprenticeships Training Audit Adjustments' as SubGroupHeader,10 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 16-18 Non-Levy Apprenticeships - Training', @CollectionPeriodInt) UNION
	SELECT 'EAS 16-18 Non-Levy Contracted Apprenticeships Training Authorised Claims' as SubGroupHeader,11 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 16-18 Non-Levy Apprenticeships - Training', @CollectionPeriodInt) UNION
	SELECT 'EAS 16-18 Non-Levy Contracted Apprenticeships Additional Payments for Providers Audit Adjustments' as SubGroupHeader,12 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 16-18 Non-Levy Apprenticeships - Provider', @CollectionPeriodInt) UNION
	SELECT 'EAS 16-18 Non-Levy Contracted Apprenticeships Additional Payments for Providers Authorised Claims ' as SubGroupHeader,13 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 16-18 Non-Levy Apprenticeships - Provider', @CollectionPeriodInt) UNION
	SELECT 'EAS 16-18 Non-Levy Contracted Apprenticeships Additional Payments for Providers Learner Support' as SubGroupHeader,14 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Excess Learning Support: 16-18 Non-Levy Apprenticeships - Provider', @CollectionPeriodInt) UNION
	SELECT 'EAS 16-18 Non-Levy Contracted Apprenticeships Additional Payments for Employers Audit Adjustments ' as SubGroupHeader,15 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 16-18 Non-Levy Apprenticeships - Employer', @CollectionPeriodInt) UNION
	SELECT 'EAS 16-18 Non-Levy Contracted Apprenticeships Additional Payments for Employers Authorised Claims' as SubGroupHeader,16 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 16-18 Non-Levy Apprenticeships - Employer', @CollectionPeriodInt)
	) AS [1618NonLevyContractedApprenticeships]

	--16-18 Non-Levy Contracted Apprenticeships Totals
	INSERT INTO [Report].[FundingSummary_Total1618NonLevyContractedApprenticeships]
          (SubGroupHeader, SortOrder, DataSetName, YTDCalc, TotalCalc, AugToMar, AprToJul, FundCalcAug, FundCalcSep, FundCalcOct, FundCalcNov, FundCalcDec, FundCalcJan, FundCalcFeb, FundCalcMar, FundCalcApr, FundCalcMay, FundCalcJun, FundCalcJul)
	SELECT * 
				FROM 
				(SELECT 'Total 16-18 Non-Levy Contracted Apprenticeships' as SubGroupHeader,18 as SortOrder,'LineTotals1618NonLevyContractedApprenticeships' as DataSetName,
				SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
				sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
				sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
				From [Report].[FundingSummary_1618NonLevyContractedApprenticeships] Where SubGroupHeader NOT IN ('...of which Indicative Co-Investment Earnings') ) TOTAL 	

	--Adult Non-Levy Contracted Apprenticeships
	INSERT INTO [Report].[FundingSummary_AdultNonLevyContractedApprenticeships]
	(SubGroupHeader, SortOrder, DataSetName, YTDCalc, TotalCalc, AugToMar, AprToJul, FundCalcAug, FundCalcSep, FundCalcOct, FundCalcNov, FundCalcDec, FundCalcJan, FundCalcFeb, FundCalcMar, FundCalcApr, FundCalcMay, FundCalcJun, FundCalcJul)
	SELECT * 
			FROM 
	(SELECT 'ILR Adult Non-Levy Contracted Apprenticeships Programme Aim Indicative Earnings'as SubGroupHeader,1 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'ProgrammeAimOnProgPayment,ProgrammeAimBalPayment,ProgrammeAimCompletionPayment') UNION
	SELECT '...of which Indicative Co-Investment Earnings'as SubGroupHeader,2 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'ProgrammeAimProgFundIndMinCoInvest') UNION
	SELECT 'ILR Adult Non-Levy Contracted Apprenticeships Maths and English Programme Funding'as SubGroupHeader,3 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'MathEngOnProgPayment,MathEngBalPayment') UNION
	SELECT 'ILR Adult Non-Levy Contracted Apprenticeships Framework Uplift'as SubGroupHeader,4 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'LDApplic1618FrameworkUpliftBalancingPayment,LDApplic1618FrameworkUpliftCompletionPayment,LDApplic1618FrameworkUpliftOnProgPayment') UNION
	SELECT 'ILR Adult Non-Levy Contracted Apprenticeships Disadvantage Payments'as SubGroupHeader,5 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'DisadvFirstPayment,DisadvSecondPayment') UNION
	SELECT 'ILR Adult Non-Levy Contracted Apprenticeships Additional Payments for Providers'as SubGroupHeader,6 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'LearnDelFirstProv1618Pay,LearnDelSecondProv1618Pay') UNION
	SELECT 'ILR Adult Non-Levy Contracted Apprenticeships Additional Payments for Employers'as SubGroupHeader,7 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'LearnDelFirstEmp1618Pay,LearnDelSecondEmp1618Pay') UNION
	SELECT 'ILR Adult Non-Levy Contracted Apprenticeships Learning Support'as SubGroupHeader,8 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName,*  FROM [dbo].[GetAECFundingForType] ('19+ Apprenticeship (From May 2017) Non-Levy Contract',@CollectionPeriodInt,'LearnSuppFundCash')
	UNION
	SELECT 'EAS Adult Non-Levy Contracted Apprenticeships Training Audit Adjustments' as SubGroupHeader,10 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: Adult Non-Levy Apprenticeships - Training', @CollectionPeriodInt) UNION
	SELECT 'EAS Adult Non-Levy Contracted Apprenticeships Training Authorised Claims' as SubGroupHeader,11 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: Adult Non-Levy Apprenticeships - Training', @CollectionPeriodInt) UNION
	SELECT 'EAS Adult Non-Levy Contracted Apprenticeships Additional Payments for Providers Audit Adjustments' as SubGroupHeader,12 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: Adult Non-Levy Apprenticeships - Provider', @CollectionPeriodInt) UNION
	SELECT 'EAS Adult Non-Levy Contracted Apprenticeships Additional Payments for Providers Authorised Claims ' as SubGroupHeader,13 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: Adult Non-Levy Apprenticeships - Provider', @CollectionPeriodInt) UNION
	SELECT 'EAS Adult Non-Levy Contracted Apprenticeships Additional Payments for Providers Learner Support' as SubGroupHeader,14 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Excess Learning Support: Adult Non-Levy Apprenticeships - Provider', @CollectionPeriodInt) UNION
	SELECT 'EAS Adult Non-Levy Contracted Apprenticeships Additional Payments for Employers Audit Adjustments ' as SubGroupHeader,15 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: Adult Non-Levy Apprenticeships - Employer', @CollectionPeriodInt) UNION
	SELECT 'EAS Adult Non-Levy Contracted Apprenticeships Additional Payments for Employers Authorised Claims' as SubGroupHeader,16 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: Adult Non-Levy Apprenticeships - Employer', @CollectionPeriodInt)
	) AS [AdultNonLevyContractedApprenticeships]

	--Adult Non-Levy Contracted Apprenticeships Totals
	INSERT INTO [Report].[FundingSummary_TotalAdultNonLevyContractedApprenticeships]
	(SubGroupHeader, SortOrder, DataSetName, YTDCalc, TotalCalc, AugToMar, AprToJul, FundCalcAug, FundCalcSep, FundCalcOct, FundCalcNov, FundCalcDec, FundCalcJan, FundCalcFeb, FundCalcMar, FundCalcApr, FundCalcMay, FundCalcJun, FundCalcJul)
	SELECT * 
				FROM 
				(SELECT 'Total Adult Non-Levy Contracted Apprenticeships' as SubGroupHeader,18 as SortOrder,'LineTotalsAdultNonLevyContractedApprenticeships' as DataSetName,
				SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
				sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
				sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
				From [Report].[FundingSummary_AdultNonLevyContractedApprenticeships] Where SubGroupHeader NOT IN ('...of which Indicative Co-Investment Earnings') ) TOTAL
	
	
	--Total NonLevy Budget
	INSERT INTO [Report].[FundingSummary_TotalNonLevyBudget]
         (SubGroupHeader, SortOrder, DataSetName, YTDCalc, TotalCalc, AugToMar, AprToJul, FundCalcAug, FundCalcSep, FundCalcOct, FundCalcNov, FundCalcDec, FundCalcJan, FundCalcFeb, FundCalcMar, FundCalcApr, FundCalcMay, FundCalcJun, FundCalcJul)

	SELECT 'Total Non-Levy Contracted Apprenticeships Budget for starts on or after 1 May 2017' as SubGroupHeader,1 as SortOrder,'LineTotalsNonLevyBudget' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,
			sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul FROM (
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_Total1618NonLevyContractedApprenticeships UNION
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_TotalAdultNonLevyContractedApprenticeships) as a
	

	/********************************************************************************************************************************************************************/





	INSERT INTO [Report].[FundingSummary_AebOther]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT *
			FROM
			(SELECT 'ILR AEB - Other Learning Programme Funding' as SubGroupHeader,1 as SortOrder,'LineTotalsAebOtherLearning' as DataSetName, * FROM dbo.GetSFAFundingForType('AEB - Other Learning', @CollectionPeriodInt) UNION
			SELECT 'ILR AEB - Other Learning (EFA Model) Programme Funding' as SubGroupHeader,2 as SortOrder,'LineTotalsAebOtherLearning' as DataSetName, * FROM dbo.GetEFAFundingForType('Adult Skills Funded EFA Model', @CollectionPeriodInt) UNION
			SELECT 'ILR AEB - Other Learning (25+ High Needs Students) Programme Funding' as SubGroupHeader,3 as SortOrder,'LineTotalsAebOtherLearning' as DataSetName, * FROM dbo.GetEFAFundingForType('25+ Students with an LDA or EHCP', @CollectionPeriodInt) UNION
			SELECT 'ILR AEB - Other Learning Learning Support' as SubGroupHeader,4 as SortOrder,'LineTotalsAebOtherLearning' as DataSetName, * FROM dbo.GetLSFFundingForType('AEB - Other Learning', @CollectionPeriodInt) UNION
			SELECT 'EAS AEB - Other Learning Audit Adjustments' as SubGroupHeader,6 as SortOrder,'LineTotalsAebOtherLearning' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: AEB-Other Learning', @CollectionPeriodInt) UNION
			SELECT 'EAS AEB - Other Learning Authorised Claims' as SubGroupHeader,7 as SortOrder,'LineTotalsAebOtherLearning' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: AEB-Other Learning', @CollectionPeriodInt) UNION
			SELECT 'EAS AEB - Other Learning Excess Learning Support' as SubGroupHeader,8 as SortOrder,'LineTotalsAebOtherLearning' as DataSetName, * FROM dbo.GetEASFunding('Excess Learning Support: AEB-Other Learning', @CollectionPeriodInt) ) AS a

	INSERT INTO [Report].[FundingSummary_TotalAebOther]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT * 
			FROM 
			(SELECT 'Total AEB - Other Learning' as SubGroupHeader,10 as SortOrder,'LineTotalsAebOtherLearning' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
			sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
			From Report.FundingSummary_AebOther) TOTAL

	INSERT INTO [Report].[FundingSummary_24PlusAdvLoansBursary]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])	
	SELECT *
			FROM
			(SELECT 'ILR Advanced Loans Bursary Funding' as SubGroupHeader,1 as SortOrder,'LineTotals24PlusAdvLoansBursary' as DataSetName, * FROM dbo.GetBursaryFundingForType('Advanced Learner Loans Bursary', @CollectionPeriodInt) UNION
			SELECT 'ILR Advanced Loans Bursary Area Costs' as SubGroupHeader,2 as SortOrder,'LineTotals24PlusAdvLoansBursary' as DataSetName, * FROM dbo.GetBursaryLoansAreaUpliftForType('Advanced Learner Loans Bursary', @CollectionPeriodInt) UNION
			SELECT 'EAS Advanced Loans Bursary Excess Support' as SubGroupHeader,4 as SortOrder,'LineTotals24PlusAdvLoansBursary' as DataSetName, * FROM dbo.GetEASFunding('Excess Support: Advanced Learner Loans Bursary', @CollectionPeriodInt) UNION
			SELECT 'EAS Advanced Loans Bursary Area Costs Audit Adjustments' as SubGroupHeader,5 as SortOrder,'LineTotals24PlusAdvLoansBursary' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: Advanced Learner Loans Bursary', @CollectionPeriodInt)) AS a

	INSERT INTO [Report].[FundingSummary_Total24PlusAdvLoansBursary]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])	
	SELECT * 
			FROM 
			(SELECT 'Total Advanced Loans Bursary' as SubGroupHeader,7 as SortOrder,'LineTotals24PlusAdvLoansBursary' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
			sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
			From Report.FundingSummary_24PlusAdvLoansBursary) TOTAL

	INSERT INTO [Report].[FundingSummary_AdultOLASS]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])	
	SELECT *
			FROM
			(SELECT 'ILR Adult OLASS Programme Funding' as SubGroupHeader,1 as SortOrder,'LineTotalsAdultOLASS' as DataSetName, * FROM dbo.GetSFAFundingForType('Adult OLASS', @CollectionPeriodInt) UNION
			SELECT 'ILR Adult OLASS Learning Support' as SubGroupHeader,2 as SortOrder,'LineTotalsAdultOLASS' as DataSetName, * FROM dbo.GetLSFFundingForType('Adult OLASS', @CollectionPeriodInt) UNION
			SELECT 'EAS Adult OLASS Audit Adjustments' as SubGroupHeader,4 as SortOrder,'LineTotalsAdultOLASS' as DataSetName, * FROM dbo.GetOLASSEASAuditAdjustmentsFunding(@CollectionPeriodInt)UNION
			SELECT 'EAS Adult OLASS Authorised Claims' as SubGroupHeader,5 as SortOrder,'LineTotalsAdultOLASS' as DataSetName, * FROM dbo.GetOLASSEASAuthorisedClaimsFunding(@CollectionPeriodInt)UNION
			SELECT 'EAS Adult OLASS Excess Learning Support' as SubGroupHeader,6 as SortOrder,'LineTotalsAdultOLASS' as DataSetName, * FROM dbo.GetOLASSEASExcessLearningSupportFunding(@CollectionPeriodInt) ) AS a

	INSERT INTO [Report].[FundingSummary_TotalAdultOLASS]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT * 
			FROM 
			(SELECT 'Total Adult OLASS' as SubGroupHeader,8 as SortOrder,'LineTotalsAdultOLASS' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
			sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
			From Report.FundingSummary_AdultOLASS) TOTAL

	INSERT INTO [Report].[FundingSummary_1618Trailblazers]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT *
			FROM
			(SELECT 'ILR 16-18 Trailblazer Apprenticeships Programme Funding (Core Government Contribution, Maths and English)' as SubGroupHeader,1 as SortOrder,'LineTotals1618Trailblazers' as DataSetName, * FROM dbo.GetTrailblazerOnProgFundingForType('16-18 Trailblazer Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'ILR 16-18 Trailblazer Apprenticeships Employer Incentive Payments (Achievement, Small Employer, 16-18)' as SubGroupHeader,2 as SortOrder,'LineTotals1618Trailblazers' as DataSetName, * FROM dbo.GetTrailblazerIncentivesFundingForType('16-18 Trailblazer Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'ILR 16-18 Trailblazer Apprenticeships Learning Support' as SubGroupHeader,3 as SortOrder,'LineTotals1618Trailblazers' as DataSetName, * FROM dbo.GetTrailblazerLSFFundingForType('16-18 Trailblazer Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-18 Trailblazer Apprenticeships Audit Adjustments' as SubGroupHeader,5 as SortOrder,'LineTotals1618Trailblazers' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 16-18 Trailblazer Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-18 Trailblazer Apprenticeships Authorised Claims' as SubGroupHeader,6 as SortOrder,'LineTotals1618Trailblazers' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 16-18 Trailblazer Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-18 Trailblazer Apprenticeships Excess Learning Support' as SubGroupHeader,7 as SortOrder,'LineTotals1618Trailblazers' as DataSetName, * FROM dbo.GetEASFunding('Excess Learning Support: 16-18 Trailblazer Apprenticeships', @CollectionPeriodInt)) AS a

	INSERT INTO [Report].[FundingSummary_Total1618Trailblazers]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT * 
			FROM 
			(SELECT 'Total 16-18 Trailblazer Apprenticeships for starts before 1 May 2017' as SubGroupHeader,9 as SortOrder,'LineTotals1618Trailblazers' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
			sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
			From  [Report].[FundingSummary_1618Trailblazers]) TOTAL

	INSERT INTO [Report].[FundingSummary_1923Trailblazers]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT *
			FROM
			(SELECT 'ILR 19-23 Trailblazer Apprenticeships Programme Funding (Core Government Contribution, Maths and English)' as SubGroupHeader,1 as SortOrder,'LineTotals1923Trailblazers' as DataSetName, * FROM dbo.GetTrailblazerOnProgFundingForType('19-23 Trailblazer Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'ILR 19-23 Trailblazer Apprenticeships Employer Incentive Payments (Achievement, Small Employer, 16-18)' as SubGroupHeader,2 as SortOrder,'LineTotals1923Trailblazers' as DataSetName, * FROM dbo.GetTrailblazerAdultIncentivesFundingForType('19-23 Trailblazer Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'ILR 19-23 Trailblazer Apprenticeships Learning Support' as SubGroupHeader,3 as SortOrder,'LineTotals1923Trailblazers' as DataSetName, * FROM dbo.GetTrailblazerLSFFundingForType('19-23 Trailblazer Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'EAS 19-23 Trailblazer Apprenticeships Audit Adjustments' as SubGroupHeader,5 as SortOrder,'LineTotals1923Trailblazers' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 19-23 Trailblazer Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 19-23 Trailblazer Apprenticeships Authorised Claims' as SubGroupHeader,6 as SortOrder,'LineTotals1923Trailblazers' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 19-23 Trailblazer Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 19-23 Trailblazer Apprenticeships Excess Learning Support' as SubGroupHeader,7 as SortOrder,'LineTotals1923Trailblazers' as DataSetName, * FROM dbo.GetEASFunding('Excess Learning Support: 19-23 Trailblazer Apprenticeships', @CollectionPeriodInt)) AS a

	INSERT INTO [Report].[FundingSummary_Total1923Trailblazers]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT * 
			FROM 
			(SELECT 'Total 19-23 Trailblazer Apprenticeships' as SubGroupHeader,9 as SortOrder,'LineTotals1923Trailblazers' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
			sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
			From  [Report].[FundingSummary_1923Trailblazers]) TOTAL

	INSERT INTO [Report].[FundingSummary_24PlusTrailblazers]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT *
			FROM
			(SELECT 'ILR 24+ Trailblazer Apprenticeships Programme Funding (Core Government Contribution, Maths and English)' as SubGroupHeader,1 as SortOrder,'LineTotals24PlusTrailblazers' as DataSetName, * FROM dbo.GetTrailblazerOnProgFundingForType('24+ Trailblazer Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'ILR 24+ Trailblazer Apprenticeships Employer Incentive Payments (Achievement, Small Employer, 16-18)' as SubGroupHeader,2 as SortOrder,'LineTotals24PlusTrailblazers' as DataSetName, * FROM dbo.GetTrailblazerAdultIncentivesFundingForType('24+ Trailblazer Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'ILR 24+ Trailblazer Apprenticeships Learning Support' as SubGroupHeader,3 as SortOrder,'LineTotals24PlusTrailblazers' as DataSetName, * FROM dbo.GetTrailblazerLSFFundingForType('24+ Trailblazer Apprenticeship', @CollectionPeriodInt) UNION
			SELECT 'EAS 24+ Trailblazer Apprenticeships Audit Adjustments' as SubGroupHeader,5 as SortOrder,'LineTotals24PlusTrailblazers' as DataSetName, * FROM dbo.GetEASFunding('Audit Adjustments: 24+ Trailblazer Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 24+ Trailblazer Apprenticeships Authorised Claims' as SubGroupHeader,6 as SortOrder,'LineTotals24PlusTrailblazers' as DataSetName, * FROM dbo.GetEASFunding('Authorised Claims: 24+ Trailblazer Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 24+ Trailblazer Apprenticeships Excess Learning Support' as SubGroupHeader,7 as SortOrder,'LineTotals24PlusTrailblazers' as DataSetName, * FROM dbo.GetEASFunding('Excess Learning Support: 24+ Trailblazer Apprenticeships', @CollectionPeriodInt)) AS a

	INSERT INTO [Report].[FundingSummary_Total24PlusTrailblazers]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT * 
			FROM 
			(SELECT 'Total 24+ Trailblazer Apprenticeships' as SubGroupHeader,9 as SortOrder,'LineTotals24PlusTrailblazers' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
			sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
			From  [Report].[FundingSummary_24PlusTrailblazers]) TOTAL

	INSERT INTO [Report].[FundingSummary_Total1618Budget]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT 'Total 16-18 Apprenticeships Budget' as SubGroupHeader,1 as SortOrder,'LineTotals1618Budget' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,
			sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul FROM (
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_Total1618 UNION
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_Total1618Trailblazers) as a

	INSERT INTO [Report].[FundingSummary_TotalAdultAppBudget]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT 'Total Adult Apprenticeships Budget for starts before 1 May 2017' as SubGroupHeader,1 as SortOrder,'LineTotalsAdultBudget' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,
			sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul FROM (
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_Total1923 UNION
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_Total1923Trailblazers UNION
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_Total24PlusTrailblazers UNION
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_Total24Plus) as a

	INSERT INTO [Report].[FundingSummary_TotalNonAppBudget]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT 'Total Non-Apprenticeships' as SubGroupHeader,1 as SortOrder,'LineTotalsNonApprenticeships' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc ,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,
			sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul
			 FROM (
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_Total1924Traineeships UNION
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_TotalAebOther) as a

	INSERT INTO [Report].[FundingSummary_TotalAdultBudget]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT 'Total Adult Education Budget' as SubGroupHeader,1 as SortOrder,'LineTotalsAdultSkillsBudget' as DataSetName,
			SUM(YTDCalc) AS YTDCalc, SUM (TotalCalc) AS TotalCalc,sum(AugToMar) AS AugToMar,sum(AprToJul) AS AprToJul,sum(FundCalcAug) AS FundCalcAug,sum(FundCalcSep) AS FundCalcSep,sum(FundCalcOct) AS FundCalcOct,
			sum(FundCalcNov) AS FundCalcNov,sum(FundCalcDec) AS FundCalcDec,
			sum(FundCalcJan) AS FundCalcJan,sum(FundCalcFeb) AS FundCalcFeb,sum(FundCalcMar) AS FundCalcMar,sum(FundCalcApr) AS FundCalcApr,sum(FundCalcMay) AS FundCalcMay,sum(FundCalcJun) AS FundCalcJun,sum(FundCalcJul) AS FundCalcJul FROM (
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_Total1924Traineeships UNION
			select FundCalcAug,FundCalcSep,FundCalcOct,FundCalcNov,FundCalcDec,FundCalcJan,FundCalcFeb,FundCalcMar,FundCalcApr,FundCalcMay,FundCalcJun,FundCalcJul,YTDCalc, TotalCalc,AugToMar,AprToJul from Report.FundingSummary_TotalAebOther) as a

	INSERT INTO [Report].[FundingSummary_LineTotalsOLASSEASCancellationCosts]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT *
			FROM
			(
			SELECT 'EAS Adult OLASS Cancellation Costs' as SubGroupHeader,1 as SortOrder,'LineTotalsOLASSEASCancellationCosts' as DataSetName, * FROM dbo.GetOLASSEASCancellationCostsFunding(@CollectionPeriodInt)) AS a

	INSERT INTO [Report].[FundingSummary_ExceptionalLearningSupport]
			   ([SubGroupHeader],[SortOrder],[DataSetName],[YTDCalc],[TotalCalc],[AugToMar],[AprToJul],[FundCalcAug],[FundCalcSep],[FundCalcOct],[FundCalcNov],[FundCalcDec]
			   ,[FundCalcJan],[FundCalcFeb] ,[FundCalcMar] ,[FundCalcApr],[FundCalcMay] ,[FundCalcJun],[FundCalcJul])
	SELECT *
			FROM
			(
			SELECT 'EAS 16-18 Apprenticeship Frameworks Exceptional Learning Support' as SubGroupHeader,1 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetEASFunding('Exceptional Learning Support: 16-18 Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-18 Trailblazer Apprenticeships Exceptional Learning Support' as SubGroupHeader,2 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetEASFunding('Exceptional Learning Support: 16-18 Trailblazer Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 19-23 Apprenticeship Frameworks Exceptional Learning Support' as SubGroupHeader,3 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetEASFunding('Exceptional Learning Support: 19-23 Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 19-23 Trailblazer Apprenticeships Exceptional Learning Support' as SubGroupHeader,4 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetEASFunding('Exceptional Learning Support: 19-23 Trailblazer Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 24+ Apprenticeship Frameworks Exceptional Learning Support' as SubGroupHeader,5 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetEASFunding('Exceptional Learning Support: 24+ Apprenticeships', @CollectionPeriodInt) UNION
			SELECT 'EAS 24+ Trailblazer Apprenticeships Exceptional Learning Support' as SubGroupHeader,6 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetEASFunding('Exceptional Learning Support: 24+ Trailblazer Apprenticeships', @CollectionPeriodInt) UNION
			
			SELECT 'EAS 16-18 Levy contracted Apprenticeships Exceptional Learning Support' as SubGroupHeader,7 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetEASFunding('Exceptional Learning Support: 16-18 Levy Apprenticeships – Provider', @CollectionPeriodInt) UNION
			SELECT 'EAS Adult Levy contracted Apprenticeships Exceptional Learning Support' as SubGroupHeader,8 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetEASFunding('Exceptional Learning Support: Adult Levy Apprenticeships – Provider', @CollectionPeriodInt) UNION
			SELECT 'EAS 16-18 Non-levy contracted Apprenticeships Exceptional Learning Support' as SubGroupHeader,9 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetEASFunding('Exceptional Learning Support: 16-18 Non-Levy Apprenticeships – Provider', @CollectionPeriodInt) UNION
			SELECT 'EAS Adult Non-levy contracted Apprenticeships Exceptional Learning Support' as SubGroupHeader,10 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetEASFunding('Exceptional Learning Support: Adult Non-Levy Apprenticeships – Provider', @CollectionPeriodInt) UNION
			
			SELECT 'EAS 19-24 Traineeships Exceptional Learning Support' as SubGroupHeader,11 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetEASFunding('Exceptional Learning Support: 19-24 Traineeships', @CollectionPeriodInt) UNION
			SELECT 'EAS AEB - Other Learning Exceptional Learning Support' as SubGroupHeader,12 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetEASFunding('Exceptional Learning Support: AEB-Other Learning', @CollectionPeriodInt) UNION
			SELECT 'EAS Advanced Loans Bursary Exceptional Learning Support' as SubGroupHeader,13 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetEASFunding('Exceptional Learning Support: Advanced Learner Loans Bursary', @CollectionPeriodInt) UNION
			SELECT 'EAS Adult OLASS Exceptional Learning Support' as SubGroupHeader,14 as SortOrder,'LineTotalsExceptionalLearningSupport' as DataSetName, * FROM dbo.GetOLASSEASExceptionalLearningSupportFunding(@CollectionPeriodInt)) AS a
END

GO