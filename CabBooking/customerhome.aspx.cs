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
    public partial class customerhome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id"] != null)
            {
                Label1.Text = "";
            }
            else
            {
                Label1.Text = "Login is required to book a cab.";
            }
        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Session["Id"] = 0;
            Session["Role"] = "";
            Response.Redirect("~/login.aspx");
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CabBookingDb"].ConnectionString;
            string query = "SELECT COUNT(*) FROM Driver WHERE Location=@Location AND Status=@Status";
            try
            {
                using (con)
                {
                    SqlCommand cmd = new SqlCommand(query);
                    cmd.Parameters.AddWithValue("@Location", ddl_Source.SelectedValue);
                    cmd.Parameters.AddWithValue("@Status", "Idle");
                    cmd.Connection = con;
                    con.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if(count == 0)
                    {
                        Label1.Text = "We are unable to find a driver that matches your choices!";
                    }
                    else
                    {
                        string query1 = "SELECT Id,CabId FROM Driver WHERE Location=@Location AND Status=@Status AND CabId IN (SELECT Id FROM Cab WHERE FuelType=@Fuel AND Type=@Type)";
                        SqlCommand cmd1 = new SqlCommand(query1);
                        cmd1.Parameters.AddWithValue("@Location", ddl_Source.SelectedValue);
                        cmd1.Parameters.AddWithValue("@Status", "Idle");
                        cmd1.Parameters.AddWithValue("@Fuel", ddl_Fuel_Type.SelectedValue);
                        cmd1.Parameters.AddWithValue("@Type", ddl_Cab_Type.SelectedValue);
                        cmd1.Connection = con;
                        var reader = cmd1.ExecuteReader();
                        if (reader.HasRows)
                        {
                            reader.Read();
                            int DriverId = reader.GetInt32(reader.GetOrdinal("Id"));
                            int CabId = reader.GetInt32(reader.GetOrdinal("CabId"));
                            reader.Close();
                            string query2 = "SELECT Fare FROM Cab WHERE Id=@Id";
                            SqlCommand cmd2 = new SqlCommand(query2);
                            cmd2.Parameters.AddWithValue("@Id", CabId);
                            cmd2.Connection = con;
                            double Fare = Convert.ToDouble(cmd2.ExecuteScalar());
                            string query3 = "SELECT Distance FROM Location WHERE Source=@Source AND Destination=@Dest";
                            SqlCommand cmd3 = new SqlCommand(query3);
                            cmd3.Parameters.AddWithValue("@Source", ddl_Source.SelectedValue);
                            cmd3.Parameters.AddWithValue("@Dest", ddl_Destination.SelectedValue);
                            cmd3.Connection = con;
                            int Distance = Convert.ToInt32(cmd3.ExecuteScalar());
                            string query4 = "INSERT INTO Request (CustId,DriverId,Source,Destination,CabId,Fare) " +
                                "VALUES (@CustId,@DriverId,@Source,@Destination,@CabId,@Fare);SELECT @@IDENTITY";
                            SqlCommand cmd4 = new SqlCommand(query4);
                            cmd4.Parameters.AddWithValue("@CustId", Session["Id"]);
                            cmd4.Parameters.AddWithValue("@DriverId", DriverId);
                            cmd4.Parameters.AddWithValue("@Source", ddl_Source.SelectedValue);
                            cmd4.Parameters.AddWithValue("@Destination", ddl_Destination.SelectedValue);
                            cmd4.Parameters.AddWithValue("@CabId", CabId);
                            cmd4.Parameters.AddWithValue("@Fare", Fare*Distance);
                            cmd4.Connection = con;
                            int ReqId = Convert.ToInt32(cmd4.ExecuteScalar());
                            Session["ReqId"] = ReqId;
                            Response.Redirect("~/confirmbook.aspx");
                        }
                        else
                        {
                            Label1.Text = "We are unable to find a driver that matches your choices!";
                        }
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "Errors: " + ex.Message;
            }
        }
    }
}