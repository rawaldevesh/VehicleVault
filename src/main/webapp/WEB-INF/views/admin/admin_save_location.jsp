<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Location (State, City, Area)</title>
</head>
<body>

<%@ include file="admin_header.jsp" %>

<table width="100%" border="1">
    <tr>
        <!-- Sidebar -->
        <td width="20%" valign="top">
            <%@ include file="admin_sidebar.jsp" %>
        </td>

        <!-- Main Content -->
        <td width="80%" valign="top">
            <h2>Add Location Details</h2>

            <!-- Add State Form -->
            <h3>Add State</h3>
            <form action="adminsavestate" method="post">
                <label>State Name:</label>
                <input type="text" name="stateName" required>
                <input type="submit" value="Save State">
            </form>
            <hr>

            <!-- Add City Form -->
            <h3>Add City</h3>
            <form action="adminsavecity" method="post">
                <label>City Name:</label>
                <input type="text" name="cityName" required>

                <label>Select State:</label>
                <select name="stateId" required>
                    <option value="">Select State</option>
                    <c:forEach items="${allState}" var="s">
                        <option value="${s.stateId}">${s.stateName}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Save City">
            </form>
            <hr>

            <!-- Add Area Form -->
            <h3>Add Area</h3>
            <form action="adminsavearea" method="post">
                <label>Area Name:</label>
                <input type="text" name="areaName" required>

                <label>Select State:</label>
                <select name="stateId" required>
                    <option value="">Select State</option>
                    <c:forEach items="${allState}" var="s">
                        <option value="${s.stateId}">${s.stateName}</option>
                    </c:forEach>
                </select>

                <label>Select City:</label>
                <select name="cityId" required>
                    <option value="">Select City</option>
                    <c:forEach items="${allCity}" var="c">
                        <option value="${c.cityId}">${c.cityName}</option>
                    </c:forEach>
                </select>

                <input type="submit" value="Save Area">
            </form>

        </td>
    </tr>
</table>

</body>
</html>
