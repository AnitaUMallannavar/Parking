<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<!-- CSS link -->
<link rel="stylesheet" href="style.css">
<title>Rental-Parking Spot</title>
<style>
.selector-for-some-widget {
	box-sizing: content-box;
}

/* Background video */
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
	overflow-x: hidden;
}

.video-bg {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	z-index: -1; /* keep video behind content */
}

.content {
	position: relative;
	z-index: 1;
	color: #fff;
}

/* Footer */
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.8);
	text-align: center;
	height: 5%;
	font-size: 14px;
	z-index: 2;
}
</style>
<script>
function enableSubmit(){
	console.log("enableSubmit() logged-in");
	let input = document.getElementById('email');
	let btn = document.querySelector('input[type="submit"]');
	let isValid = true;
	let changedInput = input;
	if (changedInput.value.trim() === "" || changedInput.value === null){
		isValid = false;
	}
	btn.disabled = !isValid;
}

function enableOTPSubmit(){
	console.log("enableOTPSubmit() logged-in");
	let input = document.getElementById('otp');
	let btn = document.getElementById('OtpSubmitBtn');
	let isValid = true;
	let changedInput = input;
	if (changedInput.value.trim() === "" || changedInput.value === null){
		isValid = false;
	}
	btn.disabled = !isValid;
}
</script>
<script>
function EmailAjax(){
	var email=document.getElementById("email").value;
	var url="http://localhost:8080/parking-rental-app/validateEmailForOPT/"+email;
	const xmlHttp=new XMLHttpRequest();
	xmlHttp.open("GET", url);
	xmlHttp.send();
	xmlHttp.onload=function(){
		document.getElementById("emailDisplay").innerHTML=this.responseText;
	}
}

function OTPAjax(){
	var otp=document.getElementById("otp").value;
	var url="http://localhost:8080/parking-rental-app/validateOTP/"+otp;
	const xmlHttp=new XMLHttpRequest();
	xmlHttp.open("POST", url);
	xmlHttp.send();
	xmlHttp.onload=function(){
		document.getElementById("OtpDisplay").innerHTML=this.responseText;
	}
}
</script>
</head>
<body>
	<!-- Background video -->
	<video autoplay muted loop class="video-bg">
		<source src="Parking.mp4" type="video/mp4">
		Your browser does not support the video tag.
	</video>

	<!-- Page Content -->
	<div class="content">
		<nav class="navbar fixed-top navbar-dark bg-dark" style="height: 50px;">
			<div class="container-fluid">
				<img src="parking_PNG74.png" class="w3-bar w3-border" width="85" height="50">
				<div class="navbar-left" style="margin-top: -5px;">
					<a href="UserHome.jsp" class="btn btn-sm"
						style="background-color: turquoise;">Home</a>
				</div>
			</div>
		</nav>

		<div class="container">
			<div class="row justify-content-center mt-5">
				<div class="col-lg-6 col-md-8 col-sm-8" style="margin-top:-5%;">
					<span style="color:blue;margin-right: 20%;"><b>${generateOtpSuccess}</b></span>
					<span style="color:red;margin-left: -20%;"><b>${generateOtpError}</b></span>
					<span style="color:red;margin-right: 20%;"><b>${acctLocked}</b></span>
					<span style="color:red;margin-left: -20%;"><b>${otpExpired}</b></span>

					<div class="card shadow" style="width: 400px;">
						<div class="card-title text-center border-bottom" style="background-color: turquoise;">
							<h3 class="p-2" style="color: black;">User Login</h3>
						</div>
						<div class="card-body">
							<form action="generateOTPAndLogin" method="post" class="container center" style="margin-right: 50px">
								<span style="color:red;font-size: 12px;" id="emailDisplay">${emailError}</span>
								<div class="row">
									<div class="col-md-7 mt-md-0 mt-3">
										<input type="text"  class="form-control shadow" onkeyup="enableSubmit()" id="email" name="email" value="${mail}" placeholder="Enter email address" onchange="EmailAjax()"/>
									</div>
									<div class="col-md-4 mt-md-0 mt-3">
										<input type="submit" name="generateOtp" value="Generate OTP" class="btn w-60 shadow" style="background-color: turquoise;text-align: center;" disabled>
									</div>
								</div>

								<br/><span style="color:red;font-size: 12px;" id="OtpDisplay">${otpError}</span>
								<div class="row">
									<div class="col-md-7 mt-md-0 mt-3">
										<input type="text" class="form-control shadow" id="otp" name="otp" onkeyup="enableOTPSubmit()" placeholder="Enter OTP" onchange="OTPAjax()"/>
									</div>
									<div class="col-md-4 mt-md-0 mt-2">
										<input type="submit" name="login" value="Login" id="OtpSubmitBtn" class="btn w-60 shadow" style="background-color: turquoise;text-align: center;" disabled>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<div class="footer">
			<small style="color: white;">&copy; Created by: </small>
			<small style="color: white;">Anita U Mallannavar,</small>
			<small style="color: white;">&ensp;anitaum007@gmail.com</small>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
