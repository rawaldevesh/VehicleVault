<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    
    <style>
        body {
            transition: background 0.3s, color 0.3s;
            background: linear-gradient(135deg, #f0f0f0, #d6d6d6);
            color: #333;
        }
        .dark-mode {
            background: linear-gradient(135deg, #1e1e1e, #121212);
            color: #fff;
        }
        .container {
            max-width: 450px;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            background: linear-gradient(135deg, #ffffff, #f7f7f7);
            transition: background 0.3s;
        }
        .dark-mode .card {
            background: linear-gradient(135deg, #2a2a2a, #1e1e1e);
        }
        .btn-primary {
            background: linear-gradient(135deg, #007bff, #0056b3);
            border: none;
        }
        .dark-mode .btn-primary {
            background: linear-gradient(135deg, #0056b3, #003f7f);
        }
        .form-control {
            border-radius: 10px;
            border: 1px solid #ccc;
        }
        .dark-mode .form-control {
            background: #333;
            color: #fff;
            border: 1px solid #555;
        }
        .toggle-btn {
            cursor: pointer;
            font-size: 20px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="text-end">
        <span class="toggle-btn" onclick="toggleDarkMode()">
            <i class="fas fa-moon"></i>
        </span>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card shadow-lg p-4">
                <h2 class="text-center mb-4">Login</h2>
                <form action="authenticate" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" id="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password:</label>
                        <input type="password" id="password" name="password" class="form-control" required>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                </form>

                <div class="text-center mt-3">
                    <a href="signup" class="text-decoration-none">Sign Up</a> | 
                    <a href="forgetpassword" class="text-decoration-none">Forgot Password?</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function toggleDarkMode() {
        document.body.classList.toggle("dark-mode");
        let icon = document.querySelector(".toggle-btn i");
        if (document.body.classList.contains("dark-mode")) {
            icon.classList.remove("fa-moon");
            icon.classList.add("fa-sun");
        } else {
            icon.classList.remove("fa-sun");
            icon.classList.add("fa-moon");
        }
    }
</script>

</body>
</html>
