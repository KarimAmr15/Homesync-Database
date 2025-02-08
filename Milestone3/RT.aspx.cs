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
    public partial class RT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
     
        }


        protected void ReceiveButton_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id = 0;
            decimal amount = 0;
            try
            {
                 id = int.Parse(SenderID.Text);
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

            string type = Type.Text;
            string status = Status.Text;
            string date = Date.Text;


            SqlCommand ReciveMoney = new SqlCommand("ReciveMoney", conn);
            ReciveMoney.CommandType = CommandType.StoredProcedure;

            ReciveMoney.Parameters.Add(new SqlParameter("@Reciver_id", id));
            ReciveMoney.Parameters.Add(new SqlParameter("@type", type));
            ReciveMoney.Parameters.Add(new SqlParameter("@amount", amount));
            ReciveMoney.Parameters.Add(new SqlParameter("@status", status));
            ReciveMoney.Parameters.Add(new SqlParameter("@date", date));

            if (type == "" || status == "" || date == "")
            {
                outputlabel.Text = "please fill out all data";
                return;
            }


            try
            {
                conn.Open();
                int rowsAffected = ReciveMoney.ExecuteNonQuery();
                conn.Close();

               


                if (rowsAffected > 0)
                {
                    outputlabel.Text = "Transaction Received Successfully.";
                }
                else
                {
                    outputlabel.Text = "Failed to Receive Transaction.";
                }
            }
            catch (SqlException ex)
            {
                Response.Write($"An error occurred: {ex.Message}");
            }




        }
    }
}