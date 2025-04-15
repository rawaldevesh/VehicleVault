<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="app-header navbar navbar-expand bg-body">
  <!--begin::Container-->
  <div class="container-fluid">
    <!-- Start navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-lte-toggle="sidebar" href="#" role="button">
          <i class="bi bi-list"></i>
        </a>
      </li>
      <li class="nav-item d-none d-md-block">
        <a href="admindashboard" class="nav-link">Home</a>
      </li>
      
    </ul>
    <!-- End navbar links -->

    <ul class="navbar-nav ms-auto">

      <li class="nav-item dropdown user-menu">
        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
          <img
            src="../../../dist/assets/img/user2-160x160.jpg"
            class="user-image rounded-circle shadow"
            alt="User Image"
          />
          <span class="d-none d-md-inline">Admin</span>
        </a>
        <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
          <!-- User image -->
          <li class="user-header text-bg-primary">
            <img
              src="../../../dist/assets/img/user2-160x160.jpg"
              class="rounded-circle shadow"
              alt="User Image"
            />

            <p>
              Admin - Web Developer
              <small>Member since Nov. 2023</small>
            </p>
          </li>
          <!-- Menu Body -->
         
          <!-- Menu Footer-->
          <li class="user-footer">
            <a href="profile" class="btn btn-default btn-flat">Profile</a>
            <a href="logout" class="btn btn-default btn-flat float-end">Sign out</a>
          </li>
        </ul>
      </li>
    </ul>
  </div>
  <!--end::Container-->
</nav>
<!-- /.navbar -->