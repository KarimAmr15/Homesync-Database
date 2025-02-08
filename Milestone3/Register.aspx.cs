using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace DBM3
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void register(object sender, EventArgs e)
        {
            try
            {
                String connString = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
                SqlConnection con = new SqlConnection(connString);

                String type1 = type.Text;
                String Firstname = fname.Text;
                String Lastname = lname.Text;
                String Bdate = bdate2.Text;
                String em = email2.Text;
                String pass = password.Text;
                if (type1 == "" || Firstname == "" || Lastname == "" || Bdate == "" || em == "" || pass == "")
                {
                    Response.Write("Info is missing, try again");
                    return;
                }
                    SqlCommand registerproc = new SqlCommand("UserRegister", con);
                    registerproc.CommandType = CommandType.StoredProcedure;

                    registerproc.Parameters.Add(new SqlParameter("@usertype", type1));
                    registerproc.Parameters.Add(new SqlParameter("@first_name", Firstname));
                    registerproc.Parameters.Add(new SqlParameter("@last_name", Lastname));
                    registerproc.Parameters.Add(new SqlParameter("@birth_date", Bdate));
                    registerproc.Parameters.Add(new SqlParameter("@email", em));
                    registerproc.Parameters.Add(new SqlParameter("@password", pass));

                    SqlParameter user_id = registerproc.Parameters.Add("@user_id", SqlDbType.Int);
                    user_id.Direction = ParameterDirection.Output;

                    con.Open();
                    registerproc.ExecuteNonQuery();
                    con.Close();

                    int userId = Convert.ToInt32(user_id.Value);

                    if (userId > 0)
                    {
                        Response.Write("Registration successful User ID: " + userId);
                        ClientScript.RegisterStartupScript(this.GetType(), "redirect", "setTimeout(function(){ window.location.href = 'Login.aspx'; }, 2000);", true);
                    }
                    else
                    {
                        Response.Write("Registration failed Please try again.");
                    }
                }
            catch (SqlException ex)
            {
                if (ex.Number == 2627) //  the error number for a duplicate key violation 
                {
                    
                    Response.Write("Registration failed. The email address is already in use.");
                }
                else
                {
                    Response.Write("An unexpected error occurred: " + ex.Message);
                }
            }
        
        







        }
    }
    }
            




    



    