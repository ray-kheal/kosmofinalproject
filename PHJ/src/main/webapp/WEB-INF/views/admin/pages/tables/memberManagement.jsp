<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>편히점 Admin페이지</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
  
    <link rel="stylesheet" href="../../assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../assets/images/favicon.png" />
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_navbar.do -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="../../index.do"><img src="../../../resources/images/logo.png" alt="logo" /></a>
          <a class="navbar-brand brand-logo-mini" href="../../index.do"><img src="../../assets/images/logo-mini.svg" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
        
          <!----- 상단 오른쪽의 프로필 , 메세지, 알림 아이콘  ----->
           <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item nav-profile dropdown">
            <!-- 상단 프로필 -->
              <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                <div class="nav-profile-img">
                  <img src="../../assets/images/faces/login.png" alt="image">
                  <span class="availability-status online"></span>
                </div>
                <div class="nav-profile-text">
                  <p class="mb-1 text-black">PHJ Admin</p>
                </div>
              </a>
            
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->  <!-- 사이드바 시작 -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.do -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="#" class="nav-link">
                <div class="nav-profile-image">
                  <img src="../../assets/images/faces/login.png" alt="profile">
                  <span class="login-status online"></span>
                  <!--change to offline or busy as needed-->
                </div>
                <div class="nav-profile-text d-flex flex-column">
                  <span class="font-weight-bold mb-2">PHJ Admin</span> 
                  <span class="text-secondary text-small">Project Manager</span>
                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
              </a>
            </li>
               <li class="nav-item">
              <a class="nav-link" href="../../index.do">
                <span class="menu-title">메인</span>
                <i class="mdi mdi-home menu-icon"></i>
              </a>
            </li>
      
            <li class="nav-item">
              <a class="nav-link" href="./memberManagement.do">
                <span class="menu-title">고객관리</span>
                <i class="mdi mdi-table-large menu-icon"></i>
              </a>
            </li> 
            <li class="nav-item"> 
              <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">편의점관리</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-table-large menu-icon"></i>
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="./productManagement.do">상품관리</a></li>
                  <li class="nav-item"> <a class="nav-link" href="./placeManagement.do">점포관리</a></li>
                </ul>
              </div>
            </li> 
             
            
            <li class="nav-item"> 
              <a class="nav-link" data-toggle="collapse" href="#board-pages" aria-expanded="false" aria-controls="board-pages">
                <span class="menu-title">게시판관리</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-table-large menu-icon"></i>
              </a>
              <div class="collapse" id="board-pages">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="./boardManagement.do">공지사항</a></li>
                  <li class="nav-item"> <a class="nav-link" href="./RecipeManagement.do">레시피 게시판</a></li>
                  <li class="nav-item"> <a class="nav-link" href="./EventManagement.do">이벤트 게시판</a></li>
                </ul>
              </div>
            </li> 
          </ul>   
        </nav>
        <!-- partial --> <!-- 사이드바 끝 -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> 고객관리 </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">관리</a></li>
                  <li class="breadcrumb-item active" aria-current="page">고객관리</li>
                </ol>
              </nav>
            </div>
      
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.do -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2017 <a href="https://www.bootstrapdash.com/" target="_blank">BootstrapDash</a>. All rights reserved.</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="mdi mdi-heart text-danger"></i></span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
 
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>