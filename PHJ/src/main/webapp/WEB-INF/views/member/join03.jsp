<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype HTML>
<html>
<head>
<title>편히점 - 회원가입 완료</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="resources/newlogo.css" />
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
		margin-left: auto;
		margin-right: auto;  
		
	}   
	
	.form-group {
		width:400px;  
	}
</style>

<script type='text/javascript'>
 
</script>

<body class="is-preload left-sidebar">
	<div id="page-wrapper">
		<!-- 헤더 -->
		<%@ include file="../general/MainHeader.jsp"%>

		<!-- Main -->

		<div id="content">
			<div class="row" style="margin-top:10px;">
				<div id="account-box">
						<h1 style="margin-top:30%; color:white; "><%=request.getParameter("name") %>님, <br />
						편히점에 가입하신것을 환영합니다!</h1> 
				</div>
			</div>
			<div id="account-box">
					<a href=./login.do>
					<button type="button" class="btn btn-primary">로그인페이지 바로가기</button>
					</a>
			</div>
			<br />
			<div id="account-box">
					<a href=./home.do>
					<button type="button" class="btn btn-primary">메인으로 돌아가기</button>
					</a>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="../general/simpleFooter.jsp"%>
   
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