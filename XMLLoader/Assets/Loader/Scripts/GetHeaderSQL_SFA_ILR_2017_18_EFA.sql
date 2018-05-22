select cast(
	(
		select 
		(
			select 
				[Collection],
				[Year],
				cast([FilePreparationDate] as date) as FilePreparationDate 
			from 
				Valid.[CollectionDetails] as CollectionDetails
			where
				UKPRN = ${ukprn}
			for xml auto, type, elements
		)
		,(
			select 
				[ProtectiveMarking]
				,[UKPRN]
				,[SoftwareSupplier]
				,[SoftwarePackage]
				,[Release]
				,[SerialNo]
				,[DateTime]
				,[ReferenceData]
				,[ComponentSetVersion] 
			from 
				Valid.[Source] as [Source]
			where
				UKPRN = ${ukprn}
			for xml auto, 
			type, 
			elements
		) 
		for xml path('Header'), 
		type, 
		elements
	) as varchar(max)
)