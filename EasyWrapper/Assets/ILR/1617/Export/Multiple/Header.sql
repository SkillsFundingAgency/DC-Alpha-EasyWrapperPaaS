select cast((
	select 
		(
			select 
				CollectionDetails.Collection,
				CollectionDetails.Year,
				cast(CollectionDetails.FilePreparationDate as date) FilePreparationDate 
			from 
				ILR1617.Header CollectionDetails 
			where 
				CollectionDetails.UKPRN=$(UKPRN) 
			for xml auto, type, elements
		),
		(
			select 
				'OFFICIAL-SENSITIVE-Personal' ProtectiveMarking,
				Source.UKPRN,
				Source.SoftwareSupplier,
				Source.SoftwarePackage,
				Source.Release,
				Source.SerialNo,
				cast(Source.DateTime as datetime) DateTime 
			from 
				ILR1617.Header Source 
			where 
				Source.UKPRN=$(UKPRN) 
			for xml auto, type, elements
		) 
	for xml path('Header'), type, elements
) as varchar(max))