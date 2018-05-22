using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml;
using System.Xml.Schema;

namespace XML2SQL
{
    public class SQLSchema
    {
        //private struct Key
        //{
        //    public string Name;
        //    public string Declaration;
        //}

        public static string NameSpace;
        public bool IncludeFileId;
        public bool CreateRelations = false;
        public bool Identity;
        public string TableNamePrefix;
        public SQLTableList Tables = new SQLTableList();
        public SQLTable FileTable;
        public XmlDocument TableHierarchy = new XmlDocument();

        private XmlDocument relationships;
        public XmlDocument Relationships
        {
            set
            {
                relationships = value;
                foreach (SQLTable table in Tables)
                    table.DefineKeys(value);
            }
            get
            {
                return relationships;
            }
        }

        public SQLTableList BottomUpTableList
        {
            get
            {
                return BuildBottomUpTableList();
            }
        }

        public SQLSchema(string XMLSchemaPath, bool identity, bool includeFileId = false)
        {
            //Store whether we are including a file id
            IncludeFileId = includeFileId;
            Identity = identity;

            //If required, create a table to hold the names and ids of multiple files
            if (includeFileId)
            {
                SQLDatabase.DropTable("__File");
                FileTable = new SQLTable();
                FileTable.Name = "__File";
                FileTable.Columns.Add(new SQLColumn("FileName", new SQLDataType("string", 255), true, false, FileTable));
                FileTable.Schema = this;
                FileTable.Create(false);
            }

            //Load the schema
            XmlSchemaSet ss = new XmlSchemaSet();
            ss.Add(null, XMLSchemaPath);

            //For each schema in the collection - ha, there's only ever one, but how else do you get to the schema collection?
            foreach (XmlSchema schema in ss.Schemas())
            {
                //Get the namespace
                NameSpace = schema.TargetNamespace;

                //Loop through the top-level elements - only be one of these too
                foreach (XmlSchemaElement schemaElement in schema.Elements.Values)
                {
                    //Cast the schema element to a particle 
                    XmlSchemaParticle schemaParticle = (XmlSchemaParticle)schemaElement;

                    //Point to the root of the table hierarchy 
                    XmlNode node = TableHierarchy;

                    //Recurse through all of the particles in the schema
                    TraverseParticle(schemaParticle, schema, node);
                }
            }
        }

