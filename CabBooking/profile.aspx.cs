using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CabBooking
{
    public partial class profile : System.Web.UI.Page
    {
        string Name, Email, Password, ContactNo;
        double WalletAmt;

        protected void GetData()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CabBookingDb"].ConnectionString;
            string query = "SELECT Name,Email,Password,ContactNo,WalletAmt FROM Customer WHERE Id=@Id";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@Id", Session["Id"]);
            con.Open();
            cmd.Connection = con;
            var reader = cmd.ExecuteReader();
            reader.Read();
            Name = reader.GetString(reader.GetOrdinal("Name"));
            Email = reader.GetString(reader.GetOrdinal("Email"));
            Password = reader.GetString(reader.GetOrdinal("Password"));
            ContactNo = reader.GetString(reader.GetOrdinal("ContactNo"));
            WalletAmt = Convert.ToDouble(reader.GetDecimal(reader.GetOrdinal("WalletAmt")));
            lbl_Name.Text = Name;
            lbl_Email.Text = Email;
            lbl_Password.Text = Password;
            lbl_Contact.Text = ContactNo;
            lbl_Wallet.Text = WalletAmt.ToString();
            reader.Close();
            con.Close();
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CabBookingDb"].ConnectionString;
            string query = "UPDATE Customer SET Name=@Name, Email=@Email, Password=@Password, ContactNo=@Contact, WalletAmt=@Wallet WHERE Id=@Id";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@Name", tb_Name.Text);
            cmd.Parameters.AddWithValue("@Email", tb_Email.Text);
            cmd.Parameters.AddWithValue("@Password", tb_Password.Text);
            cmd.Parameters.AddWithValue("@Contact", tb_Contact.Text);
            cmd.Parameters.AddWithValue("@Wallet", Convert.ToDecimal(tb_Wallet.Text));
            cmd.Parameters.AddWithValue("@Id", Session["Id"]);
            con.Open();
            if(cmd.ExecuteNonQuery() == 1)
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
            }
            con.Close();
            GetData();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            GetData();
        }

        protected void btn_Edit_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            tb_Name.Text = Name;
            tb_Email.Text = Email;
            tb_Password.Text = Password;
            tb_Contact.Text = ContactNo;
            tb_Wallet.Text = WalletAmt.ToString();
        }
    }
}