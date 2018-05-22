declare @sql nvarchar(max)

set @sql='select ukprn from [$(FromILRDatabase)].[$(FromILRSchema)].[LearningProvider]'

if len('$(UKPRNList)')>0
	set @sql=@sql+' where UKPRN in ($(UKPRNList))'

set @sql=@sql+' order by ukprn'

exec sp_executesql @sql