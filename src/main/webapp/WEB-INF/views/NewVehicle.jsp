<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<form action="savevehicle" method="post">
    <h2 class="text-center">Add New Vehicle</h2>
    
        <div class="row">
            <div class="col-md-6">
                <label>Make:</label>
                <input type="text" name="make" class="form-control" required><br>

                <label>Model:</label>
                <input type="text" name="model" class="form-control" required><br>

                <label>Year:</label>
                <input type="number" name="year" class="form-control" required><br>

                <label>Variant:</label>
                <input type="text" name="variant" class="form-control"><br>

                <label>Mileage (kmpl):</label>
                <input type="number" name="mileage" class="form-control" step="0.1"><br>

                <label>Fuel Type:</label>
                <select name="fuelType" class="form-control">
                    <option value="Petrol">Petrol</option>
                    <option value="Diesel">Diesel</option>
                    <option value="Electric">Electric</option>
                    <option value="Hybrid">Hybrid</option>
                </select><br>

                <label>Transmission Type:</label>
                <select name="transmissionType" class="form-control">
                    <option value="Manual">Manual</option>
                    <option value="Automatic">Automatic</option>
                </select><br>

                <label>Price (₹):</label><br>
                <input type="number" name="price" class="form-control" step="0.01" required>

                <label>Color:</label>
                <input type="text" name="color" class="form-control"><br>
            </div><br>

            <div class="col-md-6">
                <label>Description:</label>
                <textarea name="description" class="form-control"></textarea>

                <label>Status:</label>
                <select name="status" class="form-control">
                    <option value="Available">Available</option>
                    <option value="Sold">Sold</option>
                </select><br>

                <label>Registration Number:</label>
                <input type="text" name="registrationNum" class="form-control"><br>

                <label>Registration Year:</label>
                <input type="date" name="registrationYear" class="form-control"><br>

                <label>Insurance:</label>
                <input type="text" name="insurance" class="form-control"><br>

                <label>Seats:</label>
                <input type="number" name="seats" class="form-control"><br>

                <label>KMs Driven:</label>
                <input type="number" name="kmsDriven" class="form-control"><br>

                <label>RTO:</label>
                <input type="text" name="rTO" class="form-control"><br>

                <label>Ownership:</label>
                <select name="ownerShip" class="form-control">
                    <option value="First Owner">First Owner</option>
                    <option value="Second Owner">Second Owner</option>
                    <option value="Third Owner">Third Owner</option>
                </select><br>
				
     			
                <label>Engine Displacement (cc):</label>
                <input type="number" name="engineDisplacement" class="form-control"><br>

                <label>Number of Airbags:</label>
                <input type="number" name="numberofBags" class="form-control"><br>
                
                <br>State:
     		<select name="stateId">
     			<option>Select State</option>
     		<c:forEach items = "${allState}" var ="s" >
     			
     			<option value="${s.stateId}">${s.stateName}</option>
     					
     		</c:forEach>
     		</select>
     		
     		City:
     		<select name="cityId">
     			<option>Select City</option>
     		<c:forEach items = "${allCity}" var ="c" >
     			
     			<option value="${c.cityId}">${c.cityName}</option>
     					
     		</c:forEach>
     		</select>
     		
     		Area:
     		<select name="areaId">
     			<option>Select Area</option>
     		<c:forEach items = "${allArea}" var ="a" >
     			
     			<option value="${a.areaId}">${a.areaName}</option>
     					
     		</c:forEach>
     		</select>
            </div>
        </div>

        <input type="hidden" name="userId" value="${sessionScope.userId}">
        
        
        <br>
        <div class="mt-4 text-center">
            <button type="submit" class="btn btn-primary">Add Vehicle</button>
        </div>
    </form>
</div>


</body>
</html>
