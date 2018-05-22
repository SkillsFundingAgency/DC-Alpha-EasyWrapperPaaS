-- =====================================================================================================
-- Cranked by hand
-- Date: 8TH JUNE 2017
-- Profile:
-- Rulebase Version: ILR DP, Version 1718.01
-- =====================================================================================================
use [$(IntrajobDatabase)]
go

insert into [Input].[LearningProvider] (
	LearningProvider_Id,
	[UKPRN]
)
select
	PK_LearningProvider,
	[UKPRN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearningProvider]
go

insert into [Input].[CollectionDetails] (
	[CollectionDetails_Id]
	,[Collection] 
	,[Year]
	,[FilePreparationDate]
)
select
	PK_CollectionDetails
	,[Collection] 
	,[Year]
	,[FilePreparationDate]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[CollectionDetails] CollectionDetails
go

insert into [Input].[LearnerDestinationandProgression] (
	[LearnerDestinationandProgression_Id]
	,[LearnRefNumber]
	,[ULN]
)
select
	PK_LearnerDestinationandProgression
	,[LearnRefNumber]
	,[ULN]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[LearnerDestinationandProgression]
go

insert into [Input].[DPOutcome] (
	DPOutcome_Id,
	LearnerDestinationandProgression_Id,
	[LearnRefNumber]
	,[OutType]
	,[OutCode]
	,[OutStartDate]
	,[OutCollDate]
	,[OutEndDate]
)
select
	PK_DpOutcome,
	FK_LearnerDestinationandProgression,
	LearnerDestinationandProgression.[LearnRefNumber]
	,[OutType]
	,[OutCode]
	,[OutStartDate]
	,[OutCollDate]
	,[OutEndDate]
from
	[$(FromILRDatabase)].[$(FromILRSchema)].[DPOutcome]
	join [$(FromILRDatabase)].[$(FromILRSchema)].LearnerDestinationandProgression
		on LearnerDestinationandProgression.PK_LearnerDestinationandProgression = DPOutcome.FK_LearnerDestinationandProgression
go
