namespace XML2SQL
{
    public class SQLDataType
    {
        public string Name;
        public int Size;

        public SQLDataType()
        {
        }

        public SQLDataType(string name)
        {
            Name = name;
        }

        public SQLDataType(string name, int size)
        {
            Name = name;
            Size = size;
        }

        public string NativeSQLDataType
        {
            get
            {
                if (Name.Length > 0)
                {
                    switch (Name.ToLower())
                    {
                        case "string":
                            return "varchar";
                        case "positiveinteger":
                        case "int":
                        case "integer":
                        case "long":
                            if (Size > 9 || Size == 0)
                                return "bigint";
                            else
                                return "int";
                        case "datetime":
                        case "date":
                            return "datetime";
                        case "decimal":
                            return "float";
                        case "boolean":
                            return "bit";
                        default:
                            return "unhandledType: " + Name.ToLower();
                    }
                }
                else
                {
                    return string.Empty;
                }
            }
        }
    }
}
