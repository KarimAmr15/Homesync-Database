using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class RemoveEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAssign_Click(object sender, EventArgs e)
        {

            String connString = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            int eventid = 0;
            int userid = 0;

            try
            {
                eventid = int.Parse(txtEventId.Text);
                userid = int.Parse(txtUserId.Text);

            }
            catch (FormatException ex)
            {
                outputlabel.Text = "An error occurred:" + ex.Message;
                return;
            }
            catch (SqlException ex)
            {
                outputlabel.Text = "An error occurred:" + ex.Message;
                return;
            }


            SqlCommand RemoveEvent = new SqlCommand("RemoveEvent", conn);
            RemoveEvent.CommandType = CommandType.StoredProcedure;

            RemoveEvent.Parameters.Add(new SqlParameter("@event_id", eventid));
            RemoveEvent.Parameters.Add(new SqlParameter("@user_id", userid));


            try
            {
                conn.Open();
                int rowsAffected = RemoveEvent.ExecuteNonQuery();
                conn.Close();

                if (rowsAffected > 0)
                {
                    outputlabel.Text = "User Removed Successfully";
                }
                else
                {
                    outputlabel.Text = "Failed To Remove User";
                }
            }
            catch (SqlException ex)
            {
                outputlabel.Text = "An error occurred: " + ex.Message;
            }
        }


        protected void txtUserId_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtEventId_TextChanged(object sender, EventArgs e)
        {

        }
    }
}