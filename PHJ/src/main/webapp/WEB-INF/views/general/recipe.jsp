<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board.recipeDAO"%>
<%@page import="java.util.List"%>
<%@page import="board.recipeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>편히점 - 레시피</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
/* 해당 HTML문서의 기본 폰트 지정하기 */
body {
	font-family: verdana;
	font-size: 12px;
}

/*** 뱃지 css ***/
.effect {
	position: relative;
	display: inline-block;
	overflow: hidden; /* 불필요한 부분 가리기 */
	padding: 1px 0 0 -10px;
}

.effect:after {
	content: "";
	position: absolute;
	z-index: 5;
	width: 150px;
	height: auto;
	background: #ffa126;
	content: "BEST RECIPE"; /* 보여주는 텍스트 */
	text-align: center;
	color: #fff;
	font-family: 'Arial';
	font-weight: bold;
	padding: 5px 10px;
	left: 25px;
	top: 35px; 
	transform: rotate(0deg);
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
}
</style>
<style>
.pattern {
	background-color: #ffffff;
	background-image: linear-gradient(90deg, rgba(0, 0, 0, .5) 50%,
		transparent 50%), linear-gradient(rgba(0, 0, 0, .5) 50%, transparent
		50%);
	background-size: 50px 50px;
}
</style>


<style>/**** 마우스오버 js *****/
/* Demo purposes only */
$("
.hover
 
")
.mouseleave
 
(
function
 
(){
$(
this
 
)
.removeClass
("hover");

	

}
);
</style>
<style>/**** 마우스오버 css *****/
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

@import
	url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css)
	;

figure.recipePhoto {
	font-family: 'Raleway', Arial, sans-serif;
	position: relative;
	overflow: hidden;
	margin: 10px;
	min-width: 230px;
	max-width: 315px;
	width: 100%;
	color: #ffffff;
	text-align: left;
	font-size: 16px;
	background-color: #000000;
	border-radius: 10px;
}

figure.recipePhoto * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

figure.recipePhoto img {
	max-width: 100%;
	backface-visibility: hidden;
	vertical-align: top;
}

