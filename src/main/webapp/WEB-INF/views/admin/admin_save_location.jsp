<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Add Location (State, City, Area)</title>
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
    <div class="container-fluid py-4">
      <div class="card">
        <div class="card-header">
          <h4 class="mb-0">Add Location Details</h4>
        </div>
        <div class="card-body">

          <!-- Add State -->
          <h5 class="mt-3">Add State</h5>
          <form action="adminsavestate" method="post" class="row g-2 align-items-center mb-4">
            <div class="col-md-6">
              <input type="text" name="stateName" class="form-control" placeholder="State Name" required>
            </div>
            <div class="col-md-auto">
              <button type="submit" class="btn btn-primary">Save State</button>
            </div>
          </form>

          <hr>

          <!-- Add City -->
          <h5 class="mt-3">Add City</h5>
          <form action="adminsavecity" method="post" class="row g-2 align-items-center mb-4">
            
            <div class="col-md-4">
              <select name="stateId" class="form-select" required>
                <option value="">Select State</option>
                <c:forEach items="${allState}" var="s">
                  <option value="${s.stateId}">${s.stateName}</option>
                </c:forEach>
              </select>
            </div>
            <div class="col-md-4">
              <input type="text" name="cityName" class="form-control" placeholder="City Name" required>
            </div>
            <div class="col-md-auto">
              <button type="submit" class="btn btn-primary">Save City</button>
            </div>
          </form>

          <hr>

          <!-- Add Area -->
          <h5 class="mt-3">Add Area</h5>
          <form action="adminsavearea" method="post" class="row g-2 align-items-center">
            
            <div class="col-md-3">
              <select name="stateId" id="stateId" class="form-select" onchange="getCityName()" required>
				    <option value="">Select State</option>
				    <c:forEach items="${allState}" var="s">
				        <option value="${s.stateId}">${s.stateName}</option>
				    </c:forEach>
				</select>
            </div>
            <div class="col-md-3">
              <select name="cityId" id="cityId" class="form-select" required>
				    <option value="">Select City</option>
				</select>
            </div>
            <div class="col-md-3">
              <input type="text" name="areaName" class="form-control" placeholder="Area Name" required>
            </div>
            <div class="col-md-auto">
              <button type="submit" class="btn btn-primary">Save Area</button>
            </div>
          </form>

        </div>
      </div>
    </div>
  </main>
</div>


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

</script>
 
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
        const table = document.getElementById("listVehicleTable");
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
