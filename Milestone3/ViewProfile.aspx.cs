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
    public partial class ViewProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String userType = Session["usertype1"] as string;
            int userId;
            if (Session["userid"] != null && int.TryParse(Session["userid"].ToString(), out userId))
            {
                SqlCommand viewprofile = new SqlCommand("ViewProfile", conn);
                viewprofile.CommandType = CommandType.StoredProcedure;
                viewprofile.Parameters.AddWithValue("@user_id", userId);

                conn.Open();

                SqlDataReader rdr = viewprofile.ExecuteReader();
                while (rdr.Read())
                {

                    PlaceHolder infoPlaceholder = FindControl("infoPlaceholder") as PlaceHolder;

                    if (infoPlaceholder != null)
                    {
                        // Name
                        string fName = rdr.IsDBNull(rdr.GetOrdinal("f_name")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("f_name"));
                        string lName = rdr.IsDBNull(rdr.GetOrdinal("l_name")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("l_name"));
                        if (!string.IsNullOrEmpty(fName) && !string.IsNullOrEmpty(lName))
                        {
                            Label nameLabel = new Label();
                            nameLabel.Text = $"   Name: {fName} {lName}<br />";
                            infoPlaceholder.Controls.Add(nameLabel);
                        }

                        // Email
                        string email = rdr.IsDBNull(rdr.GetOrdinal("email")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("email"));
                        if (!string.IsNullOrEmpty(email))
                        {
                            Label emailLabel = new Label();
                            emailLabel.Text = $"   Email: {email}<br />";
                            infoPlaceholder.Controls.Add(emailLabel);
                        }

                        // Password
                        string password = rdr.IsDBNull(rdr.GetOrdinal("password")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("password"));
                        if (!string.IsNullOrEmpty(password))
                        {
                            Label passwordLabel = new Label();
                            passwordLabel.Text = $"   Password: {password}<br />";
                            infoPlaceholder.Controls.Add(passwordLabel);
                        }

                        // Preference
                        string preference = rdr.IsDBNull(rdr.GetOrdinal("preference")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("preference"));
                        if (!string.IsNullOrEmpty(preference))
                        {
                            Label preferenceLabel = new Label();
                            preferenceLabel.Text = $"   Preference: {preference}<br />";
                            infoPlaceholder.Controls.Add(preferenceLabel);
                        }

                        // Room
                        int? roomNullable = rdr.IsDBNull(rdr.GetOrdinal("room")) ? (int?)null : rdr.GetInt32(rdr.GetOrdinal("room"));
                        if (roomNullable.HasValue)
                        {
                            Label roomLabel = new Label();
                            roomLabel.Text = $"   Room: {roomNullable}<br />";
                            infoPlaceholder.Controls.Add(roomLabel);
                        }

                        // Type
                        string type = rdr.IsDBNull(rdr.GetOrdinal("type")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("type"));
                        if (!string.IsNullOrEmpty(type))
                        {
                            Label typeLabel = new Label();
                            typeLabel.Text = $"   Type: {type}<br />";
                            infoPlaceholder.Controls.Add(typeLabel);
                            Session["usertype1"] = type;
                        }

                        // Birth Date
                        DateTime birthDate = rdr.GetDateTime(rdr.GetOrdinal("birth_date"));
                        Label birthDateLabel = new Label();
                        birthDateLabel.Text = $"   Birth Date: {birthDate.ToShortDateString()}<br />";
                        infoPlaceholder.Controls.Add(birthDateLabel);

                        // Age
                        int age = rdr.GetInt32(rdr.GetOrdinal("age"));
                        Label ageLabel = new Label();
                        ageLabel.Text = $"   Age: {age}<br />";
                        infoPlaceholder.Controls.Add(ageLabel);

                        int id = Convert.ToInt32(Session["userid"]);
                        Label idLabel = new Label();
                        ageLabel.Text = $"   Id: {id}<br />";
                        infoPlaceholder.Controls.Add(idLabel);

                         Label separatorLabel = new Label();
                        separatorLabel.Text = "<hr />";
                        infoPlaceholder.Controls.Add(separatorLabel);
                    }

                }
                conn.Close();
                String t = (Session["usertype1"]) as string;
                if (t == "Guest")
                {
                    Guest.Visible = false;

                }
            }

        }

        protected void numGuestsButton_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand guestnumber = new SqlCommand("GuestNumber", conn);
            guestnumber.CommandType = CommandType.StoredProcedure;

            int id;

            if (int.TryParse(numGuestsText.Text, out id))
            {
                guestnumber.Parameters.Add(new SqlParameter("@admin_id", id));

                SqlParameter number = guestnumber.Parameters.Add("@guest_count", SqlDbType.Int);
                number.Direction = ParameterDirection.Output;

                try
                {
                    conn.Open();
                    guestnumber.ExecuteNonQuery();
                    conn.Close();

                    int guest = Convert.ToInt32(number.Value);
                    numGuestsOutput.Text = $"{guest}";
                }
                catch (SqlException ex)
                {

                    numGuestsOutput.Text = $"An error occurred: {ex.Message}";

                }
            }
        }

        protected void numberofguestsbutton_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand guestmax = new SqlCommand("GuestsAllowed", conn);
            guestmax.CommandType = CommandType.StoredProcedure;

            int id;

            if (int.TryParse(numGuestsText.Text, out id))
            {
                int num = 0;
                try
                {
                    num = Convert.ToInt32(numberofgueststxt.Text);
                }
                catch (FormatException ex)
                {
                    maxg.Text = ($"Invalid input for number of guests: {ex.Message}");
                    return; 
                }
                catch (Exception ex)
                {
                    maxg.Text = ($"An error occurred: {ex.Message}");
                }
                guestmax.Parameters.Add(new SqlParameter("@admin_id", id));
                guestmax.Parameters.Add(new SqlParameter("@number_of_guests", num));

                try
                {
                    conn.Open();
                    int rowsAffected = guestmax.ExecuteNonQuery();
                    conn.Close();

                    if (rowsAffected > 0)
                    {
                        maxg.Text = $"Number of guests is now: {num}";
                    }
                    else
                    {
                        maxg.Text = "Failed to update number of guests.";
                    }
                }
                catch (SqlException ex)
                {
                    maxg.Text = $"An error occurred: {ex.Message}";
                }
            }
        }

        protected void Devices_Click(object sender, EventArgs e)
        {
            Response.Redirect("Devices.aspx");
        }

        protected void Rooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("Room.aspx");
        }

        protected void Tasks_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tasks.aspx");
        }

        protected void Events_Click(object sender, EventArgs e)
        {
            Response.Redirect("Events.aspx");
        }

        protected void Finance_Click(object sender, EventArgs e)
        {
            Response.Redirect("Finance.aspx");
        }

        protected void Guest_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int guestid = 0;
            int adminid = 0;
            try
            {
                guestid = int.Parse(GuestID.Text);
                adminid = int.Parse(UserID.Text);
            }
            catch (FormatException ex)
            {
                outputlabel.Text = ($"An error occurred: {ex.Message}");
                return;
            }
            SqlCommand GuestRemove = new SqlCommand("GuestRemove", conn);
            GuestRemove.CommandType = CommandType.StoredProcedure;

            GuestRemove.Parameters.Add(new SqlParameter("@guest_id", guestid));
            GuestRemove.Parameters.Add(new SqlParameter("@admin_id", adminid));

            SqlParameter num = GuestRemove.Parameters.Add("@number_of_allowed_guests", SqlDbType.Int);
            num.Direction = ParameterDirection.Output;

            conn.Open();
            int rowsAffected = GuestRemove.ExecuteNonQuery();
            conn.Close();
            int numberOfAllowedGuests = 0;
            try
            {
                 numberOfAllowedGuests = Convert.ToInt32(num.Value);
            }
            catch (FormatException ex)
            {
               
                return;
            }
            catch (SqlException ex)
            {
          
                return;
            }
          
            if (rowsAffected > 0)
            {
                outputlabel.Text = "Guest Removed Successfully" + " Number of allowed guests now: " + numberOfAllowedGuests;
            }
            else
            {
                outputlabel.Text = "Failed To Remove Guest";
            }


        }

    }
}




            
        
    