figure.recipePhoto:after, figure.recipePhoto figcaption {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

figure.recipePhoto:after {
	content: '';
	background-color: rgba(0, 0, 0, 0.65);
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
	opacity: 0;
}

figure.recipePhoto figcaption {
	z-index: 1;
	padding: 40px;
}

figure.recipePhoto h3, figure.recipePhoto .links {
	width: 100%;
	margin: 5px 0;
	padding: 0;
}

figure.recipePhoto h3 {
	line-height: 1.1em;
	font-weight: 700;
	font-size: 1.4em;
	text-transform: uppercase;
	opacity: 0;
}

figure.recipePhoto p {
	font-size: 0.8em;
	font-weight: 300;
	letter-spacing: 1px;
	opacity: 0;
	top: 50%;
	-webkit-transform: translateY(40px);
	transform: translateY(40px);
}

figure.recipePhoto i {
	position: absolute;
	bottom: 10px;
	right: 10px;
	padding: 20px 25px;
	font-size: 34px;
	opacity: 0;
	-webkit-transform: translateX(-10px);
	transform: translateX(-10px);
}

figure.recipePhoto a {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	z-index: 1;
}

figure.recipePhoto:hover img, figure.recipePhoto.hover img {
	zoom: 1;
	filter: alpha(opacity = 50);
	-webkit-opacity: 0.5;
	opacity: 0.5;
}

figure.recipePhoto:hover:after, figure.recipePhoto.hover:after {
	opacity: 1;
	position: absolute;
	top: 10px;
	bottom: 10px;
	left: 10px;
	right: 10px;
}

figure.recipePhoto:hover h3, figure.recipePhoto.hover h3, figure.recipePhoto:hover p,
	figure.recipePhoto.hover p, figure.recipePhoto:hover i, figure.recipePhoto.hover i
	{
	-webkit-transform: translate(0px, 0px);
	transform: translate(0px, 0px);
	opacity: 1;
}
</style>
<script>
	$(function() {
		$("#recipe").attr("class", "current");
	});
</script>
</head>
<body>
	<!-- <div style="width:100%; height:200px; text-align: center; background-color: #ffd74d; display:table;"> 
		 <p style="display:table-cell; text-align:center; vertical-align:middle; font-family:Arial; font-size: 60px; color: white; font-weight: bold;">
		 RECIPE
		 </p>
	</div>  
	 
	<div style="width:100%; text-align: center;">
	<br /><br />
		<img src="./images/fork.png" alt="포크" style=" width:100px; height: 100px;"/>
	</div> -->

	<!-- 메인헤더 인클루드 -->
	<%@ include file="MainHeader.jsp"%>

	<div
		style="width: 100%; height: 200px; text-align: center; background-color: #ffd74d; display: table;">
		<br /> <br /> <br />
		<p
			style="display: table-cell; text-align: center; vertical-align: middle; font-family: Arial; font-size: 60px; color: white; font-weight: bold;">
			<img src="images/fork_round.png" alt="포크"
				style="width: 50px; height: 50px;" /> RECIPE <br />
		</p>
	</div>
	<div class="container">
		<!-- Page Content -->
		<div class="container">
			<hr class="mt-2 mb-5 ">
			<div class="row text-center text-lg-left">

				<!-- 이미지 시작 -->
				<!-- 베스트게시물 s-->
				<div class="col-lg-3 col-md-4 col-6 effect ">
					<figure class="recipePhoto">
						<img class="img-fluid img-thumbnail effect"
							src="https://www.paris.co.kr/data/product/[2]ham%20egg.jpg"
							alt="">
						<figcaption>
							<h3>샌드위치</h3>
							<p>계란야채샌드위치</p>
							<i class="ion-ios-arrow-right"></i>
						</figcaption>
						<a href="#" class="d-block mb-4 h-100"></a>
					</figure>
				</div>
				<!-- 베스트게시물 e-->

				<!-- 베스트게시물 s-->
				<div class="col-lg-3 col-md-4 col-6 effect ">
					<figure class="recipePhoto">
						<img class="img-fluid img-thumbnail effect"
							src="https://www.paris.co.kr/data/product/[2]ham%20egg.jpg"
							alt="">
						<figcaption>
							<h3>샌드위치</h3>
							<p>계란야채샌드위치</p>
							<i class="ion-ios-arrow-right"></i>
						</figcaption>
						<a href="#" class="d-block mb-4 h-100"></a>
					</figure>
				</div>
				<!-- 베스트게시물 e-->
				<!-- 베스트게시물 s-->
				<div class="col-lg-3 col-md-4 col-6 effect ">
					<figure class="recipePhoto">
						<img class="img-fluid img-thumbnail effect"
							src="https://www.paris.co.kr/data/product/[2]ham%20egg.jpg"
							alt="">
						<figcaption>
							<h3>샌드위치</h3>
							<p>계란야채샌드위치</p>
							<i class="ion-ios-arrow-right"></i>
						</figcaption>
						<a href="#" class="d-block mb-4 h-100"></a>
					</figure>
				</div>
				<!-- 베스트게시물 e-->
				
				<c:choose>
					<c:when test="${empty listRows }">
						<div><span>등록된 게시물이 없습니다.</span></div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listRows }" var="row" varStatus="loop">
							<!-- 일반게시물 s-->
							<div class="col-lg-3 col-md-4 col-6 ">
								<figure class="recipePhoto">
									<img class="img-fluid img-thumbnail effect"
										src="https://www.paris.co.kr/data/product/[2]ham%20egg.jpg"
										alt="">
									<figcaption>
										<h3>${row.title }</h3>
										<p>${row.content }</p>
										<i class="ion-ios-arrow-right"></i>
									</figcaption>
									<a href="#" class="d-block mb-4 h-100"></a>
								</figure>
							</div>
							<!-- 일반게시물 e-->
					</c:forEach>
				</c:otherwise>
			</c:choose>


			</div>
		</div>
		<!-- /.container -->

		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link"
				href="javascript:void(0);">←</a></li>
			<li class="page-item"><a class="page-link"
				href="javascript:void(0);">1</a></li>
			<li class="page-item"><a class="page-link"
				href="javascript:void(0);">2</a></li>
			<li class="page-item"><a class="page-link"
				href="javascript:void(0);">→</a></li>
		</ul>
	</div>
	
	<!-- Footer -->
	<%@ include file="../general/LoginFooter.jsp"%>
	
	<!-- Scripts -->

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>