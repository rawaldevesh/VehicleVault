<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Inquiry</title>
</head>
<body>
<form action="saveinquiry" method="post">
    <label>Inquiry Message:</label>
    <input type="text" name="message" required><br>
<!-- This is an HTML comment, visible in the browser source -->
   <!-- <input type="hidden" name="vehicleId" value="${sessionScope.vehicleId}"> -->
      <input type="hidden" name="vehicleId" value="${sessionScope.vehicleId}">
      <input type="hidden" name="userId" value="${sessionScope.userId}">
     <!-- <input type="hidden" name="vehicleId" value="${sessionScope.vehicleId}">
      --> 
    <button type="submit">Submit Inquiry</button>
</form>
</body>
</html>
