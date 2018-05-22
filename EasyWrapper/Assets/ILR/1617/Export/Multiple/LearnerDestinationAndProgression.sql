select coalesce(cast((
	select 
		LearnerDestinationandProgression.LearnRefNumber, 
		LearnerDestinationandProgression.ULN,
		(
			select 
				DPOutcome.OutType,
				DPOutcome.OutCode,
				cast(DPOutcome.OutStartDate as date) OutStartDate,
				cast(DPOutcome.OutEndDate as date) OutEndDate,
				cast(DPOutcome.OutCollDate as date) OutCollDate 
			from 
				ILR1617.DPOutcome DPOutcome 
			where 
				DPOutcome.LearnRefNumber=LearnerDestinationandProgression.LearnRefNumber 
				and DPOutcome.UKPRN=$(UKPRN) 
			for xml auto, type, elements
		) 
	from 
		ILR1617.LearnerDestinationandProgression LearnerDestinationandProgression 
	where 
		LearnerDestinationandProgression.UKPRN=$(UKPRN)
	for xml auto, type, elements
) as varchar(max)),'')