<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
	<h2 class="text-center">List of User</h2>

    <table class="table table-bordered table-striped mt-3">
        <thead class="table-dark">
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Contact Number</th>
			<th>City</th>
			<th>Born Year</th>
			<th>Gender</th>
			<th>Action</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${listUser}" var="u">

			<tr>
				<td>${u.firstName }</td>
				<td>${u.lastName}</td>
				<td>${u.email}</td>
				<td>${u.contactNum}</td>
				<td>${u.city}</td>
				<td>${u.bornYear}</td>
				<td>${u.gender}</td>
				
				<td>
				<a href="editUser?id=${u.userId}" class="btn btn-warning btn-sm">Edit</a>
                <a href="deleteUser?id=${u.userId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                </td>    
			</tr>
		</c:forEach>
		 </tbody>
    </table>

</div>





</body>
</html>