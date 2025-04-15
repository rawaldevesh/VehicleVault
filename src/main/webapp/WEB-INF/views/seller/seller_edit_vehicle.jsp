<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Edit Vehicle</title>
    <!--begin::Primary Meta Tags-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="title" content="AdminLTE | Dashboard v3" />
    <meta name="author" content="ColorlibHQ" />
    <meta
      name="description"
      content="AdminLTE is a Free Bootstrap 5 Admin Dashboard, 30 example pages using Vanilla JS."
    />
    <meta
      name="keywords"
      content="bootstrap 5, bootstrap, bootstrap 5 admin dashboard, bootstrap 5 dashboard, bootstrap 5 charts, bootstrap 5 calendar, bootstrap 5 datepicker, bootstrap 5 tables, bootstrap 5 datatable, vanilla js datatable, colorlibhq, colorlibhq dashboard, colorlibhq admin dashboard"
    />
    <!--end::Primary Meta Tags-->
    <!--begin::Fonts-->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css"
      integrity="sha256-tXJfXfp6Ewt1ilPzLDtQnJV4hclT9XuaZUKyUvmyr+Q="
      crossorigin="anonymous"
    />
    
    <!--end::Fonts-->
    <!--begin::Third Party Plugin(OverlayScrollbars)-->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/styles/overlayscrollbars.min.css"
      integrity="sha256-tZHrRjVqNSRyWg2wbppGnT833E/Ys0DHWGwT04GiqQg="
      crossorigin="anonymous"
    />
    <!--end::Third Party Plugin(OverlayScrollbars)-->
    <!--begin::Third Party Plugin(Bootstrap Icons)-->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
      integrity="sha256-9kPW/n5nn53j4WMRYAxe9c1rCY96Oogo/MKSVdKzPmI="
      crossorigin="anonymous"
    />
    <!--end::Third Party Plugin(Bootstrap Icons)-->
    <!--begin::Required Plugin(AdminLTE)-->
    <link rel="stylesheet" href="../../dist/css/adminlte.css" />
    <!--end::Required Plugin(AdminLTE)-->
    <!-- apexcharts -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.css"
      integrity="sha256-4MX+61mt9NVvvuPjUWdUdyfZfxSB1/Rf9WtqRHgG5S0="
      crossorigin="anonymous"
    />
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">

<table width="100%" border="1">
  <div class="app-wrapper">
      <!--begin::Header-->
	<%@ include file="header.jsp" %>
      <!--end::Header-->
      <!--begin::Sidebar-->
      <%@ include file="sidebar.jsp" %>
      <!--end::Sidebar-->
      <!--begin::App Main-->
      <main class="app-main">
        <!--begin::App Content Header-->
        <div class="app-content-header">
          <!--begin::Container-->
          <div class="container-fluid">
            <!--begin::Row-->
            <div class="row">
              <div class="col-sm-6"><h3 class="mb-0">Vehicle List</h3></div>

