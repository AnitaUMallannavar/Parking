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
</head>
<body>

<!-- Navbar -->
<nav class="navbar fixed-top navbar-dark bg-dark" style="height:50px;">
	<div class="container-fluid d-flex justify-content-between align-items-center">
		<!-- Logo -->
		<img src="parking_PNG74.png" width="85" height="40" alt="Logo" class="me-3">

		<!-- Sign-out first, then Admin Name -->
		<div class="d-flex align-items-center">
			<a href="AdminLogin.jsp" class="btn btn-outline-light btn-sm me-2">
				Sign-out
			</a>
			<p class="navbar-text text-white mb-0 small">
				Welcome, ${sessionDTO.name}
			</p>
		</div>
	</div>
</nav>

<!-- Buttons Section -->
<div class="container mt-5 pt-5">
	<div class="row justify-content-start g-3">
		<div class="col-12 col-sm-6 col-md-4 col-lg-3">
			<button class="btn btn-info w-100 shadow fw-semibold" type="button"
				onclick="window.location.href='onStart';">
				<i class="bi bi-pencil-square me-1"></i> Update Parking Info
			</button>
		</div>
		<div class="col-12 col-sm-6 col-md-4 col-lg-3">
			<button class="btn btn-success w-100 shadow fw-semibold" type="button"
				onclick="window.location.href='AdminViewData.jsp';">
				<i class="bi bi-table me-1"></i> View Data
			</button>
		</div>
	</div>
</div>

<!-- Footer -->
<div class="footer">
	<small class="text-white">&copy; Created by: Anita U Mallannavar,</small>
	<small class="text-white">&ensp;anitaum007@gmail.com</small>
	<small class="text-success"> | Last login time: ${sessionDTO.loginTime}</small>
</div>

<!-- Bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</body>
</html>
