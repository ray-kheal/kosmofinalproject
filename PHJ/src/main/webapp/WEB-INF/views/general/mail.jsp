<%@page import="model.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype HTML>
<html>
<head>
<title>고객센터</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link
	href="https://fonts.googleapis.com/css?family=Gamja+Flower|Mali&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<%
if(session.getAttribute("EMAIL")==null){
%>
<script type="text/javascript">
	alert("로그인 후 문의하실 수 있습니다.");
	location.href="login.do";
</script>
<%
	return;
}
%>
	
	<style type="text/css">
	@font-face { 
   font-family: 'Goyang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Goyang.woff') format('woff'); 
   font-weight: normal; font-style: normal;
}
nav {
   font-family: 'Goyang', cursive;
}
</style>
</head>
<script type="text/javascript">
	function FindFrmCheck() {
		var fn = document.emailFrm;

		if (fn.subject.value == "") {
			alert("문의하실 제목을 입력하세요");
			fn.subject.focus();
			return false;
		}
		if (fn.contents.value == "") {
			alert("문의하실 내용을 입력하세요");
			fn.contents.focus();
			return false;
		} else {
			alert("문의해 주셔서 감사합니다.");
		}
	}

	$(function() {
		$("#service").attr("class", "current");
	});
</script>
<!-- <style type="text/css"> -->

<!-- </style> -->
<body class="is-preload left-sidebar">

	<!-- 메인헤더 인클루드 -->
	<%@ include file="MainHeader.jsp"%>

	<!-- Main -->
	<div id="main-wrapper">
		<div class="container">
			<div class="row gtr-200">
				<div class="col-4 col-12-medium">
					<div id="sidebar">

						<!-- Sidebar -->
						<section class="widget contact">
							<h3 >Contact Us</h3>
							<ul>
								<li><a href="./twitter.do" class="icon brands fa-twitter"><span
										class="label">Twitter</span></a></li>
								<li><a href="./facebook.do" class="icon brands fa-facebook-f"><span
										class="label">Facebook</span></a></li>
								<li><a href="" class="icon brands fa-instagram"><span
										class="label">Instagram</span></a></li>
								<li><a href="" class="icon brands fa-dribbble"><span
										class="label">Dribbble</span></a></li>
								<li><a href="" class="icon brands fa-pinterest"><span
										class="label">Pinterest</span></a></li>
							</ul>
							<p style="font-family: Goyang" >
								서울특별시 금천구 가산동 426-5 <br /> 월드 메르디앙 벤처 센터 2 차 410 호<br />  (02) 2025-4119 
								
							</p>
						</section>
					</div>
				</div>
				<div class="col-8 col-12-medium imp-medium">
					<div id="content">

						<!-- Content -->
						<article>
						

							<h2 style="font-family: Goyang; text-align: center;" > <img src="https://image.flaticon.com/icons/svg/1067/1067566.svg" width="80px" height="80px" />1:1 문의하기</h2>
							
							<form action="InquireEmail.do" method="post" name="emailFrm"
								onsubmit="return FindFrmCheck();">

								<div class="pw_box">

									<table border="5px solid">

									<table style="border:1px solid gray;" >


										<!-- <tr>
											<td style="text-align: center; vertical-align:middle; font-family: Goyang;">답장 받으실 메일</td> -->
											<input type="hidden" name="email" value="<%=session.getAttribute("EMAIL") %>" />
											<input type="hidden" name="name" value="<%=session.getAttribute("NAME") %>" />
										<!-- </tr> -->
										<tr>
											<td style="text-align: center; vertical-align:middle; font-family: Goyang;">문의할 제목</td>
											<td><input type="text" name="subject" value="" /></td>
										</tr>
										<tr>
											<td style="text-align: center; vertical-align:middle; font-family: Goyang;">문의할 내용</td>
											<td><textarea name="contents" id="" cols="30" rows="10"
													value=""></textarea></td>
										</tr>
										<tr>
											<td colspan="2" style="text-align:center;"><button type="submit" class="btn" style="float: center; font-family: Goyang; font-size: 20px;">문의하기<img src="https://image.flaticon.com/icons/svg/2139/2139118.svg" width="30px" height="30px" /></button></td>
										</tr>
									</table>


								</div>
							</form>

						</article>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="../general/simpleFooter.jsp"%>
	<!-- Scripts -->

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>