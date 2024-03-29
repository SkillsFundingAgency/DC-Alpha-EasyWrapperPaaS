--create procedure [dbo].[ClearStageTables] AS

--	begin

--		set nocount on

--		declare truncursor cursor for 
--			(
--				select 
--					'truncate table ' + s.name + '.' + t.name
--				from
--					sys.schemas s
--					inner join sys.tables t
--						on s.schema_id=t.schema_id
--				where
--					s.name in ('Input','Valid','Invalid')
--			)
--		open truncursor

--		declare @sql varchar(1024)
--		fetch next from truncursor into @sql

--		while @@fetch_status=0 begin
--			exec(@sql)
--			fetch next from truncursor into @sql
--		end

--		close truncursor
--		deallocate truncursor

--	end

--go

--create procedure [dbo].[ClearTargetTables] AS

--	begin

--		set nocount on

--		declare truncursor cursor for 
--			(
--				select 
--					'truncate table ' + s.name + '.' + t.name
--				from
--					sys.schemas s
--					inner join sys.tables t
--						on s.schema_id=t.schema_id
--				where
--					s.name in ('Rulebase')
--			)
--		open truncursor

--		declare @sql varchar(1024)
--		fetch next from truncursor into @sql

--		while @@fetch_status=0 begin
--			exec(@sql)
--			fetch next from truncursor into @sql
--		end

--		close truncursor
--		deallocate truncursor

--	end


if object_id('ClearStageTables', 'p') is not null
begin
	exec ('drop procedure ClearStageTables');
end
go

create procedure ClearStageTables as 
begin
	exec sp_msforeachtable @command1 = 'truncate table ?', @whereand = 'and schema_id = schema_id(''Input'')';
	exec sp_msforeachtable @command1 = 'truncate table ?', @whereand = 'and schema_id = schema_id(''Invalid'')';
	exec sp_msforeachtable @command1 = 'truncate table ?', @whereand = 'and schema_id = schema_id(''Valid'')';
end
go

if object_id('ClearTargetTables', 'p') is not null
begin
	exec ('drop procedure ClearTargetTables');
end
go

create procedure ClearTargetTables as 
begin
	exec sp_msforeachtable @command1 = 'truncate table ?', @whereand = 'and Schema_Id = Schema_Id(''Rulebase'')';
end
go