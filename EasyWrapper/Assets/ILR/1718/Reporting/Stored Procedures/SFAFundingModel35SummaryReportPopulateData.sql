IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Report].[SFAFundingModel35SummaryReportPopulateData]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Report].[SFAFundingModel35SummaryReportPopulateData]
GO

--In FIS Manifest - Make sure call to this appears after the html form(as filters need applying before aggregation)
CREATE PROCEDURE [Report].[SFAFundingModel35SummaryReportPopulateData]	
	@ProvSpecLearnMonA VARCHAR(50) = NULL,
	@ProvSpecLearnMonB VARCHAR(50) = NULL,
	@ProvSpecDelMonA VARCHAR(50) = NULL,
	@ProvSpecDelMonB VARCHAR(50) = NULL,
	@ProvSpecDelMonC VARCHAR(50) = NULL,
	@ProvSpecDelMonD VARCHAR(50) = NULL,
	@FundLineFilter VARCHAR(50) =NULL
AS
BEGIN	
	-- Setting up dummy data for empty report
	DECLARE @TempFundLineValueTable TABLE (	FundLine VARCHAR(100),	ACM INT)

	INSERT INTO @TempFundLineValueTable (FundLine, ACM)
	VALUES ('16-18 Apprenticeship', 1), ('16-18 Apprenticeship', 2), ('16-18 Apprenticeship', 3), ('16-18 Apprenticeship', 4), ('16-18 Apprenticeship', 5), ('16-18 Apprenticeship', 6), ('16-18 Apprenticeship', 7), ('16-18 Apprenticeship', 8), ('16-18 Apprenticeship', 9), ('16-18 Apprenticeship', 10), ('16-18 Apprenticeship', 11), ('16-18 Apprenticeship', 12)

	INSERT INTO @TempFundLineValueTable (FundLine, ACM)
	SELECT '19-23 Apprenticeship', ACM FROM @TempFundLineValueTable GROUP BY ACM

	INSERT INTO @TempFundLineValueTable (FundLine, ACM)
	SELECT '24+ Apprenticeship', ACM FROM @TempFundLineValueTable GROUP BY ACM

	INSERT INTO @TempFundLineValueTable (FundLine, ACM)
	SELECT '19-24 Traineeship', ACM FROM @TempFundLineValueTable GROUP BY ACM

	INSERT INTO @TempFundLineValueTable (FundLine, ACM)
	SELECT 'AEB - Other Learning', ACM FROM @TempFundLineValueTable GROUP BY ACM

	--INSERT INTO @TempFundLineValueTable (FundLine, ACM)
	--SELECT 'Adult OLASS', ACM FROM @TempFundLineValueTable GROUP BY ACM
	-- Finish setting up dummy data for empty report

		TRUNCATE TABLE [Report].[SFAFundingModel35SummaryReport]

	

	--Periodised Values
	CREATE TABLE #PVTempTable(
								LearnRefNumber VARCHAR(12) NOT NULL,
								AimSeqNumber INT NOT NULL,
								AttributeName VARCHAR(100) NOT NULL,
								ACM INT NOT NULL,
								ACMValue DECIMAL(15,5) NULL
							)


	INSERT INTO #PVTempTable (LearnRefNumber, AimSeqNumber, AttributeName, ACM, ACMValue)
	SELECT LearnRefNumber, AimSeqNumber, AttributeName, 1, Period_1 FROM [Rulebase].[SFA_LearningDelivery_PeriodisedValues]

	INSERT INTO #PVTempTable (LearnRefNumber, AimSeqNumber, AttributeName, ACM, ACMValue)
	SELECT LearnRefNumber, AimSeqNumber, AttributeName, 2, Period_2 FROM [Rulebase].[SFA_LearningDelivery_PeriodisedValues]

	INSERT INTO #PVTempTable (LearnRefNumber, AimSeqNumber, AttributeName, ACM, ACMValue)
	SELECT LearnRefNumber, AimSeqNumber, AttributeName, 3, Period_3 FROM [Rulebase].[SFA_LearningDelivery_PeriodisedValues]

	INSERT INTO #PVTempTable (LearnRefNumber, AimSeqNumber, AttributeName, ACM, ACMValue)
	SELECT LearnRefNumber, AimSeqNumber, AttributeName, 4, Period_4 FROM [Rulebase].[SFA_LearningDelivery_PeriodisedValues]

	INSERT INTO #PVTempTable (LearnRefNumber, AimSeqNumber, AttributeName, ACM, ACMValue)
	SELECT LearnRefNumber, AimSeqNumber, AttributeName, 5, Period_5 FROM [Rulebase].[SFA_LearningDelivery_PeriodisedValues]

	INSERT INTO #PVTempTable (LearnRefNumber, AimSeqNumber, AttributeName, ACM, ACMValue)
	SELECT LearnRefNumber, AimSeqNumber, AttributeName, 6, Period_6 FROM [Rulebase].[SFA_LearningDelivery_PeriodisedValues]

	INSERT INTO #PVTempTable (LearnRefNumber, AimSeqNumber, AttributeName, ACM, ACMValue)
	SELECT LearnRefNumber, AimSeqNumber, AttributeName, 7, Period_7 FROM [Rulebase].[SFA_LearningDelivery_PeriodisedValues]

	INSERT INTO #PVTempTable (LearnRefNumber, AimSeqNumber, AttributeName, ACM, ACMValue)
	SELECT LearnRefNumber, AimSeqNumber, AttributeName, 8, Period_8 FROM [Rulebase].[SFA_LearningDelivery_PeriodisedValues]

	INSERT INTO #PVTempTable (LearnRefNumber, AimSeqNumber, AttributeName, ACM, ACMValue)
	SELECT LearnRefNumber, AimSeqNumber, AttributeName, 9, Period_9 FROM [Rulebase].[SFA_LearningDelivery_PeriodisedValues]

	INSERT INTO #PVTempTable (LearnRefNumber, AimSeqNumber, AttributeName, ACM, ACMValue)
	SELECT LearnRefNumber, AimSeqNumber, AttributeName, 10, Period_10 FROM [Rulebase].[SFA_LearningDelivery_PeriodisedValues]

	INSERT INTO #PVTempTable (LearnRefNumber, AimSeqNumber, AttributeName, ACM, ACMValue)
	SELECT LearnRefNumber, AimSeqNumber, AttributeName, 11, Period_11 FROM [Rulebase].[SFA_LearningDelivery_PeriodisedValues]

	INSERT INTO #PVTempTable (LearnRefNumber, AimSeqNumber, AttributeName, ACM, ACMValue)
	SELECT LearnRefNumber, AimSeqNumber, AttributeName, 12, Period_12 FROM [Rulebase].[SFA_LearningDelivery_PeriodisedValues]
	-- Finish setting up Periodised Values

	;WITH ProvSpecLearnMon_CTE AS 
	(
		SELECT ProvSpecLearnMon.* FROM [Valid].[ProviderSpecLearnerMonitoring] PIVOT (MAX(ProvSpecLearnMon) FOR ProvSpecLearnMonOccur IN ([A],[B]))AS ProvSpecLearnMon
	)
	,ProvSpecDelMon_CTE AS 
	(
		SELECT ProvSpecDelMon.* FROM [Valid].[ProviderSpecDeliveryMonitoring] PIVOT (MAX(ProvSpecDelMon) FOR ProvSpecDelMonOccur IN ([A],[B],[C],[D]))AS ProvSpecDelMon
	)
	INSERT INTO [Report].[SFAFundingModel35SummaryReport]
			   ([UKPRN]
			   ,[FundingLine]
			   ,[Period]
			   ,[OnProgPayment]
			   ,[Balancing]
			   ,[JobOutcomeAchievement]
			   ,[AimAchievement]
			   ,[TotalAchievement]
			   ,[LearningSupport]
			   ,[Total]
			   ,[SortOrder])   

	SELECT		(SELECT UKPRN FROM [Valid].LearningProvider) AS UKPRN,
				Dummy.FundLine AS 'FundingLine',			
				Dummy.ACM AS 'Period',		
				SUM(CASE WHEN PV.AttributeName = 'OnProgPayment' THEN PV.ACMValue ELSE 0 END) AS 'OnProgPayment',
				SUM(CASE WHEN PV.AttributeName = 'BalancePayment' THEN PV.ACMValue ELSE 0 END) AS 'Balancing',
				SUM(CASE WHEN PV.AttributeName = 'EmpOutcomePay' THEN PV.ACMValue ELSE 0 END) AS 'JobOutcomeAchievement',
				SUM(CASE WHEN PV.AttributeName = 'AchievePayment' THEN PV.ACMValue ELSE 0 END) AS 'AimAchievement',
				SUM(CASE WHEN PV.AttributeName IN ('EmpOutcomePay', 'AchievePayment') THEN PV.ACMValue ELSE 0 END) AS 'TotalAchievement',
				SUM(CASE WHEN PV.AttributeName = 'LearnSuppFundCash' THEN PV.ACMValue ELSE 0 END) AS 'LearningSupport',
				SUM(CASE WHEN PV.AttributeName IN ('OnProgPayment', 'BalancePayment', 'EmpOutcomePay', 'AchievePayment', 'LearnSuppFundCash') THEN PV.ACMValue ELSE 0 END) AS 'Total',
				SortOrder = CASE [Dummy].[FundLine]
									WHEN '16-18 Apprenticeship' THEN 1
									WHEN '19-23 Apprenticeship' THEN 2
									WHEN '24+ Apprenticeship' THEN 3
									WHEN '19-24 Traineeship' THEN 4
									WHEN 'AEB - Other Learning' THEN 5								
									WHEN 'Adult OLASS' THEN 6
									END
			FROM [Rulebase].[SFA_LearningDelivery] LD
			LEFT OUTER JOIN #PVTempTable AS PV
				ON LD.LearnRefNumber = PV.LearnRefNumber AND LD.AimSeqNumber = PV.AimSeqNumber
			RIGHT OUTER JOIN @TempFundLineValueTable AS Dummy
				ON PV.ACM = Dummy.ACM AND LD.FundLine = Dummy.FundLine
			LEFT OUTER JOIN [Valid].[Learner] L
				ON LD.LearnRefNumber = L.LearnRefNumber			
			LEFT JOIN ProvSpecLearnMon_CTE [ProvSpecLearnMon] ON [ProvSpecLearnMon].[LearnRefNumber] = [LD].[LearnRefNumber]
			LEFT JOIN ProvSpecDelMon_CTE [ProvSpecDelMon] ON [ProvSpecDelMon].[LearnRefNumber] = [LD].[LearnRefNumber] AND [ProvSpecDelMon].[AimSeqNumber] = [LD].[AimSeqNumber]

			LEFT JOIN [Valid].[LearningDelivery] VLD
				ON L.LearnRefNumber = VLD.LearnRefNumber AND VLD.AimSeqNumber = LD.AimSeqNumber			
		
			WHERE ([ProvSpecLearnMon].[A] = @ProvSpecLearnMonA OR ISNULL(@ProvSpecLearnMonA, '') = '')AND
				([ProvSpecLearnMon].[B] = @ProvSpecLearnMonB OR ISNULL(@ProvSpecLearnMonB, '') = '') AND
				([ProvSpecDelMon].[A] = @ProvSpecDelMonA OR ISNULL(@ProvSpecDelMonA, '') = '') AND
				([ProvSpecDelMon].[B] = @ProvSpecDelMonB OR ISNULL(@ProvSpecDelMonB, '') = '') AND
				([ProvSpecDelMon].[C] = @ProvSpecDelMonC OR ISNULL(@ProvSpecDelMonC, '') = '') AND
				([ProvSpecDelMon].[D] = @ProvSpecDelMonD OR ISNULL(@ProvSpecDelMonD, '') = '') AND					
				(LD.FundLine = '0' OR LD.FundLine = @FundLineFilter OR COALESCE(@FundLineFilter, '') = '')
				group by Dummy.FundLine,Dummy.ACM 		
				order by Dummy.FundLine,Dummy.ACM


		INSERT INTO [Report].[SFAFundingModel35SummaryReport]
					([UKPRN]
					,[FundingLine]
					,[Period]
					,[OnProgPayment]
					,[Balancing]
					,[JobOutcomeAchievement]
					,[AimAchievement]
					,[TotalAchievement]
					,[LearningSupport]
					,[Total]
					,[SortOrder]) 

		SELECT A.* 
		FROM
			(SELECT
				(SELECT UKPRN FROM [Valid].LearningProvider) AS UKPRN,
				FundLine.FundLine AS 'FundingLine',
				FundLine.ACM AS 'Period',
				0 AS 'OnProgPayment',
				0 AS 'Balancing',
				0 AS 'JobOutcomeAchievement',
				0 AS 'AimAchievement',
				0 AS 'TotalAchievement',
				0 AS 'LearningSupport',
				0 AS 'Total',
				CASE FundLine.FundLine
					WHEN '16-18 Apprenticeship' THEN 1
					WHEN '19-23 Apprenticeship' THEN 2
					WHEN '24+ Apprenticeship' THEN 3
					WHEN '19-24 Traineeship' THEN 4
					WHEN 'AEB - Other Learning' THEN 5								
					WHEN 'Adult OLASS' THEN 6
				END AS 'SortOrder'
			FROM @TempFundLineValueTable FundLine) A
			LEFT JOIN [Report].[SFAFundingModel35SummaryReport] B
			ON A.FundingLine = B.FundingLine
			AND A.Period = B.Period
			WHERE B.FundingLine IS NULL
	DROP TABLE #PVTempTable
END