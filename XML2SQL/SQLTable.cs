using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using System.Data;
using System.Data.SqlClient;

namespace XML2SQL
{
    public class SQLTable
    {
        public SQLTable Parent;
        public string Name;
        public SQLColumnList Columns = new SQLColumnList();
        public SQLColumnList Keys = new SQLColumnList();
        public int LastPK = 0;
        public SQLSchema Schema;

        public SQLTable()
        {
        }
        public SQLTable(string name, SQLSchema schema)
        {
            Name = name;
            Schema = schema;
        }
        public SQLTable(string name, SQLTable parent, SQLSchema schema)
        {
            Name = name;
            Parent = parent;
            Schema = schema;
        }

        public string CreateTableSQL
        {
            get
            {
                string tableName = Schema.TableNamePrefix + Name;
                string sql = "create table [" + tableName + "] (";
                if (Schema.IncludeFileId && Name != "__File")
                    sql += "[PK_File] int,";
                sql += "[PK_" + Name + "] int,";
                if (Parent != null)
                    sql += "[FK_" + Parent.Name + "] int not null,";
                foreach (SQLColumn column in Columns)
                    sql += column.CreateColumnSQL + ",";
                sql += " constraint " + tableName + "_PK primary key (" + (Schema.IncludeFileId && Name != "__File" ? "PK_File," : "") + "[PK_" + Name + "])";
                sql += ")";

                return sql;
            }
        }
        public string CreateTableWithIdentitySQL
        {
            get
            {
                string tableName = Schema.TableNamePrefix + Name;
                string sql = "create table [" + tableName + "] (";
                if (Schema.IncludeFileId && Name != "__File")
                    sql += "[PK_File] int,";
                sql += "[PK_" + Name + "] int identity,";
                if (Parent != null)
                    sql += "[FK_" + Parent.Name + "] int not null,";
                foreach (SQLColumn column in Columns)
                    sql += column.CreateColumnSQL + ",";
                sql += " constraint " + tableName + "_PK primary key (" + (Schema.IncludeFileId && Name != "__File" ? "PK_File," : "") + "[PK_" + Name + "])";
                sql += ")";

                return sql;
            }
        }

        public string CreateTableOmmittingNoColumnParentSQL
        {
            get
            {
                string tableName = Schema.TableNamePrefix + Name;
                string sql = "create table [" + tableName + "] (";
                if (Schema.IncludeFileId && Name != "__File")
                    sql += "[PK_File] int,";
                sql += "[PK_" + Name + "] int identity,";
                if (Parent != null && Parent.Columns.Count > 0)
                    sql += "[FK_" + Parent.Name + "] int not null,";
                foreach (SQLColumn column in Columns)
                    sql += column.CreateColumnSQL + ",";
                sql += " constraint " + tableName + "_PK primary key (" + (Schema.IncludeFileId && Name != "__File" ? "PK_File," : "") + "[PK_" + Name + "])";
                sql += ")";

                return sql;
            }
        }

        public string CreateMainIndexSQL
        {
            get
            {
                string tableName = Schema.TableNamePrefix + Name;
                string sql = "create index [IDX_" + tableName + "] on [" + tableName + "] (";
                if (Schema.IncludeFileId)
                    sql += "[PK_File] asc,";
                if (Parent != null)
                    sql += "[FK_" + Parent.Name + "] asc,";
                sql += "[PK_" + Name + "] asc)";

                return sql;
            }
        }

        public string CreateMainIndexSQLOmmittingNoColumnParent
        {
            get
            {
                string tableName = Schema.TableNamePrefix + Name;
                string sql = "create index [IDX_" + tableName + "] on [" + tableName + "] (";
                if (Schema.IncludeFileId)
                    sql += "[PK_File] asc,";
                if (Parent != null && Parent.Columns.Count > 0)
                    sql += "[FK_" + Parent.Name + "] asc,";
                sql += "[PK_" + Name + "] asc)";

                return sql;
            }
        }

        public string CreateForeignKeyConstraintSQL
        {
            get
            {
                if (Parent == null)
                    return null;

                string thisTableName = Schema.TableNamePrefix + Name;
                string parentTableName = Schema.TableNamePrefix + Parent.Name;
                string sql = "alter table [" + thisTableName + "] add constraint [FK_" + thisTableName + "] foreign key([FK_" + Parent.Name + "]) references [" + parentTableName + "]([PK_" + Parent.Name + "])";

                return sql;
            }
        }

