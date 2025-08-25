<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Rental-Parking Spot</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
/* Background video */
.video-bg {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: -1;
}

/* Glass effect card */
.card {
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(10px);
    border-radius: 20px;
    border: 1px solid rgba(255, 255, 255, 0.3);
    color: #fff;
}

/* Card title */
.card-title {
    background: rgba(64, 224, 208, 0.8);
    border-radius: 20px 20px 0 0;
    color: #000;
    font-weight: bold;
}

/* Footer */
.footer {
    position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    background-color: rgba(0,0,0,0.7);
    text-align: center;
    font-size: 14px;
    padding: 5px;
    color: #fff;
}

/* Labels */
.form-label {
    color: #fff;
    font-weight: 500;
}

/* Error text */
.text-danger {
    font-size: 0.85rem;
}
</style>
</head>
<body>

<!-- Background Video -->
<video autoplay muted loop class="video-bg">
    <source src="Parking.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

<!-- Navbar -->
<nav class="navbar fixed-top navbar-dark bg-dark">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <img src="parking_PNG74.png" width="85" height="40" alt="Logo">
        <a href="Landing.jsp" class="btn btn-sm text-dark" style="background-color: turquoise;">Home</a>
    </div>
</nav>

<!-- Login Card -->
<div class="container d-flex justify-content-center align-items-center" style="min-height:100vh;">
    <div class="col-12 col-sm-8 col-md-6 col-lg-4">
        <div class="card shadow">
            <div class="card-title text-center p-3">
                <h3>Admin Login</h3>
            </div>
            <div class="card-body">
                <form action="adminLogin" method="post" onsubmit="return validateform()" name="myform">

                    <!-- Global Error -->
                    <div class="text-center mb-2">
                        <span id="form" class="text-danger"></span>
                        <span class="text-danger">${error}</span>
                    </div>

                    <!-- Email -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="text" class="form-control" id="email" name="email" placeholder="Enter email">
                        <small id="email1" class="text-danger"></small>
                    </div>

                    <!-- Password -->
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
                        <small id="password1" class="text-danger"></small>
                    </div>

                    <!-- Button -->
                    <div class="d-grid">
                        <button type="submit" class="btn" style="background-color: turquoise; color:black; font-weight:bold;">
                            Login
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    &copy; Created by: Anita U Mallannavar | anitaum007@gmail.com
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
