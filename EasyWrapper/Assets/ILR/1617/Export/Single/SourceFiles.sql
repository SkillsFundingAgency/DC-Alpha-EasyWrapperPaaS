select cast((
	select 
		(
			select 
				SourceFile.SourceFileName,
				cast(SourceFile.FilePreparationDate as date) FilePreparationDate,
				SourceFile.SoftwareSupplier,
				SourceFile.SoftwarePackage,
				SourceFile.Release,
				SourceFile.SerialNo,
				SourceFile.DateTime
			from 
				SourceFile 
			for xml auto, type, elements
		) 
	where
		exists(select top 1 * from SourceFile)
	for xml path('SourceFiles'), type, elements
) as varchar(max))