        public string DropTableSQL
        {
            get
            {
                return "drop table[" + Schema.TableNamePrefix + Name + "]";
            }
        }

        public string ColumnsString
        {
            get
            {
                string columnString = "[PK_" + Name + "]";
                if (Parent != null)
                    columnString += ",[FK_" + Parent.Name + "]";
                foreach (SQLColumn column in Columns)
                    columnString += ",[" + column.Name + "]";
                return columnString;
            }
        }

        public void Create(bool CreateNoColumnTables)
        {
            Drop();
            if (CreateNoColumnTables)
            {
                SQLDatabase.Execute(Schema.Identity ? CreateTableWithIdentitySQL : CreateTableSQL);
                SQLDatabase.Execute(CreateMainIndexSQL);
            }
            else
            {
                SQLDatabase.Execute(CreateTableOmmittingNoColumnParentSQL);
                SQLDatabase.Execute(CreateMainIndexSQLOmmittingNoColumnParent);
            }
            if (Schema.CreateRelations && Parent != null && (CreateNoColumnTables || Parent.Columns.Count() > 0))
                SQLDatabase.Execute(CreateForeignKeyConstraintSQL);
        }

        public void Drop()
        {
            try
            {
                SQLDatabase.Execute(DropTableSQL);
            }
            catch (Exception e)
            {
            }
        }

        public string InsertSQL(XmlNode Data)
        {
            //Set up a stupid namespace thing or else select single node doesn't work
            XmlNamespaceManager nsManager = new XmlNamespaceManager(Data.OwnerDocument.NameTable);
            nsManager.AddNamespace("ia", SQLSchema.NameSpace);

            //Start building the string with the insert SQL
            string tableName = Schema.TableNamePrefix + Name;
            string sql = "insert into [" + tableName + "]";
            sql += "(" + ColumnsString + ")";
            sql += " values(";

            //If not loading the __File table itself and we're using file Ids then add the file Id 
            if (Schema.IncludeFileId && Name != "__File")
                sql += (Schema.FileTable.LastPK).ToString() + ",";

            //Add the primary key field value to the insert SQL and the node
            sql += (++LastPK).ToString() + ",";
            XmlElement pk = Data.OwnerDocument.CreateElement("PK_" + Name);
            pk.InnerText = LastPK.ToString();
            Data.AppendChild(pk);

            //Add the parent's PK if there is one
            if (Parent != null)
            {
                XmlNode fkNode = Data.ParentNode.SelectSingleNode("PK_" + Parent.Name);
                if (fkNode != null)
                {
                    sql += fkNode.InnerText + ",";
                    XmlElement fk = Data.OwnerDocument.CreateElement("FK_" + Parent.Name);
                    fk.InnerText = fkNode.InnerText;
                    Data.AppendChild(fk);
                }
            }

            //Add data for each column
            foreach (SQLColumn column in Columns)
            {
                string value = null;

                if (column.IsAttribute && Data.Attributes[column.Name] != null)
                {
                    value = Data.Attributes[column.Name].Value;
                }
                else
                {
                    //Get the node for the column
                    XmlNode columnNode = Data.SelectSingleNode("ia:" + column.Name, nsManager);

                    //If we find the node, append the value to the sql with appropriate delimiters
                    if (columnNode != null && columnNode.InnerText.Length > 0)
                    {
                        value = columnNode.InnerText;
                    }
                }

                if (value != null)
                {
                    switch (column.DataType.Name.ToLower())
                    {
                        case "string":
                            sql += "'" + ((string)value).Replace("'", "''") + "',";
                            break;
                        case "date":
                        case "datetime":
                            if ((value.Contains("0000-")) || (value.Contains("0001-")))
                            {
                                // Added by PC as had issue loading into DateTime column. Must be aftyer 1754-01-01
                                value = value.ToString().Replace("0000-", "1800-").Replace("0001-", "1800-");
                            }
                            DateTime dateTime = XmlConvert.ToDateTime(value);
                            sql += "'" + dateTime.ToString("yyyy-MMM-dd HH:mm:ss") + "',";
                            break;
                        default:
                            sql += value + ",";
                            break;
                    }
                }
                else
                    sql += "null,";
            }

            //Drop the trailing comma and add a closing bracket to complete the sql statement
            sql = sql.Substring(0, sql.Length - 1) + ")";

            return sql;
        }

