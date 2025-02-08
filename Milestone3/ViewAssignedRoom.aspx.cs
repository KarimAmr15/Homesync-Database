using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class ViewAssignedRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
               
            
        }

        protected void btnViewRooms_Click(object sender, EventArgs e)
        {
            string userID = txtUserID.Text.Trim();
            string age = txtAge.Text.Trim();

            if (!string.IsNullOrEmpty(userID) && !string.IsNullOrEmpty(age))
            {
                int parsedUserID, parsedAge;
                if (int.TryParse(userID, out parsedUserID) && int.TryParse(age, out parsedAge))
                {
                    ShowRoomInformation(parsedUserID, parsedAge);
                }
                else
                {
                    lblErrorMessage.Text = "Please enter valid User ID and Age.";
                    lblErrorMessage.Visible = true;
                }
            }
            else
            {
                lblErrorMessage.Text = "Please enter User ID and Age.";
                lblErrorMessage.Visible = true;
            }
        }

        private void ShowRoomInformation(int userID, int age)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand("ViewRooms", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@user_id", userID);
                    cmd.Parameters.AddWithValue("@age", age);

                    conn.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();

                    if (rdr.HasRows)
                    {
                        GridView gridViewRooms = new GridView();
                        gridViewRooms.AutoGenerateColumns = true;
                        gridViewRooms.DataSource = rdr;
                        gridViewRooms.DataBind();

                        roomInfoPlaceholder.Controls.Add(gridViewRooms);
                        roomInfoPlaceholder.Visible = true;
                    }
                    else
                    {
                        lblErrorMessage.Text = "No rooms found for the provided User ID and Age.";
                        lblErrorMessage.Visible = true;
                    }

                    rdr.Close();
                }
            }
        }






        private void ShowErrorMessage(string message)
        {
            lblErrorMessage.Text = message;
            lblErrorMessage.Visible = true;
        }





     
      
    }
}



