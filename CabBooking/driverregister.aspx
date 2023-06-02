<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="driverregister.aspx.cs" Inherits="CabBooking.driverregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
	background-color: #ffff4d;
	margin: 0;
	padding: 0;
    font-size: 20px;
}
nav {
	background-color: black;
	color: white;
	height: 50px;
    display: flex;
}
nav span{
    color: #ffff4d;
    line-height: 50px;
}
nav ul {
	list-style: none;
	margin: 0;
	padding-left: 1250px;
}

nav li {
	float: left;
}

nav a {
	display: block;
	padding: 0 10px;
	line-height: 50px;
	color: #ffff4d;
	text-decoration: none;
}

form {
	background-color: white;
	margin: auto;
	margin-top: 50px;
	padding: 20px;
	width: 400px;
	border-radius: 5px;
	box-shadow: 0px 0px 5px grey;
}

form h2 {
	margin-top: 0;
}

form label {
	display: block;
	margin-bottom: 5px;
}

form input[type="email"],
form input[type="password"],
form input[type="text"],
form input[type="tel"],
form input[type="number"],
select{
	width: 90%;
	padding: 10px;
	margin-bottom: 20px;
	border: none;
	border-radius: 5px;
	box-shadow: 0px 0px 5px grey;
}

form input[type="submit"] {
	background-color: black;
	color: #ffff4d;
	border: none;
	border-radius: 5px;
	padding: 10px;
	cursor: pointer;
    font-size: 20px;
}

form input[type="submit"]:hover {
	background-color: grey;
}
    </style>
</head>
<body>
    <nav>
        <span>EasyJourney</span>
		<ul>
			<li><a href="Home.aspx">Home</a></li>
			<li><a href="register.aspx">Register</a></li>
			<li><a href="login.aspx">Login</a></li>
		</ul>
	</nav>
    <form id="form1" runat="server">
        <div>
            <h2>Registration for Drivers</h2><br />
            Driver registration will be accepted by the Admins.<br />
            <br />
            <h3>Driver details:</h3><br />
            Name:
            <asp:TextBox ID="tb_Name" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Name" runat="server" ControlToValidate="tb_Name" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your name.</asp:RequiredFieldValidator>
            <br />
            Email:
            <asp:TextBox ID="tb_Email" runat="server" TextMode="Email"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ControlToValidate="tb_Email" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your email.</asp:RequiredFieldValidator>
            <br />
            Password:
            <asp:TextBox ID="tb_Password" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Password" runat="server" ControlToValidate="tb_Password" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter a password.</asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_Password" runat="server" ControlToValidate="tb_Password" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="((?=.*\d)(?=.*[A-Za-z])(?=.*[\W]).{6,20})">Password must be 6 to 20 characters, must contain one letter, one digit and one special symbol.</asp:RegularExpressionValidator>
            <br />
            Contact Number:
            <asp:TextBox ID="tb_Contact_Number" runat="server" TextMode="Phone"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Contact" runat="server" ControlToValidate="tb_Contact_Number" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your contact number.</asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_Contact" runat="server" ControlToValidate="tb_Contact_Number" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{10}">Contact number must be of 10 digits</asp:RegularExpressionValidator>
            <br />
            Current Location:
            <asp:TextBox ID="tb_Location" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Location" runat="server" ControlToValidate="tb_Location" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your location.</asp:RequiredFieldValidator>
            <br />
            <h3>Cab details:</h3><br />
            Type:
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
            <asp:TextBox ID="tb_Cab_Name" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_CarName" runat="server" ControlToValidate="tb_Cab_Name" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your vehicle name.</asp:RequiredFieldValidator>
            <br />
            Registration No:
            <asp:TextBox ID="tb_Cab_Reg_No" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_RegNo" runat="server" ControlToValidate="tb_Cab_Reg_No" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your vehicle registration number.</asp:RequiredFieldValidator>
            <br />
            Fuel Type:
            <asp:DropDownList ID="ddl_Fuel_Type" runat="server">
                <asp:ListItem>Petrol</asp:ListItem>
                <asp:ListItem>Diesel</asp:ListItem>
                <asp:ListItem>CNG</asp:ListItem>
                <asp:ListItem>Electric</asp:ListItem>
            </asp:DropDownList>
            <br />
            Fare (per km):
            <asp:TextBox ID="tb_Fare" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Fare" runat="server" ControlToValidate="tb_Fare" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your fare amount.</asp:RequiredFieldValidator>
            <br />
            <asp:CompareValidator ID="CompareValidator_Fare" runat="server" ControlToValidate="tb_Fare" ErrorMessage="CompareValidator" ForeColor="Red" Operator="GreaterThanEqual" Type="Double" ValueToCompare="0.0">Fare amount must be greater than 0.</asp:CompareValidator>
            <br />
            <br />
            <asp:Button ID="btn_Register" runat="server" OnClick="btn_Register_Click" Text="Send Request" />
            <br />
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/register.aspx">Back to Register</asp:HyperLink>
        </div>
    </form>
</body>
</html>
