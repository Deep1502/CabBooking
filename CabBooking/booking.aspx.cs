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
    public partial class booking : System.Web.UI.Page
    {
        int BookingId, CustId, DriverId, CabId;
        DateTime Date;
        string Source, Destination, DriverName, DriverContactNo, CabType, CabRegNo, CabFuelType;
        double FareAmt, DriverWallet;
        protected void Page_Load(object sender, EventArgs e)
        {
            BookingId = Convert.ToInt32(Session["BookingId"]);
            if(BookingId == 0)
            {
                Response.Write("You have not booked any cab yet.");
            }
            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["CabBookingDb"].ConnectionString;
                string query = "SELECT * FROM Bookings WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query);
                cmd.Parameters.AddWithValue("@Id", BookingId);
                cmd.Connection = con;
                con.Open();
                var reader = cmd.ExecuteReader();
                reader.Read();
                Date = reader.GetDateTime(reader.GetOrdinal("Date"));
                Source = reader.GetString(reader.GetOrdinal("Source"));
                Destination = reader.GetString(reader.GetOrdinal("Destination"));
                FareAmt = Convert.ToDouble(reader.GetDecimal(reader.GetOrdinal("FareAmt")));
                CustId = reader.GetInt32(reader.GetOrdinal("CustId"));
                DriverId = reader.GetInt32(reader.GetOrdinal("DriverId"));
                CabId = reader.GetInt32(reader.GetOrdinal("CabId"));
                reader.Close();
                string query1 = "SELECT Name, ContactNo, WalletAmt FROM Driver WHERE Id=@Id";
                SqlCommand cmd1 = new SqlCommand(query1);
                cmd1.Parameters.AddWithValue("@Id", DriverId);
                cmd1.Connection = con;
                reader = cmd1.ExecuteReader();
                reader.Read();
                DriverName = reader.GetString(reader.GetOrdinal("Name"));
                DriverContactNo = reader.GetString(reader.GetOrdinal("ContactNo"));
                DriverWallet = Convert.ToDouble(reader.GetDecimal(reader.GetOrdinal("WalletAmt")));
                reader.Close();
                string query2 = "SELECT Type, CarRegNo, FuelType FROM Cab WHERE Id=@Id";
                SqlCommand cmd2 = new SqlCommand(query2);
                cmd2.Parameters.AddWithValue("@Id", CabId);
                cmd2.Connection = con;
                reader = cmd2.ExecuteReader();
                reader.Read();
                CabType = reader.GetString(reader.GetOrdinal("Type"));
                CabRegNo = reader.GetString(reader.GetOrdinal("CarRegNo"));
                CabFuelType = reader.GetString(reader.GetOrdinal("FuelType"));
                reader.Close();
                lbl_Source.Text = Source;
                lbl_Destination.Text = Destination;
                lbl_Fare.Text = FareAmt.ToString();
                lbl_Date.Text = Date.ToString();
                lbl_Driver_Name.Text = DriverName;
                lbl_Driver_Contact.Text = DriverContactNo;
                lbl_Cab_Type.Text = CabType;
                lbl_Cab_RegNo.Text = CabRegNo;
                lbl_Cab_Fuel.Text = CabFuelType;
                string query3 = "UPDATE Driver SET WalletAmt=@Wallet, Location=@Location WHERE Id=@Id";
                SqlCommand cmd3 = new SqlCommand(query3);
                cmd3.Parameters.AddWithValue("@Wallet", DriverWallet + FareAmt);
                cmd3.Parameters.AddWithValue("@Location", Destination);
                cmd3.Parameters.AddWithValue("@Id", DriverId);
                cmd3.Connection = con;
                cmd3.ExecuteNonQuery();
            }
        }
    }
}