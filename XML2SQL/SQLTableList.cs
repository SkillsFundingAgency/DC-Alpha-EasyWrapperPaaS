using System; 
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace XML2SQL
{
    public class SQLTableList:List<SQLTable>
    {
        public SQLTable this[string TableName]
        {
            get
            {
                var matchingTables = from table in this where table.Name == TableName select table;
                foreach (SQLTable table in matchingTables)
                {
                    return table;
                }
                return null;
            }
        }
    }
}