        public string InsertSQL(List<string> Values)
        {
            //Start building the string with the insert SQL
            string tableName = Schema.TableNamePrefix + Name;
            string sql = "insert into [" + tableName + "] values(";

            //If not loading the __File table itself and we're using file Ids then add the file Id 
            if (Schema.IncludeFileId && Name != "__File")
                sql += (Schema.FileTable.LastPK).ToString() + ",";

            //Add the primary key field value to the insert SQL and the node
            sql += (++LastPK).ToString() + ",";

            //Add data for each column
            for (int i = 0; i < Columns.Count; i++)
            {
                SQLColumn column = Columns[i];
                string value = Values[i];

                if (value != null)
                {
                    switch (column.DataType.Name.ToLower())
                    {
                        case "string":
                            sql += "'" + value.Replace("'", "''") + "',";
                            break;
                        case "date":
                        case "datetime":
                            DateTime dateTime = XmlConvert.ToDateTime(value);
                            sql += "#" + dateTime.ToString("yyyy-MM-dd HH:mm:ss") + "#,";
                            break;
                        default:
                            sql += value + ",";
                            break;
                    }
                }
                else
                    sql += "null,";
            }

            //Drop the trailing comma and add a closing bracket to complete the sql statement
            sql = sql.Substring(0, sql.Length - 1) + ")";

            return sql;
        }

        public void Insert(XmlNode Data)
        {
            SQLDatabase.Execute("SET IDENTITY_INSERT [" + Schema.TableNamePrefix + Name + "] ON");
            SQLDatabase.Execute(InsertSQL(Data));
            SQLDatabase.Execute("SET IDENTITY_INSERT [" + Schema.TableNamePrefix + Name + "] OFF");
        }

        public void Insert(List<string> Values)
        {
            SQLDatabase.Execute(InsertSQL(Values));
        }

        public string SelectSQL(double? ParentKey = null)
        {
            string tableName = Schema.TableNamePrefix + Name;
            string sql = "select * from [" + tableName + "]";
            if (Parent != null && ParentKey != null)
                sql += " where [FK_" + Parent.Name + "]=" + ParentKey.ToString();
            sql += " order by [PK_" + Name + "]";
            return sql;
        }

        public IDataReader Select(double? ParentKey = null)
        {
            return SQLDatabase.ExecuteReader(SelectSQL(ParentKey));
        }

        public void DefineKeys(XmlDocument KeyDefinitions)
        {
            XmlNode tableNode = KeyDefinitions.SelectSingleNode("//" + Name);
            if (tableNode != null)
                Keys = GetKeys(tableNode);
        }

        public string InheritedKeyString
        {
            get
            {
                string inheritedKeyString = "";
                if (Keys != null)
                    foreach (SQLColumn column in Keys)
                    {
                        if (column != null && column.Table != this)
                            inheritedKeyString += " " + column.Name;
                    }

                return inheritedKeyString.Trim();
            }
        }

        public bool HasPrimaryKey
        {
            get
            {
                foreach (SQLColumn column in Keys)
                {
                    if (column.Table == this)
                    {
                        return true;
                    }
                }

                return false;
            }
        }

        private SQLColumnList GetKeys(XmlNode node, SQLColumnList keys = null)
        {
            if (keys == null)
            {
                keys = new SQLColumnList();
            }

            var keyNode = node.SelectSingleNode("./__keys__");
            if (keyNode != null)
            {
                var localKeys = new SQLColumnList();
                foreach (XmlNode key in keyNode.ChildNodes)
                {
                    localKeys.Add(Schema.Tables[node.Name].Columns[key.Name]);
                }

                keys.InsertRange(0, localKeys);
            }

            if (node.ParentNode != null)
            {
                keys = GetKeys(node.ParentNode, keys);
            }

            return keys;
        }
    }
}
