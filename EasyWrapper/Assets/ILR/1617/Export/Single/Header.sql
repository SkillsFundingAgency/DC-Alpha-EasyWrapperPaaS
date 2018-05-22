select cast((
	select 
		(
			select 
				CollectionDetails.Collection,
				CollectionDetails.Year,
				cast(CollectionDetails.FilePreparationDate as date) FilePreparationDate
			from 
				CollectionDetails 
			for xml auto, type, elements
		),
		(
			select 
				Source.ProtectiveMarking,
				Source.UKPRN,
				Source.SoftwareSupplier,
				Source.SoftwarePackage,
				Source.Release,
				Source.SerialNo,
				Source.DateTime
			from 
				Source 
			for xml auto, type, elements
		) 
	for xml path('Header'), type, elements
) as varchar(max))