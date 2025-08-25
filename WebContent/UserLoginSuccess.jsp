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

		/* Video as background */
		.video-bg {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			object-fit: cover;
			z-index: -1; /* keep video behind everything */
		}

		.footer {
			position: fixed;
			left: 0;
			bottom: 0;
			width: 100%;
			background-color: black;
			text-align: center;
			height: 5%;
			font-size: 14px;
			z-index: 2; /* ensure footer stays above video */
		}

		/* Make sure content stays visible on top */
		.content {
			position: relative;
			z-index: 1;
			color: white;
		}
	</style>
</head>
<body>

	<!-- Background video -->
	<video autoplay muted loop class="video-bg">
		<source src="Parking.mp4" type="video/mp4">
		Your browser does not support the video tag.
	</video>

	<!-- Page Content -->
	<div class="content">
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
			crossorigin="anonymous"></script>

		<!-- Navbar -->
		<nav class="navbar fixed-top navbar-dark bg-dark" style="height: 50px;">
			<div class="container-fluid">
				<div class="navbar-header">
					<img src="parking_PNG74.png" class="w3-bar w3-border" width="85"
						height="40" style="margin-top: -20px">
				</div>
				<div class="w3-bar w3-border"
					style="margin-left: 780px; margin-top: -20px;">
					<a href="UserLogin.jsp" class="btn btn-sm"
						style="background-color: turquoise;">Sign out</a>
				</div>
				<div class="navbar-left" class="w3-bar w3-border">
					<p class="navbar-text" style="color: white;font-size: 15px;">Welcome, ${userDto.name}</p>
				</div>
			</div>
		</nav>

		<!-- Buttons Section -->
		<div class="d-flex flex-column align-items-start m-4">
			<button class="btn mb-3" type="submit"
				onclick="window.location.href='UserParkingInfo.jsp';"
				style="background-color: turquoise; color:black; width:180px;">
				Add Parking Info
			</button>

			<button class="btn" type="submit"
				onclick="window.location.href='userViewData';"
				style="background-color: turquoise; color:black; width:180px;">
				View Data
			</button>
		</div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>

		<!-- Footer -->
		<div class="footer">
			<small style="color:white;">&copy; Created by: Anita U Mallannavar,</small>
			<small style="color:white;">&ensp;anitaum007@gmail.com</small>&ensp;
			<small style="color:white;">|</small>
			<small style="color:lightgreen;">&ensp;Last login time: ${userDto.updatedDate}</small>
		</div>
	</div>
</body>
</html>
