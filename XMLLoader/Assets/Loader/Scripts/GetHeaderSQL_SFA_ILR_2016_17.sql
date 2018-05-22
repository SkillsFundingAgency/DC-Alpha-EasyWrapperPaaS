select cast(
	(
		select 
		(
			select 
				[Collection],
				[Year],
				cast([FilePreparationDate] as date) as FilePreparationDate 
			from 
				[CollectionDetails]
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
				[Source]
			for xml auto, 
			type, 
			elements
		) 
		for xml path('Header'), 
		type, 
		elements
	) as varchar(max)
)