        private void TraverseParticle(XmlSchemaParticle particle, XmlSchema schema, XmlNode tableHierarchyParent, SQLTable parentTable = null)
        {
            //If the particle is an element
            if (particle is XmlSchemaElement)
            {
                //Cast the particle to an element
                XmlSchemaElement element = (XmlSchemaElement)particle;

                //If the element has a schema type
                if (element.SchemaType != null)
                {
                    //Get the schema type
                    var schemaType = element.SchemaType;
                    if (schemaType is XmlSchemaSimpleType)
                    {
                        parentTable.Columns.Add(new SQLColumn(element.Name, (XmlSchemaSimpleType)schemaType, schema.SchemaTypes, element.MinOccurs > 0, false, parentTable));
                    }

                    //If the type is complex, then we'll need a table and we'll need to traverse the particles inside it
                    else if (schemaType is XmlSchemaComplexType)
                    {
                        var table = new SQLTable(element.Name, parentTable, this);
                        Tables.Add(table);
                        var complexType = schemaType as XmlSchemaComplexType;
                        var tableElement = TableHierarchy.CreateElement(table.Name);
                        tableHierarchyParent.AppendChild(tableElement);

                        if (complexType.Particle != null)
                        {
                            TraverseParticle(complexType.Particle, schema, tableElement, table);
                        }
                        else if (complexType.ContentModel != null)
                        {
                            if (complexType.ContentModel.Content is XmlSchemaComplexContentExtension)
                            {
                                var complexContentExtension = complexType.ContentModel.Content as XmlSchemaComplexContentExtension;
                                if (complexContentExtension.BaseTypeName.Namespace == NameSpace)
                                {
                                    //Get the schema type for the schema type name
                                    var contentSchemaType = (XmlSchemaType)schema.SchemaTypes[complexContentExtension.BaseTypeName];
                                    var contentComplexType = (XmlSchemaComplexType)contentSchemaType;
                                    //Check for and process attributes
                                    foreach (var schemaAttribute in contentComplexType.Attributes.OfType<XmlSchemaAttribute>())
                                    {
                                        if (schemaAttribute.SchemaTypeName.Namespace == NameSpace)
                                        {
                                            table.Columns.Add(new SQLColumn(schemaAttribute.Name, schemaAttribute.SchemaType, schema.SchemaTypes, (schemaAttribute.Use == XmlSchemaUse.Required), true, table));
                                        }
                                        else
                                        {
                                            table.Columns.Add(new SQLColumn(schemaAttribute.Name, new SQLDataType(schemaAttribute.SchemaTypeName.Name), (schemaAttribute.Use == XmlSchemaUse.Required), true, table));
                                        }
                                    }

                                    TraverseParticle(contentComplexType.Particle, schema, tableElement, table);
                                }
                            }
                        }
                    }
                    else
                        parentTable.Columns.Add(new SQLColumn(element.Name, new SQLDataType("unknown(1)"), element.MinOccurs > 0, false, parentTable));
                }
                //Element has no schemaType
                else
                {
                    //If the element has a schema type name in the IA namespace
                    if (element.SchemaTypeName.Namespace == NameSpace)
                    {
                        //Get the schema type for the schema type name
                        XmlSchemaType schemaType = (XmlSchemaType)schema.SchemaTypes[element.SchemaTypeName];
                        //If the type is complex, then we'll need a table and we'll need to traverse the particles inside it
                        if (schemaType is XmlSchemaComplexType)
                        {
                            SQLTable table = new SQLTable(element.Name, parentTable, this);
                            Tables.Add(table);
                            XmlSchemaComplexType complexType = (XmlSchemaComplexType)schemaType;
                            XmlElement tableElement = TableHierarchy.CreateElement(table.Name);
                            tableHierarchyParent.AppendChild(tableElement);
                            //Check for and process attributes
                            foreach (XmlSchemaAttribute schemaAttribute in complexType.Attributes)
                            {
                                if (schemaAttribute.SchemaTypeName.Namespace == NameSpace)
                                {
                                    table.Columns.Add(new SQLColumn(schemaAttribute.Name, (XmlSchemaSimpleType)schemaAttribute.SchemaType, schema.SchemaTypes, (schemaAttribute.Use == XmlSchemaUse.Required), true, table));
                                }
                                else
                                {
                                    table.Columns.Add(new SQLColumn(schemaAttribute.Name, new SQLDataType(schemaAttribute.SchemaTypeName.Name), (schemaAttribute.Use == XmlSchemaUse.Required), true, table));
                                }
                            }
                            TraverseParticle(complexType.Particle, schema, tableElement, table);
                        }
                        else if (schemaType is XmlSchemaSimpleType)
                            parentTable.Columns.Add(new SQLColumn(element.Name, (XmlSchemaSimpleType)schemaType, schema.SchemaTypes, element.MinOccurs > 0, false, parentTable));
                        else
                            parentTable.Columns.Add(new SQLColumn(element.Name, new SQLDataType("unknown(2)"), element.MinOccurs > 0, false, parentTable));
                    }
                    //A really simple type!
                    else
                        parentTable.Columns.Add(new SQLColumn(element.Name, new SQLDataType(element.SchemaTypeName.Name), element.MinOccurs > 0, false, parentTable));
                }
            }
            else if (particle is XmlSchemaGroupBase)
            {
                XmlSchemaGroupBase baseParticle = particle as XmlSchemaGroupBase;
                foreach (XmlSchemaParticle subParticle in baseParticle.Items)
                    TraverseParticle(subParticle, schema, tableHierarchyParent, parentTable);
            }
        }
        public XmlDocument GenerateBulkLoadSchemaWithIdentity()
        {
            XmlDocument bulkLoadSchema = new XmlDocument();
            bulkLoadSchema.AppendChild(bulkLoadSchema.CreateElement("xsd", "schema", "http://www.w3.org/2001/XMLSchema"));
            bulkLoadSchema.DocumentElement.SetAttribute("xmlns:sql", "urn:schemas-microsoft-com:mapping-schema");
            bulkLoadSchema.DocumentElement.SetAttribute("attributeFormDefault", "unqualified");
            bulkLoadSchema.DocumentElement.SetAttribute("elementFormDefault", "qualified");
            bulkLoadSchema.DocumentElement.SetAttribute("targetNamespace", NameSpace);

            XmlElement annotation = bulkLoadSchema.CreateElement("xsd", "annotation", "http://www.w3.org/2001/XMLSchema");
            XmlElement appinfo = bulkLoadSchema.CreateElement("xsd", "appinfo", "http://www.w3.org/2001/XMLSchema");
            annotation.AppendChild(appinfo);
            bulkLoadSchema.DocumentElement.AppendChild(annotation);

            Dictionary<string, string> tableRelationships = new Dictionary<string, string>();
            foreach (SQLTable table in Tables)
            {
                if (table.Parent != null && table.Parent.Columns.Count > 0)
                {
                    XmlElement sqlRelationship = bulkLoadSchema.CreateElement("sql", "relationship", "urn:schemas-microsoft-com:mapping-schema");
                    sqlRelationship.SetAttribute("name", table.Parent.Name + "_" + table.Name);
                    sqlRelationship.SetAttribute("parent", table.Parent.Name);
                    sqlRelationship.SetAttribute("parent-key", "PK_" + table.Parent.Name);
                    sqlRelationship.SetAttribute("child", table.Name);
                    sqlRelationship.SetAttribute("child-key", "FK_" + table.Parent.Name);
                    appinfo.AppendChild(sqlRelationship);
                    tableRelationships.Add(table.Name, table.Parent.Name + "_" + table.Name);
                }
            }

            AddTablesToBulkLoadSchemaWithIdentity(bulkLoadSchema.DocumentElement, TableHierarchy, tableRelationships);

            return bulkLoadSchema;
        }

