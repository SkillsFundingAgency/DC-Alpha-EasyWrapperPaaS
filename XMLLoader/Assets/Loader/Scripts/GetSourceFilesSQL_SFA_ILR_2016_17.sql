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
				SourceFile
			for xml auto, 
			type, 
			elements
		)  
		for xml path('SourceFiles'), 
		type, 
		elements
	) 
as varchar(max))