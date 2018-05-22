using System.Data.SqlClient;

namespace EasyWrapper.Executor.Service
{
    public class Transformer : ITransform
    {
        public void Transform(string connection)
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("exec TransformInputToValid", con))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
