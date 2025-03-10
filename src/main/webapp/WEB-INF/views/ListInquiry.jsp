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
            <th>Inquiry ID</th>
            <th>Buyer Name</th>
            <th>Contact Number</th>
            <th>Vehicle Model</th>
            <th>Inquiry Message</th>
            <th>Inquiry Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="i" var= "u" items="${listInquiry},${listUser}">
                <tr>
                   	<td>${i.inquiryId}</td>
                    <td>${i.u.firstName} ${i.user.lastName}</td>
                    <td>${i.u.contactNum}</td>
                    <td>${i.vehicle.model}</td>
                    <td>${i.message}</td>
                    <td>${i.inquiryDate}</td>
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>