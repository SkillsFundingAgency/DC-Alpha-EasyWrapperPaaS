select cast(
	(
		select 
			UKPRN 
		from 
			LearningProvider 
		for xml auto, 
		type, 
		elements
	) as varchar(max))