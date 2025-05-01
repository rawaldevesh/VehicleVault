<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html lang="en">
  <!--begin::Head-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Vehicle Inquiry List</title>
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
  <%@ include file="header.jsp" %>
  <!--end::Header-->

  <!--begin::Sidebar-->
  <%@ include file="sidebar.jsp" %>
  <!--end::Sidebar-->

  <!--begin::App Main-->
  <main class="app-main">
    
    <!--begin::App Content Header-->
    <div class="app-content-header">
      <div class="container-fluid">
        <div class="row mb-3">
          <div class="col-sm-6">
            <h3 class="mb-0">Inquiry List</h3>
          </div>
        </div>

        <!--begin::Table Card-->
        <div class="card">
          <div class="card-body table-responsive p-3">

            <button class="btn btn-outline-primary mb-3" onclick="downloadCSV('Inquiry-list.csv')">
              <i class="fas fa-download me-1"></i> Download CSV
            </button>

            <table id="listInquiryTable" class="table table-bordered">
              <thead>
                <tr>
                  <th>Inquiry ID</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Contact Number</th>
                  <th>Email</th>
                  <th>Vehicle Model</th>
                  <th>Message</th>
                  <th>Date</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="i" items="${listInquiry}">
                  <c:if test="${i[10] == sessionScope.user.userId}">
                    <tr>
                      <td>${i[2]}</td>
                      <td>${i[4]}</td>
                      <td>${i[5]}</td>
                      <td>${i[6]}</td>
                      <td>${i[7]}</td>
                      <td>${i[8]}</td>
                      <td>${i[0]}</td>
                      <td>${i[1]}</td>
                      <td>${i[9]}</td>
                      <td class="text-center">
  <div class="d-flex justify-content-center gap-2">
    <a href="sellerdeleteinquiry?id=${i[2]}" class="btn btn-sm btn-danger">Delete</a>
    
    <form action="sellertoggleInquiryStatus" method="post" class="d-inline">
      <input type="hidden" name="id" value="${i[2]}">
      <button type="submit" class="btn btn-sm btn-secondary">
        ${i[9] == 'ON' ? 'Disable' : 'Enable'}
      </button>
    </form>
  </div>
</td>

                    </tr>
                  </c:if>
                </c:forEach>
              </tbody>
            </table>

            <!-- Pagination -->
            

          </div>
        </div>
        <!--end::Table Card-->

      </div>
    </div>
    <!--end::App Content Header-->

  </main>
  <!--end::App Main-->

</div>
<!--end::App Wrapper-->

            
          
                    
            



<!-- jQuery (first!) -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- DataTables core -->
<script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>

<!-- DataTables Bootstrap integration -->
<script src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>

<!-- Your DataTable init -->
<script>
  $(document).ready(function () {
    $('#listInquiryTable').DataTable({
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
    <script>
    function downloadCSV(filename) {
        const table = document.getElementById("listInquiryTable");
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


