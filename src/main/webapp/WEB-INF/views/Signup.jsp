<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Signup</title>
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
            max-width: 800px;
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
        .form-control, .form-select {
            border-radius: 10px;
            border: 1px solid #ccc;
        }
        .dark-mode .form-control, .dark-mode .form-select {
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
        <div class="col-md-10">
            <div class="card shadow-lg p-4">
                <h2 class="text-center mb-4">Signup</h2>
                <form action="saveuser" method="post" enctype = "multipart/form-data">
                    <div class="row">
                        <!-- Left Column -->
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="firstName" class="form-label">First Name:</label>
                                <input type="text" id="firstName" name="firstName" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="lastName" class="form-label">Last Name:</label>
                                <input type="text" id="lastName" name="lastName" class="form-control" required>
                            </div>
                            ${error}
                            <div class="mb-3">
                                <label for="email" class="form-label">Email:</label>
                                <input type="email" id="email" name="email" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password:</label>
                                <input type="password" id="password" name="password" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="confpassword" class="form-label">Confirm Password:</label>
                                <input type="password" id="confpassword" name="confpassword" class="form-control" required>
                            </div>
                        </div>

                        <!-- Right Column -->
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="contactNum" class="form-label">Contact No:</label>
                                <input type="tel" id="contactNum" name="contactNum" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Gender:</label><br>
                                <div class="form-check form-check-inline">
                                    <input type="radio" id="male" name="gender" value="male" class="form-check-input" required>
                                    <label for="male" class="form-check-label">Male</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="radio" id="female" name="gender" value="female" class="form-check-input" required>
                                    <label for="female" class="form-check-label">Female</label>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="role" class="form-label">Select Role:</label>
                                <select name="role" class="form-select">
                                    <option value="BUYER">Buyer</option>
                                    <option value="SELLER">Seller</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="bornYear" class="form-label">Born Year:</label>
                                <input type="number" id="bornYear" name="bornYear" class="form-control" min="1900" max="2024" required>
                            </div>
                           
                            <div class="mb-3">
                                <label for ="profilePic" class="form-label">Profile Pic:</label>
                                <input type="file" id="profilePic" name="profilePic" class="form-control" placeholder = "ProfilePic only .png and .jpg" required>
                            </div>
                        </div>
                    </div>

                    <div class="d-grid mt-3">
                        <button type="submit" class="btn btn-primary">Sign Up</button>
                    </div>
                </form>

                <div class="text-center mt-3">
                    <a href="login" class="text-decoration-none">Already have an account? Login</a>
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
