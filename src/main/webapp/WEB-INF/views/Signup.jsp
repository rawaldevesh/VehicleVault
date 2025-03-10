<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Signup</title>
</head>
<body>
    <h2>Signup</h2>
   <form action="saveuser" method="post">
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" required><br><br>

    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" required><br><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>

    <label for="confpassword">Confirm Password:</label>
    <input type="password" id="confpassword" name="confpassword" required><br><br>

    <label for="contactNum">Contact No:</label>
    <input type="tel" id="contactNum" name="contactNum" required><br><br>

    <label>Gender:</label>
    <input type="radio" id="male" name="gender" value="male" required>
    <label for="male">Male</label>
    <input type="radio" id="female" name="gender" value="female" required>
    <label for="female">Female</label><br><br>
    
    <label>Select Role:</label>
    <select name="role">
        <option value="BUYER">Buyer</option>
        <option value="SELLER">Seller</option>
    </select><br><br>

    <label for="bornYear">Born Year:</label>
    <input type="number" id="bornYear" name="bornYear" min="1900" max="2024" required><br><br>

    <label for="city">City:</label>
    <input type="text" id="city" name="city" required><br><br>

    <button type="submit">Sign Up</button>
</form><br>
    <a href="login">Already have an account? Login</a>
</body>
</html>
