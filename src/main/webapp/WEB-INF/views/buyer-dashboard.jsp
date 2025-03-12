<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buyer Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .sidebar {
            background-color: #343a40;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: 250px;
            padding-top: 56px;
            transition: 0.3s;
            overflow-x: hidden;
            z-index: 1000;
        }

        .sidebar.collapsed {
            width: 60px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 12px 15px;
            font-size: 16px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background-color: #495057;
        }

        .sidebar a i {
            margin-right: 10px;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
            transition: 0.3s;
        }

        .content.collapsed {
            margin-left: 60px;
        }

        .dashboard-card {
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
        }

        .dashboard-card img {
            height: 200px;
            object-fit: cover;
        }

        .navbar {
            background-color: #343a40;
        }

        .navbar-brand {
            font-weight: bold;
            color: white;
        }

        .navbar-toggler {
            border: none;
        }

        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(255, 255, 255, 1)' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 0;
                padding-top: 0;
            }

            .sidebar.collapsed {
                width: 250px;
            }

            .content {
                margin-left: 0;
            }

            .content.collapsed {
                margin-left: 250px;
            }
        }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">🚗 Vehicle Vault</a>
            <button class="navbar-toggler" type="button" id="sidebarToggle">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>

    <div class="sidebar">
        <a href="buyer-dashboard"><i class="fas fa-home"></i> Dashboard</a>
        <a href="searchvehicle"><i class="fas fa-car"></i> Browse Vehicles</a>
        <a href="myInquiries.jsp"><i class="fas fa-envelope"></i> My Inquiries</a>
        <a href="profile.jsp"><i class="fas fa-user"></i> Profile Settings</a>
        <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <div class="content">
        <h2 class="mb-4">Welcome to Your Dashboard</h2>
        <p>Select an option from the sidebar to get started.</p>

        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card dashboard-card">
                    <img src="https://source.unsplash.com/400x300/?car,luxury" class="card-img-top" alt="Luxury Car">
                    <div class="card-body text-center">
                        <h5 class="card-title">Luxury Cars</h5>
                        <p class="card-text">Explore high-end luxury vehicles.</p>
                        <a href="searchvehicle" class="btn btn-primary">View More</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card dashboard-card">
                    <img src="https://source.unsplash.com/400x300/?car,sports" class="card-img-top" alt="Sports Car">
                    <div class="card-body text-center">
                        <h5 class="card-title">Sports Cars</h5>
                        <p class="card-text">Find the latest sports cars.</p>
                        <a href="searchvehicle" class="btn btn-warning">View More</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card dashboard-card">
                    <img src="https://source.unsplash.com/400x300/?car,classic" class="card-img-top" alt="Classic Car">
                    <div class="card-body text-center">
                        <h5 class="card-title">Classic Cars</h5>
                        <p class="card-text">Browse timeless vintage cars.</p>
                        <a href="searchvehicle" class="btn btn-success">View More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('sidebarToggle').addEventListener('click', function() {
            const sidebar = document.querySelector('.sidebar');
            const content = document.querySelector('.content');
            sidebar.classList.toggle('collapsed');
            content.classList.toggle('collapsed');
        });
    </script>
     <input type="hidden" name="userId" value="${sessionScope.userId}">
     
</body>
</html>