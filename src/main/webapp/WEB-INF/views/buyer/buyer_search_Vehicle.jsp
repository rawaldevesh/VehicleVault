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
    <!--end::Sidebar-->

    <!--begin::Main-->
    <main class="app-main">

      <!--begin::App Content Header-->
      <div class="app-content-header">
        <div class="container-fluid">

          <!--begin::Vehicle Section-->
          <section class="vehicle-section py-4">
            <h2 class="mb-3">Search Vehicles</h2>

            <!-- Search Input -->
            <input type="text" id="searchBar" onkeyup="searchVehicles()" 
                   class="form-control mb-4 w-50" 
                   placeholder="Search by Make, Model, Year..." />

            <!-- If no vehicles -->
            <c:if test="${empty vehicles}">
              <p>No approved vehicles found.</p>
            </c:if>

            <!-- Vehicle Cards Grid -->
            <div class="row" id="vehicleGrid">
              <c:forEach var="vehicle" items="${vehicles}" varStatus="status">
                <div class="col-md-4 mb-4">
                  <div class="card h-100 vehicle-card" 
                       data-search="${vehicle.make} ${vehicle.model} ${vehicle.year} ${vehicle.fuelType}">
                    <img src="${vehicle.carPicPath}" 
                         class="card-img-top" 
                         alt="Vehicle Image" 
                         style="height: 180px; object-fit: cover;">

                    <div class="card-body">
                      <h5 class="card-title">${vehicle.make} ${vehicle.model} (${vehicle.year})</h5>
                      <p class="card-text mb-1"><strong>Price:</strong> ₹${vehicle.price}</p>
                      <p class="card-text mb-1"><strong>Fuel:</strong> ${vehicle.fuelType}</p>
                      <p class="card-text mb-1"><strong>Variant:</strong> ${vehicle.variant}</p>
                      <p class="card-text mb-1"><strong>Mileage:</strong> ${vehicle.mileage} kmpl</p>
                      <p class="card-text mb-2"><strong>Status:</strong> ${vehicle.status}</p>
                      <a href="buyerviewvehicle?id=${vehicle.vehicleId}" class="btn btn-primary w-100">View Details</a>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>

          </section>
          <!--end::Vehicle Section-->

        </div>
      </div>
      <!--end::App Content Header-->

    </main>
    <!--end::Main-->

  </div>
  <!--end::App Wrapper-->

  <!-- Optional: Script for client-side search (if needed) -->
  <script>
    function searchVehicles() {
      const input = document.getElementById("searchBar").value.toLowerCase();
      const cards = document.querySelectorAll(".vehicle-card");

      cards.forEach(card => {
        const searchContent = card.getAttribute("data-search").toLowerCase();
        card.parentElement.style.display = searchContent.includes(input) ? "" : "none";
      });
    }
  </script>
</body>


 

    
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
