<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--begin::Sidebar-->
<aside class="app-sidebar bg-body-secondary shadow" data-bs-theme="dark">
  <!--begin::Sidebar Brand-->
  <div class="sidebar-brand">
    <!--begin::Brand Link-->
    <a href="home" class="brand-link">
      <!--begin::Brand Image-->
      <i></i>
      <!--end::Brand Image-->
      <!--begin::Brand Text-->
      <span class="brand-text fw-light">Vehicle Vault</span>
      <!--end::Brand Text-->
    </a>
    <!--end::Brand Link-->
  </div>
  <!--end::Sidebar Brand-->
  <!--begin::Sidebar Wrapper-->
  <div class="sidebar-wrapper">
    <nav class="mt-2">
      <!--begin::Sidebar Menu-->
      <ul
        class="nav sidebar-menu flex-column"
        data-lte-toggle="treeview"
        role="menu"
        data-accordion="false"
      >
        
        <li class="nav-item">
          <a href="admindashboard" class="nav-link">
         <!--    <i class="nav-icon bi bi-circle-fill"></i> -->
            <i class="nav-icon bi bi-speedometer"></i>Dashboard
          </a>
        </li>
        <li class="nav-item">
          <a href="adminlistvehicle" class="nav-link">
            <!-- <i class="nav-icon bi bi-circle-fill"></i> -->
            <p>List Vehicles</p>
          </a>
         
        <li class="nav-item">
          <a href="adminlistinquiry" class="nav-link ">
           
            <p> List Inquiries</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="adminlistuser" class="nav-link ">
           
            <p> List Users</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="adminadddata" class="nav-link ">
           
            <p> Add New Data</p>
          </a>
        </li>
         <li class="nav-item">
          <a href="adminviewuser?id=${sessionScope.user.userId}" class="nav-link ">
           
            <p> Profile</p>
          </a>
        </li>

        
          
       
      </ul>
      <!--end::Sidebar Menu-->
    </nav>
  </div>
  <!--end::Sidebar Wrapper-->
</aside>
<!--end::Sidebar-->
