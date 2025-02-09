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
    public partial class Tasks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void MyTasks_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyTasks.aspx");
        }

        protected void FinishTask_Click(object sender, EventArgs e)
        {
            Response.Redirect("FinishTask.aspx");
        }

        protected void TaskStatus_Click(object sender, EventArgs e)
        {
            Response.Redirect("TaskStatus.aspx");
        }

        protected void AddReminder_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddReminder.aspx");
        }

        protected void UpdateDeadline_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateDeadline.aspx");

        }
    }
}