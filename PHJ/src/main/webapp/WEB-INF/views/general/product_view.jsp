<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>편히점 - 상품찾기</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
/* 해당 HTML문서의 기본 폰트 지정하기 */
body {
	font-family: verdana;
	font-size: 12px;
}
</style>
<script>
	$(function() {
		$("#stock").attr("class", "current");
	});
</script>
<body>
	<!-- <div style="width:100%; height:200px; text-align: center; background-color: #82b9e4; display:table;"> 
		 <p style="display:table-cell; text-align:center; vertical-align:middle; font-family:Arial; font-size: 60px; color: white; font-weight: bold;">
		 BOARD
		 </p> 
	</div> 
	<div style="width:100%; text-align: center;">
	<br /><br />
		<img src="./images/memo.png" alt="메모" style=" width:100px; height: 100px;"/>
	</div> -->
	<div id="page-wrapper">
		<!-- 메인헤더 인클루드 -->
		<%@ include file="MainHeader.jsp"%>


		<div
			style="width: 100%; height: 200px; text-align: center;  display: table;">
			<p
				style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 60px; color: black; font-weight: bold;">
				
						편의점 정보가 여기에!
						
				<img src="https://image.flaticon.com/icons/svg/2/2215.svg" width="80px" height="80px" /> 
			</p>
		</div>

		<input type="hidden" name="product_code" value="${product_code }" />
		<input type="hidden" name="place_code" value="${place_code }" />

		
		<div class="container">
			<table class="table table-hover" style="text-align: center;">
				<tbody style="color: black;">
					<!-- 상품 리스트 출력  -->
						
					<c:choose>
						<c:when test="${empty listRows }">
							<tr>
								<td colspan="5" class="text-center">해상 상품이 등록된 편의점이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							
							<c:forEach items="${listRows }" var="row" varStatus="loop">
								<!-- 리스트반복시작 -->
								
								<tr>
									<th bgcolor="#f2efef"

										style="text-align: center; border-top: 5px solid #82b9e4; ">편의점</th>
									<td bgcolor="white" style="border-top: 5px solid #82b9e4;">${row.place_name}</td>

									
									<td bgcolor="white" style="border-top: 1px solid #82b9e4;">
									<a href="./findPlace.do?product_code=${product_code}&place_code=${row.place_code}"
									class="btn" style="text-align: center; font-family: Goyang;" > 편의점 찾기</a></td>  
								</tr>
								<tr>
									<th bgcolor="#f2efef"
										style="text-align: center; border-top: 1px solid #82b9e4;">재고</th>
									<td bgcolor="white" style="border-top: 1px solid #82b9e4;">${row.stock}</td>
								</tr>

								<!-- 리스트반복끝 -->
							</c:forEach>
						</c:otherwise>
					</c:choose>


				</tbody>
			</table>



			<br /> <br />

			<div class="row text-right" style="float: right;">
				<button type="button" class="btn"
					onclick="location.href='./findproduct.do';" style="font-family: Goyang;">리스트</button>

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


