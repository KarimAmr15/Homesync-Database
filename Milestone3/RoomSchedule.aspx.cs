using System;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Emit;
using System.Web.Configuration;

namespace Milestone3
{
    public partial class CreateSchedule : System.Web.UI.Page
    {
        protected void btnCreateSchedule_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int creatorId, roomId;
            DateTime startTime, endTime;
            string action = txtAction.Text; 

            if (int.TryParse(txtCreatorID.Text, out creatorId) &&
                int.TryParse(txtRoomID.Text, out roomId) &&
                DateTime.TryParse(txtStartTime.Text, out startTime) &&
                DateTime.TryParse(txtEndTime.Text, out endTime))
            {
                try
                {
                    SqlCommand createScheduleCommand = new SqlCommand("CreateSchedule", conn);
                    createScheduleCommand.CommandType = CommandType.StoredProcedure;
                    createScheduleCommand.Parameters.AddWithValue("@creator_id", creatorId);
                    createScheduleCommand.Parameters.AddWithValue("@room_id", roomId);
                    createScheduleCommand.Parameters.AddWithValue("@start_time", startTime);
                    createScheduleCommand.Parameters.AddWithValue("@end_time", endTime);
                    createScheduleCommand.Parameters.AddWithValue("@action", action);

                    conn.Open();

                    int rowsAffected = createScheduleCommand.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {

                        ShowMessage("Schedule created successfully!");
                    }
                    else
                    {

                        ShowErrorMessage("Failed to create schedule. Please check provided data.");
                    }
                }
                catch (SqlException ex)
                {
                    ShowErrorMessage("An error occurred: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                ShowErrorMessage("Please enter valid data for all fields.");
            }
        }

        private void ShowMessage(string message)
        {

            lblMessage.Text = message;
            lblMessage.CssClass = "success-message";
            lblMessage.Visible = true;
        }

        private void ShowErrorMessage(string message)
        {

            lblMessage.Text = message;
            lblMessage.CssClass = "error-message";
            lblMessage.Visible = true;
        }

      
    }
}
