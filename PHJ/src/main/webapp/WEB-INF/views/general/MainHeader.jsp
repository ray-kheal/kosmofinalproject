<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%@ page trimDirectiveWhitespaces="true"%>
<link rel="stylesheet" href="assets/css/main.css" />
<link
	href="https://fonts.googleapis.com/css?family=Gamja+Flower|Mali&display=swap"
	rel="stylesheet">
<!-- link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" -->
<style type="text/css">
nav {
	font-family: 'Mali', cursive;
	font-family: 'Gamja Flower', cursive
}
</style>

<!-- Header -->
<div id="header-wrapper">



	<header id="header" class="container">

		<!-- Logo -->
		<div id="logo">
			<h1>
				<a href="/phj"><img src="assets/css/images/편의점홈페이지로고.png" alt="" /></a>
			</h1>
		</div>

		<!-- Nav -->
		<nav id="nav" style="font-size: 20px;">
			<ul>
				<li id="welcome" class=""><a href="/phj">Home</a></li>
				<li id="stock">
					<a href="right-sidebar.do">편의점 상품 조회</a>
					<ul>
						<li><a href="#">상품별</a></li>
						<li><a href="#">편의점별</a></li>
					</ul>
				</li>
				<li id="recipe" class=""><a href="left-sidebar.do" id="link2">레시피</a></li>


				<li id="place"><a href="no-sidebar.do">전국 편의점 검색</a></li>
				<li id="login"><a href="login.do">공지사항</a></li>
				<li id="service"><a href="#">고객센터</a>
					<ul>
						<li><a href="#">Q&A</a></li>
						<li><a href="#">Veroeros feugiat</a></li>
					</ul></li>
			</ul>
		</nav>
	</header>
</div>



