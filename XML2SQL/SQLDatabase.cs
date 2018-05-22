using System;
using System.Data;
using System.Data.SqlClient;

namespace XML2SQL
{
    public class SQLDatabase : IDisposable
    {
        public static SqlConnection Connection { get; private set; }

        public SQLDatabase(string connectionString)
        {
            Connection = new SqlConnection(connectionString);
        }

        public void Open()
        {
            Connection.Open();
        }

        public static void Open(string ConnectionString)
        {
            //Open database connection
            Connection = new SqlConnection(ConnectionString);
            Connection.Open();
        }

        public static void Close()
        {
            if (Connection.State == ConnectionState.Open)
                Connection.Close();
        }

        public static IDbCommand GetCommand(string SQL)
        {
            var command = new SqlCommand(SQL);
            command.CommandType = CommandType.Text;
            command.Connection = Connection;

            return command;
        }

        public static void ExecuteReaderAction(string sql, Action<IDataReader> action)
        {
            using(var reader = ExecuteReader(sql))
            {
                while (reader.Read())
                {
                    action(reader);
                }
            }
        }

        public static IDataReader ExecuteReader(string SQL)
        {
            var command = GetCommand(SQL);

            return command.ExecuteReader();
        }

        public static TReturnType ExecuteScalarStatic<TReturnType>(string SQL)
        {
            var command = GetCommand(SQL);
            command.CommandTimeout = 900; // ??

            return (TReturnType)command.ExecuteScalar();
        }

        public TReturnType ExecuteScalar<TReturnType>(string sql)
        {
            return (TReturnType)new SqlCommand(sql, Connection).ExecuteScalar();
        }

        public static void Execute(string SQL)
        {
            var command = GetCommand(SQL);
            command.CommandTimeout = 600; // ??

            command.ExecuteNonQuery();
        }

        public static void DropTable(string TableName)
        {
            try
            {
                Execute("drop table [" + TableName + "]");
            }
            catch (Exception e)
            {
            }
        }

        public static void CreateDatabase(string DatabaseName)
        {
            Execute("create database [" + DatabaseName + "]");
            Execute("alter database [" + DatabaseName + "] set auto_close off with no_wait");
        }

        public enum ObjectType { DATABASE = 0, USER_TABLE = 1 };

        public static bool Exists(string Name, ObjectType Type)
        {
            string sql;
            switch (Type)
            {
                case ObjectType.DATABASE:
                    sql = "select count(*) from sys.databases where name='" + Name + "'";
                    break;
                default:
                    sql = "select count(*) from sys.objects where name='" + Name + "' and type_desc='" + Type.ToString() + "'";
                    break;
            }

            var count = ExecuteScalarStatic<int>(sql);
            return (count > 0);
        }

        public static void Empty()
        {
            var restrictions = new string[4];

            restrictions[3] = "Table";
            var userTables = Connection.GetSchema("Tables", restrictions);

            for (int i = 0; i < userTables.Rows.Count; i++)
                DropTable(userTables.Rows[i][2].ToString());
        }

        public static void Empty(SQLSchema Schema)
        {
            var tables = Schema.BottomUpTableList;

            foreach (var table in tables)
            {
                string tableName = table.Name;

                if (Schema.TableNamePrefix != null)
                    tableName = Schema.TableNamePrefix + tableName;

                DropTable(tableName);
            }
        }

        public static void DeleteFrom(SQLSchema Schema)
        {
            var tables = Schema.BottomUpTableList;

            foreach (var table in tables)
            {
                string tableName = table.Name;

                if (Schema.TableNamePrefix != null)
                    tableName = Schema.TableNamePrefix + tableName;

                string sql = "delete from [" + tableName + "]";

                Execute(sql);
            }
        }

        public void Dispose()
        {
            Connection.Dispose();
        }
    }
}
