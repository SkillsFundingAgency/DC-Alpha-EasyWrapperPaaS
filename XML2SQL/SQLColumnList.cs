using System; 
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace XML2SQL
{
    public class SQLColumnList : List<SQLColumn>
    {
        public SQLColumn this[string ColumnName]
        {
            get
            {
                var matchingColumns=from column in this where column.Name == ColumnName select column;
                foreach (SQLColumn column in matchingColumns)
                {
                    return column;
                }
                return null;
            }
        }
        public override string ToString()
        {
            string result = "";
            foreach (SQLColumn column in this)
                result += "," + column.Name;
            return result.Substring(1);
        }
    }
}
