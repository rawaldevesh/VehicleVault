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
  <div class="app-content-header py-4">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-6">
          <h3 class="mb-0">Vehicle List</h3>
        </div>
      </div>

      <div class="container mt-4">
        <div class="card shadow">
          <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Edit Vehicle</h4>
          </div>
          <div class="card-body">
            <form action="sellerupdatevehicle" method="post" enctype="multipart/form-data">

              <input type="hidden" name="vehicleId" value="${vehicle.vehicleId}">
				<input type="hidden" name="listingDate" value="<%= java.time.LocalDate.now() %>">
                <input type="hidden" name="userId" value="${sessionScope.userId}">
				
              <div class="row g-3">
                <!-- Column 1 -->
                <div class="col-md-6">
                  <label class="form-label">Make</label>
                  <input type="text" class="form-control" name="make" value="${vehicle.make}" required>

                  <label class="form-label mt-3">Model</label>
                  <input type="text" class="form-control" name="model" value="${vehicle.model}" required>

                  <label class="form-label mt-3">Vehicle Type</label>
                  <input type="text" class="form-control" name="vehicleType" value="${vehicle.vehicleType}" required>

                  <label class="form-label mt-3">Year</label>
                  <input type="number" class="form-control" name="year" value="${vehicle.year}" required>

                  <label class="form-label mt-3">Variant</label>
                  <input type="text" class="form-control" name="variant" value="${vehicle.variant}" required>

                  <label class="form-label mt-3">Mileage (km/l)</label>
                  <input type="number" step="0.1" class="form-control" name="mileage" value="${vehicle.mileage}" required>

                  <div class="col-md-4">
					    <label class="form-label">Fuel Type</label>
					    <select name="fuelType" class="form-select" required>
					        <option value="Petrol" <c:if test="${vehicle.fuelType == 'Petrol'}">selected</c:if>>Petrol</option>
					        <option value="Diesel" <c:if test="${vehicle.fuelType == 'Diesel'}">selected</c:if>>Diesel</option>
					        <option value="Electric" <c:if test="${vehicle.fuelType == 'Electric'}">selected</c:if>>Electric</option>
					        <option value="Hybrid" <c:if test="${vehicle.fuelType == 'Hybrid'}">selected</c:if>>Hybrid</option>
					    </select>
					</div>

                  <div class="col-md-4">
					    <label class="form-label">Transmission Type</label>
					    <select name="transmissionType" class="form-select" required>
					        <option value="Manual" <c:if test="${vehicle.transmissionType == 'Manual'}">selected</c:if>>Manual</option>
					        <option value="Automatic" <c:if test="${vehicle.transmissionType == 'Automatic'}">selected</c:if>>Automatic</option>
					    </select>
					</div>

                  <label class="form-label mt-3">Price (₹)</label>
                  <input type="number" step="0.01" class="form-control" name="price" value="${vehicle.price}" required>

                  <label class="form-label mt-3">Color</label>
                  <input type="text" class="form-control" name="color" value="${vehicle.color}" required>

                  <label class="form-label mt-3">Seats</label>
                  <input type="text" class="form-control" name="seats" value="${vehicle.seats}" required>

                  <label class="form-label mt-3">KMs Driven</label>
                  <input type="text" class="form-control" name="kmsDriven" value="${vehicle.kmsDriven}" required>
                </div>

                <!-- Column 2 -->
                <div class="col-md-6">
                  <!-- Vehicle Picture -->
				    <div class="col-md-6">
				        <label class="form-label">Vehicle Picture</label>
				        <!-- Show existing car picture if it exists -->
				        <div>
				            <img src="${vehicle.carPicPath}" alt="Vehicle Image" width="150" height="100" class="img-thumbnail mb-3" />
				        </div>
				        <!-- Allow the user to upload a new image -->
				        <input type="file" class="form-control" name="carPic">
				    </div>

                  <label class="form-label mt-3">Description</label>
                  <textarea class="form-control" name="description" rows="3">${vehicle.description}</textarea>

                 <div class="col-md-6">
					    <label class="form-label">Status</label>
					    <select name="status" class="form-select" required>
					        <option value="Available" <c:if test="${vehicle.status == 'Available'}">selected</c:if>>Available</option>
					        <option value="Sold" <c:if test="${vehicle.status == 'Sold'}">selected</c:if>>Sold</option>
					    </select>
					</div>

                  <label class="form-label mt-3">Listing Date</label>
                  <input type="date" class="form-control" name="listingDate" value="${vehicle.listingDate}" required>

                  <label class="form-label mt-3">Registration Number</label>
                  <input type="text" class="form-control" name="registrationNum" value="${vehicle.registrationNum}" required>

                  <label class="form-label mt-3">Registration Year</label>
                  <input type="date" class="form-control" name="registrationYear" value="${vehicle.registrationYear}" required>
