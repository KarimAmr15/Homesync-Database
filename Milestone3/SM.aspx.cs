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
    public partial class SM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SendButton_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int Rid = 0;
            int Sid = 0;
          
            try
            {
                Rid = int.Parse(ReceiverID.Text);
                Sid = int.Parse(SenderID.Text);
            }

            catch (FormatException ex)
            {
                outputlabel.Text = ($"An error occurred: {ex.Message}");
                return;
            }
            catch (SqlException ex)
            {
                outputlabel.Text = $"An error occurred: {ex.Message}";
                return;
            }

            string title = Title.Text;
            string content = Content.Text;
            string timesent = TimeSent.Text;
            string timereceived = TimeReceived.Text;


            SqlCommand SendMessage = new SqlCommand("SendMessage", conn);
            SendMessage.CommandType = CommandType.StoredProcedure;

            SendMessage.Parameters.Add(new SqlParameter("@sender_id", Sid));
            SendMessage.Parameters.Add(new SqlParameter("@receiver_id", Rid));
            SendMessage.Parameters.Add(new SqlParameter("@title", title));
            SendMessage.Parameters.Add(new SqlParameter("@content", content));
            SendMessage.Parameters.Add(new SqlParameter("@timesent", timesent));
            SendMessage.Parameters.Add(new SqlParameter("@timereceived", timereceived));

            if (title == "" || content == "" || timesent == "" || timereceived == "")
            {
                outputlabel.Text = "please fill out all data";
                return;
            }


            try
            {
                conn.Open();
                int rowsAffected = SendMessage.ExecuteNonQuery();
                conn.Close();


                if (rowsAffected > 0)
                {
                    outputlabel.Text = "Message Sent Successfully";
                }
                else
                {
                    outputlabel.Text = "Failed To Send Message";
                }
            }
            catch (SqlException ex)
            {
                Response.Write($"An error occurred: {ex.Message}");
            }

        }
    }
}
