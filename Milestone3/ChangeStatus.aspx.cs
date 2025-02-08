using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace YourNamespace
{
    public partial class ChangeStatus : System.Web.UI.Page
    {
        protected void btnChangeStatus_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int roomId;
            string newStatus = txtNewStatus.Text.Trim().ToLower();

            if (int.TryParse(txtRoomID.Text, out roomId))
            {
                try
                {
                    SqlCommand changeStatusCommand = new SqlCommand("RoomAvailability", conn);
                    changeStatusCommand.CommandType = CommandType.StoredProcedure;
                    changeStatusCommand.Parameters.AddWithValue("@location", roomId);
                    changeStatusCommand.Parameters.AddWithValue("@status", newStatus);

                    conn.Open();


                    changeStatusCommand.ExecuteNonQuery();


                    lblMessage.Text = "Room status changed successfully.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                catch (SqlException ex)
                {

                    lblMessage.Text = "An error occurred: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                lblMessage.Text = "Please enter a valid Room ID.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

         }
}
