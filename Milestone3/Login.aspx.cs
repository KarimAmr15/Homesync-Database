using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace Milestone3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void login(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string email = Email.Text;
            string password = Password.Text;

            SqlCommand loginProc = new SqlCommand("UserLogin", conn);
            loginProc.CommandType = CommandType.StoredProcedure;

            loginProc.Parameters.Add(new SqlParameter("@email", email));
            loginProc.Parameters.Add(new SqlParameter("@password", password));

            SqlParameter success = loginProc.Parameters.Add("@success", SqlDbType.Int);
            SqlParameter id = loginProc.Parameters.Add("@user_id", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            id.Direction = ParameterDirection.Output;

            if (email == "" || password == "")
            {
                outputlabel.Text = "please fill all data";
                return;
            }

            conn.Open();
            loginProc.ExecuteNonQuery();
            conn.Close();

            if (success.Value != null && success.Value.ToString() == "1")
            {
                int userId = (int)id.Value;

                SqlCommand usertypeecom = new SqlCommand("usertypee", conn);
                usertypeecom.CommandType = CommandType.StoredProcedure;

                usertypeecom.Parameters.Add(new SqlParameter("@user_id", userId));
                SqlParameter type = usertypeecom.Parameters.Add("@type", SqlDbType.VarChar, 50); // Adjust the size accordingly
                type.Direction = ParameterDirection.Output;

                conn.Open();
                usertypeecom.ExecuteNonQuery();
                conn.Close();

                outputlabel.Text = "Login successful";
                Session["userid"] = userId;
                

               
                ClientScript.RegisterStartupScript(this.GetType(), "redirect", "setTimeout(function(){ window.location.href = 'ViewProfile.aspx'; }, 2000);", true);
            }
            else
            {
                outputlabel.Text = "Email or Password is incorrect";
                registerlabel.Text = "If you don't have an account, register here";
                registerbutton.Visible = true;
            }
        }

        protected void registerbutton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}
