select coalesce(
	cast(
		(
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
						Valid.DPOutcome as DPOutcome
					where 
						DPOutcome.LearnRefNumber = LearnerDestinationandProgression.LearnRefNumber 
					and	DPOutcome.UKPRN = LearnerDestinationandProgression.UKPRN
					for xml auto, 
					type, 
					elements
				) 
			from 
				Valid.LearnerDestinationandProgression as LearnerDestinationandProgression
			where
				LearnerDestinationandProgression.UKPRN = ${ukprn}
			for xml auto, 
			type, 
			elements
		) as varchar(max)
	),
'')