        public XmlDocument GenerateBulkLoadSchema(XmlNode CurrentSchemaNode = null, XmlNode CurrentTableNode = null)
        {
            XmlDocument bulkLoadSchema = new XmlDocument();
            bulkLoadSchema.AppendChild(bulkLoadSchema.CreateElement("xsd", "schema", "http://www.w3.org/2001/XMLSchema"));
            bulkLoadSchema.DocumentElement.SetAttribute("xmlns:sql", "urn:schemas-microsoft-com:mapping-schema");
            bulkLoadSchema.DocumentElement.SetAttribute("attributeFormDefault", "unqualified");
            bulkLoadSchema.DocumentElement.SetAttribute("elementFormDefault", "qualified");
            bulkLoadSchema.DocumentElement.SetAttribute("targetNamespace", NameSpace);


            Dictionary<string, string> tableRelationships = new Dictionary<string, string>();
            if (Relationships != null)
            {
                XmlElement annotation = bulkLoadSchema.CreateElement("xsd", "annotation", "http://www.w3.org/2001/XMLSchema");
                XmlElement appinfo = bulkLoadSchema.CreateElement("xsd", "appinfo", "http://www.w3.org/2001/XMLSchema");
                annotation.AppendChild(appinfo);
                bulkLoadSchema.DocumentElement.AppendChild(annotation);

                XmlNodeList keyNodes = Relationships.SelectNodes("//__keys__");
                foreach (XmlNode keyNode in keyNodes)
                {
                    foreach (XmlNode childNode in keyNode.ParentNode.ChildNodes)
                    {
                        if (childNode.Name != "__keys__")
                        {
                            SQLTable thisTable = Tables[childNode.Name];
                            string keys = thisTable.InheritedKeyString;
                            XmlElement sqlRelationship = bulkLoadSchema.CreateElement("sql", "relationship", "urn:schemas-microsoft-com:mapping-schema");
                            sqlRelationship.SetAttribute("name", keyNode.ParentNode.Name + "_" + childNode.Name);
                            sqlRelationship.SetAttribute("parent", keyNode.ParentNode.Name);
                            sqlRelationship.SetAttribute("parent-key", keys);
                            sqlRelationship.SetAttribute("child", childNode.Name);
                            sqlRelationship.SetAttribute("child-key", keys);
                            appinfo.AppendChild(sqlRelationship);
                            tableRelationships.Add(childNode.Name, keyNode.ParentNode.Name + "_" + childNode.Name);
                        }
                    }
                }
            }

            AddTablesToBulkLoadSchema(bulkLoadSchema.DocumentElement, TableHierarchy, tableRelationships);

            return bulkLoadSchema;
        }

        public List<string> IndexCreationSQL
        {
            get
            {
                List<string> sql = new List<string>();

                foreach (SQLTable table in Tables)
                {
                    if (table.Keys.Count > 0)
                        if (table.HasPrimaryKey)
                        {
                            sql.Add("ALTER TABLE " + table.Name + " ADD CONSTRAINT PK_" + table.Name + " PRIMARY KEY CLUSTERED (" + table.Keys.ToString() + ")");
                        }
                        else
                            sql.Add("CREATE INDEX IX_" + table.Name + " ON " + table.Name + " (" + table.Keys.ToString() + ")");
                }

                return sql;
            }
        }

        public List<string> NotNullKeysSQL
        {
            get
            {
                List<string> sql = new List<string>();

                foreach (SQLTable table in Tables)
                    foreach (SQLColumn column in table.Keys)
                        sql.Add("alter table " + table.Name + " alter column " + column.Name + " " + column.SQLDeclaration + " not null");

                return sql;
            }
        }

