-- =====================================================================================================
-- Cranked by hand
-- Date: 8TH JUNE 2017
-- Profile: 
-- Rulebase Version: ILR DP, Version 1718.01
-- =====================================================================================================
use [$(IntrajobDatabase)]
go

insert into [Input].[LearningProvider] (
	[UKPRN]
)
select
	[UKPRN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningProvider]
where
	[LearningProvider].[UKPRN]=$(UKPRN)
go

insert into [Input].[CollectionDetails] (
	[CollectionDetails_Id]
	,[Collection] 
	,[Year]
	,[FilePreparationDate]
)
select
	[CollectionDetails_Id]
	,[Collection] 
	,[Year]
	,[FilePreparationDate]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[CollectionDetailsDenorm] CollectionDetails
where
	[CollectionDetails].[UKPRN]=$(UKPRN)
go

insert into [Input].[LearnerDestinationandProgression] (
	[LearnerDestinationandProgression_Id]
	,[LearnRefNumber]
	,[ULN]
)
select
	[LearnerDestinationandProgression_Id]
	,[LearnRefNumber]
	,[ULN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerDestinationandProgressionDenorm] LearnerDestinationandProgression
where
	[LearnerDestinationandProgression].[UKPRN]=$(UKPRN)
go

insert into [Input].[DPOutcome] (
	[LearnRefNumber]
	,[OutType]
	,[OutCode]
	,[OutStartDate]
	,[OutCollDate]
	,[OutEndDate]
)
select
	[LearnRefNumber]
	,[OutType]
	,[OutCode]
	,[OutStartDate]
	,[OutCollDate]
	,[OutEndDate]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[DPOutcome]
where
	[DPOutcome].[UKPRN]=$(UKPRN)
go
