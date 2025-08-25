<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rental-Parking Spot</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
/* Background styling like previous page */
body {
    background-image: url('park3.jpg'); /* Replace with your background image */
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    color: white;
}

/* Navbar */
.navbar-inverse {
    background-color: rgba(0, 0, 0, 0.85);
    border: none;
}
.navbar-inverse .navbar-text {
    font-size: 22px;
    font-weight: bold;
}
.navbar-inverse .nav > li > a {
    color: turquoise;
    font-weight: bold;
}
.navbar-inverse .nav > li > a:hover {
    background-color: rgba(64, 224, 208, 0.2);
    color: white;
}

/* Contact Details Box */
.contact-box {
    background-color: rgba(0, 0, 0, 0.65);
    padding: 20px;
    border-radius: 10px;
    margin: 100px auto;
    max-width: 600px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.5);
}
.contact-box h3 {
    color: turquoise;
    font-weight: bold;
}
.contact-box pre {
    background: none;
    border: none;
    color: white;
    font-size: 16px;
}

/* Footer */
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: black;
   color: white;
   text-align: center;
   padding: 8px 0;
   font-size: 14px;
   opacity: 0.9;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<p class="navbar-text">Rental Parking Spot</p>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="Landing.jsp"><span
						class="glyphicon glyphicon-user"></span> Home</a></li>
			</ul>
		</div>
	</nav>

	<div class="contact-box">
		<h3>Contact Details:</h3>
		<pre>
Institute: X-workz(ODC)
Address: No 712/55, 62st Cross, 5th Block,
 Rajajinagar, Bengaluru, Karnataka 560010
Phone: 080 4866 9257
Website: www.x-workz.in
Hours: Mon-sat : 8am-7pm
		</pre>
	</div>

	<div class="footer">
		<small>@ 2025 Copyright &copy; Rental Parking Spot</small>
	</div>
</body>
</html>
