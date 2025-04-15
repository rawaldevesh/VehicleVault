<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Area</title>
</head>
<body>
<form action = "adminsavearea" method ="post">
     		AreaName  : <input type = "text" name ="areaName" /><br></br>
     		<br>
     		City:
     		<select name="cityId">
     			<option>Select City</option>
     		<c:forEach items = "${allCity}" var ="c" >
     			
     			<option value="${c.cityId}">${c.cityName}</option>
     					
     		</c:forEach>
     		</select>
     		State:
     		<select name="stateId">
     			<option>Select State</option>
     		<c:forEach items = "${allState}" var ="s" >
     			
     			<option value="${s.stateId}">${s.stateName}</option>
     					
     		</c:forEach>
     		</select>
     		
     		<input type ="submit" value = "Save Area"/>
     </form>
</body>
</html>