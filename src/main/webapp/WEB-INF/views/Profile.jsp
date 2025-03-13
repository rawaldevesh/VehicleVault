<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile </title>
</head>
<body>


<h2> welcome, ${user.firstName}</h2>
		
	<br>
		Profile Pic
		<img src ="${user.profilePicPath}"   height = "200px" width = "200px" />	
	<br>
		
</body>
</html>