<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="driverlogin.aspx.cs" Inherits="CabBooking.driverlogin" %>

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
	display:flex;
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
form input[type="password"] {
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
            <h2>Driver Login</h2><br />
            <br />
            Email:
            <asp:TextBox ID="tb_Email" runat="server" TextMode="Email"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ControlToValidate="tb_Email" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter an email.</asp:RequiredFieldValidator>
            <br />
            Password:
            <asp:TextBox ID="tb_Password" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Password" runat="server" ControlToValidate="tb_Password" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter a password.</asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_Password" runat="server" ControlToValidate="tb_Password" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="((?=.*\d)(?=.*[A-Za-z])(?=.*[\W]).{6,20})">Password must be 6 to 20 characters, must contain one letter, one digit and one special symbol.</asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Button ID="btn_Login" runat="server" OnClick="btn_Login_Click" Text="Login" />
            <br />
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="hl_Home" runat="server" NavigateUrl="~/login.aspx">Back to Login</asp:HyperLink>
        </div>
    </form>
</body>
</html>
