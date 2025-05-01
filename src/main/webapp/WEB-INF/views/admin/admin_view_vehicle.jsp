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
      <<main class="app-main">
    <!--begin::App Content Header-->
    <div class="app-content-header">
        <!--begin::Container-->
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="card mb-4">
                        <div class="card-header text-center">
                            <h3>${vehicle.make} ${vehicle.model} - Full Details</h3>
                        </div>
                        <div class="card-body table-responsive">

                            <!-- Vehicle Image -->
                            <div class="text-center mb-4">
                                <img src="${vehicle.carPicPath}" alt="Vehicle Image" width="400" height="250" class="img-fluid rounded shadow"/>
                            </div>

                            <!-- Vehicle Details Table -->
                            <table class="table table-bordered table-striped">
                                <tbody>
                                    <tr><td><strong>Make</strong></td><td>${vehicle.make}</td></tr>
                                    <tr><td><strong>Model</strong></td><td>${vehicle.model}</td></tr>
                                    <tr><td><strong>Type</strong></td><td>${vehicle.vehicleType}</td></tr>
                                    <tr><td><strong>Year</strong></td><td>${vehicle.year}</td></tr>
                                    <tr><td><strong>Variant</strong></td><td>${vehicle.variant}</td></tr>
                                    <tr><td><strong>Mileage</strong></td><td>${vehicle.mileage} km/l</td></tr>
                                    <tr><td><strong>Fuel Type</strong></td><td>${vehicle.fuelType}</td></tr>
                                    <tr><td><strong>Transmission</strong></td><td>${vehicle.transmissionType}</td></tr>
                                    <tr><td><strong>Price</strong></td><td>₹ ${vehicle.price}</td></tr>
                                    <tr><td><strong>Color</strong></td><td>${vehicle.color}</td></tr>
                                    <tr><td><strong>Seats</strong></td><td>${vehicle.seats}</td></tr>
                                    <tr><td><strong>KMs Driven</strong></td><td>${vehicle.kmsDriven}</td></tr>
                                    <tr><td><strong>RTO</strong></td><td>${vehicle.rTO}</td></tr>
                                    <tr><td><strong>Ownership</strong></td><td>${vehicle.ownerShip}</td></tr>
                                    <tr><td><strong>Engine Displacement</strong></td><td>${vehicle.engineDisplacement}</td></tr>
                                    <tr><td><strong>Airbags</strong></td><td>${vehicle.numberofBags}</td></tr>
                                    <tr><td><strong>Description</strong></td><td>${vehicle.description}</td></tr>
                                    <tr><td><strong>Status</strong></td><td>${vehicle.status}</td></tr>
                                    <tr><td><strong>Registration No.</strong></td><td>${vehicle.registrationNum}</td></tr>
                                    <tr><td><strong>Registration Year</strong></td><td>${vehicle.registrationYear}</td></tr>
                                    <tr>
<tr>
    <th>Insurance</th>
    <td>
        <c:choose>
            <c:when test="${not empty vehicle.insurance}">
                ${vehicle.insurance.insuranceType}
            </c:when>
            <c:otherwise>
                No insurance available
            </c:otherwise>
        </c:choose>
    </td>
</tr>

<tr>
    <th>Features</th>
    <td>
        <c:forEach var="f" items="${vehicle.featuresEntities}" varStatus="status">
            ${f.featureName}<c:if test="${!status.last}">, </c:if>
        </c:forEach>
    </td>
</tr>
                                    <tr><td><strong>Listing Date</strong></td><td>${vehicle.listingDate}</td></tr>
                                    <tr><td><strong>Vehicle Status</strong></td><td>${vehicle.vehicleStatus}</td></tr>
                                    
                                    <tr><td><strong>State</strong></td><td>${vehicle.state.stateName}</td></tr>
                                    <tr><td><strong>City</strong></td><td>${vehicle.city.cityName}</td></tr>
                                    <tr><td><strong>Area</strong></td><td>${vehicle.area.areaName}</td></tr>
                                </tbody>
                            </table>

                            <!-- Back Button -->
                            <div class="text-end">
                                <a href="admindashboard" class="btn btn-secondary">← Back to Dashboard</a>
                            </div>
                             <!-- Reviews Section -->
              <div class="mt-5">
                <h4>Reviews</h4>
                <c:choose>
                  <c:when test="${empty reviews}">
                    <p>No reviews yet. Be the first to review!</p>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="review" items="${reviews}">
                      <div class="card p-3 mb-2">
                        <strong>Rating:</strong> ${review.rating}/5 <br>
                        <strong>Comment:</strong> ${review.comment}
                      </div>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
              </div>
                            

                        </div>
                    </div>
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
