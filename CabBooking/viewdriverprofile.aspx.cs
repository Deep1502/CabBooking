using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace CabBooking
{
    public partial class viewdriverprofile : System.Web.UI.Page
    {
        string Name, Email, Password, ContactNo, Status, Location, CabType, CabName, CabRegNo, FuelType;
        double WalletAmt, Fare;
        int CabId;

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CabBookingDb"].ConnectionString;
            string query = "UPDATE Cab SET Type=@Type, CarName=@Name, CarRegNo=@RegNo, Fare=@Fare, FuelType=@Fuel WHERE Id=@Id";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@Type", ddl_Cab_Type.SelectedValue);
            cmd.Parameters.AddWithValue("@Name", tb_CabName.Text);
            cmd.Parameters.AddWithValue("@RegNo", tb_CabRegNo.Text);
            cmd.Parameters.AddWithValue("@Fare", Convert.ToDecimal(tb_Fare.Text));
            cmd.Parameters.AddWithValue("@Fuel", ddl_Fuel_Type.SelectedValue);
            cmd.Parameters.AddWithValue("@Id", CabId);
            con.Open();
            if (cmd.ExecuteNonQuery() == 1)
            {
                string query1 = "UPDATE Driver SET Name=@Name,Email=@Email,Password=@Password,ContactNo=@Contact,WalletAmt=@Wallet,Status=@Status,Location=@Location WHERE Id=@Id";
                SqlCommand cmd1 = new SqlCommand(query1);
                cmd1.Connection = con;
                cmd1.Parameters.AddWithValue("@Name", tb_Name.Text);
                cmd1.Parameters.AddWithValue("@Email", tb_Email.Text);
                cmd1.Parameters.AddWithValue("@Password", tb_Password.Text);
                cmd1.Parameters.AddWithValue("@Contact", tb_Contact.Text);
                cmd1.Parameters.AddWithValue("@Wallet", Convert.ToDecimal(tb_Wallet.Text));
                cmd1.Parameters.AddWithValue("@Status", tb_Status.Text);
                cmd1.Parameters.AddWithValue("@Location", tb_Location.Text);
                cmd1.Parameters.AddWithValue("@Id", Session["Id"]);
                if(cmd1.ExecuteNonQuery() == 1)
                {
                    lbl_Error.Text = "";
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                }
                else
                {
                    lbl_Error.Text = "Incorrect values of one or more fields in Driver details.";
                }
            }
            else
            {
                lbl_Error.Text = "Incorrect values of one or more fields in Cab details.";
            }
            con.Close();
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
            tb_Status.Text = Status;
            tb_Location.Text = Location;
            ddl_Cab_Type.SelectedValue = CabType;
            tb_CabName.Text = CabName;
            tb_CabRegNo.Text = CabRegNo;
            tb_Fare.Text = Fare.ToString();
            ddl_Fuel_Type.SelectedValue = FuelType;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            GetData();
        }

        protected void GetData()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CabBookingDb"].ConnectionString;
            string query = "SELECT Name,Email,Password,ContactNo,WalletAmt,Status,Location,CabId FROM Driver WHERE Id=@Id";
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
            Status = reader.GetString(reader.GetOrdinal("Status"));
            Location = reader.GetString(reader.GetOrdinal("Location"));
            CabId = reader.GetInt32(reader.GetOrdinal("CabId"));
            lbl_Name.Text = Name;
            lbl_Email.Text = Email;
            lbl_Password.Text = Password;
            lbl_Contact.Text = ContactNo;
            lbl_Wallet.Text = WalletAmt.ToString();
            lbl_Status.Text = Status;
            lbl_Location.Text = Location;
            reader.Close();
            string query1 = "SELECT Type,CarName,CarRegNo,Fare,FuelType FROM Cab WHERE Id=@Id";
            SqlCommand cmd1 = new SqlCommand(query1);
            cmd1.Parameters.AddWithValue("@Id", CabId);
            cmd1.Connection = con;
            reader = cmd1.ExecuteReader();
            reader.Read();
            CabType = reader.GetString(reader.GetOrdinal("Type"));
            CabName = reader.GetString(reader.GetOrdinal("CarName"));
            CabRegNo = reader.GetString(reader.GetOrdinal("CarRegNo"));
            Fare = Convert.ToDouble(reader.GetDecimal(reader.GetOrdinal("Fare")));
            FuelType = reader.GetString(reader.GetOrdinal("FuelType"));
            reader.Close();
            lbl_Cab_Type.Text = CabType;
            lbl_Cab_Name.Text = CabName;
            lbl_Cab_RegNo.Text = CabRegNo;
            lbl_Cab_Fare.Text = Fare.ToString();
            lbl_Cab_FuelType.Text = FuelType;
            con.Close();
        }
    }
}