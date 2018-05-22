-- =====================================================================================================
-- Generated by Data Dictionary Version 1.0.0.0
-- Date: 11 May 2016 11:56
-- Profile: 1516 Test Harness Validation
-- Rulebase Version: DCSS Validation DP 1617, Drop 000, Version 1617.01
-- =====================================================================================================
use [$(IntrajobDatabase)]
go
insert into
	[Valid].[CollectionDetails]
		(
			[CollectionDetails_Id],
			[FilePreparationDate]
		)
select
	[CollectionDetails_Id],
	[FilePreparationDate]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[CollectionDetailsDenorm] CollectionDetails
where
	[CollectionDetails].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[LearningProvider]
		(
			[LearningProvider_Id],
			[UKPRN]
		)
select
	[LearningProvider_Id],
	[UKPRN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningProviderDenorm] LearningProvider
where
	[LearningProvider].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[LearnerDestinationandProgression]
		(
			[LearnerDestinationandProgression_Id],
			[LearnRefNumber],
			[ULN]
		)
select
	[LearnerDestinationandProgression_Id],
	[LearnRefNumber],
	[ULN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerDestinationandProgressionDenorm] LearnerDestinationandProgression
where
	[LearnerDestinationandProgression].[UKPRN]=$(UKPRN)
go

insert into
	[Valid].[DPOutcome]
		(
			[DPOutcome_Id],
			[OutCode],
			[OutCollDate],
			[OutEndDate],
			[OutStartDate],
			[OutType]
		)
select
	[DPOutcome_Id],
	[OutCode],
	[OutCollDate],
	[OutEndDate],
	[OutStartDate],
	[OutType]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[DPOutcomeDenorm] DPOutcome
where
	[DPOutcome].[UKPRN]=$(UKPRN)
go

