<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
 <!-- plugins:css -->
<link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="../../assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="../../assets/images/favicon.png" />
<div id="sidebar-wrapper">
	<header id="sidebar" class="container">
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
	</header>
</div>
