 IF OBJECT_ID('[Report].[AppsIndicitiveReportPMRsCurrentYear]') IS NOT NULL
 BEGIN
	 DROP VIEW [Report].[AppsIndicitiveReportPMRsCurrentYear]
 END
 GO	

create view [Report].[AppsIndicitiveReportPMRsCurrentYear]
as
SELECT 
pe.LearnRefNumber, PriceEpisodeIdentifier, EpisodeEffectiveTNPStartDate, pe.EpisodeStartDate, PriceEpisodeActualEndDate, 
PriceEpisodeActualInstalments, PriceEpisodeAimSeqNumber, 
PmrBaseEpisodes.TNP1, PmrBaseEpisodes.TNP2, PmrBaseEpisodes.TNP3, PmrBaseEpisodes.TNP4, PmrBaseEpisodes.TNPTotal
 FROM 

[Rulebase].[AEC_ApprenticeshipPriceEpisode] pe 
INNER JOIN 
(
SELECT
 MIN(EpisodeStartDate) "EpisodeStartDate",pe.LearnRefNumber, 
 TBAFR1.AFinAmount AS TNP1, 
 TBAFR2.AFinAmount AS TNP2,
 TBAFR3.AFinAmount AS TNP3, 
 TBAFR4.AFinAmount AS TNP4,
  ((ISNULL(TBAFR1.AFinAmount,0)+ISNULL(TBAFR2.AFinAmount,0))-ISNULL(TBAFR3.AFinAmount,0)) AS TNPTotal

from Rulebase.AEC_ApprenticeshipPriceEpisode pe

	--AFin1
	LEFT JOIN  [Valid].[AppFinRecord] TBAFR1 ON TBAFR1.LearnRefNumber = pe.LearnRefNumber AND TBAFR1.AimSeqNumber = pe.PriceEpisodeAimSeqNumber AND TBAFR1.AFinType='PMR'
	AND TBAFR1.AFinCode = 1 AND TBAFR1.AFinDate > '${YearStartDate}' and TBAFR1.AFinDate < '${YearEndDate}' 
	--AFin2
	LEFT JOIN  [Valid].[AppFinRecord] TBAFR2 ON TBAFR2.LearnRefNumber = pe.LearnRefNumber AND TBAFR2.AimSeqNumber = pe.PriceEpisodeAimSeqNumber AND TBAFR2.AFinType='PMR'
	AND TBAFR2.AFinCode = 2 AND TBAFR2.AFinDate > '${YearStartDate}' and TBAFR2.AFinDate < '${YearEndDate}' 
	--AFin3
	LEFT JOIN  [Valid].[AppFinRecord] TBAFR3 ON TBAFR3.LearnRefNumber = pe.LearnRefNumber AND TBAFR3.AimSeqNumber = pe.PriceEpisodeAimSeqNumber AND TBAFR3.AFinType='PMR'
	AND TBAFR3.AFinCode = 3 AND TBAFR3.AFinDate > '${YearStartDate}' and TBAFR3.AFinDate < '${YearEndDate}' 
	--AFin4
	LEFT JOIN  [Valid].[AppFinRecord] TBAFR4 ON TBAFR4.LearnRefNumber = pe.LearnRefNumber AND TBAFR4.AimSeqNumber = pe.PriceEpisodeAimSeqNumber AND TBAFR4.AFinType='PMR'
	AND TBAFR4.AFinCode = 4 AND TBAFR4.AFinDate > '${YearStartDate}' and TBAFR4.AFinDate < '${YearEndDate}' 


WHERE pe.EpisodeStartDate > '${YearStartDate}' and pe.EpisodeStartDate < '${YearEndDate}'
GROUP BY 
pe.LearnRefNumber,TBAFR1.AFinAmount,TBAFR2.AFinAmount,TBAFR3.AFinAmount,TBAFR4.AFinAmount
) PmrBaseEpisodes

on PmrBaseEpisodes.LearnRefNumber = pe.LearnRefNumber
and PmrBaseEpisodes.EpisodeStartDate = pe.EpisodeStartDate 

GO




