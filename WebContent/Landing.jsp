<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
          crossorigin="anonymous">

    <title>Rental-Parking Spot</title>

    <style>
        /* Reset margins */
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow-x: hidden;
        }

        /* Video as background */
        .video-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover; /* Makes video cover full screen */
            z-index: -1; /* Push video behind content */
        }

        /* Footer */
        .footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            text-align: center;
            height: 50px;
            font-size: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 2;
        }

        /* Navbar brand text bold */
        .navbar-brand {
            font-weight: 600;
            font-size: 18px;
        }

        /* Add spacing for description */
        .welcome-section {
            margin-top: 90px;
        }

        /* Ensure content is above video */
        .content {
            position: relative;
            z-index: 1;
            color: #fff;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

    <!-- Background video -->
    <video autoplay muted loop class="video-bg">
        <source src="Parking.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>

    <!-- Content -->
    <div class="content">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top py-2 shadow-sm">
            <div class="container-fluid">
                <!-- Logo -->
                <a class="navbar-brand d-flex align-items-center" href="#">
                    <img src="parking_PNG74.png" alt="Logo" width="85" height="40" class="me-2">
                    Rental Parking
                </a>

                <!-- Toggle for mobile -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNav" aria-controls="navbarNav"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Nav items with modern Bootstrap buttons -->
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav gap-2">
                        <li class="nav-item">
                            <a href="AdminLogin.jsp" class="btn btn-sm btn-primary">Admin</a>
                        </li>
                        <li class="nav-item">
                            <a href="UserHome.jsp" class="btn btn-sm btn-success">User</a>
                        </li>
                        <li class="nav-item">
                            <a href="ContactDetails.jsp" class="btn btn-sm btn-warning text-dark">Contact Us</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Description -->
        <div class="container text-center welcome-section">
            <h2 class="fw-bold display-5">Welcome to Rental Parking Spot</h2>
            <p class="lead mt-3">
                Our rental parking service offers secure, convenient, and affordable spaces for your vehicle.
                Whether you need short-term or long-term parking, we provide flexible options to suit your needs.
                Reserve your spot easily and park with peace of mind.
            </p>
            <!-- Call to action button -->
            <a href="UserHome.jsp" class="btn btn-lg btn-outline-light mt-3">Get Started</a>
        </div>

        <!-- Footer -->
        <footer class="footer mt-auto">
            <small class="text-white">&copy; Created by: Anita U Mallannavar | </small>
            <small class="text-white ms-1">anitaum007@gmail.com</small>
        </footer>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
</body>
</html>
