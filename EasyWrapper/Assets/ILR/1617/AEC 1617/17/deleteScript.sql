declare @ukprn int;
declare @year varchar(4) = '$(year)';

set @ukprn = (select UKPRN from [Valid].[LearningProvider]);

if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_global' and TABLE_SCHEMA = 'dbo')
begin
	delete from [$(FromILRDatabase)].[dbo].[AEC_global] where UKPRN = @ukprn and [Year] = @year
end

if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_LearningDelivery' and TABLE_SCHEMA = 'dbo')
begin
	delete from [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery] where UKPRN = @ukprn and [Year] = @year
end

if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_LearningDelivery_Period' and TABLE_SCHEMA = 'dbo')
begin
	delete from [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_Period] where [UKPRN] = @ukprn and [Year] = @year
end

if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_LearningDelivery_PeriodisedValues' and TABLE_SCHEMA = 'dbo')
begin
	delete from [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_PeriodisedValues] where [UKPRN] = @ukprn and [Year] = @year
end

if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_LearningDelivery_PeriodisedTextValues' and TABLE_SCHEMA = 'dbo')
begin
	delete from [$(FromILRDatabase)].[dbo].[AEC_LearningDelivery_PeriodisedTextValues] where [UKPRN] = @ukprn and [Year] = @year
end

if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].TABLES where TABLE_NAME = 'AEC_ApprenticeshipPriceEpisode' and TABLE_SCHEMA = 'dbo')
begin
	delete from [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode] where [UKPRN] = @ukprn and [Year] = @year
end

if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_ApprenticeshipPriceEpisode_Period' and TABLE_SCHEMA = 'dbo')
begin
	delete from [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_Period] where [UKPRN] = @ukprn and [Year] = @year
end

if exists (select * from [$(FromILRDatabase)].[INFORMATION_SCHEMA].[TABLES] where TABLE_NAME = 'AEC_ApprenticeshipPriceEpisode_PeriodisedValues' and TABLE_SCHEMA = 'dbo')
begin
	delete from [$(FromILRDatabase)].[dbo].[AEC_ApprenticeshipPriceEpisode_PeriodisedValues] where [UKPRN] = @ukprn and [Year] = @year
end
go