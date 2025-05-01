<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Add Data (Location, Features, Insurance)</title>
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
<body  class="layout-fixed sidebar-expand-lg bg-body-tertiary">

<div class="app-wrapper">
  <%@ include file="admin_header.jsp" %>
  <%@ include file="admin_sidebar.jsp" %>

  <main class="app-main">
    <div class="app-content-header">
      <div class="container-fluid">
        <div class="row">

          <!-- LOCATION CARD -->
          <div class="col-md-4">
            <div class="card my-4">
              <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Location List</h5>
                <div>
                  <button class="btn btn-outline-primary btn-sm" onclick="downloadCSV('pending-vehicles.csv')">
                    <i class="fas fa-download me-1"></i> CSV
                  </button>
                  <a href="adminaddlocation" class="btn btn-primary btn-sm ms-1">Add</a>
                </div>
              </div>
              <div class="card-body table-responsive p-0" style="max-height: 400px; overflow-y: auto;">
                <table class="table table-bordered mb-0">
                  <thead>
                    <tr><th>State</th>
                    <th>City</th>
                    <th>Area</th></tr>
                  </thead>
                  <tbody>
                    <c:forEach var="area" items="${allArea}">
                      <c:if test="${not empty area.cityName and not empty area.stateName}">
                        <tr>
                          <td>${area.stateName}</td>
                          <td>${area.cityName}</td>
                          <td>${area.areaName}</td>
                        </tr>
                      </c:if>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

          <!-- INSURANCE CARD -->
          <div class="col-md-4">
            <div class="card my-4">
              <div class="card-header"><h5 class="mb-0">Add Insurance</h5></div>
              <div class="card-body">
                <form action="adminsaveinsurance" method="post" class="row g-2 align-items-center mb-3">
                  <div class="col-8">
                    <input type="text" name="insuranceType" class="form-control" placeholder="Insurance type" required />
                  </div>
                  <div class="col-4">
                    <button type="submit" class="btn btn-success w-100">Add</button>
                  </div>
                </form>
                <table class="table table-bordered table-sm">
                  <thead><tr><th>ID</th><th>Type</th><th>Action</th></tr></thead>
                  <tbody>
                    <c:forEach var="ins" items="${allInsurance}">
                      <tr>
                        <td>${ins.insuranceId}</td>
                        <td>${ins.insuranceType}</td>
                        <td>
                          <a href="admindeleteinsurance?id=${ins.insuranceId}" class="btn btn-sm btn-danger" onclick="return confirm('Delete this insurance?')">Delete</a>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

          <!-- FEATURES CARD -->
          <div class="col-md-4">
            <div class="card my-4">
              <div class="card-header"><h5 class="mb-0">Add Feature</h5></div>
              <div class="card-body">
                <form action="adminsavefeatures" method="post" class="row g-2 align-items-center mb-3">
                  <div class="col-8">
                    <input type="text" name="featureName" class="form-control" placeholder="Feature name" required />
                  </div>
                  <div class="col-4">
                    <button type="submit" class="btn btn-success w-100">Add</button>
                  </div>
                </form>
                <h6>All Features</h6>
                <table class="table table-bordered table-sm">
                  <thead><tr><th>ID</th><th>Name</th><th>Action</th></tr></thead>
                  <tbody>
                    <c:forEach var="feat" items="${allFeatures}">
                      <tr>
                        <td>${feat.featureId}</td>
                        <td>${feat.featureName}</td>
                        <td>
                          <a href="admindeletefeature?id=${feat.featureId}" class="btn btn-sm btn-danger" onclick="return confirm('Delete this feature?')">Delete</a>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div> <!-- end row -->
      </div> <!-- end container -->
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
    <script>
    function downloadCSV(filename) {
        const table = document.getElementById("listlocationTable");
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
</body>
</html>
