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
    public partial class Room : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String t = (Session["usertype1"]) as string;
            if (t == "Guest")
            {
                LinkButton3.Visible = false;
                LinkButton4.Visible = false;
                LinkButton5.Visible = false;

            }

        }
        
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewAssignedRoom.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookRoom.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangeStatus.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewUnusedRooms.aspx");
        }
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomSchedule.aspx");
        }
    }
}