        public void CreateIndices()
        {
            foreach (string sql in NotNullKeysSQL)
                SQLDatabase.Execute(sql);
            foreach (string sql in IndexCreationSQL)
                SQLDatabase.Execute(sql);
        }

        private void AddTablesToBulkLoadSchema(XmlNode CurrentSchemaNode, XmlNode CurrentTableNode, Dictionary<string, string> TableRelationships)
        {
            foreach (XmlElement tableElement in CurrentTableNode.ChildNodes)
            {
                XmlElement schemaElement = CurrentSchemaNode.OwnerDocument.CreateElement("xsd", "element", "http://www.w3.org/2001/XMLSchema");
                schemaElement.SetAttribute("name", tableElement.Name);
                if (Tables[tableElement.Name].Columns.Count == 0)
                {
                    XmlAttribute isConstant = CurrentSchemaNode.OwnerDocument.CreateAttribute("sql", "is-constant", "urn:schemas-microsoft-com:mapping-schema");
                    isConstant.Value = "1";
                    schemaElement.Attributes.Append(isConstant);
                }
                else
                {
                    XmlAttribute sqlRelation = CurrentSchemaNode.OwnerDocument.CreateAttribute("sql", "relation", "urn:schemas-microsoft-com:mapping-schema");
                    sqlRelation.Value = tableElement.Name;
                    schemaElement.Attributes.Append(sqlRelation);

                    if (TableRelationships.ContainsKey(tableElement.Name))
                    {
                        XmlAttribute sqlRelationship = CurrentSchemaNode.OwnerDocument.CreateAttribute("sql", "relationship", "urn:schemas-microsoft-com:mapping-schema");
                        sqlRelationship.Value = TableRelationships[tableElement.Name];
                        schemaElement.Attributes.Append(sqlRelationship);
                    }

                }
                CurrentSchemaNode.AppendChild(schemaElement);

                XmlElement complexType = CurrentSchemaNode.OwnerDocument.CreateElement("xsd", "complexType", "http://www.w3.org/2001/XMLSchema");
                schemaElement.AppendChild(complexType);
                XmlElement sequence = CurrentSchemaNode.OwnerDocument.CreateElement("xsd", "sequence", "http://www.w3.org/2001/XMLSchema");
                complexType.AppendChild(sequence);
                foreach (SQLColumn column in Tables[tableElement.Name].Keys)
                {
                    if (column.Table.Name != tableElement.Name)
                    {
                        XmlElement columnElement = CurrentSchemaNode.OwnerDocument.CreateElement("xsd", "element", "http://www.w3.org/2001/XMLSchema");
                        columnElement.SetAttribute("name", column.Name);
                        columnElement.SetAttribute("type", "xsd:" + column.DataType.Name);
                        XmlAttribute sqlTypeAttribute = CurrentSchemaNode.OwnerDocument.CreateAttribute("sql", "datatype", "urn:schemas-microsoft-com:mapping-schema");
                        sqlTypeAttribute.Value = column.SQLDeclaration;
                        columnElement.Attributes.Append(sqlTypeAttribute);
                        if (!column.Required)
                            columnElement.SetAttribute("minOccurs", "0");
                        sequence.AppendChild(columnElement);
                    }
                }
                foreach (SQLColumn column in Tables[tableElement.Name].Columns)
                {
                    XmlElement columnElement = CurrentSchemaNode.OwnerDocument.CreateElement("xsd", "element", "http://www.w3.org/2001/XMLSchema");
                    columnElement.SetAttribute("name", column.Name);
                    columnElement.SetAttribute("type", "xsd:" + column.DataType.Name);
                    XmlAttribute sqlTypeAttribute = CurrentSchemaNode.OwnerDocument.CreateAttribute("sql", "datatype", "urn:schemas-microsoft-com:mapping-schema");
                    sqlTypeAttribute.Value = column.SQLDeclaration;
                    columnElement.Attributes.Append(sqlTypeAttribute);
                    if (!column.Required)
                        columnElement.SetAttribute("minOccurs", "0");
                    sequence.AppendChild(columnElement);
                }


                AddTablesToBulkLoadSchema(sequence, tableElement, TableRelationships);

            }
        }

