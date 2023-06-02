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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CabBookingDb"].ConnectionString;
            string query = "SELECT COUNT(*) FROM Customer WHERE Email = '" + tb_Email.Text + "' AND Password = '" + tb_Password.Text + "'";
            try
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                        if (count == 1)
                        {
                            string idquery = "SELECT Id FROM Customer WHERE Email = '" + tb_Email.Text + "' AND Password = '" + tb_Password.Text + "'";
                            SqlCommand cmd2 = new SqlCommand(idquery, con);
                            int id = Convert.ToInt32(cmd2.ExecuteScalar().ToString());
                            Session["Id"] = id;
                            Session["Role"] = "Customer";
                            Label1.Text = "";
                            Response.Redirect("~/customerhome.aspx");
                        }
                        else
                        {
                            Label1.Text = "Invalid username or password ";
                            Label1.Visible = true;
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