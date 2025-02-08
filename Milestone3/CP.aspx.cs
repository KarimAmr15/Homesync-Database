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
    public partial class CP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void CreateButton_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int Rid = 0;
            int Sid = 0;
            decimal amount = 0;
            try
            {
                Rid = int.Parse(ReceiverID.Text);
                Sid = int.Parse(SenderID.Text);
                amount = decimal.Parse(Amount.Text);
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

           
            string status = Status.Text;
            string date = Date.Text;


            SqlCommand PlanPayment = new SqlCommand("PlanPayment", conn);
            PlanPayment.CommandType = CommandType.StoredProcedure;

            PlanPayment.Parameters.Add(new SqlParameter("@sender_id", Sid));
            PlanPayment.Parameters.Add(new SqlParameter("@reciever_id", Rid));
            PlanPayment.Parameters.Add(new SqlParameter("@amount", amount));
            PlanPayment.Parameters.Add(new SqlParameter("@status", status));
            PlanPayment.Parameters.Add(new SqlParameter("@deadline", date));

            if ( status == "" || date == "")
            {
                outputlabel.Text = "please fill out all data";
                return;
            }


            try
            {
                conn.Open();
                int rowsAffected = PlanPayment.ExecuteNonQuery();
                conn.Close();


                if (rowsAffected > 1)
                {
                    outputlabel.Text = "Payment Created Successfully.";
                }
                else
                {
                    outputlabel.Text = "Failed To Create Payment.";
                }
            }
            catch (SqlException ex)
            {
                Response.Write($"An error occurred: {ex.Message}");
            }








        }
    }
}