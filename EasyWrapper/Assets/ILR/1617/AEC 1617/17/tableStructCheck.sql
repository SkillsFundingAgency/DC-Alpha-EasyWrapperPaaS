--AEC_LearningDelivery
if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_LearningDelivery' and TABLE_SCHEMA = 'dbo')
begin
	if not exists (select * from [$(FromILRDatabase)].INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME = 'UKPRN' and TABLE_NAME = 'AEC_LearningDelivery' and TABLE_SCHEMA = 'dbo')
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery]
		add [UKPRN] int null
	end

	if not exists (select * from [$(FromILRDatabase)].INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME = 'Year' and TABLE_NAME = 'AEC_LearningDelivery' and TABLE_SCHEMA = 'dbo')
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery]
		add [Year] varchar(4) null
	end
end
go

--AEC_LearningDelivery_Period
if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_LearningDelivery_Period' and TABLE_SCHEMA = 'dbo')
begin
	if not exists (select * from [$(FromILRDatabase)].INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME = 'UKPRN' and TABLE_NAME = 'AEC_LearningDelivery_Period' and TABLE_SCHEMA = 'dbo')
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_Period]
		add [UKPRN] int null
	end

	if not exists (select * from [$(FromILRDatabase)].INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME = 'Year' and TABLE_NAME = 'AEC_LearningDelivery_Period' and TABLE_SCHEMA = 'dbo')
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_Period]
		add [Year] varchar(4)
	end
end

--AEC_LearningDelivery_PeriodisedValues
if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_LearningDelivery_PeriodisedValues' and TABLE_SCHEMA = 'dbo')
begin
	if not exists (select * from [$(FromILRDatabase)].INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME = 'UKPRN' and TABLE_NAME = 'AEC_LearningDelivery_PeriodisedValues' and TABLE_SCHEMA = 'dbo')
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_PeriodisedValues]
		add UKPRN int null
	end

	if not exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[COLUMNS] where COLUMN_NAME = 'Year' and TABLE_NAME = 'AEC_LearningDelivery_PeriodisedValues' and TABLE_SCHEMA = 'dbo')
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_PeriodisedValues]
		add [Year] varchar(4) null
	end
end

--AEC_LearningDelivery_PeriodisedTextValues
if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_LearningDelivery_PeriodisedTextValues' and TABLE_SCHEMA = 'dbo')
begin
	if not exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[COLUMNS] where COLUMN_NAME = 'UKPRN' and TABLE_NAME = 'AEC_LearningDelivery_PeriodisedTextValues' and TABLE_SCHEMA = 'dbo')
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_PeriodisedTextValues]
		add UKPRN int null
	end

	if not exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[COLUMNS] where COLUMN_NAME = 'Year' and TABLE_NAME = 'AEC_LearningDelivery_PeriodisedTextValues' and TABLE_SCHEMA = 'dbo')
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_PeriodisedTextValues]
		add [Year] varchar(4) null
	end
end

--AEC_ApprenticeshipPriceEpisode
if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_ApprenticeshipPriceEpisode' and TABLE_SCHEMA = 'dbo')
begin
	if not exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[COLUMNS] where COLUMN_NAME = 'UKPRN' and TABLE_NAME = 'AEC_ApprenticeshipPriceEpisode' and TABLE_SCHEMA = 'dbo')
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode]
		add [UKPRN] int null
	end

	if not exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[COLUMNS] where COLUMN_NAME = 'Year' and TABLE_NAME = 'AEC_ApprenticeshipPriceEpisode' and TABLE_SCHEMA = 'dbo')
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode]
		add [Year] varchar(4) null
	end
end

--AEC_ApprenticeshipPriceEpisode_Period
if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_ApprenticeshipPriceEpisode_Period' and TABLE_SCHEMA = 'dbo')
begin
	if not exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[COLUMNS] where COLUMN_NAME = 'UKPRN' and TABLE_NAME = 'AEC_ApprenticeshipPriceEpisode_Period' and TABLE_SCHEMA = 'dbo') 
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_Period]
		add [UKPRN] int null
	end

	if not exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[COLUMNS] where COLUMN_NAME = 'Year' and TABLE_NAME = 'AEC_ApprenticeshipPriceEpisode_Period' and TABLE_SCHEMA = 'dbo')
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_Period]
		add [Year] varchar(4)
	end
end

--AEC_ApprenticeshipPriceEpisode_PeriodisedTextValues
if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_ApprenticeshipPriceEpisode_PeriodisedValues' and TABLE_SCHEMA = 'dbo')
begin
	if not exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[COLUMNS] where COLUMN_NAME = 'UKPRN' and TABLE_NAME = 'AEC_ApprenticeshipPriceEpisode_PeriodisedValues' and TABLE_SCHEMA = 'dbo')
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_PeriodisedValues]
		add UKPRN int null
	end

	if not exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[COLUMNS] where COLUMN_NAME = 'Year' and TABLE_NAME = 'AEC_ApprenticeshipPriceEpisode_PeriodisedValues' and TABLE_SCHEMA = 'dbo')
	begin
		alter table [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_PeriodisedValues]
		add [Year] varchar(4) null
	end
end