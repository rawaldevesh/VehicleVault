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
              <div class="col-sm-6"><h3 class="mb-0">Edit ${user.firstName}  ${user.lastName}</h3></div>
        
           
			<div class="mb-3">
           <form action="adminupdateuser" method="post" enctype="multipart/form-data">
                <input type="hidden" name="userId" value="${user.userId}">
			
                <p>First Name: <input type="text" name="firstName" value="${user.firstName}" required></p>
                <p>Last Name: <input type="text" name="lastName" value="${user.lastName}" required></p>
                <p>email <input type="text" name="email" value="${user.email}" required></p>
                <p>Profile Picture: <input type="file" name="profilePic"></p>
                <p>Contact Number <input type="number" name="contactNum" value="${user.contactNum}" required></p>
                <p>City <input type="text" name="city" value="${user.city}" required></p>
                <p>Born year <input type="number" name="bornYear" value="${user.bornYear}" required></p>
               
                 <div class="mb-3">
				    <label class="form-label">Gender:</label><br>
				    <div class="form-check form-check-inline">
				        <input type="radio" id="male" name="gender" value="male" class="form-check-input"
				            ${user.gender == 'male' ? 'checked' : ''} required>
				        <label for="male" class="form-check-label">Male</label>
				    </div>
				    <div class="form-check form-check-inline">
				        <input type="radio" id="female" name="gender" value="female" class="form-check-input"
				            ${user.gender == 'female' ? 'checked' : ''} required>
				        <label for="female" class="form-check-label">Female</label>
				    </div>
				</div>
				<div class="mb-3">
			    <label for="role" class="form-label">Role:</label>
			    <select name="role" class="form-select" required>
			        <option value="BUYER" ${user.role == 'BUYER' ? 'selected' : ''}>Buyer</option>
			        <option value="SELLER" ${user.role == 'SELLER' ? 'selected' : ''}>Seller</option>
			       
			    </select>
			</div>


                <p>
                    <input type="submit" value="Update User">
                    
                </p>
            </form>
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
  
    
    
    
</script>
</body>
</html>