<div class="col-md-4">
    <label class="form-label">Insurance</label>
    <select name="insuranceId" class="form-select" required>
        <c:forEach items="${allInsurance}" var="i">
            <option value="${i.insuranceId}" 
                <c:if test="${i.insuranceId == vehicle.insurance.insuranceId}">selected</c:if>>
                ${i.insuranceType}
            </option>
        </c:forEach>
    </select>
</div>






<!-- Features --><!-- Edit Vehicle JSP: features section -->
<div class="col-md-6 mb-3">
    <label class="form-label">Features</label>
    <div class="form-check">
        <c:forEach var="f" items="${allFeatures}">
            <c:set var="isChecked" value="false" />
            <c:forEach var="vFeature" items="${vehicle.featuresEntities}">
                <c:if test="${vFeature.featureId == f.featureId}">
                    <c:set var="isChecked" value="true" />
                </c:if>
            </c:forEach>

            <div class="form-check mb-1">
                <input class="form-check-input" type="checkbox" name="featureIds" 
                       value="${f.featureId}" <c:if test="${isChecked}">checked</c:if>>
                <label class="form-check-label">${f.featureName}</label>
            </div>
        </c:forEach>
    </div>
</div>





<div class="col-md-4">
    <label class="form-label">Ownership</label>
    <select name="ownerShip" class="form-select" required>
        <option value="First Hand" <c:if test="${vehicle.ownerShip == 'First Hand'}">selected</c:if>>First Hand</option>
        <option value="Second Hand" <c:if test="${vehicle.ownerShip == 'Second Hand'}">selected</c:if>>Second Hand</option>
        <option value="Third Hand" <c:if test="${vehicle.ownerShip == 'Third Hand'}">selected</c:if>>Third Hand</option>
    </select>
</div>

                  <label class="form-label mt-3">RTO</label>
                  <input type="text" class="form-control" name="rTO" value="${vehicle.rTO}" required>

                  <label class="form-label mt-3">Engine Displacement</label>
                  <input type="text" class="form-control" name="engineDisplacement" value="${vehicle.engineDisplacement}" required>

                  <label class="form-label mt-3">Number of Air Bags</label>
                  <input type="text" class="form-control" name="numberofBags" value="${vehicle.numberofBags}" required>
                </div>

                <!-- Location and User Info -->
                <!-- Location and User Info -->
				<div class="col-md-4">
				    <label class="form-label">State</label>
				    <select name="stateId" id="stateId" class="form-select" onchange="getCityName()" required>
				        <option value="-1">Select State</option>
				        <!-- Loop through all available states and set the selected state -->
				        <c:forEach items="${allState}" var="s">
				            <option value="${s.stateId}" 
				                    <c:if test="${s.stateId == vehicle.state.stateId}">selected</c:if>>
				                ${s.stateName}
				            </option>
				        </c:forEach>
				    </select>
				</div>

                
                <!-- Location and User Info -->
				<div class="col-md-4">
				    <label class="form-label">City</label>
				    <select name="cityId" id="cityId" class="form-select" onchange="getAreaName()" required>
				        <option value="-1">Select City</option>
				        <!-- Loop through all available cities and set the selected city -->
				        <c:forEach items="${allCity}" var="c">
				            <option value="${c.cityId}" 
				                    <c:if test="${c.cityId == vehicle.city.cityId}">selected</c:if>>
				                ${c.cityName}
				            </option>
				        </c:forEach>
				    </select>
				</div>
				<div class="col-md-4">
				    <label class="form-label">Area</label>
				    <select name="areaId" id="areaId" class="form-select" required>
				        <option value="-1">Select Area</option>
				        <!-- Loop through all available areas and set the selected area -->
				        <c:forEach items="${allArea}" var="a">
				            <option value="${a.areaId}" 
				                    <c:if test="${a.areaId == vehicle.area.areaId}">selected</c:if>>
				                ${a.areaName}
				            </option>
				        </c:forEach>
				    </select>
				</div>
				

                
              </div>

              <!-- Submit -->
              <div class="mt-4">
                <button type="submit" class="btn btn-success">Update Vehicle</button>
                <a href="sellervehiclelist" class="btn btn-secondary ms-2">Cancel</a>
              </div>
            </form>
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
