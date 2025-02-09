using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class FinishTask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Finish_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            String title = Title.Text;

            SqlCommand finishTaskProc = new SqlCommand("FinishMyTask", conn);
            finishTaskProc.CommandType = CommandType.StoredProcedure;

            finishTaskProc.Parameters.Add(new SqlParameter("@user_id", Session["userid"]));
            finishTaskProc.Parameters.Add(new SqlParameter("@title", title));

            if (title != null)
            {
                try
                {
                    conn.Open();
                    finishTaskProc.ExecuteNonQuery();
                    conn.Close();
                    outputlabel.Text = "Task finished successfully";
                }
                catch (FormatException ex)
                {
                    Response.Write("An error occurred: parameters missing or invalid data");
                    return;
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: parameters missing or invalid data");
                    return;
                }
            }
            else
            {
                outputlabel.Text = "No task assigned with this name";
            }
        }
    }
}