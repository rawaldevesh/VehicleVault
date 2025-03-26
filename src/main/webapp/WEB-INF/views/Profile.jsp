<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .profile-container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .profile-pic {
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #007bff;
        }
        .profile-header {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
        .profile-detail {
            font-size: 18px;
            color: #555;
        }
        .logout-btn {
            margin-top: 20px;
        }
    </style>
</head>
<body class="bg-light">

<div class="container">
    <c:if test="${user.userId == sessionScope.user.userId}">
        <div class="profile-container">
            <h2 class="profile-header">Welcome, ${user.firstName} ${user.lastName}</h2>
            
            <img src="${user.profilePicPath}" alt="Profile Picture" class="profile-pic mt-3" height="150px" width="150px">
            
            <div class="mt-3">
                <p class="profile-detail"><strong>Email:</strong> ${user.email}</p>
                <p class="profile-detail"><strong>Phone:</strong> ${user.contactNum}</p>
                <p class="profile-detail"><strong>City:</strong> ${user.city}</p>
                <p class="profile-detail"><strong>Born Year:</strong> ${user.bornYear}</p>
                <p class="profile-detail"><strong>Gender:</strong> ${user.gender}</p>
                
            </div>
            
            <a href="editProfile" class="btn btn-primary">Edit Profile</a>
            <a href="logout" class="btn btn-danger logout-btn">Logout</a>
        </div>
    </c:if>
</div>

</body>
</html>
