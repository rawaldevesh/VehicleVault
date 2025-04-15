<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Add Vehicle</title>
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
            <form action="sellersavevehicle" method="post" enctype="multipart/form-data">
                <div class="row g-3">
                    <!-- Basic Info -->
                    <div class="col-md-4">
                        <label class="form-label">Make By</label>
                        <input type="text" name="make" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Vehicle Type</label>
                        <input type="text" name="vehicleType" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Model</label>
                        <input type="text" name="model" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Variant</label>
                        <input type="text" name="variant" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Year</label>
                        <input type="number" name="year" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Mileage (km/l)</label>
                        <input type="number" name="mileage" class="form-control" required>
                    </div>

                    <!-- Fuel & Transmission -->
                    <div class="col-md-4">
                        <label class="form-label">Fuel Type</label>
                        <select name="fuelType" class="form-select">
                            <option>Petrol</option>
                            <option>Diesel</option>
                            <option>Electric</option>
                            <option>Hybrid</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Transmission</label>
                        <select name="transmissionType" class="form-select">
                            <option>Manual</option>
                            <option>Automatic</option>
                        </select>
                    </div>

                    <!-- Pricing & Appearance -->
                    <div class="col-md-4">
                        <label class="form-label">Price</label>
                        <input type="number" name="price" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Color</label>
                        <input type="text" name="color" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Seats</label>
                        <input type="number" name="seats" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">KMs Driven</label>
                        <input type="number" name="kmsDriven" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">RTO Name</label>
                        <input type="text" name="rTO" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Engine CC</label>
                        <input type="number" name="engineDisplacement" class="form-control" placeholder="e.g., 1000cc">
                    </div>

                    <!-- Description -->
                    <div class="col-12">
                        <label class="form-label">Description</label>
                        <textarea name="description" rows="3" class="form-control" placeholder="Enter vehicle details here..."></textarea>
                    </div>

                    <!-- Status -->
                    <div class="col-md-6">
                        <label class="form-label">Status</label>
                        <select name="status" class="form-select">
                            <option>Available</option>
                            <option>Sold</option>
                        </select>
                    </div>

                    <!-- Registration -->
                    <div class="col-md-6">
                        <label class="form-label">Registration Number</label>
                        <input type="text" name="registrationNum" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Registration Year</label>
                        <input type="date" name="registrationYear" class="form-control" required>
                    </div>

                    <!-- Hidden -->
                    <input type="hidden" name="listingDate" value="<%= java.time.LocalDate.now() %>">
                    <input type="hidden" name="userId" value="${sessionScope.userId}">

                    <!-- Location -->
                    <div class="col-md-4">
                        <label class="form-label">State</label>
                        <select name="stateId" id="stateId" class="form-select" onchange="getCityName()" required>
                            <option value="-1">Select State</option>
                            <c:forEach items="${allState}" var="s">
                                <option value="${s.stateId}">${s.stateName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">City</label>
                        <select name="cityId" id="cityId" class="form-select" onchange="getAreaName()" required>
                            <option value="-1">Select City</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Area</label>
                        <select name="areaId" id="areaId" class="form-select" required>
                            <option value="-1">Select Area</option>
                        </select>
                    </div>

                    <!-- Insurance -->
                    <div class="col-md-6">
                        <label class="form-label">Insurance Type</label>
                        <select name="insuranceId" class="form-select">
                            <c:forEach items="${allInsurance}" var="i">
                                <option value="${i.insuranceId}">${i.insuranceType}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Features -->
                    <div class="col-md-6">
                        <label class="form-label">Features</label><br/>
                        <div class="form-check">
                            <c:forEach var="feature" items="${allFeatures}">
                                <div>
                                    <input class="form-check-input" type="checkbox" name="featureIds" value="${feature.featureId}">
                                    <label class="form-check-label">${feature.featureName}</label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Extra Info -->
                    <div class="col-md-4">
                        <label class="form-label">Ownership</label>
                        <select name="ownerShip" class="form-select">
                            <option>First Hand</option>
                            <option>Second Hand</option>
                            <option>Third Hand</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Air Bags</label>
                        <input type="number" name="numberofBags" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Vehicle Picture</label>
                        <input type="file" name="carPic" class="form-control" required>
                    </div>
                </div>

                <!-- Submit -->
                <div class="mt-4 text-end">
                    <button type="submit" class="btn btn-success btn-lg">
                        <i class="bi bi-save"></i> Submit Vehicle
                    </button>
                </div>
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
