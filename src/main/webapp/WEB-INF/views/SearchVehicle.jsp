<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search Vehicles</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            background-color: #f4f4f4;
        }
        .search-container {
            margin-bottom: 20px;
        }
        .vehicle-list {
            max-height: 600px;
            overflow-y: auto;
            padding: 10px;
        }
        .card {
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 15px;
            transition: transform 0.3s ease-in-out;
        }
        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .card:hover {
            transform: scale(1.02);
        }
        .card-body {
            padding: 15px;
        }
        .details-table {
            font-size: 14px;
        }
    </style>
    
    <script>
        function searchVehicles() {
            let input = document.getElementById("searchBar").value.toLowerCase();
            let cards = document.getElementsByClassName("vehicle-card");
            
            for (let card of cards) {
                let text = card.getAttribute("data-search").toLowerCase();
                card.style.display = text.includes(input) ? "block" : "none";
            }
        }
    </script>
</head>

<body>

<div class="container mt-4">
    <h2 class="text-center">Search Vehicles</h2>

    <!-- Search Bar -->
    <div class="search-container">
        <input type="text" id="searchBar" onkeyup="searchVehicles()" class="form-control" placeholder="Search by Make, Model, Year...">
    </div>

    <!-- Vehicle List (Scrollable) -->
    <div class="vehicle-list row">
        <c:forEach var="vehicle" items="${listVehicle}">
            <div class="col-md-6 vehicle-card" 
                 data-search="${vehicle.make} ${vehicle.model} ${vehicle.year} ${vehicle.variant} ${vehicle.fuelType} ${vehicle.transmissionType}">
                <div class="card shadow">
                    <img src="https://source.unsplash.com/400x300/?car,${vehicle.make}" alt="Car Image">
                    <div class="card-body">
                        <h5 class="card-title">${vehicle.make} ${vehicle.model} (${vehicle.year})</h5>
                        <p class="card-text"><strong>Variant:</strong> ${vehicle.variant} | <strong>Fuel:</strong> ${vehicle.fuelType}</p>
                        <p class="card-text"><strong>Transmission:</strong> ${vehicle.transmissionType} | <strong>Price:</strong> ₹${vehicle.price}</p>

                        <table class="table table-bordered details-table">
                            <tr><td><strong>Mileage:</strong></td><td>${vehicle.mileage} kmpl</td></tr>
                            <tr><td><strong>Color:</strong></td><td>${vehicle.color}</td></tr>
                            <tr><td><strong>Description:</strong></td><td>${vehicle.description}</td></tr>
                            <tr><td><strong>Status:</strong></td><td>${vehicle.status}</td></tr>
                            <tr><td><strong>Registration No.:</strong></td><td>${vehicle.registrationNum}</td></tr>
                            <tr><td><strong>Registration Year:</strong></td><td>${vehicle.registrationYear}</td></tr>
                            <tr><td><strong>Insurance:</strong></td><td>${vehicle.insurance}</td></tr>
                            <tr><td><strong>Seats:</strong></td><td>${vehicle.seats}</td></tr>
                            <tr><td><strong>KMs Driven:</strong></td><td>${vehicle.kmsDriven}</td></tr>
                            <tr><td><strong>RTO:</strong></td><td>${vehicle.rTO}</td></tr>
                            <tr><td><strong>Ownership:</strong></td><td>${vehicle.ownerShip}</td></tr>
                            <tr><td><strong>Engine:</strong></td><td>${vehicle.engineDisplacement} cc</td></tr>
                            <tr><td><strong>Airbags:</strong></td><td>${vehicle.numberofBags}</td></tr>
                        </table>

                        <a href="newinquery?id=${vehicle.vehicleId}" class="btn btn-danger btn-sm">Send Inquiry</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
