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
</head>
<script type="text/javascript">
	function FindFrmCheck() {
		var fn = document.emailFrm;

		if (fn.email.value == "") {
			alert("이메일을 입력하세요");
			fn.email.focus();
			return false;
		}
		if (fn.subject.value == "") {
			alert("제목을 입력하세요");
			fn.subject.focus();
			return false;
		}
		if (fn.content.value == "") {
			alert("내용을 입력하세요");
			fn.content.focus();
			return false;
		} else {
			alert("메일이 전송되었습니다.");
		}
	}

	$(function() {
		$("#service").attr("class", "current");
	});
</script>
<style type="text/css">
body {
	font-family: 'Mali', cursive;
	font-family: 'Gamja Flower', cursive
}
</style>
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
							<h3>Contact Us</h3>
							<ul>
								<li><a href="https://twitter.com/2HgFp07ljAUN6Io" class="icon brands fa-twitter"><span
										class="label">Twitter</span></a></li>
								<li><a href="https://www.facebook.com/%ED%8E%B8%ED%9E%88%EC%A0%90-%ED%8E%B8%ED%9E%88%EC%93%B0%EB%8A%94-%ED%8E%B8%EC%9D%98%EC%A0%90-120437606011425/?modal=admin_todo_tour" class="icon brands fa-facebook-f"><span
										class="label">Facebook</span></a></li>
								<li><a href="https://www.instagram.com/pyeonhijeom/" class="icon brands fa-instagram"><span
										class="label">Instagram</span></a></li>
								<li><a href="https://dribbble.com/pyeonhijeom" class="icon brands fa-dribbble"><span
										class="label">Dribbble</span></a></li>
								<li><a href="https://www.pinterest.co.kr/vusglwja/" class="icon brands fa-pinterest"><span
										class="label">Pinterest</span></a></li>
							</ul>
							<p>
								서울특별시 금천구 가산동 426-5 <br /> 월드 메르디앙 벤처 센터 2 차 410 호<br />  (02) 2025-4119 
								
							</p>
						</section>
					</div>
				</div>
				<div class="col-8 col-12-medium imp-medium">
					<div id="content">

						<!-- Content -->
						<article>

							<h2>1:1 문의하기</h2>
							<form action="mail_send.jsp" method="post" name="emailFrm"
								onsubmit="return FindFrmCheck();">
								<div class="pw_box">
									<table border="1">
										<tr>
											<td>답장 받으실 메일</td>
											<td><input type="text" name="email" value="" /></td>
										</tr>
										<tr>
											<td>제목</td>
											<td><input type="text" name="subject" value="" /></td>
										</tr>
										<tr>
											<td>내용</td>
											<td><textarea name="content" id="" cols="30" rows="10"
													value=""></textarea></td>
										</tr>
										<tr>
											<td colspan="2"><button type="submit">문의하기</button></td>
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