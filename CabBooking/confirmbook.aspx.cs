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
    public partial class confirmbook : System.Web.UI.Page
    {
        DateTime Date;
        string Source, Destination;
        double FareAmt;
        int CustId, DriverId, CabId, ReqId;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "";
            ReqId = Convert.ToInt32(Session["ReqId"]);
            if(ReqId == 0)
            {
                Response.Redirect("~/customerhome.aspx");
            }
            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["CabBookingDb"].ConnectionString;
                string query = "SELECT Source,Destination,CabId,Fare,DriverId FROM Request WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query);
                cmd.Parameters.AddWithValue("@Id", ReqId);
                cmd.Connection = con;
                con.Open();
                var reader = cmd.ExecuteReader();
                reader.Read();
                Source = reader.GetString(reader.GetOrdinal("Source"));
                Destination = reader.GetString(reader.GetOrdinal("Destination"));
                CabId = reader.GetInt32(reader.GetOrdinal("CabId"));
                FareAmt = Convert.ToDouble(reader.GetDecimal(reader.GetOrdinal("Fare")));
                DriverId = reader.GetInt32(reader.GetOrdinal("DriverId"));
                reader.Close();
                string query1 = "SELECT Type,FuelType FROM Cab WHERE Id=@Id";
                SqlCommand cmd1 = new SqlCommand(query1);
                cmd1.Parameters.AddWithValue("@Id", CabId);
                cmd1.Connection = con;
                reader = cmd1.ExecuteReader();
                reader.Read();
                lbl_Source.Text = Source;
                lbl_Destination.Text = Destination;
                lbl_CabType.Text = reader.GetString(reader.GetOrdinal("Type"));
                lbl_FuelType.Text = reader.GetString(reader.GetOrdinal("FuelType"));
                lbl_Fare.Text = FareAmt.ToString();
                reader.Close();
                con.Close();
            }
        }

        protected void btn_yes_Click(object sender, EventArgs e)
        {
            Date = DateTime.Now;
            CustId = Convert.ToInt32(Session["Id"]);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CabBookingDb"].ConnectionString;
            string query2 = "SELECT WalletAmt FROM Customer WHERE Id=@Id";
            SqlCommand cmd2 = new SqlCommand(query2);
            cmd2.Parameters.AddWithValue("@Id", CustId);
            cmd2.Connection = con;
            con.Open();
            double WalletAmt = Convert.ToDouble(cmd2.ExecuteScalar());
            if(WalletAmt >= FareAmt)
            {
                string query = "INSERT INTO Bookings (Date,Source,Destination,FareAmt,CustId,DriverId,CabId)" +
                "VALUES(@Date,@Source,@Dest,@Fare,@CustId,@DriverId,@CabId); SELECT @@IDENTITY";
                SqlCommand cmd = new SqlCommand(query);
                cmd.Parameters.AddWithValue("@Date", Date);
                cmd.Parameters.AddWithValue("@Source", Source);
                cmd.Parameters.AddWithValue("@Dest", Destination);
                cmd.Parameters.AddWithValue("@Fare", FareAmt);
                cmd.Parameters.AddWithValue("@CustId", CustId);
                cmd.Parameters.AddWithValue("@DriverId", DriverId);
                cmd.Parameters.AddWithValue("@CabId", CabId);
                cmd.Connection = con;
                int BookingId = Convert.ToInt32(cmd.ExecuteScalar());
                Session["BookingId"] = BookingId;
                string query1 = "DELETE FROM Request WHERE Id=@Id";
                SqlCommand cmd1 = new SqlCommand(query1);
                cmd1.Parameters.AddWithValue("@Id", ReqId);
                cmd1.Connection = con;
                cmd1.ExecuteNonQuery();
                string query3 = "UPDATE Customer SET WalletAmt=@Wallet WHERE Id=@Id";
                SqlCommand cmd3 = new SqlCommand(query3);
                cmd3.Parameters.AddWithValue("@Wallet", WalletAmt - FareAmt);
                cmd3.Parameters.AddWithValue("@Id", CustId);
                cmd3.Connection = con;
                cmd3.ExecuteNonQuery();
                Response.Redirect("~/booking.aspx");
            }
            else
            {
                Label1.Text = "Insufficient amount in your wallet.";
            }
        }

        protected void btn_no_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CabBookingDb"].ConnectionString;
            string query = "DELETE FROM Request WHERE Id=@Id";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@Id", ReqId);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/customerhome.aspx");
        }
    }
}