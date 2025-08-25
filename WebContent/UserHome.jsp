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
        /* Reset */
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow-x: hidden;
        }

        /* Background video */
        .video-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1; /* keep video behind content */
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

        /* Navbar brand styling */
        .navbar-brand img {
            height: 45px;
        }

        /* Content should appear above the video */
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

    <!-- Content (Navbar + Footer) -->
    <div class="content">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top py-2 shadow-sm">
            <div class="container-fluid">
                <!-- Logo -->
                <a class="navbar-brand d-flex align-items-center" href="Landing.jsp">
                    <img src="parking_PNG74.png" alt="Logo">
                    <span class="ms-2 fw-bold">Rental Parking</span>
                </a>

                <!-- Toggle for mobile -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNav" aria-controls="navbarNav"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Nav Items -->
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav gap-2">
                        <li class="nav-item">
                            <a href="Landing.jsp" class="btn btn-sm btn-primary">Home</a>
                        </li>
                        <li class="nav-item">
                            <a href="onRegister" class="btn btn-sm btn-success">Sign Up</a>
                        </li>
                        <li class="nav-item">
                            <a href="UserLogin.jsp" class="btn btn-sm btn-warning text-dark">Sign In</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

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
