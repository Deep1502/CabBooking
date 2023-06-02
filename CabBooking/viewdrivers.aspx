<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewdrivers.aspx.cs" Inherits="CabBooking.viewdrivers" %>

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
            <h1>View Drivers and their Cabs</h1><br />
            <br />
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" SortExpression="ContactNo" />
                    <asp:BoundField DataField="WalletAmt" HeaderText="WalletAmt" SortExpression="WalletAmt" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                    <asp:BoundField DataField="CabId" HeaderText="CabId" SortExpression="CabId" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:BoundField DataField="CarName" HeaderText="CarName" SortExpression="CarName" />
                    <asp:BoundField DataField="CarRegNo" HeaderText="CarRegNo" SortExpression="CarRegNo" />
                    <asp:BoundField DataField="Fare" HeaderText="Fare" SortExpression="Fare" />
                    <asp:BoundField DataField="FuelType" HeaderText="FuelType" SortExpression="FuelType" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CabBookingDb.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Driver.Id, Driver.Name, Driver.Email, Driver.Password, Driver.ContactNo, Driver.WalletAmt, Driver.Status, Driver.Location, Driver.CabId, Cab.Type, Cab.CarName, Cab.CarRegNo, Cab.Fare, Cab.FuelType FROM Driver INNER JOIN Cab ON Driver.CabId = Cab.Id"></asp:SqlDataSource>
            <br />
            <br />
            <asp:HyperLink ID="hl_Home" runat="server" NavigateUrl="~/adminhome.aspx">Back to Home Page</asp:HyperLink>
        </div>
    </form>
</body>
</html>