<div class="container mt-4">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Add New Vehicle</h4>
        </div>
        <div class="card-body">

            <form action="sellerupdatevehicle" method="post" enctype="multipart/form-data">
                <input type="hidden" name="vehicleId" value="${vehicle.vehicleId}">

                <p>Make: <input type="text" name="make" value="${vehicle.make}" required></p>
                <p>Vehicle Type: <input type="text" name="vehicleType" value="${vehicle.vehicleType}" required></p>
                <p>Model: <input type="text" name="model" value="${vehicle.model}" required></p>
                <p>Vehicle Picture: <input type="file" name="carPic"></p>
                <p>Year: <input type="number" name="year" value="${vehicle.year}" required></p>
                <p>Variant: <input type="text" name="variant" value="${vehicle.variant}" required></p>
                <p>Mileage: <input type="number" step="0.1" name="mileage" value="${vehicle.mileage}" required></p>
                <p>Fuel Type: <input type="text" name="fuelType" value="${vehicle.fuelType}" required></p>
                <p>Transmission Type: <input type="text" name="transmissionType" value="${vehicle.transmissionType}" required></p>
                <p>Price: <input type="number" step="0.01" name="price" value="${vehicle.price}" required></p>
                <p>Color: <input type="text" name="color" value="${vehicle.color}" required></p>
                <p>Description: <textarea name="description" rows="3">${vehicle.description}</textarea></p>
                <p>Status: <input type="text" name="status" value="${vehicle.status}" required></p>
                <p>Listing Date: <input type="date" name="listingDate" value="${vehicle.listingDate}" required></p>
                <p>Registration Number: <input type="text" name="registrationNum" value="${vehicle.registrationNum}" required></p>
                <p>User ID: <input type="number" name="userId" value="${vehicle.userId}" required></p>
                <p>City ID: <input type="number" name="cityId" value="${vehicle.cityId}" required></p>
                <p>Area ID: <input type="number" name="areaId" value="${vehicle.areaId}" required></p>
                <p>State ID: <input type="number" name="stateId" value="${vehicle.stateId}" required></p>
                <p>Registration Year: <input type="text" name="registrationYear" value="${vehicle.registrationYear}" required></p>
                <p>Insurance: <input type="text" name="insurance" value="${vehicle.insurance}" required></p>
                <p>Features: <input type="text" name="features" value="${vehicle.features}" required></p>
                <p>Seats: <input type="text" name="seats" value="${vehicle.seats}" required></p>
                <p>Kms Driven: <input type="text" name="kmsDriven" value="${vehicle.kmsDriven}" required></p>
                <p>RTO: <input type="text" name="rTO" value="${vehicle.rTO}" required></p>
                <p>Ownership: <input type="text" name="ownerShip" value="${vehicle.ownerShip}" required></p>
                <p>Engine Displacement: <input type="text" name="engineDisplacement" value="${vehicle.engineDisplacement}" required></p>
                <p>Number of Air Bags: <input type="text" name="numberofBags" value="${vehicle.numberofBags}" required></p>

                <p>
                    <input type="submit" value="Update Vehicle">
                    <a href="sellervehiclelist">Cancel</a>
                </p>
            </form>
</div>
</div>
</div>
</div>
</div>
</div>
</main>
</div>

</table>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script type="text/javascript">
    function getCityName() {
        let stateId = document.getElementById("stateId").value;
        $.get("get-citiesbystateid/" + stateId)
            .done(function(data) {
                $('#cityId').empty().append('<option selected value="-1">Select City</option>');
                for (let i = 0; i < data.length; i++) {
                    $('#cityId').append('<option value="' + data[i].cityId + '">' + data[i].cityName + '</option>');
                }
            });
    }

    function getAreaName() {
        let cityId = document.getElementById("cityId").value;
        $.get("get-areasbycityid/" + cityId)
            .done(function(data) {
                $('#areaId').empty().append('<option selected value="-1">Select Area</option>');
                for (let i = 0; i < data.length; i++) {
                    $('#areaId').append('<option value="' + data[i].areaId + '">' + data[i].areaName + '</option>');
                }
            });
        
        
        
        
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    
    <!--begin::Third Party Plugin(OverlayScrollbars)-->
    <script
      src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/browser/overlayscrollbars.browser.es6.min.js"
      integrity="sha256-dghWARbRe2eLlIJ56wNB+b760ywulqK3DzZYEpsg2fQ="
      crossorigin="anonymous"
    ></script>
    <!--end::Third Party Plugin(OverlayScrollbars)--><!--begin::Required Plugin(popperjs for Bootstrap 5)-->
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
      integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
      crossorigin="anonymous"
    ></script>
    <!--end::Required Plugin(popperjs for Bootstrap 5)--><!--begin::Required Plugin(Bootstrap 5)-->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
      integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
      crossorigin="anonymous"
    ></script>
    <!--end::Required Plugin(Bootstrap 5)--><!--begin::Required Plugin(AdminLTE)-->
    <script src="../../dist/js/adminlte.js"></script>

</body>
</html>
