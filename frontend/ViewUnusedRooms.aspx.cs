using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Milestone3
{
    public partial class ViewUnusedRooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand("ViewRoom", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    conn.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();

                    if (rdr.HasRows)
                    {
                        DataTable dt = new DataTable();
                        dt.Load(rdr); 

                        gridViewUnusedRooms.DataSource = dt; 
                        gridViewUnusedRooms.DataBind();
                    }

                    rdr.Close();
                }
            }


        }

      
   }
}