        private void AddTablesToBulkLoadSchemaWithIdentity(XmlNode CurrentSchemaNode, XmlNode CurrentTableNode, Dictionary<string, string> TableRelationships)
        {
            foreach (XmlElement tableElement in CurrentTableNode.ChildNodes)
            {
                XmlElement schemaElement = CurrentSchemaNode.OwnerDocument.CreateElement("xsd", "element", "http://www.w3.org/2001/XMLSchema");
                schemaElement.SetAttribute("name", tableElement.Name);
                if (Tables[tableElement.Name].Columns.Count == 0)
                {
                    XmlAttribute isConstant = CurrentSchemaNode.OwnerDocument.CreateAttribute("sql", "is-constant", "urn:schemas-microsoft-com:mapping-schema");
                    isConstant.Value = "1";
                    schemaElement.Attributes.Append(isConstant);
                }
                else
                {
                    XmlAttribute sqlRelation = CurrentSchemaNode.OwnerDocument.CreateAttribute("sql", "relation", "urn:schemas-microsoft-com:mapping-schema");
                    sqlRelation.Value = tableElement.Name;
                    schemaElement.Attributes.Append(sqlRelation);

                    if (TableRelationships.ContainsKey(tableElement.Name))
                    {
                        XmlAttribute sqlRelationship = CurrentSchemaNode.OwnerDocument.CreateAttribute("sql", "relationship", "urn:schemas-microsoft-com:mapping-schema");
                        sqlRelationship.Value = TableRelationships[tableElement.Name];
                        schemaElement.Attributes.Append(sqlRelationship);
                    }

                }
                CurrentSchemaNode.AppendChild(schemaElement);

                XmlElement complexType = CurrentSchemaNode.OwnerDocument.CreateElement("xsd", "complexType", "http://www.w3.org/2001/XMLSchema");
                schemaElement.AppendChild(complexType);
                XmlElement sequence = CurrentSchemaNode.OwnerDocument.CreateElement("xsd", "sequence", "http://www.w3.org/2001/XMLSchema");
                complexType.AppendChild(sequence);

                if (Tables[tableElement.Name].Columns.Count > 0)
                {
                    XmlElement primaryKeyElement = CurrentSchemaNode.OwnerDocument.CreateElement("xsd", "element", "http://www.w3.org/2001/XMLSchema");
                    primaryKeyElement.SetAttribute("name", "PK_" + tableElement.Name);
                    primaryKeyElement.SetAttribute("type", "xsd:int");
                    XmlAttribute sqlTypeAttribute = CurrentSchemaNode.OwnerDocument.CreateAttribute("sql", "datatype", "urn:schemas-microsoft-com:mapping-schema");
                    sqlTypeAttribute.Value = "int";
                    primaryKeyElement.Attributes.Append(sqlTypeAttribute);
                    sequence.AppendChild(primaryKeyElement);

                    if (Tables[tableElement.Name].Parent != null && Tables[tableElement.Name].Parent.Columns.Count > 0)
                    {
                        XmlElement parentKeyElement = CurrentSchemaNode.OwnerDocument.CreateElement("xsd", "element", "http://www.w3.org/2001/XMLSchema");
                        parentKeyElement.SetAttribute("name", "FK_" + Tables[tableElement.Name].Parent.Name);
                        parentKeyElement.SetAttribute("type", "xsd:int");
                        sqlTypeAttribute = CurrentSchemaNode.OwnerDocument.CreateAttribute("sql", "datatype", "urn:schemas-microsoft-com:mapping-schema");
                        sqlTypeAttribute.Value = "int";
                        parentKeyElement.Attributes.Append(sqlTypeAttribute);
                        sequence.AppendChild(parentKeyElement);
                    }

                    foreach (SQLColumn column in Tables[tableElement.Name].Columns)
                    {
                        XmlElement columnElement = CurrentSchemaNode.OwnerDocument.CreateElement("xsd", "element", "http://www.w3.org/2001/XMLSchema");
                        columnElement.SetAttribute("name", column.Name);
                        columnElement.SetAttribute("type", "xsd:" + column.DataType.Name);
                        sqlTypeAttribute = CurrentSchemaNode.OwnerDocument.CreateAttribute("sql", "datatype", "urn:schemas-microsoft-com:mapping-schema");
                        sqlTypeAttribute.Value = column.SQLDeclaration;
                        columnElement.Attributes.Append(sqlTypeAttribute);
                        if (!column.Required)
                            columnElement.SetAttribute("minOccurs", "0");
                        sequence.AppendChild(columnElement);
                    }
                }
                AddTablesToBulkLoadSchemaWithIdentity(sequence, tableElement, TableRelationships);

            }
        }

