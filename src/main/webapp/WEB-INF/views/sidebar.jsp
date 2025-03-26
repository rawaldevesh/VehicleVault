<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Sidebar Wrapper -->
<div class="d-flex flex-column flex-shrink-0 p-3 bg-dark text-white sidebar" style="width: 250px; height: 100vh; position: fixed;">
    
    <h4 class="text-center">Dashboard</h4>
    <hr>

    <c:choose>
        <!-- Admin Sidebar -->
        <c:when test="${sessionScope.user.role == 'ADMIN'}">
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item"><a href="adminHome.jsp" class="nav-link text-white">Dashboard</a></li>
                <li class="nav-item"><a href="manageUsers.jsp" class="nav-link text-white">Manage Users</a></li>
                <li class="nav-item"><a href="viewInquiries.jsp" class="nav-link text-white">View Inquiries</a></li>
                <li class="nav-item"><a href="settings.jsp" class="nav-link text-white">Settings</a></li>
            </ul>
        </c:when>

        <!-- Buyer Sidebar -->
        <c:when test="${sessionScope.user.role == 'BUYER'}">
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item"><a href="buyerHome.jsp" class="nav-link text-white">Home</a></li>
                <li class="nav-item"><a href="viewVehicles.jsp" class="nav-link text-white">View Vehicles</a></li>
                <li class="nav-item"><a href="myInquiries.jsp" class="nav-link text-white">My Inquiries</a></li>
                <li class="nav-item"><a href="profile.jsp" class="nav-link text-white">Profile</a></li>
            </ul>
        </c:when>

        <!-- Seller Sidebar -->
        <c:when test="${sessionScope.user.role == 'SELLER'}">
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item"><a href="sellerHome.jsp" class="nav-link text-white">Home</a></li>
                <li class="nav-item"><a href="addVehicle.jsp" class="nav-link text-white">Add Vehicle</a></li>
                <li class="nav-item"><a href="myListings.jsp" class="nav-link text-white">My Listings</a></li>
                <li class="nav-item"><a href="profile.jsp" class="nav-link text-white">Profile</a></li>
            </ul>
        </c:when>
    </c:choose>

    <hr>
    <a href="logout.jsp" class="btn btn-danger w-100">Logout</a>
</div>
