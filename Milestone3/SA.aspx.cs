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
    public partial class SA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ShowButton_Click(object sender, EventArgs e)
        {


            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int Uid = 0;
            int Sid = 0;

            try
            {
                Uid = int.Parse(ReceiverID.Text);
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

            SqlCommand ShowMessages = new SqlCommand("ShowMessages", conn);
            ShowMessages.CommandType = CommandType.StoredProcedure;

            ShowMessages.Parameters.Add(new SqlParameter("@sender_id", Sid));
            ShowMessages.Parameters.Add(new SqlParameter("@user_id", Uid));

            conn.Open();

            SqlDataReader rdr = ShowMessages.ExecuteReader();
            PlaceHolder infoPlacehold = FindControl("infoPlacehold") as PlaceHolder;

            if (infoPlacehold != null)
            {
                while (rdr.Read())
                {
                    Panel devicePanel = new Panel();

                    string content = rdr.IsDBNull(rdr.GetOrdinal("content")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("content"));

                    if (!string.IsNullOrEmpty(content))
                    {
                        Label content1 = new Label();
                        content1.Text = $"content: {content} |  <br />";
                        devicePanel.Controls.Add(content1);
                        infoPlacehold.Controls.Add(devicePanel);
                    }


                }
            }

            conn.Close();


        }


        }
}