        public void CreateTables(bool CreateNamespaceTables, bool CreateNoColumnTables, bool Identity, string TableNamePrefix = "")
        {
            //Store the table name prefix
            TableNamePrefix = TableNamePrefix;

            //Create each of the schema tables
            foreach (SQLTable table in Tables)
                if (CreateNoColumnTables || table.Columns.Count > 0)
                    table.Create(CreateNoColumnTables);

            if (CreateNamespaceTables)
            {

                //Create tables to hold the namespace info and xml declarations
                string tableName = TableNamePrefix + "__XMLNamespaceStuff";
                SQLDatabase.DropTable(tableName);
                string sql = "create table [" + tableName + "] (";
                if (IncludeFileId)
                    sql += "PK_File long,";
                sql += "[name] varchar(255), [value] varchar(255))";
                SQLDatabase.Execute(sql);

                tableName = TableNamePrefix + "__XMLDeclaration";
                SQLDatabase.DropTable(tableName);
                sql = "create table [" + tableName + "] (";
                if (IncludeFileId)
                    sql += "PK_File long,";
                sql += "version varchar(255), encoding varchar(255), standalone varchar(255))";
                SQLDatabase.Execute(sql);

                tableName = TableNamePrefix + "__XMLSchemaInfo";
                SQLDatabase.DropTable(tableName);
                sql = "create table [" + tableName + "] (";
                if (IncludeFileId)
                    sql += "PK_File long,";
                sql += "namespace varchar(255))";
                SQLDatabase.Execute(sql);
                sql = "insert into [" + tableName + "] values('" + NameSpace + "')";
                SQLDatabase.Execute(sql);
            }
        }

        public void LoadXMLintoSQL(string InputFile)
        {
            //Load the XML into a document
            XmlDocument data = new XmlDocument();
            data.Load(InputFile);

            //Create a file record if we're doing that sort of thing
            if (IncludeFileId)
            {
                List<string> values = new List<string>();
                values.Add(InputFile);
                FileTable.Insert(values);
            }

            //Store the declaration from the document
            StoreDeclaration(data);

            //Get the namespace from the document element
            NameSpace = data.DocumentElement.NamespaceURI;

            //Store the namespace attributes for use when the XML is written out again
            StoreNamespaceStuff(data);

            //Process XML
            processXMLData(data.DocumentElement);
        }

        public void LoadXMLintoSQL(string[] InputFiles)
        {
            //Loop though the files loading each into the database
            foreach (string inputFile in InputFiles)
                LoadXMLintoSQL(inputFile);
        }


        private void StoreNamespaceStuff(XmlDocument Document)
        {
            string tableName = TableNamePrefix + "__XMLNamespaceStuff";
            SQLTable table = Tables[Document.DocumentElement.Name];

            foreach (XmlAttribute attribute in Document.DocumentElement.Attributes)
            {
                if (table.Columns[attribute.Name] == null)
                {
                    string sql = "insert into [" + tableName + "] values(";
                    if (IncludeFileId)
                        sql += FileTable.LastPK.ToString() + ",";
                    sql += "'" + attribute.Name + "',";
                    sql += "'" + attribute.Value + "'";
                    sql += ")";
                    SQLDatabase.Execute(sql);
                }
            }
        }
        private void StoreDeclaration(XmlDocument Document)
        {
            string tableName = TableNamePrefix + "__XMLDeclaration";

            if (Document.FirstChild is XmlDeclaration)
            {
                XmlDeclaration declaration = (XmlDeclaration)Document.FirstChild;

                string sql = "insert into [" + tableName + "] values(";
                if (IncludeFileId)
                    sql += FileTable.LastPK.ToString() + ",";
                sql += "'" + declaration.Version + "',";
                sql += "'" + declaration.Encoding + "',";
                sql += "'" + declaration.Standalone + "'";
                sql += ")";
                SQLDatabase.Execute(sql);
            }
        }
        private XmlDeclaration LoadDeclaration(XmlDocument Document)
        {
            string tableName = TableNamePrefix + "__XMLDeclaration";
            XmlDeclaration dec = null;
            var reader = SQLDatabase.ExecuteReader("select * from [" + tableName + "]");

            if (reader.Read())
                dec = Document.CreateXmlDeclaration(reader.GetString(reader.GetOrdinal("version")), reader.GetString(reader.GetOrdinal("encoding")), reader.GetString(reader.GetOrdinal("standalone")));
            reader.Close();
            return dec;
        }
        private string GetXMLDeclaration()
        {
            string tableName = TableNamePrefix + "__XMLDeclaration";
            var reader = SQLDatabase.ExecuteReader("select * from [" + tableName + "]");
            string result = "";
            if (reader.Read())
            {
                string version = reader.GetString(reader.GetOrdinal("version"));
                string encoding = reader.GetString(reader.GetOrdinal("encoding"));
                string standalone = reader.GetString(reader.GetOrdinal("standalone"));

                if (version.Length > 0 || encoding.Length > 0 || standalone.Length > 0)
                {
                    result = "<?xml";
                    if (version.Length > 0)
                        result += " version=\"" + version + "\"";
                    if (encoding.Length > 0)
                        result += " encoding=\"" + encoding + "\"";
                    if (standalone.Length > 0)
                        result += " standalone=\"" + standalone + "\"";
                    result += "?>";
                }
            }
            reader.Close();
            return result;
        }
        private void processXMLData(XmlNode Data)
        {
            //Insert the data
            Tables[Data.Name].Insert(Data);

            //Loop through all child nodes
            foreach (var child in Data.ChildNodes.OfType<XmlNode>())
            {
                //If the child has children of its own process it as it'll be a new record in a table
                if (child.HasChildNodes && child.FirstChild.NodeType != XmlNodeType.Text)
                    processXMLData(child);
            }
        }

