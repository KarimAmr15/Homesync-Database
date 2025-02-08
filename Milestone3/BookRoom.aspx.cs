using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Milestone3
{
    public partial class BookRoom : System.Web.UI.Page
    {
        protected void btnBookRoom_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int userId, roomId;

            if (int.TryParse(txtUserID.Text, out userId) && int.TryParse(txtRoomID.Text, out roomId))
            {
                try
                {
                    SqlCommand assignRoomCommand = new SqlCommand("AssignRoom", conn);
                    assignRoomCommand.CommandType = CommandType.StoredProcedure;
                    assignRoomCommand.Parameters.AddWithValue("@user_id", userId);
                    assignRoomCommand.Parameters.AddWithValue("@room_id", roomId);

                    conn.Open();

                    int rowsAffected = assignRoomCommand.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        ShowSuccessMessage("Room booked successfully!");
                    }
                    else
                    {
                        ShowErrorMessage("Failed to book the room. Please check the provided IDs.");
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
                ShowErrorMessage("Please enter valid User ID and Room ID.");
            }
        }

        private void ShowSuccessMessage(string message)
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
