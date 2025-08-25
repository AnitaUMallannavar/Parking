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
	rel="stylesheet">

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
</head>
<body class="pt-5">

<!-- Navbar -->
<nav class="navbar fixed-top navbar-dark bg-dark">
	<div class="container-fluid d-flex justify-content-between align-items-center">
		<img src="parking_PNG74.png" width="85" height="40" alt="Logo">

		<!-- Right side buttons/text -->
		<div class="d-flex align-items-center">
			<a href="AdminLoginSuccess.jsp" class="btn btn-sm btn-info text-dark me-3">Home</a>
			<p class="navbar-text text-white mb-0 small">Welcome, ${sessionDTO.name}</p>
		</div>
	</div>
</nav>

<!-- Wrapper -->
<div class="container my-5">
	<div class="row justify-content-center">
		<div class="col-12 col-md-8 col-lg-6">
			<div class="card shadow">
				<div class="card-header text-center bg-info">
					<h3 class="mb-0 text-dark">Parking Details</h3>
				</div>
				<div class="card-body bg-white">
					<h5 class="text-success text-center">${success}</h5>
					<form action="updateParkingInfo" method="post" onsubmit="return validateFields()">
						<span class="text-danger" id="display">${error}</span>
						<span class="text-danger" id="validate"></span>

						<!-- Location -->
						<div class="mb-3">
							<select name="location" id="location" class="form-select required shadow" onchange="checkForm()">
								<option value="">Location</option>
								<option value="RajajiNagar">RajajiNagar</option>
								<option value="E.city">E.city</option>
								<option value="VijayaNagar">VijayaNagar</option>
								<option value="BTM">BTM</option>
							</select>
						</div>

						<!-- Vehicle & Engine -->
						<div class="row g-3">
							<div class="col-12 col-md-6">
								<select name="vehicleType" id="vehicleType" class="form-select shadow required" onchange="checkForm()">
									<option value="">Vehicle Type</option>
									<option value="2_Wheeler">2-wheeler</option>
									<option value="4_Wheeler">4-wheeler</option>
								</select>
							</div>
							<div class="col-12 col-md-6">
								<select name="engineType" id="engineType" class="form-select shadow required" onchange="checkForm()">
									<option value="">Engine Type</option>
									<option value="Normal">Normal</option>
									<option value="Electrical">Electrical</option>
								</select>
							</div>
						</div>

						<!-- Classification & Term -->
						<div class="row g-3 mt-3">
							<div class="col-12 col-md-6">
								<select name="classification" id="classification" class="form-select shadow required" onchange="checkForm()">
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
							<div class="col-12 col-md-6">
								<select name="term" id="term" class="form-select shadow required" onchange="checkForm()">
									<option value="">Term</option>
									<option value="1min">1 min</option>
									<option value="1_day">1 Day</option>
									<option value="7_days">7 Days</option>
									<option value="15_days">15 Days</option>
									<option value="30_days">30 Days</option>
									<option value="90_days">90 Days</option>
									<option value="180_days">180 Days</option>
									<option value="360_days">360 Days</option>
								</select>
							</div>
						</div>

						<!-- Slots -->
						<div class="row g-3 mt-3">
							<div class="col-12 col-md-6">
								<input type="text" placeholder="Add Slots" id="slots" name="slots" class="form-control shadow required" />
							</div>
						</div>

						<!-- Price & Discount -->
						<div class="row g-3 mt-3">
							<div class="col-12 col-md-6">
								<input type="text" id="price" placeholder="Price" name="price" class="form-control shadow required" oninput="checkForm()"/>
							</div>
							<div class="col-12 col-md-6">
								<input type="text" placeholder="Discount(%)" id="discount" name="discount" class="form-control shadow" />
							</div>
						</div>

						<!-- Buttons -->
						<div class="d-flex justify-content-center mt-4">
							<button type="submit" id="smtBtn" class="btn btn-info text-dark me-3 shadow" disabled>Submit</button>
							<button type="reset" class="btn btn-secondary shadow" onclick="resetForm()">Reset</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Footer -->
<div class="footer">
	<small class="text-white">&copy; Created by: Anita U Mallannavar,</small>
	<small class="text-white">&ensp;anitaum007@gmail.com</small>
	<small class="text-success"> | Last login time: ${sessionDTO.loginTime}</small>
</div>

<!-- JavaScript -->
<script>
function checkForm() {
    let requiredFields = document.querySelectorAll(".required");
    let allFilled = true;

    for (let field of requiredFields) {
        if (field.value.trim() === "") {
            allFilled = false;
            break;
        }
    }

    document.getElementById("smtBtn").disabled = !allFilled;
}

function validateFields() {
    let requiredFields = document.querySelectorAll(".required");
    for (let field of requiredFields) {
        if (field.value.trim() === "") {
            document.getElementById("validate").innerText = "All fields are required!";
            return false;
        }
    }
    return true;
}

function resetForm() {
    document.getElementById("smtBtn").disabled = true;
    document.getElementById("validate").innerText = "";
}
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