        public void SaveSQLAsXML(string OutputFile)
        {
            //Create an empty XMLDocument for the output
            var xmlOutput = new XmlDocument();

            //Declare the encoding
            XmlDeclaration dec;
            if ((dec = LoadDeclaration(xmlOutput)) != null)
                xmlOutput.AppendChild(dec);

            //Traverse table hierarchy adding data to the XML
            TraverseTableHierarchy(TableHierarchy.DocumentElement, xmlOutput, xmlOutput);

            //Add any other namespace stuff to the document element
            AddNamespaceStuff(xmlOutput.DocumentElement);

            //Save the XML
            xmlOutput.Save(OutputFile);
        }

        private void AddNamespaceStuff(XmlElement Element)
        {
            string tableName = TableNamePrefix + "__XMLNamespaceStuff";
            string sql = "select [name],[value] from [" + tableName + "] where name like 'xmlns*' union select [name],[value] from [" + tableName + "] where name not like 'xmlns*'";
            var reader = SQLDatabase.ExecuteReader(sql);

            while (reader.Read())
            {
                string name = reader.GetString(0);
                string value = reader.GetString(1);
                if (name == "xmlns" && NameSpace.Length > 0 && NameSpace != value)
                    value = NameSpace;
                if (!name.StartsWith("xmlns") && name.Contains(":"))
                {
                    string[] nameParts = name.Split(':');
                    var nameSpaceUri = SQLDatabase.ExecuteScalarStatic<string>("select [value] from [" + tableName + "] where name='xmlns:" + nameParts[0] + "'").ToString();
                    Element.SetAttribute(nameParts[1], nameSpaceUri, value);
                }
                else
                    Element.SetAttribute(name, value);
            }
            reader.Close();
        }

        private void TraverseTableHierarchy(XmlNode TableHierarchyPoint, XmlDocument XmlOutput, XmlNode OutputNode, double? ParentKey = null)
        {
            //Get the table named in the xml node
            string tableName = TableHierarchyPoint.Name;
            var table = Tables[tableName];

            //Read each record in the table for parent record's key (if there is a parent)
            var reader = table.Select(ParentKey);
            while (reader.Read())
            {
                //Add data to XML
                XmlElement tableElement = XmlOutput.CreateElement(tableName, NameSpace);
                foreach (SQLColumn column in table.Columns)
                {
                    int ordinal = reader.GetOrdinal(column.Name);
                    if (!reader.IsDBNull(ordinal))
                    {
                        string value;
                        switch (column.DataType.NativeSQLDataType.ToLower())
                        {
                            case "text":
                                value = reader.GetString(ordinal);
                                break;
                            case "long":
                                value = reader.GetInt32(ordinal).ToString();
                                break;
                            case "float":
                            case "double":
                                value = reader.GetDouble(ordinal).ToString();
                                break;
                            case "datetime":
                                value = reader.GetDateTime(ordinal).ToString("yyyy-MM-ddTHH:mm:ss");
                                if (column.DataType.Name == "date")
                                    value = value.Substring(0, 10);
                                break;
                            default:
                                value = "Unhandled Data type " + column.DataType.NativeSQLDataType;
                                break;
                        }
                        if (column.IsAttribute)
                        {
                            tableElement.SetAttribute(column.Name, value);
                        }
                        else
                        {
                            XmlElement fieldElement = OutputNode.OwnerDocument.CreateElement(column.Name, NameSpace);
                            fieldElement.InnerText = value;
                            tableElement.AppendChild(fieldElement);
                        }
                    }
                }
                OutputNode.AppendChild(tableElement);

                //Process any child tables
                foreach (XmlNode childTableNode in TableHierarchyPoint.ChildNodes)
                    TraverseTableHierarchy(childTableNode, XmlOutput, tableElement, reader.GetDouble(reader.GetOrdinal("PK_" + tableName)));
            }
            reader.Close();
        }

