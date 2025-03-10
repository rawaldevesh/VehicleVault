<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buyer Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    
    <style>
        body {
            display: flex;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            background: #343a40;
            color: white;
            padding-top: 20px;
            position: fixed;
        }
        .sidebar a {
            padding: 10px;
            text-decoration: none;
            color: white;
            display: block;
            font-size: 18px;
        }
        .sidebar a:hover {
            background: #495057;
        }
        .content {
            margin-left: 260px;
            padding: 20px;
            width: 100%;
        }
    </style>
</head>

<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-center">🚗 Vehicle Vault</h4>
        <a href="buyer-dashboard"><i class="fas fa-home"></i> Dashboard</a>
        <a href="searchvehicle"><i class="fas fa-car"></i> Browse Vehicles</a>
        <a href="myInquiries.jsp"><i class="fas fa-envelope"></i> My Inquiries</a>
        <a href="profile.jsp"><i class="fas fa-user"></i> Profile Settings</a>
        <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h2>Welcome to Your Dashboard</h2>
        <p>Select an option from the sidebar to get started.</p>
    </div>

</body>
</html>