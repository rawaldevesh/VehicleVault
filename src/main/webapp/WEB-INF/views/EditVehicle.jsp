<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Vehicle</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center">Edit Vehicle</h2>
    
    <form action="updateVehicle" method="post">
        <input type="hidden" name="vehicleId" value="${vehicle.vehicleId}">
        
        <div class="mb-3">
            <label class="form-label">Make:</label>
            <input type="text" class="form-control" name="make" value="${vehicle.make}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Model:</label>
            <input type="text" class="form-control" name="model" value="${vehicle.model}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Year:</label>
            <input type="number" class="form-control" name="year" value="${vehicle.year}" required>
        </div>

        <div class="mb-3">
        <label class="form-label">Year:</label>
        <input type="number" class="form-control" name="year" value="${vehicle.year}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Variant:</label>
        <input type="text" class="form-control" name="variant" value="${vehicle.variant}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Mileage:</label>
        <input type="number" step="0.1" class="form-control" name="mileage" value="${vehicle.mileage}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Fuel Type:</label>
        <input type="text" class="form-control" name="fuelType" value="${vehicle.fuelType}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Transmission Type:</label>
        <input type="text" class="form-control" name="transmissionType" value="${vehicle.transmissionType}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Price:</label>
        <input type="number" step="0.01" class="form-control" name="price" value="${vehicle.price}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Color:</label>
        <input type="text" class="form-control" name="color" value="${vehicle.color}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Description:</label>
        <textarea class="form-control" name="description" required>${vehicle.description}</textarea>
    </div>

    <div class="mb-3">
        <label class="form-label">Status:</label>
        <input type="text" class="form-control" name="status" value="${vehicle.status}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Listing Date:</label>
        <input type="date" class="form-control" name="listingDate" value="${vehicle.listingDate}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Registration Number:</label>
        <input type="text" class="form-control" name="registrationNum" value="${vehicle.registrationNum}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">User ID:</label>
        <input type="number" class="form-control" name="userId" value="${vehicle.userId}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">City ID:</label>
        <input type="number" class="form-control" name="cityId" value="${vehicle.cityId}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Area ID:</label>
        <input type="number" class="form-control" name="areaId" value="${vehicle.areaId}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">State ID:</label>
        <input type="number" class="form-control" name="stateId" value="${vehicle.stateId}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Registration Year:</label>
        <input type="date" class="form-control" name="registrationYear" value="${vehicle.registrationYear}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Insurance:</label>
        <input type="text" class="form-control" name="insurance" value="${vehicle.insurance}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Features:</label>
        <input type="text" class="form-control" name="features" value="${vehicle.features}" required></input>
    </div>

    <div class="mb-3">
        <label class="form-label">Seats:</label>
        <input type="text" class="form-control" name="seats" value="${vehicle.seats}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Kms Driven:</label>
        <input type="text" class="form-control" name="kmsDriven" value="${vehicle.kmsDriven}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">RTO:</label>
        <input type="text" class="form-control" name="rTO" value="${vehicle.rTO}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Ownership:</label>
        <input type="text" class="form-control" name="ownerShip" value="${vehicle.ownerShip}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Engine Displacement:</label>
        <input type="text" class="form-control" name="engineDisplacement" value="${vehicle.engineDisplacement}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Number of Bags:</label>
        <input type="text" class="form-control" name="numberofBags" value="${vehicle.numberofBags}" required>
    </div>        

        <button type="submit" class="btn btn-success">Update Vehicle</button>
        <a href="listvehicle" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
