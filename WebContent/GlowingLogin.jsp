<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rental-Parking Spot</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <style>
        .view {
            background-color: green;
            border: 2px solid black;
            color: white;
            padding: 5px 10px;
            text-align: center;
            display: inline-block;
            font-size: 20px;
            margin: 10px 30px;
            cursor: pointer;
        }
    </style>
    
    <style>
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;

   background-color: black;
   color: white;
   text-align: center;
}
</style>
</head>
<body style="background-color:papayawhip;">
      <div class="login-form">
         <div class="text">
            LOGIN
         </div>
         <form name="form" action="success.html" onsubmit="return validateform()" >
			<span id="form" style="color:red;"></span>
					<div class="field">
						<div class="fas fa-envelope"></div>
							<input type="text" placeholder="Email or Phone" name="name">
						</div>
						<span id="name" style="color:red;"></span>
					<div class="field">
						<div class="fas fa-lock"></div>
							<input type="password" placeholder="Password" name="password">
						</div>
						<span id="password" style="color:red;"></span>
            <button class="btn1" type="submit" >LOGIN</button> &ensp; <button class="btn2" type="reset" onclick="return resetValue()">CLEAR</button>
            <div class="link">
               <a href="forgot.html">Forgot Password?</a>
            </div>
            <div class="link">
               Not a member?
               <a href="#">Signup now</a>
            </div>
         </form>
      </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<div class="footer">
	<small>@ 2023 Copyright &copy; xworkz.com</small>
 <p> <a href="ContactDetails.jsp">Contact Details</a><p>
</div>
</body>
</html>