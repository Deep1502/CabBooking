using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CabBooking
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Register_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["CabBookingDb"].ConnectionString;
                string query = "INSERT INTO Customer(Name, Email, Password, ContactNo, WalletAmt) " +
                    "VALUES(@Name, @Email, @Password, @Contact, @Wallet)";
                try
                {
                    using (con)
                    {
                        SqlCommand cmd = new SqlCommand(query);
                        cmd.Parameters.AddWithValue("@Name", tb_Name.Text);
                        cmd.Parameters.AddWithValue("@Email", tb_Email.Text);
                        cmd.Parameters.AddWithValue("@Password", tb_Password.Text);
                        cmd.Parameters.AddWithValue("@Contact", tb_Contact.Text);
                        cmd.Parameters.AddWithValue("@Wallet", 0.00);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                catch(Exception ex)
                {
                    Response.Write("Errors: " + ex.Message);
                }
                Response.Redirect("~/login.aspx");
            }
        }
    }
}