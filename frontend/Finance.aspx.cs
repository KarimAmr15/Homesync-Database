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
    public partial class Finance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String t = (Session["usertype1"]) as string;
            if (t == "Guest")
            {
                LinkButton5.Visible = false;
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("RT.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CP.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("SM.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("SA.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand DeleteMsg = new SqlCommand("DeleteMsg", conn);
            DeleteMsg.CommandType = CommandType.StoredProcedure;

            try
            {
                conn.Open();
                int rowsAffected = DeleteMsg.ExecuteNonQuery();
                conn.Close();

                if (rowsAffected > 0)
                {
                    outputlabel.Text = "Message Was Deleted Successfully";
                }
                else
                {
                    outputlabel.Text = "Failed To Delete Message";
                }
            }
            catch (SqlException ex)
            {
                Response.Write($"An error occurred: {ex.Message}");
            }

        }
    }
}