        public void SaveSQLAsXMLQuickly(string OutputFile)
        {
            //Create a writer
            var writer = File.CreateText(OutputFile);

            //Declare the encoding
            string declaration = GetXMLDeclaration();
            if (declaration.Length > 0)
                writer.WriteLine(declaration);

            //Traverse table hierarchy adding data to the XML
            TraverseTableHierarchy(TableHierarchy.DocumentElement, writer);

            //Close the writer
            writer.Flush();
            writer.Close();
        }

        private string GetNamespaceStuff()
        {
            string namespaceStuff = "";
            string tableName = TableNamePrefix + "__XMLNamespaceStuff";
            string sql = "select [name],[value] from [" + tableName + "] where name like 'xmlns*' union select [name],[value] from [" + tableName + "] where name not like 'xmlns*'";
            var reader = SQLDatabase.ExecuteReader(sql);

            while (reader.Read())
            {
                string name = reader.GetString(0);
                string value = reader.GetString(1);
                if (name == "xmlns" && NameSpace.Length > 0 && NameSpace != value)
                    value = NameSpace;

                namespaceStuff += " " + name + "=\"" + value + "\"";
            }
            reader.Close();
            return namespaceStuff;
        }
        private void TraverseTableHierarchy(XmlNode TableHierarchyPoint, TextWriter Writer, string Indent = "", double? ParentKey = null)
        {
            //Get the table named in the xml node
            string tableName = TableHierarchyPoint.Name;
            var table = Tables[tableName];

            //Get the namespace stuff
            string namespaceStuff = null;
            if (ParentKey == null)
                namespaceStuff = GetNamespaceStuff();

            //Read each record in the table for parent record's key (if there is a parent)
            var reader = table.Select(ParentKey);
            while (reader.Read())
            {
                //Add data to XML
                if (ParentKey == null)
                    Writer.WriteLine(Indent + "<" + tableName + namespaceStuff + ">");
                else
                    Writer.WriteLine(Indent + "<" + tableName + ">");
                foreach (var column in table.Columns)
                {
                    int ordinal = reader.GetOrdinal(column.Name);
                    if (!reader.IsDBNull(ordinal))
                    {
                        string value;
                        switch (column.DataType.NativeSQLDataType.ToLower())
                        {
                            case "varchar":
                                value = reader.GetString(ordinal);
                                break;
                            case "bigint":
                                value = reader.GetInt64(ordinal).ToString();
                                break;
                            case "long":
                            case "int":
                                value = reader.GetInt32(ordinal).ToString();
                                break;
                            case "double":
                            case "float":
                                value = reader.GetDouble(ordinal).ToString();
                                break;
                            case "datetime":
                                value = reader.GetDateTime(ordinal).ToString("yyyy-MM-ddTHH:mm:ss");
                                if (column.DataType.Name == "date")
                                    value = value.Substring(0, 10);
                                break;
                            default:
                                value = "Unhandled Data type " + column.DataType.NativeSQLDataType;
                                break;
                        }
                        if (column.IsAttribute)
                        {
                            //tableElement.SetAttribute(column.Name, value);
                        }
                        else
                        {
                            Writer.WriteLine(Indent + "\t<" + column.Name + ">" + EscapeForXML(value) + "</" + column.Name + ">");
                        }
                    }
                }

                //Get the primary key to pass to the processing of the child nodes
                int parentKey = reader.GetInt32(reader.GetOrdinal("PK_" + tableName));

                //Process any child tables                
                foreach (var childTableNode in TableHierarchyPoint.ChildNodes.OfType<XmlNode>())
                    TraverseTableHierarchy(childTableNode, Writer, Indent + "\t", parentKey);
                Writer.WriteLine(Indent + "</" + tableName + ">");

            }
            if (!reader.IsClosed)
                reader.Close();
        }

        private string EscapeForXML(string Value)
        {
            Value = Value.Replace("&", "&amp;");
            Value = Value.Replace("<", "&lt;");
            Value = Value.Replace(">", "&gt;");
            Value = Value.Replace("\"", "&quot;");
            Value = Value.Replace("'", "&apos;");

            return Value;
        }

        private SQLTableList BuildBottomUpTableList(SQLTableList Tables = null, XmlNode TableNode = null)
        {
            if (Tables == null)
                Tables = new SQLTableList();
            if (TableNode == null)
                TableNode = TableHierarchy.DocumentElement;

            foreach (XmlNode childTableNode in TableNode.ChildNodes)
                Tables = BuildBottomUpTableList(Tables, childTableNode);

            Tables.Add(Tables[TableNode.Name]);

            return Tables;
        }
    }
}
