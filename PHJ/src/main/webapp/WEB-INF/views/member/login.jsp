<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype HTML>
<html>
<head>
<title>편히점 - 로그인</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="resources/newlogo.css" />
<link
	href="https://fonts.googleapis.com/css?family=Gamja+Flower|Mali&display=swap"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
	body {
		font-family: 'Mali', cursive;
		font-family: 'Gamja Flower', cursive
	}
	* {
		margin: 0px;
		padding: 0px;
	}
	
	.back {
		height: 98%;
		border: 3px solid blue;
	}
	
	.account-box {
		left: 100%;
		margin: auto;
		diso
	}
	
	#saveId {
		z-index: 100;
	}
	
	#content {
		background-image: url("images/bgimg.jpg");
		margin: 0 auto;
		text-align: center;
		background-repeat: no-repeat;
		background-position: 50% 50%;
		background-attachment: fixed;
		background-size: cover;
		height: 700px;
	}
	
	#account-box {
		margin-top:50px;
		margin-left: auto;
		margin-right: auto;
	}
	
	.form-group {
		width:400px;
	}
</style>
<body class="is-preload left-sidebar">
	<div id="page-wrapper">
		<!-- 헤더 -->
		<%@ include file="../general/MainHeader.jsp"%>

		<!-- Main -->

		<div id="content">
			<div class="row" style="margin-top:10px;">
				<div id="account-box">
					<div class="account-box">
						<form class="loginForm" action="loginAction.do">
							<div class="form-group">
								<input type="text" class="form-control" name="email" placeholder="이메일"
									required autofocus />
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="pass" placeholder="암호"
									required />
							</div>
							<div class="" style="color: white;">
								<input type="checkbox" value="remember-me"
									class="" /> 아이디를 저장합니다.
							</div>
							<span style="color:red;font-size:1em;">
								${loginError }
							</span>
							<br />
							<button class="btn btn-lg btn-success btn-block" type="submit">
								로그인</button>
						</form>
						<div class="or-box">
							<span class="or" style="text-align: center; color: white;">
								또는 </span>
							<div id="OtherLogin">
								<div class="kakao" style="margin-bottom:15px;">
									<a href="#">
										<button type="button"  class="btn btn-kakao btn-warning"></button> 
									</a>
								</div>
								<div class="google" style="margin-top:10px;">
									<a href="#"> 
										<button type="button" class="btn btn-google btn-light"></button>
									</a>
								</div>
							</div>
						</div>
						<div class="or-box row-block">
							<a class="forgotLnk" href="http://www.jquery2dotnet.com"
								style="color: blue;">로그인이 되지 않으시나요?</a><br /> <span
								style="color: white;">아직 계정이 없으신가요?</span> <a
								href="join1.do"
								class="btn btn-primary btn-block" style="color: white;">회원가입
								하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="../general/LoginFooter.jsp"%>

	</div>


	<!-- Scripts -->

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>