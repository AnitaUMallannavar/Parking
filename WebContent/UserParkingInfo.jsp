<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Rental-Parking Spot</title>

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
		  rel="stylesheet"
		  integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
		  crossorigin="anonymous">

	<!-- Custom CSS -->
	<link rel="stylesheet" href="style.css">

	<style>
		.selector-for-some-widget { box-sizing: content-box; }
		.footer {
			position: fixed;
			left: 0; bottom: 0;
			width: 100%;
			background-color: black;
			text-align: center;
			height: 5%;
			font-size: 14px;
		}
	</style>

	<script>
		function enableSubmit() {
			let inputs = document.getElementsByClassName('required');
			let btn = document.querySelector('button[type="submit"]');
			let isValid = true;

			for (let i = 0; i < inputs.length; i++) {
				if (inputs[i].value.trim() === "") {
					isValid = false;
					break;
				}
			}
			btn.disabled = !isValid;
		}

		function vehicleNoAjax() {
			let vehicleNo = document.getElementById("vehicleNo").value;
			let url = "http://localhost:8080/parking-rental-app/validateVehicleNo/" + vehicleNo;

			const xmlHttp = new XMLHttpRequest();
			xmlHttp.open("GET", url);
			xmlHttp.send();
			xmlHttp.onload = function () {
				document.getElementById('display').innerHTML = this.responseText;
			}
		}

		function ajaxWithObj() {
			let location = document.getElementById("location").value;
			let vehicleType = document.getElementById("vehicleType").value;
			let engineType = document.getElementById("engineType").value;
			let classification = document.getElementById("classification").value;
			let term = document.getElementById("term").value;

			let url = "http://localhost:8080/parking-rental-app/getPriceAndDiscount/"
					+ location + "/" + vehicleType + "/" + engineType + "/"
					+ classification + "/" + term;

			const xmlHttp = new XMLHttpRequest();
			xmlHttp.open("GET", url);
			xmlHttp.send();
			xmlHttp.onload = function () {
				let obj = JSON.parse(this.responseText);
				document.getElementById("price").value = obj.price;
				document.getElementById("discount").value = obj.discount;
				let totalAmount = obj.price - ((obj.price * obj.discount) / 100);
				document.getElementById("totalAmount").value = totalAmount;
			}
		}
	</script>
</head>
<body style="background-color: white; margin-bottom: 10%; margin-top: 10%;">

<!-- Navbar -->
<nav class="navbar fixed-top navbar-dark bg-dark" style="height: 50px;">
	<div class="container-fluid">
		<div class="navbar-header">
			<img src="parking_PNG74.png" width="85" height="40" style="margin-top: -20px">
		</div>
		<div style="margin-left: auto; margin-top: -20px;">
			<a href="UserLoginSuccess.jsp" class="btn btn-sm" style="background-color: turquoise;">Home</a>
		</div>
		<div>
			<p class="navbar-text" style="color: white; font-size: 15px;">
				Welcome, ${userDto.name}
			</p>
		</div>
	</div>
</nav>

