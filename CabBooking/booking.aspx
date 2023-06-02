<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="booking.aspx.cs" Inherits="CabBooking.booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <style>
        form span{
            color: black;
        }
    </style>
</head>
<body>
    <nav>
        <span>EasyJourney</span>
    </nav>
    <form id="form1" runat="server">
        <div>
            <h1>Booking details</h1><br />
            <br />
            <h3>Trip details:</h3><br />
            Source:<asp:Label ID="lbl_Source" runat="server" Text="Label"></asp:Label>
            <br />
            Destination:<asp:Label ID="lbl_Destination" runat="server" Text="Label"></asp:Label>
            <br />
            Total Fare:<asp:Label ID="lbl_Fare" runat="server" Text="Label"></asp:Label>
            <br />
            Date of booking:<asp:Label ID="lbl_Date" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <h3>Driver details:</h3><br />
            Name:<asp:Label ID="lbl_Driver_Name" runat="server" Text="Label"></asp:Label>
            <br />
            Contact No:<asp:Label ID="lbl_Driver_Contact" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <h3>Cab details:</h3><br />
            Type:<asp:Label ID="lbl_Cab_Type" runat="server" Text="Label"></asp:Label>
            <br />
            Registration No:<asp:Label ID="lbl_Cab_RegNo" runat="server" Text="Label"></asp:Label>
            <br />
            Fuel Type:<asp:Label ID="lbl_Cab_Fuel" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            You can view all your bookings
            <asp:HyperLink ID="hl_user_bookings" runat="server" NavigateUrl="~/userbookings.aspx">here</asp:HyperLink>
            .<br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/customerhome.aspx">Back to Home Page</asp:HyperLink>
        </div>
    </form>
</body>
</html>
