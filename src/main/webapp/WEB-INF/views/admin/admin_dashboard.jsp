<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html lang="en">
  <!--begin::Head-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Vehicle Vault</title>
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
    <link rel="stylesheet" href="https://cdn.datatables.net/2.2.2/css/dataTables.bootstrap5.min.css">
    
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
    <style>
     .chart-container canvas {
            max-height: 250px;
        }
        </style>
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
            <!--begin::Row-->
            <div class="row">
              <div class="col-sm-6"><h3 class="mb-0">Dashboard</h3></div>
              
            </div>
            <!--end::Row-->
          </div>
          <!--end::Container-->
        <!--begin::Dashboard Cards-->
<div class="row g-4 mb-4">

  <!-- Total Buyers -->
  <div class="col-lg-3 col-md-6 col-sm-12">
    <div class="card border-start border-primary border-4 shadow-sm">
      <div class="card-body">
        <div class="d-flex justify-content-between align-items-center">
          <div>
            <h5 class="card-title text-muted">Total Users</h5>
            <h3 class="fw-bold mb-0">${totalBuyers}</h3>
          </div>
          <i class="bi bi-people-fill fs-1 text-primary"></i>
        </div>
        <a href="adminlistuser" class="stretched-link text-decoration-none text-primary small d-block mt-2">
          View Buyers <i class="bi bi-chevron-right small"></i>
        </a>
      </div>
    </div>
  </div>

  <!-- This Month's Buyers -->
  <div class="col-lg-3 col-md-6 col-sm-12">
    <div class="card border-start border-success border-4 shadow-sm">
      <div class="card-body">
        <div class="d-flex justify-content-between align-items-center">
          <div>
            <h5 class="card-title text-muted">Buyers (This Month)</h5>
            <h3 class="fw-bold mb-0">${thisMonthBuyerCount}</h3>
          </div>
          <i class="bi bi-calendar-event-fill fs-1 text-success"></i>
        </div>
        <a href="adminlistuser" class="stretched-link text-decoration-none text-success small d-block mt-2">
          View Recent Buyers <i class="bi bi-chevron-right small"></i>
        </a>
      </div>
    </div>
  </div>

  <!-- Total Vehicles -->
  <div class="col-lg-3 col-md-6 col-sm-12">
    <div class="card border-start border-info border-4 shadow-sm">
      <div class="card-body">
        <div class="d-flex justify-content-between align-items-center">
          <div>
            <h5 class="card-title text-muted">Total Vehicles</h5>
            <h3 class="fw-bold mb-0">${totalVehicles}</h3>
          </div>
          <i class="bi bi-truck-front-fill fs-1 text-info"></i>
        </div>
        <a href="adminlistvehicle" class="stretched-link text-decoration-none text-info small d-block mt-2">
          View Vehicles <i class="bi bi-chevron-right small"></i>
        </a>
      </div>
    </div>
  </div>

  <!-- This Month's Vehicles -->
  <div class="col-lg-3 col-md-6 col-sm-12">
    <div class="card border-start border-warning border-4 shadow-sm">
      <div class="card-body">
        <div class="d-flex justify-content-between align-items-center">
          <div>
            <h5 class="card-title text-muted">Vehicles (This Month)</h5>
            <h3 class="fw-bold mb-0">${thisMonthVehicleCount}</h3>
          </div>
          <i class="bi bi-calendar-check-fill fs-1 text-warning"></i>
        </div>
        <a href="adminlistvehicle" class="stretched-link text-decoration-none text-warning small d-block mt-2">
          View Recent Vehicles <i class="bi bi-chevron-right small"></i>
        </a>
      </div>
    </div>
  </div>

  <!-- Pending Vehicles -->
  <div class="col-lg-3 col-md-6 col-sm-12">
    <div class="card border-start border-secondary border-4 shadow-sm">
      <div class="card-body">
        <div class="d-flex justify-content-between align-items-center">
          <div>
          
            <h5 class="card-title text-muted">Approved Vehicles</h5>
            <h3 class="fw-bold mb-0">${totalApprovedVehicles}</h3>
          </div>
          <i class="bi bi-hourglass-split fs-1 text-secondary"></i>
        </div>
        <a href="adminlistvehicle" class="stretched-link text-decoration-none text-secondary small d-block mt-2">
          View Vehicle List <i class="bi bi-chevron-right small"></i>
        </a>
      </div>
    </div>
  </div>
  

  <!-- Total Inquiries -->
  <div class="col-lg-3 col-md-6 col-sm-12">
    <div class="card border-start border-danger border-4 shadow-sm">
      <div class="card-body">
        <div class="d-flex justify-content-between align-items-center">
          <div>
            <h5 class="card-title text-muted">Vehicle Inquiries</h5>
            <h3 class="fw-bold mb-0">${totalInquiry}</h3>
          </div>
          <i class="bi bi-chat-dots-fill fs-1 text-danger"></i>
        </div>
        <a href="adminlistinquiry" class="stretched-link text-decoration-none text-danger small d-block mt-2">
          Total Inquiries <i class="bi bi-chevron-right small"></i>
        </a>
      </div>
    </div>
  </div>
	
	<div class="col-lg-3 col-md-6 col-sm-12">
    <div class="card border-start border-danger border-4 shadow-sm">
      <div class="card-body">
        <div class="d-flex justify-content-between align-items-center">
          <div>
            <h5 class="card-title text-muted">Inquiries(This Month)</h5>
            <h3 class="fw-bold mb-0">${thisMonthInquiryCount}</h3>
          </div>
          <i class="bi bi-chat-dots-fill fs-1 text-danger"></i>
        </div>
        <a href="adminlistinquiry" class="stretched-link text-decoration-none text-danger small d-block mt-2">
          Total Inquiries <i class="bi bi-chevron-right small"></i>
        </a>
      </div>
    </div>
  </div>
