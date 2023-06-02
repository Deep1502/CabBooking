<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CabBooking.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        * {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
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
	display: block;
	line-height: 50px;
}

    nav ul {
        list-style: none;
        margin-left: 70vw;
        /*padding-left: 1200px;*/
    }

    nav li {
        float: right;
    }

    nav a {
        display: block;
        padding: 0 10px;
        line-height: 50px;
        color: #ffff4d;
        text-decoration: none;
    }
	#nav-ul{
		/*display: inline-block;*/
		float: right;
	}
main {
	width: 100%;
	margin: 0 auto;
	padding: 20px;
}

.hero {
	background-image: url('cab.jpeg');
	background-size: 100% 100%;
	background-position: left;
	color: white;
	text-align: right;
	padding: 300px 20px;
}

.hero h2 {
	font-size: 48px;
	font-weight: bold;
	margin-bottom: 20px;
}

.hero p {
	font-size: 24px;
	margin-bottom: 20px;
}

.services {
	margin-top: 50px;
	text-align: center;
}

.services h2 {
	font-size: 36px;
	font-weight: bold;
	margin-bottom: 20px;
}

.services ul {
	list-style: none;
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	margin: 0;
	padding: 0;
}

.services li {
	font-size: 24px;
	margin: 20px;
}

.about {
	margin-top: 50px;
	text-align: center;
}

.about h2 {
	font-size: 36px;
	font-weight: bold;
	margin-bottom: 20px;
}

.about p {
	font-size: 24px;
	margin-bottom: 20px;
}

footer {
	background-color: #333;
	color: #fff;
	padding: 20px;
	text-align: center;
	margin-top: 50px;
}

footer p {
	font-size: 18px
}
    </style>
</head>
<body>
    <nav>
		<span>EasyJourney</span>
		<ul id="nav-ul">
			<li><a href="register.aspx">Register</a></li>
			<li><a href="login.aspx">Login</a></li>
		</ul>
	</nav>
	<main>
		<section class="hero">
			<h2>Get a Ride Anytime, Anywhere</h2>
			<p>Book your ride with us and enjoy a comfortable and safe journey to your destination.</p>
		</section>
		<section class="services">
			<h2>Our Services</h2>
			<ul>
				<li>24/7 Availability</li>
				<li>Easy Online Booking</li>
				<li>Professional Drivers</li>
				<li>Affordable Prices</li>
				<li>Wide Range of Vehicles</li>
			</ul>
		</section>
		<section class="about">
			<h2>About Us</h2>
			<p>We are a leading cab booking service that provides reliable and affordable transportation to people all over the city. Our mission is to make traveling easier and more convenient for everyone.</p>
		</section>
	</main>
	<footer>
		<p>&copy; 2023 Cab Booking System. All rights reserved.</p>
	</footer>
</body>
</html>
