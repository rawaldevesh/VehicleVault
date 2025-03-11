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
    <h2 class="text-center">List of Inquiry</h2>

    <table class="table table-bordered table-striped mt-3">
        <thead class="table-dark">
            <tr>
            <th>Inquiry ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Contact Number</th>
            <th>Email</th>
            <th>Vehicle Model</th>
            <th>Inquiry Message</th>
            <th>Inquiry Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="i" items="${listInquiry}">
                <tr>
                   	<td>${i[2]}</td>
                    <td>${i[3]}</td>
                    <td>${i[4]}</td>
                    <td>${i[5]}</td>
                    <td>${i[6]}</td>
                    <td>${i[7]}</td>
                    <td>${i[0]}</td>
                    <td>${i[1]}</td>
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>