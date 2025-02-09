using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class UpdateDeadline : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdateDD_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int taskId = 0;
            try
            {
                 taskId = Int16.Parse(Task.Text);
            }
            catch (FormatException ex)
            {
                Response.Write("An error occurred: " +ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred: " + ex.Message);
                return;
            }
           
            String deadline = Deadline.Text;


            SqlCommand updateDDProc = new SqlCommand("UpdateTaskDeadline", conn);
            updateDDProc.CommandType = CommandType.StoredProcedure;

            updateDDProc.Parameters.Add(new SqlParameter("@task_id", taskId));
            updateDDProc.Parameters.Add(new SqlParameter("@deadline", deadline));



            conn.Open();
            try
            {
                updateDDProc.ExecuteNonQuery();
            }
            catch (FormatException ex)
            {
                Response.Write("An error occurred: " + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred: " + ex.Message);
                return;
            }
            conn.Close();
            Label2.Text = "Deadline Updated successfully";
        }
    }
}