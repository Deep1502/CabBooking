<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="CabBooking.profile" %>

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
            <h1>User Profile</h1><br />
            <br />
            Name:
            <asp:Label ID="lbl_Name" runat="server" Text="Label"></asp:Label>
            <br />
            Email:
            <asp:Label ID="lbl_Email" runat="server" Text="Label"></asp:Label>
            <br />
            Password:
            <asp:Label ID="lbl_Password" runat="server" Text="Label"></asp:Label>
            <br />
            Contact No:
            <asp:Label ID="lbl_Contact" runat="server" Text="Label"></asp:Label>
            <br />
            Wallet Amount:
            <asp:Label ID="lbl_Wallet" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Panel ID="Panel2" runat="server">
                <asp:Button ID="btn_Edit" runat="server" OnClick="btn_Edit_Click" Text="Edit Profile" />
            </asp:Panel>
            <br />
            <asp:Panel ID="Panel1" runat="server">
                Name:
                <asp:TextBox ID="tb_Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Name" runat="server" ControlToValidate="tb_Name" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your name.</asp:RequiredFieldValidator>
                Email:
                <asp:TextBox ID="tb_Email" runat="server" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ControlToValidate="tb_Email" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your email.</asp:RequiredFieldValidator>
                Password:
                <asp:TextBox ID="tb_Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Password" runat="server" ControlToValidate="tb_Password" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter a password.</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator_Password" runat="server" ControlToValidate="tb_Password" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="((?=.*\d)(?=.*[A-Za-z])(?=.*[\W]).{6,20})">Password must be 6 to 20 characters, must contain one letter, one digit and one special symbol.</asp:RegularExpressionValidator>
                Contact No:
                <asp:TextBox ID="tb_Contact" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Contact" runat="server" ControlToValidate="tb_Contact" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your contact number.</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator_Contact" runat="server" ControlToValidate="tb_Contact" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{10}">Contact number must be of 10 digits</asp:RegularExpressionValidator>
                Wallet Amount:
                <asp:TextBox ID="tb_Wallet" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Wallet" runat="server" ControlToValidate="tb_Wallet" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter wallet amount.</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator_Wallet" runat="server" ControlToValidate="tb_Wallet" ErrorMessage="CompareValidator" ForeColor="Red" Operator="GreaterThanEqual" Type="Double" ValueToCompare="0.0">Wallet amount must be greater than or equal to 0</asp:CompareValidator>
                <asp:Button ID="btn_Submit" runat="server" Text="Edit Profile" OnClick="btn_Submit_Click" />
            </asp:Panel>
            <br />
            <asp:HyperLink ID="hl_home" runat="server" NavigateUrl="~/customerhome.aspx">Back to Home Page</asp:HyperLink>
        </div>
    </form>
</body>
</html>
