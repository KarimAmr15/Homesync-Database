using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection.Emit;

namespace Milestone3
{
    public partial class AddReminder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddRem_Click(object sender, EventArgs e)
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
                Response.Write("An error occurred: " + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred: " + ex.Message);
                return;
            }
            
            String remdate = ReminderDate.Text;


            SqlCommand addReminderProc = new SqlCommand("AddReminder", conn);
            addReminderProc.CommandType = CommandType.StoredProcedure;

            addReminderProc.Parameters.Add(new SqlParameter("@task_id", taskId));
            addReminderProc.Parameters.Add(new SqlParameter("@reminder", remdate));



            conn.Open();
            addReminderProc.ExecuteNonQuery();
            conn.Close();
            Label1.Text = "Reminder Added successfully";


        }
    }
}