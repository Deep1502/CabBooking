using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CabBooking
{
    public partial class driverhome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Session["Id"] = 0;
            Session["Role"] = "";
            Response.Redirect("~/driverlogin.aspx");
        }

        protected void btn_View_Trips_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/viewtrips.aspx");
        }

        protected void btn_Profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/viewdriverprofile.aspx");
        }
    }
}