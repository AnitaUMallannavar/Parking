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
		  crossorigin="anonymous">

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
			<form action="parkinginfo" method="post" enctype="multipart/form-data">

				<!-- Vehicle No -->
				<div class="row mb-3">
					<div class="col-md-6">
						<input type="text" id="vehicleNo" name="vehicleNo"
							   value="${dto.vehicleNo}"
							   placeholder="Enter vehicle No."
							   class="form-control shadow required" />
					</div>
				</div>

				<!-- Location & Vehicle Type -->
				<div class="row mb-3">
					<div class="col-md-6">
						<select name="location" id="location" class="form-select shadow required">
							<option value="">Location</option>
							<option value="RajajiNagar" ${dto.location == 'RajajiNagar' ? 'selected' : ''}>RajajiNagar</option>
							<option value="E.city" ${dto.location == 'E.city' ? 'selected' : ''}>E.city</option>
							<option value="VijayaNagar" ${dto.location == 'VijayaNagar' ? 'selected' : ''}>VijayaNagar</option>
							<option value="BTM" ${dto.location == 'BTM' ? 'selected' : ''}>BTM</option>
						</select>
					</div>
					<div class="col-md-6">
						<select name="vehicleType" id="vehicleType" class="form-select shadow required">
							<option value="">Vehicle Type</option>
							<option value="2_Wheeler" ${dto.vehicleType == '2_Wheeler' ? 'selected' : ''}>2-wheeler</option>
							<option value="4_Wheeler" ${dto.vehicleType == '4_Wheeler' ? 'selected' : ''}>4-wheeler</option>
						</select>
					</div>
				</div>

				<!-- Engine Type & Classification -->
				<div class="row mb-3">
					<div class="col-md-6">
						<select name="engineType" id="engineType" class="form-select shadow required">
							<option value="">Engine Type</option>
							<option value="Normal" ${dto.engineType == 'Normal' ? 'selected' : ''}>Normal</option>
							<option value="Electrical" ${dto.engineType == 'Electrical' ? 'selected' : ''}>Electrical</option>
						</select>
					</div>
					<div class="col-md-6">
						<select name="classification" id="classification" class="form-select shadow required">
							<option value="">Classification</option>
							<optgroup label="Bike">
								<option value="Bike" ${dto.classification == 'Bike' ? 'selected' : ''}>Bike</option>
							</optgroup>
							<optgroup label="Cars">
								<option value="BMW" ${dto.classification == 'BMW' ? 'selected' : ''}>BMW</option>
								<option value="Renault" ${dto.classification == 'Renault' ? 'selected' : ''}>Renault</option>
								<option value="Skoda" ${dto.classification == 'Skoda' ? 'selected' : ''}>Skoda</option>
								<option value="Kia" ${dto.classification == 'Kia' ? 'selected' : ''}>Kia</option>
								<option value="Toyata" ${dto.classification == 'Toyata' ? 'selected' : ''}>Toyata</option>
							</optgroup>
						</select>
					</div>
				</div>

				<!-- Term & Price -->
				<div class="row mb-3">
					<div class="col-md-6">
						<label for="term">Term:</label>
						<select name="term" id="term" class="form-select shadow required">
							<option value="">Select</option>
							<option value="1min" ${dto.term == '1min' ? 'selected' : ''}>1 Minute</option>
							<option value="1_day" ${dto.term == '1_day' ? 'selected' : ''}>1 Day</option>
							<option value="7_days" ${dto.term == '7_days' ? 'selected' : ''}>7 Days</option>
							<option value="15_days" ${dto.term == '15_days' ? 'selected' : ''}>15 Days</option>
							<option value="30_days" ${dto.term == '30_days' ? 'selected' : ''}>30 Days</option>
							<option value="90_days" ${dto.term == '90_days' ? 'selected' : ''}>90 Days</option>
							<option value="180_days" ${dto.term == '180_days' ? 'selected' : ''}>180 Days</option>
							<option value="360_days" ${dto.term == '360_days' ? 'selected' : ''}>360 Days</option>
						</select>
					</div>
					<div class="col-md-6">
						<label for="price">Price:</label>
						<input type="text" id="price" name="price" value="${dto.price}" class="form-control shadow" style="background-color: ghostwhite;" readonly />
					</div>
				</div>

				<!-- Discount & Total Amount -->
				<div class="row mb-3">
					<div class="col-md-6">
						<label for="discount">Discount(%):</label>
						<input type="text" id="discount" name="discount" value="${dto.discount}" class="form-control shadow" style="background-color: ghostwhite;" readonly />
					</div>
					<div class="col-md-6">
						<label for="totalAmount">Total Amount:</label>
						<input type="text" id="totalAmount" name="totalAmount" value="${dto.totalAmount}" class="form-control shadow" style="background-color: ghostwhite;" readonly />
					</div>
				</div>

				<!-- File Upload -->
				<div class="row mb-3">
					<div class="col-md-10">
						<label for="file">Upload vehicle pic:</label>
						<input type="file" name="file" id="file" class="form-control shadow" style="background-color: ghostwhite;">
						<c:if test="${not empty dto.fileName}">
							<small>Current file: ${dto.originalFileName}</small>
						</c:if>
					</div>
				</div>

				<!-- Buttons -->
				<div class="row" style="margin-left: 25%;">
					<div class="col-md-12">
						<button type="submit" id="smtBtn" class="btn w-30 shadow" style="background-color: turquoise; color: black; text-align: center;">
							Update
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
