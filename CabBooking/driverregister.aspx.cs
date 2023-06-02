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
    public partial class driverregister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "";
        }

        protected void btn_Register_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CabBookingDb"].ConnectionString;
            string query = "INSERT INTO Cab(Type, CarName, CarRegNo, Fare, FuelType) " +
                "VALUES(@Type, @CarName, @CarRegNo, @Fare, @FuelType); SELECT @@IDENTITY";
            try
            {
                using (con)
                {
                    SqlCommand cmd = new SqlCommand(query);
                    cmd.Parameters.AddWithValue("@Type", ddl_Cab_Type.SelectedValue);
                    cmd.Parameters.AddWithValue("@CarName", tb_Cab_Name.Text);
                    cmd.Parameters.AddWithValue("@CarRegNo", tb_Cab_Reg_No.Text);
                    cmd.Parameters.AddWithValue("@Fare", float.Parse(tb_Fare.Text));
                    cmd.Parameters.AddWithValue("@FuelType", ddl_Fuel_Type.SelectedValue);
                    cmd.Connection = con;
                    con.Open();
                    int cabid = Convert.ToInt32(cmd.ExecuteScalar());
                    string query1 = "INSERT INTO Driver(Name, Email, Password, ContactNo, WalletAmt, Status, Location, CabId)" +
                        "VALUES(@Name, @Email, @Password, @Contact, @Wallet, @Status, @Location, @CabId)";
                    SqlCommand cmd1 = new SqlCommand(query1);
                    cmd1.Parameters.AddWithValue("@Name", tb_Name.Text);
                    cmd1.Parameters.AddWithValue("@Email", tb_Email.Text);
                    cmd1.Parameters.AddWithValue("@Password", tb_Password.Text);
                    cmd1.Parameters.AddWithValue("@Contact", tb_Contact_Number.Text);
                    cmd1.Parameters.AddWithValue("@Wallet", 0);
                    cmd1.Parameters.AddWithValue("@Status", "Registration pending");
                    cmd1.Parameters.AddWithValue("@Location", tb_Location.Text);
                    cmd1.Parameters.AddWithValue("@CabId", cabid);
                    cmd1.Connection = con;
                    cmd1.ExecuteNonQuery();
                    con.Close();
                }
                Label1.Text = "Your request was sent to the admin successfully!!";
            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
            }
        }
    }
}