<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewdriverprofile.aspx.cs" Inherits="CabBooking.viewdriverprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style.css" type="text/css" rel="stylesheet" />
    <style>
        form span{
            color:black;
        }
    </style>
</head>
<body>
    <nav>
        <span>EasyJourney</span>
    </nav>
    <form id="form1" runat="server">
        <div>
            <h1>View Profile</h1>
            <br />
            <h3>Driver details:</h3>
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
            Status:
            <asp:Label ID="lbl_Status" runat="server" Text="Label"></asp:Label>
            <br />
            Location:
            <asp:Label ID="lbl_Location" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <h3>Cab Details:</h3>
            Type:
            <asp:Label ID="lbl_Cab_Type" runat="server" Text="Label"></asp:Label>
            <br />
            Car Name:
            <asp:Label ID="lbl_Cab_Name" runat="server" Text="Label"></asp:Label>
            <br />
            Car Registration Number:
            <asp:Label ID="lbl_Cab_RegNo" runat="server" Text="Label"></asp:Label>
            <br />
            Fare:
            <asp:Label ID="lbl_Cab_Fare" runat="server" Text="Label"></asp:Label>
            <br />
            Fuel Type:
            <asp:Label ID="lbl_Cab_FuelType" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Panel ID="Panel2" runat="server">
                <asp:Button ID="btn_Edit" runat="server" OnClick="btn_Edit_Click" Text="Edit Profile" />
            </asp:Panel>
            <br />
            <asp:Panel ID="Panel1" runat="server">
                <h3>Driver details:</h3><br /> Name:
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Contact" runat="server" ControlToValidate="tb_Contact" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your contact number.</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator_Contact" runat="server" ControlToValidate="tb_Contact" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{10}">Contact number must be of 10 digits</asp:RegularExpressionValidator>
                Wallet Amount:
                <asp:TextBox ID="tb_Wallet" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Wallet" runat="server" ControlToValidate="tb_Wallet" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter wallet amount.</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator_Wallet" runat="server" ControlToValidate="tb_Wallet" ErrorMessage="CompareValidator" ForeColor="Red" Operator="GreaterThanEqual" Type="Double" ValueToCompare="0.0">Wallet amount must be greater than or equal to 0</asp:CompareValidator>
                Status:
                <asp:TextBox ID="tb_Status" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Status" runat="server" ControlToValidate="tb_Status" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your status.</asp:RequiredFieldValidator>
                Location:
                <asp:TextBox ID="tb_Location" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Location" runat="server" ControlToValidate="tb_Location" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your location.</asp:RequiredFieldValidator>
                <br />
                <h3>Cab details:</h3><br /> Type:
                <asp:DropDownList ID="ddl_Cab_Type" runat="server">
                    <asp:ListItem>Motorcycle</asp:ListItem>
                    <asp:ListItem>Rickshaw</asp:ListItem>
                    <asp:ListItem>Sedan</asp:ListItem>
                    <asp:ListItem>Hatchback</asp:ListItem>
                    <asp:ListItem>SUV</asp:ListItem>
                    <asp:ListItem>Minivan</asp:ListItem>
                </asp:DropDownList>
                <br />
                Car Name:
                <asp:TextBox ID="tb_CabName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_CarName" runat="server" ControlToValidate="tb_CabName" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your vehicle name.</asp:RequiredFieldValidator>
                Car Registration Number:
                <asp:TextBox ID="tb_CabRegNo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_RegNo" runat="server" ControlToValidate="tb_CabRegNo" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your vehicle registration number.</asp:RequiredFieldValidator>
                Fare (per km):
                <asp:TextBox ID="tb_Fare" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Fare" runat="server" ControlToValidate="tb_Fare" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your fare amount.</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator_Fare" runat="server" ControlToValidate="tb_Fare" ErrorMessage="CompareValidator" ForeColor="Red" Operator="GreaterThanEqual" Type="Double" ValueToCompare="0.0">Fare amount must be greater than 0.</asp:CompareValidator>
                Fuel Type:
                <asp:DropDownList ID="ddl_Fuel_Type" runat="server">
                    <asp:ListItem>Petrol</asp:ListItem>
                    <asp:ListItem>Diesel</asp:ListItem>
                    <asp:ListItem>CNG</asp:ListItem>
                    <asp:ListItem>Electric</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="btn_Submit" runat="server" Text="Edit Profile" OnClick="btn_Submit_Click" />
                <br />
                <asp:Label ID="lbl_Error" runat="server" ForeColor="Red"></asp:Label>
            </asp:Panel>
            <br />
            <br />
            <asp:HyperLink ID="hl_home" runat="server" NavigateUrl="~/driverhome.aspx">Back to Home</asp:HyperLink>
        </div>
    </form>
</body>
</html>
