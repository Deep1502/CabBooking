<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="driverhome.aspx.cs" Inherits="CabBooking.driverhome" %>

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
            <h1>Driver Home</h1><br />
            <br />
            <asp:Button ID="btn_Profile" runat="server" OnClick="btn_Profile_Click" Text="View Profile" />
            <br />
            <br />
            <asp:Button ID="btn_View_Trips" runat="server" OnClick="btn_View_Trips_Click" Text="View My Trips" />
            <br />
            <br />
            <asp:Button ID="btn_Logout" runat="server" OnClick="btn_Logout_Click" Text="Logout" />
        </div>
    </form>
</body>
</html>
