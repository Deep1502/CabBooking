<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="CabBooking.adminhome" %>

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
            <h1>Admin Home</h1>
            <br />
            <asp:Button ID="btn_View_Customers" runat="server" OnClick="btn_View_Customers_Click" Text="View Customers" />
            &nbsp;&nbsp;&nbsp;<br /><br />
            <asp:Button ID="btn_bookings" runat="server" OnClick="btn_bookings_Click" Text="View Bookings" />
&nbsp;&nbsp;&nbsp;<br /><br>
            <asp:Button ID="btn_Driver_Cab" runat="server" Text="View Drivers and Cabs" OnClick="btn_Driver_Cab_Click" />
            <br />
            <hr />
            <h2>Accept Driver Registrations</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" EmptyDataText="No registration requests pending." BackColor=#ffff4d BorderColor="#ffff4d" BorderStyle="Solid" BorderWidth="1px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                    <asp:BoundField DataField="Password" HeaderText="Password" ReadOnly="True" SortExpression="Password" />
                    <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" ReadOnly="True" SortExpression="ContactNo" />
                    <asp:BoundField DataField="WalletAmt" HeaderText="WalletAmt" ReadOnly="True" SortExpression="WalletAmt" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="Location" HeaderText="Location" ReadOnly="True" SortExpression="Location" />
                    <asp:BoundField DataField="CabId" HeaderText="CabId" ReadOnly="True" SortExpression="CabId" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CabBookingDb.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Driver] WHERE ([Status] = @Status)"
                UpdateCommand="UPDATE Driver SET Status=@Status WHERE Id=@Id">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="Registration pending" Name="Status" QueryStringField="@Status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="btn_Logout" runat="server" OnClick="btn_Logout_Click" Text="Logout" />
        </div>
    </form>
</body>
</html>
