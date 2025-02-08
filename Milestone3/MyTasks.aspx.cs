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
    public partial class MyTasks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewMyTaskProc = new SqlCommand("ViewMyTask", conn);
            viewMyTaskProc.CommandType = CommandType.StoredProcedure;
            viewMyTaskProc.Parameters.Add(new SqlParameter("@user_id", Session["userid"]));
            conn.Open();
            try
            {
                SqlDataReader rdr = viewMyTaskProc.ExecuteReader();
                while (rdr.Read())
                {

                    PlaceHolder inPlaceholder = FindControl("inPlaceholder") as PlaceHolder;

                    if (inPlaceholder != null)
                    {
                        // Task id
                        int taskId = rdr.GetInt32(rdr.GetOrdinal("task_id"));
                        Label taskIdLabel = new Label();
                        taskIdLabel.Text = $"Task Id: {taskId}<br />";
                        inPlaceholder.Controls.Add(taskIdLabel);

                        // Name
                        string name = rdr.IsDBNull(rdr.GetOrdinal("name")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("name"));
                        if (!string.IsNullOrEmpty(name))
                        {
                            Label nameLabel = new Label();
                            nameLabel.Text = $"Name: {name}<br />";
                            inPlaceholder.Controls.Add(nameLabel);
                        }

                        // Creation Date
                        DateTime creationDate = rdr.GetDateTime(rdr.GetOrdinal("creation_date"));
                        Label creationDateLabel = new Label();
                        creationDateLabel.Text = $"Creation Date: {creationDate.ToShortDateString()}<br />";
                        inPlaceholder.Controls.Add(creationDateLabel);

                        // Due Date
                        DateTime dueDate = rdr.GetDateTime(rdr.GetOrdinal("due_date"));
                        Label dueDateLabel = new Label();
                        dueDateLabel.Text = $"Due Date: {dueDate.ToShortDateString()}<br />";
                        inPlaceholder.Controls.Add(dueDateLabel);


                        // Category
                        string category = rdr.IsDBNull(rdr.GetOrdinal("category")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("category"));
                        if (!string.IsNullOrEmpty(category))
                        {
                            Label categoryLabel = new Label();
                            categoryLabel.Text = $"Category: {category}<br />";
                            inPlaceholder.Controls.Add(categoryLabel);
                        }

                        // Creator
                        int creator = rdr.GetInt32(rdr.GetOrdinal("creator"));
                        Label creatorLabel = new Label();
                        creatorLabel.Text = $"Creator: {creator}<br />";
                        inPlaceholder.Controls.Add(creatorLabel);

                        // Status
                        string status = rdr.IsDBNull(rdr.GetOrdinal("status")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("status"));
                        if (!string.IsNullOrEmpty(status))
                        {
                            Label statusLabel = new Label();
                            statusLabel.Text = $"Status: {status}<br />";
                            inPlaceholder.Controls.Add(statusLabel);
                        }
                        // Reminder Date
                        DateTime reminderDate = rdr.GetDateTime(rdr.GetOrdinal("reminder_date"));
                        Label reminderDateLabel = new Label();
                        reminderDateLabel.Text = $"Reminder Date: {reminderDate.ToShortDateString()}<br />";
                        inPlaceholder.Controls.Add(reminderDateLabel);

                        // Priority
                        string priority = rdr.IsDBNull(rdr.GetOrdinal("priority")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("priority"));
                        if (!string.IsNullOrEmpty(priority))
                        {
                            Label priorityLabel = new Label();
                            priorityLabel.Text = $"Priority: {priority}<br />";
                            inPlaceholder.Controls.Add(priorityLabel);
                        }
                        // Creator
                        int userId = rdr.GetInt32(rdr.GetOrdinal("user_id"));
                        Label userIdLabel = new Label();
                        userIdLabel.Text = $"User Id: {userId}<br />";
                        inPlaceholder.Controls.Add(userIdLabel);


                        // Add a line break or separator for better readability
                        Label separatorLabel = new Label();
                        separatorLabel.Text = "<hr />";
                        inPlaceholder.Controls.Add(separatorLabel);
                    }
                }

                conn.Close();
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

        }
    }
}