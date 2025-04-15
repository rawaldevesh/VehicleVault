<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Search Vehicles</title>
    <script>
        function searchVehicles() {
            let input = document.getElementById("searchBar").value.toLowerCase();
            let cards = document.getElementsByClassName("vehicle-card");
            for (let card of cards) {
                let text = card.getAttribute("data-search").toLowerCase();
                card.style.display = text.includes(input) ? "block" : "none";
            }
        }
    </script>
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

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
    <!--begin::App Wrapper-->
    <div class="app-wrapper">
      <!--begin::Header-->
	<%@ include file="buyer_header.jsp" %>
      <!--end::Header-->
      <!--begin::Sidebar-->
      <%@ include file="buyer_sidebar.jsp" %>
        <main class="app-main">
        <!--begin::App Content Header-->
        <div class="app-content-header">
          <!--begin::Container-->
          <div class="container-fluid">

        <!-- MAIN VEHICLE CONTENT -->
        <td width="80%" valign="top">
            <h2>Search Vehicles</h2>

            <!-- Search Input -->
            <input type="text" id="searchBar" onkeyup="searchVehicles()" placeholder="Search by Make, Model, Year..." style="width: 50%; margin-bottom: 10px;" />

            <!-- Vehicle Cards -->
            <c:if test="${empty vehicles}">
                <p>No approved vehicles found.</p>
            </c:if>

            <table width="100%" cellpadding="10">
                <tr>
                    <c:forEach var="vehicle" items="${vehicles}">
                        <td width="33%" align="center">
                            <div class="vehicle-card" data-search="${vehicle.make} ${vehicle.model} ${vehicle.year} ${vehicle.fuelType}">
                                <table border="1" width="100%" cellpadding="5">
                                    <tr>
                                        <td colspan="2" align="center">
                                            <img src="${vehicle.carPicPath}" alt="Vehicle Image" width="200" height="140" />
                                        </td>
                                    </tr>
                                    <tr><td colspan="2"><b>${vehicle.make} ${vehicle.model} (${vehicle.year})</b></td></tr>
                                    <tr><td>Price:</td><td>₹${vehicle.price}</td></tr>
                                    <tr><td>Fuel:</td><td>${vehicle.fuelType}</td></tr>
                                    <tr><td>Variant:</td><td>${vehicle.variant}</td></tr>
                                    <tr><td>Mileage:</td><td>${vehicle.mileage} kmpl</td></tr>
                                    <tr><td>Status:</td><td>${vehicle.status}</td></tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <a href="buyerviewvehicle?id=${vehicle.vehicleId}">View Details</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <c:if test="${status.index % 3 == 2}"></tr><tr></c:if>
                    </c:forEach>
                </tr>
            </table>
        </td>
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
    <!--end::Required Plugin(AdminLTE)--><!--begin::OverlayScrollbars Configure-->
    <script>
      const SELECTOR_SIDEBAR_WRAPPER = '.sidebar-wrapper';
      const Default = {
        scrollbarTheme: 'os-theme-light',
        scrollbarAutoHide: 'leave',
        scrollbarClickScroll: true,
      };
      document.addEventListener('DOMContentLoaded', function () {
        const sidebarWrapper = document.querySelector(SELECTOR_SIDEBAR_WRAPPER);
        if (sidebarWrapper && typeof OverlayScrollbarsGlobal?.OverlayScrollbars !== 'undefined') {
          OverlayScrollbarsGlobal.OverlayScrollbars(sidebarWrapper, {
            scrollbars: {
              theme: Default.scrollbarTheme,
              autoHide: Default.scrollbarAutoHide,
              clickScroll: Default.scrollbarClickScroll,
            },
          });
        }
      });
      
      <!-- Chart Data Scripts -->
      const usersChart = new Chart(document.getElementById('usersChart'), {
          type: 'line',
          data: {
              labels: [${userChartMonths}], // e.g. "JAN","FEB"
              datasets: [{
                  label: 'User Registrations',
                  data: [${userChartCounts}], // e.g. 5, 10, 15
                  borderColor: '#007bff',
                  backgroundColor: 'rgba(0, 123, 255, 0.2)',
                  fill: true,
                  tension: 0.3
              }]
          },
          options: {
              responsive: true
          }
      });
      new Chart(document.getElementById('inquiriesChart'), {
          type: 'doughnut',
          data: {
              labels: ['Pending', 'Approved', 'Rejected'],
              datasets: [{
                  data: [${inquiryData}],
                  backgroundColor: ['#ffc107', '#28a745', '#dc3545'],
                  borderWidth: 1
              }]
          },
          options: {
              responsive: true,
              cutout: '60%'
          }
      });
      
    </script>
    <!--end::OverlayScrollbars Configure-->
    <!-- OPTIONAL SCRIPTS -->
    <!-- apexcharts -->
    <script
      src="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.min.js"
      integrity="sha256-+vh8GkaU7C9/wbSLIcwq82tQ2wTf44aOHA8HlBMwRI8="
      crossorigin="anonymous"
    ></script>
</body>
</html>