</div>
<!--end::Dashboard Cards-->

        <div class="app-content">
          <!--begin::Container-->
          <div class="container-fluid">
            <!--begin::Row-->
            <div class="row" style="min-height: 400px;">
			        <div class="col-12 mb-3">
			          <h3 class="mb-0">Pending Vehicle List</h3>
			        </div>
                  <div class="col-12">
          <div class="card">
            <div class="card-body">
              <!-- Download Button -->
              <div class="mb-3">
                <button class="btn btn-outline-primary" onclick="downloadCSV('pending-vehicles.csv')">
                  <i class="fas fa-download me-1"></i> Download CSV
                </button>
              </div>

              <!-- Vehicle Table -->
              <div class="table-responsive">
                  	
                    <table id="pendingVehicleTable" class="table table-striped align-middle">
                       <thead>
                        <tr>
                            <th>ID</th>
                            <th>Model</th>
                            <th>Brand</th>
                            <th>Price</th>
                            <th>Status</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="v" items="${pendingVehicles}">
                            <tr>
                                <td>${v.vehicleId}</td>
                                <td>${v.model}</td>
                                <td>${v.make}</td>
                                <td>₹${v.price}</td>
                                <td><span class="badge bg-secondary">${v.vehicleStatus}</span></td>
                                 <td>
								  <div class="d-flex justify-content-center flex-wrap gap-1">
								    <a href="adminviewvehicle?id=${v.vehicleId}" class="btn btn-sm btn-info me-1">View</a>
								    <a href="/admin/approve-vehicle/${v.vehicleId}" class="btn btn-sm btn-success me-1">Approve</a>
								    <a href="/admin/reject-vehicle/${v.vehicleId}" class="btn btn-sm btn-danger">Reject</a>
								  </div>
								</td>
                            </tr>
                        </c:forEach>
                    </tbody>

                    </table>
                  </div>
                </div>
                <!-- /.card -->
              </div>
              <!-- /.col-md-6 -->
              </div>
              </div>
              </div>
              </div>
              </div>
              </div>
             </main>
             

      <!--end::App Main-->
      <!--begin::Footer-->
      
      <!--end::Footer-->
    </div>
    <!--end::App Wrapper-->
    <!--begin::Script-->
    <!-- Bootstrap JS -->

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- DataTables core -->
<script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>

<!-- DataTables Bootstrap integration -->
<script src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>

<!-- Your DataTable init -->
<script>
  $(document).ready(function () {
    $('#pendingVehicleTable').DataTable({
      paging: true,
      searching: true,
      ordering: true,
      info: true,
      lengthChange: true,
      autoWidth: false,
      responsive: true
    });
  });
</script>

    
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
      
      
          
          function downloadCSV(filename) {
              const table = document.getElementById("pendingVehicleTable");
              if (!table) return;

              let csv = [];
              const rows = table.querySelectorAll("thead tr, tbody tr");

              rows.forEach((row) => {
                  const cols = row.querySelectorAll("th, td");
                  const rowData = [];

                  cols.forEach((cell, index) => {
                      // Skip the last column (Actions)
                      if (index === cols.length - 1) return;

                      let text = cell.textContent || cell.innerText;
                      text = text.replace(/₹/g, '').trim(); // Remove ₹ symbol
                      rowData.push('"' + text.replace(/"/g, '""') + '"');
                  });

                  // Only add non-empty rows
                  if (rowData.length > 0) {
                      csv.push(rowData.join(","));
                  }
              });

              // Check if there's data
              if (csv.length === 0) {
                  alert("No data to export.");
                  return;
              }

              const csvContent = csv.join("\n");
              const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });
              const url = URL.createObjectURL(blob);

              const link = document.createElement("a");
              link.setAttribute("href", url);
              link.setAttribute("download", filename);
              link.style.display = "none";
              document.body.appendChild(link);
              link.click();
              document.body.removeChild(link);
          }

      
    </script>
    <!--end::OverlayScrollbars Configure-->
    <!-- OPTIONAL SCRIPTS -->
    <!-- apexcharts -->
    <script
      src="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.min.js"
      integrity="sha256-+vh8GkaU7C9/wbSLIcwq82tQ2wTf44aOHA8HlBMwRI8="
      crossorigin="anonymous"
    ></script>
    
    <!--end::Script-->
  </body>
  <!--end::Body-->
</html>
