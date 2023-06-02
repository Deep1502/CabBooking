using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CabBooking
{
    public partial class driverlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CabBookingDb"].ConnectionString;
            string query = "SELECT COUNT(*) FROM Driver WHERE Email = '" + tb_Email.Text + "' AND Password = '" + tb_Password.Text + "'";
            try
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        int count = Convert.ToInt32(cmd.ExecuteScalar());
                        if (count == 1)
                        {
                            string idquery = "SELECT Id,Status FROM Driver WHERE Email = '" + tb_Email.Text + "' AND Password = '" + tb_Password.Text + "'";
                            SqlCommand cmd2 = new SqlCommand(idquery, con);
                            var reader = cmd2.ExecuteReader();
                            reader.Read();
                            int id = reader.GetInt32(reader.GetOrdinal("Id"));
                            string status = reader.GetString(reader.GetOrdinal("Status"));
                            reader.Close();
                            if(status == "Registration pending")
                            {
                                Label1.Text = "Admin has not accepted your request yet.";
                            }
                            else
                            {
                                Session["Id"] = id;
                                Session["Role"] = "Driver";
                                Label1.Text = "";
                                Response.Redirect("~/driverhome.aspx");
                            }
                        }
                        else
                        {
                            Label1.Text = "Invalid username or password ";
                        }
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
            }
        }
    }
}