using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class Events : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateEvent.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AssignUser.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("UninviteUser.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewEvent.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("RemoveEvent.aspx");
        }
    }
}