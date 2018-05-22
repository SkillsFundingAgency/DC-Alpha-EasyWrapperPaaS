select cast(
	(
		select
		(
			select 
				[SourceFileName]
				,cast([FilePreparationDate] as date) as FilePreparationDate
				,[SoftwareSupplier]
				,[SoftwarePackage]
				,[Release]
				,[SerialNo]
				,[DateTime]
			from 
				Valid.SourceFile as SourceFile
			where
				UKPRN = ${ukprn}
			for xml auto, 
			type, 
			elements
		)  
		for xml path('SourceFiles'), 
		type, 
		elements
	) 
as varchar(max))