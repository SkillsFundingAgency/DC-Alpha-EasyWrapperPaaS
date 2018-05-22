select cast(
	(
		select 
			UKPRN 
		from 
			Valid.LearningProvider as LearningProvider
		where
			UKPRN = ${ukprn}
		for xml auto, 
		type, 
		elements
	) as varchar(max))