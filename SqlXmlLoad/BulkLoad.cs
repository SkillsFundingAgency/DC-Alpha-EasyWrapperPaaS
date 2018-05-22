using SQLXMLBULKLOADLib;

namespace SqlXmlLoad
{
    public class BulkLoad
    {
        public static void Load(string ilrPath, string schema, string srvr, string db, string security, bool createTables)
        {
            var loader = new SQLXMLBulkLoad4();
            loader.ConnectionString = $"Provider=sqloledb;Server={srvr};Database={db};{security};";
            loader.ErrorLogFile = "LoadErrors.xml";
            loader.KeepIdentity = false;
            loader.SGDropTables = createTables;
            loader.SchemaGen = createTables;

            loader.Execute(schema, ilrPath);
        }
    }
}
