<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ page trimDirectiveWhitespaces="true"%>
 <!-- plugins:css -->
 <link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
 <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
 <link rel="stylesheet" href="../../assets/css/style.css">
 <!-- End layout styles -->
 <link rel="shortcut icon" href="../../assets/images/favicon.png" />
	
		<nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo" href="../../index.do"><img
					src="../../../resources/images/logo.png" alt="logo" /></a> <a
					class="navbar-brand brand-logo-mini" href="../../index.do"><img
					src="../../assets/images/logo-mini.svg" alt="logo" /></a>
			</div>
			<div class="navbar-menu-wrapper d-flex align-items-stretch">
				<button class="navbar-toggler navbar-toggler align-self-center"
					type="button" data-toggle="minimize">
					<span class="mdi mdi-menu"></span>
				</button>

				<!----- 상단 오른쪽의 프로필 , 메세지, 알림 아이콘  ----->
				<ul class="navbar-nav navbar-nav-right">
					<li class="nav-item nav-profile dropdown">
						<!-- 상단 프로필 --> <a class="nav-link dropdown-toggle"
						id="profileDropdown" href="#" data-toggle="dropdown"
						aria-expanded="false">
							<div class="nav-profile-img">
								<img src="../../assets/images/faces/login.png" alt="image">
								<span class="availability-status online"></span>
							</div>
							<div class="nav-profile-text">
								<p class="mb-1 text-black">PHJ Admin</p>
							</div>
					</a>

						<button
							class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
							type="button" data-toggle="offcanvas">
							<span class="mdi mdi-menu"></span>
						</button>
			</div>
		</nav>
	
