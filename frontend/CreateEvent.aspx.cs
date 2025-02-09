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
    public partial class CreateEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            String connString = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            int eventid = 0;
            int userid1 = 0;
            int userid2 = 0;

            try
            {
                eventid = int.Parse(txtEventId.Text);
                userid1 = int.Parse(txtUserId.Text);
                userid2 = int.Parse(txtOtherUserId.Text);
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


            string name = txtName.Text;
            string description = txtDescription.Text;
            string location = txtLocation.Text;
            string dateText = txtReminderDate.Text;
            DateTime date;
            try
            {
                 date = DateTime.Parse(dateText);
            }
            catch (FormatException ex)
            {
                outputlabel.Text = "An error occurred:"  + ex.Message;
                return;
            }
            catch (SqlException ex)
            {
                outputlabel.Text = "An error occurred:" + ex.Message;
                return;
            }

            if (name == "" || description == "" || location == "" )
            {
                outputlabel.Text = "Info is missing, try again";
                return;
            }

            SqlCommand CreateEvent = new SqlCommand("CreateEvent", conn);
            CreateEvent.CommandType = CommandType.StoredProcedure;

            CreateEvent.Parameters.Add(new SqlParameter("@event_id", eventid));
            CreateEvent.Parameters.Add(new SqlParameter("@user_id", userid1));
            CreateEvent.Parameters.Add(new SqlParameter("@name", name));
            CreateEvent.Parameters.Add(new SqlParameter("@description", description));
            CreateEvent.Parameters.Add(new SqlParameter("@location", location));
            CreateEvent.Parameters.Add(new SqlParameter("@reminder_date", date));
            CreateEvent.Parameters.Add(new SqlParameter("@other_user_id", userid2));

            try
            {
                conn.Open();
                int rowsAffected = CreateEvent.ExecuteNonQuery();
                conn.Close();



                if (rowsAffected > 0)
                {
                    outputlabel.Text = "Event Created Successfully";
                }
                else
                {
                    outputlabel.Text = "Failed To Create Event";
                }
            }
            catch (SqlException ex)
            {
                outputlabel.Text = "An error occurred: " + ex.Message;
            }
        }

        protected void txtEventId_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtUserId_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDescription_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtLocation_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtReminderDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtOtherUserId_TextChanged(object sender, EventArgs e)
        {

        }
    }


    }
