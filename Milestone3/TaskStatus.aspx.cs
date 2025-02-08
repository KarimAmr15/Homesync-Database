using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class TaskStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewStatus_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int creator = 0;
            try
            {
                 creator = Int16.Parse(CreatorId.Text);
            }
            catch (FormatException ex)
            {
                Response.Write("An error occurred: " + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred: " + ex.Message);
                return;
            }

            

            SqlCommand viewTaskProc = new SqlCommand("ViewTask", conn);
            viewTaskProc.CommandType = CommandType.StoredProcedure;
            viewTaskProc.Parameters.Add(new SqlParameter("@user_id", Session["userid"]));
            viewTaskProc.Parameters.Add(new SqlParameter("@creator", creator));
            conn.Open();

            SqlDataReader rdr = viewTaskProc.ExecuteReader();
            while (rdr.Read())
            {
                PlaceHolder inPlaceholder = FindControl("Placeholder") as PlaceHolder;
                if (inPlaceholder != null)
                {
                    // Status
                    string status = rdr.IsDBNull(rdr.GetOrdinal("status")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("status"));
                    if (!string.IsNullOrEmpty(status))
                    {
                        Label statusLabel = new Label();
                        statusLabel.Text = $"Status: {status}<br />";
                        inPlaceholder.Controls.Add(statusLabel);
                    }
                }
            }
        }
    }
}