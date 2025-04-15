<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Vehicle Details</title>
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
    <!--begin::App Wrapper-->
    <div class="app-wrapper">
      <!--begin::Header-->
	<%@ include file="admin_header.jsp" %>
      <!--end::Header-->
      <!--begin::Sidebar-->
      <%@ include file="admin_sidebar.jsp" %>
      <!--end::Sidebar-->
      <!--begin::App Main-->
      <main class="app-main">
        <!--begin::App Content Header-->
        <div class="app-content-header">
          <!--begin::Container-->
          <div class="container-fluid">
            <div class="row">
             
<div class="card-body table-responsive p-0">
<table class="table table-bordered">
    <tr>
        <!-- Sidebar -->
       

        <!-- Main Content -->
        <td width="80%" valign="top">
            <h2>${vehicle.make} ${vehicle.model} Full Details</h2>

            <table class="table table-bordered">
                <tr>
                    <th colspan="2" style="text-align:center">Vehicle Picture</th>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">
                        <img src="${vehicle.carPicPath}" alt="Vehicle Image" width="400" height="250"/>
                    </td>
                </tr>

                <tr><td><b>Make</b></td><td>${vehicle.make}</td></tr>
                <tr><td><b>Model</b></td><td>${vehicle.model}</td></tr>
                <tr><td><b>Type</b></td><td>${vehicle.vehicleType}</td></tr>
                <tr><td><b>Year</b></td><td>${vehicle.year}</td></tr>
                <tr><td><b>Variant</b></td><td>${vehicle.variant}</td></tr>
                <tr><td><b>Mileage</b></td><td>${vehicle.mileage} km/l</td></tr>
                <tr><td><b>Fuel Type</b></td><td>${vehicle.fuelType}</td></tr>
                <tr><td><b>Transmission</b></td><td>${vehicle.transmissionType}</td></tr>
                <tr><td><b>Price</b></td><td>₹ ${vehicle.price}</td></tr>
                <tr><td><b>Color</b></td><td>${vehicle.color}</td></tr>
                <tr><td><b>Seats</b></td><td>${vehicle.seats}</td></tr>
                <tr><td><b>KMs Driven</b></td><td>${vehicle.kmsDriven}</td></tr>
                <tr><td><b>RTO</b></td><td>${vehicle.rTO}</td></tr>
                <tr><td><b>Ownership</b></td><td>${vehicle.ownerShip}</td></tr>
                <tr><td><b>Engine Displacement</b></td><td>${vehicle.engineDisplacement}</td></tr>
                <tr><td><b>Airbags</b></td><td>${vehicle.numberofBags}</td></tr>
                <tr><td><b>Description</b></td><td>${vehicle.description}</td></tr>
                <tr><td><b>Status</b></td><td>${vehicle.status}</td></tr>
                <tr><td><b>Registration No.</b></td><td>${vehicle.registrationNum}</td></tr>
                <tr><td><b>Registration Year</b></td><td>${vehicle.registrationYear}</td></tr>
                <tr><td><b>Insurance</b></td><td>${vehicle.insurance}</td></tr>
                <tr><td><b>Features (String)</b></td><td>${vehicle.features}</td></tr>
                <tr><td><b>Listing Date</b></td><td>${vehicle.listingDate}</td></tr>
                <tr><td><b>Vehicle Status</b></td><td>${vehicle.vehicleStatus}</td></tr>
                <tr><td><b>User ID</b></td><td>${vehicle.userId}</td></tr>
                <tr><td><b>State ID</b></td><td>${vehicle.stateId}</td></tr>
                <tr><td><b>City ID</b></td><td>${vehicle.cityId}</td></tr>
                <tr><td><b>Area ID</b></td><td>${vehicle.areaId}</td></tr>
            </table>

            <br/>
            <a href="admindashboard">← Back to Dashboard</a>
        </td>
    </tr>
</table>
</div>
</div>
</div>
</div>
</main>
</div>

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
