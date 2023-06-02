<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customerhome.aspx.cs" Inherits="CabBooking.customerhome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <nav>
        <span>EasyJourney</span>
    </nav>
    <form id="form1" runat="server">
        <div>
            <h1>Customer Home</h1>
            <br />
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            <br />
            Select source and destination locations:<br />
            <br />
            Source
            <asp:DropDownList ID="ddl_Source" runat="server" DataSourceID="SqlDataSource1" DataTextField="Source" DataValueField="Source">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CabBookingDb.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [Source] FROM [Location]"></asp:SqlDataSource>
            <br />
            Destination
            <asp:DropDownList ID="ddl_Destination" runat="server" DataSourceID="SqlDataSource2" DataTextField="Destination" DataValueField="Destination">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CabBookingDb.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [Destination] FROM [Location]"></asp:SqlDataSource>
            <br />
            Cab Type
            <asp:DropDownList ID="ddl_Cab_Type" runat="server">
                <asp:ListItem>Motorcycle</asp:ListItem>
                <asp:ListItem>Rickshaw</asp:ListItem>
                <asp:ListItem>Sedan</asp:ListItem>
                <asp:ListItem>Hatchback</asp:ListItem>
                <asp:ListItem>SUV</asp:ListItem>
                <asp:ListItem>Minivan</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Fuel Type of cab <asp:DropDownList ID="ddl_Fuel_Type" runat="server">
                <asp:ListItem>CNG</asp:ListItem>
                <asp:ListItem>Petrol</asp:ListItem>
                <asp:ListItem>Diesel</asp:ListItem>
                <asp:ListItem>Electric</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btn_Submit" runat="server" OnClick="btn_Submit_Click" Text="Submit" />
            <br />
            <br />
            You can view your profile
            <asp:HyperLink ID="hl_profile" runat="server" NavigateUrl="~/profile.aspx">here</asp:HyperLink>
            .<br />
            You can view all your past bookings
            <asp:HyperLink ID="hl_user_bookings" runat="server" NavigateUrl="~/userbookings.aspx">here</asp:HyperLink>
            .<br />
            <br />
            <asp:Button ID="btn_Logout" runat="server" OnClick="btn_Logout_Click" Text="Logout" />
        </div>
    </form>
</body>
</html>
