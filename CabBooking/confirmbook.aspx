<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirmbook.aspx.cs" Inherits="CabBooking.confirmbook" %>

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
            <h1>Confirm Booking Page</h1>
            <br />
            Source:<asp:Label ID="lbl_Source" runat="server" Text="Label"></asp:Label>
            <br />
            Destination:<asp:Label ID="lbl_Destination" runat="server" Text="Label"></asp:Label>
            <br />
            CabType:<asp:Label ID="lbl_CabType" runat="server" Text="Label"></asp:Label>
            <br />
            FuelType:<asp:Label ID="lbl_FuelType" runat="server" Text="Label"></asp:Label>
            <br />
            TotalFare:<asp:Label ID="lbl_Fare" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            Are you sure you want to book the cab?<br />
            <asp:Button ID="btn_yes" runat="server" OnClick="btn_yes_Click" Text="Yes" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_no" runat="server" OnClick="btn_no_Click" Text="No" />
        </div>
    </form>
</body>
</html>
