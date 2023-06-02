<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userbookings.aspx.cs" Inherits="CabBooking.userbookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <nav>
        <span>EasyJourney</span>
    </nav>
    <form id="form1" runat="server">
        <div>
            <h1>Users Bookings</h1><br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Source" HeaderText="Source" SortExpression="Source" />
                    <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
                    <asp:BoundField DataField="FareAmt" HeaderText="FareAmt" SortExpression="FareAmt" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" SortExpression="ContactNo" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:BoundField DataField="FuelType" HeaderText="FuelType" SortExpression="FuelType" />
                    <asp:BoundField DataField="CarRegNo" HeaderText="CarRegNo" SortExpression="CarRegNo" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CabBookingDb.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT b.Id, b.Source, b.Destination, b.FareAmt, b.Date, d.Name, d.ContactNo, c.Type, c.FuelType, c.CarRegNo FROM Bookings AS b INNER JOIN Cab AS c ON b.CabId = c.Id INNER JOIN Driver AS d ON b.DriverId = d.Id"></asp:SqlDataSource>
            <br />
            <asp:HyperLink ID="hl_home" runat="server" NavigateUrl="~/customerhome.aspx">Back to Home Page</asp:HyperLink>
        </div>
    </form>
</body>
</html>
