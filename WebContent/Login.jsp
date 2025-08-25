<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html long="en">
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
</style>
<style>
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: black;
	text-align: center;
  	height: 5%;
  	font-size: 14px;
}
</style>
<script>
function enableSubmit(){
	console.log("enableSubmit() logged-in");
let input = document.getElementById('email'); // Enter your class name for a required field, this should also be reflected within your form fields.
console.log("input: "+input);
let btn = document.querySelector('input[type="submit"]');
console.log("btn: "+btn);
let isValid = true;
//for (var i = 0; i < inputs.length; i++){
//let changedInput = inputs[i];
let changedInput = input;
console.log("changedInput: "+changedInput);
if (changedInput.value.trim() === "" || changedInput.value === null){
isValid = false;
//break;
//}
}
btn.disabled = !isValid;
console.log("btn.disabled: "+btn.disabled);
}
</script>
<script>
function enableOTPSubmit(){
	console.log("enableOTPSubmit() logged-in");
let input = document.getElementById('otp'); // Enter your class name for a required field, this should also be reflected within your form fields.
console.log("input: "+input);
let btn = document.getElementById('OtpSubmitBtn');
console.log("btn: "+btn);
let isValid = true;
//for (var i = 0; i < inputs.length; i++){
//let changedInput = inputs[i];
let changedInput = input;
console.log("changedInput: "+changedInput);
if (changedInput.value.trim() === "" || changedInput.value === null){
isValid = false;
//break;
//}
}
btn.disabled = !isValid;
console.log("btn.disabled: "+btn.disabled);
}
</script>
<script> 
function EmailAjax(){
console.log("EmailAjax logged-in");
var email=document.getElementById("email").value;
var url="http://localhost:8080/parking-rental-app/validateEmailForOPT/"+email;
console.log(url);
const xmlHttp=new XMLHttpRequest();
xmlHttp.open("GET", url);
xmlHttp.send();
xmlHttp.onload=function(){
	console.log(this.responseText);
	document.getElementById("emailDisplay").innerHTML=this.responseText;	
}
}

function OTPAjax(){
console.log("OTPAjax logged-in");
var otp=document.getElementById("otp").value;
//var url="http://localhost:8080/parking-rental-app/validateOTP/"+email+"/"+otp;
var url="http://localhost:8080/parking-rental-app/validateOTP/"+otp;
console.log(url);
const xmlHttp=new XMLHttpRequest();
xmlHttp.open("GET", url);
xmlHttp.send();
xmlHttp.onload=function(){
	console.log(this.responseText);
	document.getElementById("OtpDisplay").innerHTML=this.responseText;	
}
}
</script>
<!-- <script>
const emaill = document.getElementById('email');

//run this function whenever the values of any of the above 4 inputs change.
//this is to check if the input for all 4 is valid.  if so, enable submitBtn.
//otherwise, disable it.
const checkEnableButton = () => smtBtn.disabled = !(emaill.value=='Choose') 
};
emaill.addEventListener('change', checkEnableButton)
</script> -->
</head>
<body>
	<nav class="navbar fixed-top navbar-dark bg-dark" style="height: 50px;">
		<div class="container-fluid">
			<img src="Xworkz-Logo.png" class="w3-bar w3-border" width="85" height="40">
			<div class="navbar-left" class="w3-bar w3-border" style="margin-top: -5px;">
				<a href="UserHome.jsp" class="btn btn-sm"
					style="background-color: turquoise;">Home</a>
			</div>
		</div>
	</nav>
		<div class="container">
		<div class="row justify-content-center mt-5" >
			<div class="col-lg-6 col-md-8 col-sm-8" style="margin-top:-5%;">
			<span style="color:blue;margin-right: 40%;"><b>${success}</b></span><br/>
				<div class="card shadow" style="width: 400px;">
					<div class="card-title text-center border-bottom" style="background-color: turquoise;">
						<h3 class="p-2" style="color: black;">User Login</h3>
					</div>
					<div class="card-body">

<form action="generateOTP" method="get" class="container center" style="margin-right: 50px">
<span style="color:red;font-size: 12px;" id="emailDisplay">${emailError}</span> 
						<div class="row">
							<div class="col-md-7 mt-md-0 mt-3"> 
								<input type="text"  class="form-control shadow" onkeyup="enableSubmit()" id="email" name="email" placeholder="Enter email address" onchange="EmailAjax()"/>
								<span id="email" style="color:red;"></span>
							</div>
							<div class="col-md-4 mt-md-0 mt-3">
							<input type="submit" name="otp" value="Generate OTP" class="btn w-60 shadow" style="background-color: turquoise;text-align: center;" disabled><!--  Generate OTP</button> -->
							</div>
						</div>	
						</form>
						<br/>
<form action="userLoginSuccess" method="get" class="container center" style="margin-right: 50px">
<span style="color:red;font-size: 12px;" id="OtpDisplay">${otpError}</span>
						<div class="row">
							<div class="col-md-7 mt-md-0 mt-3"> 
								<input type="text" class="form-control shadow" id="otp" name="otp" onkeyup="enableOTPSubmit()" placeholder="Enter OTP" onchange="OTPAjax()"/>
								<span id="otp" style="color:red;"></span>
							</div>
							<div class="col-md-4 mt-md-0 mt-2">
								<input type="submit" name="login" value="Login" id="OtpSubmitBtn" class="btn w-60 shadow" style="background-color: turquoise;text-align: center;" disabled>
								<!-- <a href="userLoginSuccess" class="btn w-60 shadow" style="background-color: turquoise;text-align: center;">send</a> -->
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<div class="footer">
	<small style="color: white;">&copy;Created by: </small><small style="color: white;">Savitri B Kandgal,</small><small style="color: white;">&ensp;Savitri.Kandgal@gmail.com</small>
	</div>
</body>
</html>