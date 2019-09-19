<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype HTML>
<html>
<head>
<title>편의점 찾기 페이지(임시)</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	
</head>
<script>
	$(function() {
		$("#place").attr("class", "current");
	});
</script>

<body class="is-preload no-sidebar">
	<div id="page-wrapper">

		<!-- 헤더파일 인클루드 -->
		<%@ include file="MainHeader.jsp"%>

		<!-- Main -->
		<div id="main-wrapper">
			<div class="container">
			
			<table style="border:1px solid gray;">
			
				<!-- <td rowspan="3">구글지도 위치</td>
				<td ><input type="text" placeholder="입력하세요"></td>
				
			<tr>
				<td ><input type="text" placeholder="입력하세요"></td>
			</tr>	
			
			<tr>
				<td ><input type="text" placeholder="입력하세요"></td>
			</tr> -->	
			
				<tr >
					<td rowspan="3" style="border-right:1px solid gray; ">구글지도</td>
					<td style="border-bottom: 1px solid gray; "><input type="text" placeholder="내 위치"></td>
				</tr>			
				<tr>
					<!-- <td></td> -->
					<td style="border-bottom: 1px solid gray; "><input type="text" placeholder="이동 시간"></td>
				</tr>			
				tr>
					<!-- <td></td> -->
					<td style="border-bottom: 1px solid gray; "><input type="text" placeholder="편의점 이름"></td>
				</tr>			
			</table>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="MainFooter.jsp"%>

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