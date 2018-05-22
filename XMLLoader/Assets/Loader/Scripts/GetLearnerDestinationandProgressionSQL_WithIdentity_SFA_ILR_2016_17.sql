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
						DPOutcome 
					where 
						DPOutcome.FK_LearnerDestinationandProgression = LearnerDestinationandProgression.PK_LearnerDestinationandProgression 
					for xml auto, 
					type, 
					elements
				) 
			from 
				LearnerDestinationandProgression 
			for xml auto, 
			type, 
			elements
		) as varchar(max)
	),
'')