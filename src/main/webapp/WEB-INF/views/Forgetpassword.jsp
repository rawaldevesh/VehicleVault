<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForgetPassword</title>
</head>
<body>
     <h2>Forget Password</h2>
     <form action="sendotp" method="post">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>

    <button type="submit">Send OTP</button>
</form>
     <a href = "login">Login</a><br>
     
     
</body>
</html>