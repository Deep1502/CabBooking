using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CabBooking
{
    public partial class adminhome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Session["Id"] = 0;
            Session["Role"] = "";
            Response.Redirect("~/adminlogin.aspx");
        }

        protected void btn_View_Customers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/viewcustomers.aspx");
        }

        protected void btn_bookings_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/viewbookings.aspx");
        }

        protected void btn_Driver_Cab_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/viewdrivers.aspx");
        }
    }
}