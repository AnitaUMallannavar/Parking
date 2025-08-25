<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
body {
     background-image: url('park3.jpg');
     background-size: cover;
     background-repeat: no-repeat;
     background-attachment: fixed;
     background-position: center center;
}
</style>
<script>
function validateLocation() {
    var location=document.form.location.value;
    var status=false;
    if (location=="" || location==null){
        document.getElementById('lc').innerHTML="*Please select the location";
        status=false;
    } else {
        document.getElementById('lc').innerHTML="";
        status=true;
    }
    return status;
}
</script>
</head>
<body class="mt-5 mb-5">

<!-- Bootstrap Navbar -->
<nav class="navbar fixed-top navbar-dark bg-dark">
	<div class="container-fluid d-flex justify-content-between align-items-center">

		<!-- Left side Logo -->
		<div class="d-flex align-items-center">
			<img src="parking_PNG74.png" width="85" height="40" alt="Logo">
		</div>

		<!-- Right side content -->
		<div class="d-flex align-items-center">
			<a href="AdminLoginSuccess.jsp" class="btn btn-sm text-white me-3" style="background-color: turquoise;">
				Home
			</a>
			<p class="navbar-text text-white mb-0" style="font-size: 15px;">Welcome, ${sessionDTO.name}</p>
		</div>
	</div>
</nav>

<div class="container mt-5 pt-5">

	<!-- Form Row -->
	<form name="form" action="viewData" onsubmit="return validateLocation()" class="row g-3 justify-content-center">
		<div class="col-12 text-center">
			<span id="lc" class="text-danger small"></span>
		</div>
		<div class="col-12 col-md-4">
			<select name="location" id="location" class="form-select shadow required">
				<option value="">Location</option>
				<option value="RajajiNagar">RajajiNagar</option>
				<option value="E.city">E.city</option>
				<option value="VijayaNagar">VijayaNagar</option>
				<option value="BTM">BTM</option>
			</select>
		</div>
		<div class="col-12 col-md-2 text-center">
			<input type="submit" value="Search" class="btn w-100 shadow" style="background-color: turquoise;">
		</div>
	</form>

	<!-- Error / Size Message -->
	<div class="text-center mt-3">
		<b class="text-danger">${error}</b> <b class="text-primary">${size}</b>
	</div>

	<!-- Table -->
	<div class="table-responsive mt-4">
		<table class="table table-bordered text-center align-middle">
			<thead>
				<tr class="table-info">
					<th>Location</th>
					<th>Vehicle-type</th>
					<th>Engine-type</th>
					<th>Classification</th>
					<th>Term</th>
					<th>Price</th>
					<th>Discount</th>
					<th>slots</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.location}</td>
					<td>${dto.vehicleType}</td>
					<td>${dto.engineType}</td>
					<td>${dto.classification}</td>
					<td>${dto.term}</td>
					<td>${dto.price}</td>
					<td>${dto.discount}</td>
			        <td>${dto.slots}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<!-- Footer -->
<div class="footer">
	<small class="text-white">&copy; Created by: Anita U Mallannavar,</small>
	<small class="text-white"> anitaum007@gmail.com</small>
	<small class="text-success"> | Last login time: ${sessionDTO.loginTime}</small>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
</body>
</html>
