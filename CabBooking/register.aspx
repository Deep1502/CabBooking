<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="CabBooking.register" %>

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
form input[type="tel"]{
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
            <h2>Registration for Customers</h2><br />
            Name:
            <asp:TextBox ID="tb_Name" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Name" runat="server" ControlToValidate="tb_Name" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your name.</asp:RequiredFieldValidator>
            <br />
            Email:
            <asp:TextBox ID="tb_Email" runat="server" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ControlToValidate="tb_Email" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your email.</asp:RequiredFieldValidator>
            <br />
            Password:
            <asp:TextBox ID="tb_Password" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Password" runat="server" ControlToValidate="tb_Password" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter a password.</asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_Password" runat="server" ControlToValidate="tb_Password" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="((?=.*\d)(?=.*[A-Za-z])(?=.*[\W]).{6,20})">Password must be 6 to 20 characters, must contain one letter, one digit and one special symbol.</asp:RegularExpressionValidator>
            <br />
            Contact No:
            <asp:TextBox ID="tb_Contact" runat="server" TextMode="Phone"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Contact" runat="server" ControlToValidate="tb_Contact" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter your contact number.</asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_Contact" runat="server" ControlToValidate="tb_Contact" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{10}">Contact number must be of 10 digits</asp:RegularExpressionValidator>
            <br />
            <asp:Button ID="btn_Register" runat="server" OnClick="btn_Register_Click" Text="Register" />
            <br />
            <br />
            If you are a driver then <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/driverregister.aspx">Click here</asp:HyperLink> to register.
            <br />
        </div>
    </form>
</body>
</html>