<!-- Content -->
<div class="wrapper rounded bg-white">
	<h5 style="color: green;">${success}</h5>
	<span style="color: red;" id="display">${error}</span>

	<div class="card shadow">
		<div class="card-title text-center border-bottom" style="background-color: turquoise;">
			<h3 class="p-2" style="color: black;">Slot Booking Form</h3>
		</div>
		<div class="card-body">
			<form action="addUserParkingInfo" method="post" enctype="multipart/form-data">

				<!-- Vehicle No -->
				<div class="row mb-3">
					<div class="col-md-6">
						<input type="text" id="vehicleNo" name="vehicleNo"
							   placeholder="Enter vehicle No."
							   class="form-control shadow required"
							   onchange="vehicleNoAjax()" onclick="enableSubmit()" />
					</div>
				</div>

				<!-- Location & Vehicle Type -->
				<div class="row mb-3">
					<div class="col-md-6">
						<select name="location" id="location" class="form-select shadow required" onclick="enableSubmit()">
							<option value="">Location</option>
							<option value="RajajiNagar">RajajiNagar</option>
							<option value="E.city">E.city</option>
							<option value="VijayaNagar">VijayaNagar</option>
							<option value="BTM">BTM</option>
						</select>
					</div>
					<div class="col-md-6">
						<select name="vehicleType" id="vehicleType" class="form-select shadow required" onclick="enableSubmit()">
							<option value="">Vehicle Type</option>
							<option value="2_Wheeler">2-wheeler</option>
							<option value="4_Wheeler">4-wheeler</option>
						</select>
					</div>
				</div>

				<!-- Engine Type & Classification -->
				<div class="row mb-3">
					<div class="col-md-6">
						<select name="engineType" id="engineType" class="form-select shadow required" onclick="enableSubmit()">
							<option value="">Engine Type</option>
							<option value="Normal">Normal</option>
							<option value="Electrical">Electrical</option>
						</select>
					</div>
					<div class="col-md-6">
						<select name="classification" id="classification" class="form-select shadow required" onclick="enableSubmit()">
							<option value="">Classification</option>
							<optgroup label="Bike">
								<option value="Bike">Bike</option>
							</optgroup>
							<optgroup label="Cars">
								<option value="BMW">BMW</option>
								<option value="Renault">Renault</option>
								<option value="Skoda">Skoda</option>
								<option value="Kia">Kia</option>
								<option value="Toyata">Toyata</option>
							</optgroup>
						</select>
					</div>
				</div>

				<!-- Term & Price -->
				<div class="row mb-3">
					<div class="col-md-6">
						<label for="term">Term:</label>
						<select name="term" id="term" onchange="ajaxWithObj()" class="form-select shadow required" onclick="enableSubmit()">
							<option value="">Select</option>
							<option value="1min">1 Minute</option>
							<option value="1_day">1 Day</option>
							<option value="7_days">7 Days</option>
							<option value="15_days">15 Days</option>
							<option value="30_days">30 Days</option>
							<option value="90_days">90 Days</option>
							<option value="180_days">180 Days</option>
							<option value="360_days">360 Days</option>
						</select>
					</div>
					<div class="col-md-6">
						<label for="price">Price:</label>
						<input type="text" id="price" name="price" class="form-control shadow" style="background-color: ghostwhite;" readonly />
					</div>
				</div>

				<!-- Discount & Total Amount -->
				<div class="row mb-3">
					<div class="col-md-6">
						<label for="discount">Discount(%):</label>
						<input type="text" id="discount" name="discount" class="form-control shadow" style="background-color: ghostwhite;" readonly />
					</div>
					<div class="col-md-6">
						<label for="totalAmount">Total Amount:</label>
						<input type="text" id="totalAmount" name="totalAmount" class="form-control shadow" style="background-color: ghostwhite;" readonly />
					</div>
				</div>

				<!-- File Upload -->
				<div class="row mb-3">
					<div class="col-md-10">
						<label for="file">Upload vehicle pic:</label>
						<input type="file" name="file" id="file" class="form-control shadow" style="background-color: ghostwhite;">
					</div>
				</div>

				<!-- Buttons -->
				<div class="row" style="margin-left: 25%;">
					<div class="col-md-12">
						<button type="submit" id="smtBtn" class="btn w-30 shadow" style="background-color: turquoise; color: black; text-align: center;" disabled>
							Book
						</button>
						&ensp;&ensp;&ensp;
						<button type="reset" class="btn w-30 shadow" style="background-color: turquoise; color: black; text-align: center;">
							Reset
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- Footer -->
<div class="footer">
	<small style="color:white;">&copy; Created by: Anita U Mallannavar,</small>
	<small style="color:white;">&ensp;anitaum007@gmail.com</small>
	&ensp;|<small style="color:lightgreen;">&ensp;Last login time: ${userDto.updatedDate}</small>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>
