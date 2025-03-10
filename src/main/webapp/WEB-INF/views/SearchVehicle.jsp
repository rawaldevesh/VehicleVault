<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Vehicle List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center">List of Vehicles</h2>

    <table class="table table-bordered table-striped mt-3">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Make</th>
                <th>Model</th>
                <th>Year</th>
                <th>Variant</th>
                <th>Mileage (kmpl)</th>
                <th>Fuel Type</th>
                <th>Transmission</th>
                <th>Price (₹)</th>
                <th>Color</th>
                <th>Description</th>
                <th>Status</th>
                <th>Registration No.</th>
                <th>Registration Year</th>
                <th>Insurance</th>
                <th>Seats</th>
                <th>KMs Driven</th>
                <th>RTO</th>
                <th>Ownership</th>
                <th>Engine (cc)</th>
                <th>Airbags</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="vehicle" items="${listVehicle}">
                <tr>
                    <td>${vehicle.vehicleId}</td>
                    <td>${vehicle.make}</td>
                    <td>${vehicle.model}</td>
                    <td>${vehicle.year}</td>
                    <td>${vehicle.variant}</td>
                    <td>${vehicle.mileage}</td>
                    <td>${vehicle.fuelType}</td>
                    <td>${vehicle.transmissionType}</td>
                    <td>${vehicle.price}</td>
                    <td>${vehicle.color}</td>
                    <td>${vehicle.description}</td>
                    <td>${vehicle.status}</td>
                    <td>${vehicle.registrationNum}</td>
                    <td>${vehicle.registrationYear}</td>
                    <td>${vehicle.insurance}</td>
                    <td>${vehicle.seats}</td>
                    <td>${vehicle.kmsDriven}</td>
                    <td>${vehicle.rTO}</td>
                    <td>${vehicle.ownerShip}</td>
                    <td>${vehicle.engineDisplacement}</td>
                    <td>${vehicle.numberofBags}</td>
                    <td>
                        
                        <a href="newinquery?id=${vehicle.vehicleId}" class="btn btn-danger btn-sm">Send Inquiery</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
				
</div>								
</body>
</html>