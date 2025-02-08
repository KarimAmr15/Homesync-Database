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
    public partial class ViewEvent : System.Web.UI.Page
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


            SqlCommand ViewEvent = new SqlCommand("ViewEvent", conn);
            ViewEvent.CommandType = CommandType.StoredProcedure;

            ViewEvent.Parameters.Add(new SqlParameter("@Event_id", eventid));
            ViewEvent.Parameters.Add(new SqlParameter("@User_id", userid));



            conn.Open();

            SqlDataReader rdr = ViewEvent.ExecuteReader();
            while (rdr.Read())
            {

                PlaceHolder infoPlaceholder = FindControl("infoPlaceholder") as PlaceHolder;

                if (infoPlaceholder != null)
                {
                    // eventid
                    int eventid1 = rdr.GetInt32(rdr.GetOrdinal("event_id"));
                    Label eventidlabel = new Label();
                    eventidlabel.Text = $"   Event id: {eventid1}<br />";
                    infoPlaceholder.Controls.Add(eventidlabel);

                    //userassigned
                    int userassigned = rdr.GetInt32(rdr.GetOrdinal("user_assigned_to"));
                    Label userlabelLabel = new Label();
                    userlabelLabel.Text = $"   User Assigned To: {userassigned}<br />";
                    infoPlaceholder.Controls.Add(userlabelLabel);

                    // Name
                    string Name = rdr.IsDBNull(rdr.GetOrdinal("name")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("name"));
                  
                    if (!string.IsNullOrEmpty(Name) )
                    {
                        Label nameLabel = new Label();
                        nameLabel.Text = $"   Name: {Name}<br />";
                        infoPlaceholder.Controls.Add(nameLabel);
                    }


                    // description
                    string description = rdr.IsDBNull(rdr.GetOrdinal("description")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("description"));
                    if (!string.IsNullOrEmpty(description))
                    {
                        Label descriptionlabel = new Label();
                        descriptionlabel.Text = $"   Email: {description}<br />";
                        infoPlaceholder.Controls.Add(descriptionlabel);
                    }


                    // location
                    string location = rdr.IsDBNull(rdr.GetOrdinal("location")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("location"));
                    if (!string.IsNullOrEmpty(location))
                    {
                        Label locationlabel = new Label();
                        locationlabel.Text = $"   Password: {location}<br />";
                        infoPlaceholder.Controls.Add(locationlabel);
                    }

                    // reminder
                    DateTime reminderDate = rdr.GetDateTime(rdr.GetOrdinal("reminder_date"));
                    string reminder = reminderDate.ToString(); // Convert DateTime to string if needed

                    // Add the reminder to your placeholder or label
                    Label reminderLabel = new Label();
                    reminderLabel.Text = $"   Reminder Date: {reminder}<br />";
                    infoPlaceholder.Controls.Add(reminderLabel);


                    Label separatorLabel = new Label();
                    separatorLabel.Text = "<hr />";
                    infoPlaceholder.Controls.Add(separatorLabel);
                }

            }
            conn.Close();


        }


        protected void txtUserId_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtEventId_TextChanged(object sender, EventArgs e)
        {

        }
    }
}