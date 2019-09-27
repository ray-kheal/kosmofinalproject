<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>편히점 - 공지사항</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<link href="https://fonts.googleapis.com/css?family=Goyang&display=swap" rel="stylesheet">
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
<style type="text/css">
@font-face { 
   font-family: 'Goyang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Goyang.woff') format('woff'); 
   font-weight: normal; font-style: normal;
}
nav {
   font-family: 'Goyang', cursive;
}
</style>
<script>
	$(function() {
		$("#notice").attr("class", "current");
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
				
						공지사항
				<img src="https://image.flaticon.com/icons/svg/1189/1189734.svg" width="80px" height="80px" /> 
			</p>
		</div>
		<div style="width: 100%; text-align: center;">
			<br /> <br />

		</div>

		<div class="container">
			<br /> <br />
			<!-- 검색기능 -->
			<form class="form-inline" method= "post">
				<div class="form-group">
					<select name="searchColumn" class="form-control" style="width: 100px;">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="postdate">게시일</option>
					</select>
				</div>
				<div class="input-group">

					<input type="text" name="searchWord" class="form-control"
						style="width: 120px;" />

					<div class="input-group-btn">
						<button type="submit" class="btn">
							검색 <img src="https://image.flaticon.com/icons/svg/148/148928.svg" width="25px" height="25px"/><i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
			<!-- 검색기능 끝 -->

			<br />
			<!-- 	<div class="row text-right"
				style="float: right; padding-bottom: 20px;">
				<button type="submit" class="btn btn-dark btn-sm">글쓰기</button>
			</div> -->
			<br /> <br />
			<div>
				<table class="table table-hover" style="text-align: center;">

					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="120px" />
						<col width="120px" />
						<col width="120px" />
					</colgroup>
					<thead>
						<tr class="table-primary" style="color: black;">
							<th style="text-align: center; font-family: Goyang">번호</th>
							<th style="text-align: center; font-family: Goyang">제목</th>
							<th style="text-align: center; font-family: Goyang">작성자</th>
							<th style="text-align: center; font-family: Goyang">조회수</th>
							<th style="text-align: center; font-family: Goyang">등록날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty listRows }">
								<tr>
									<td colspan="6" class="text-center">등록된 게시물이 없습니다 ^^*</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${listRows }" var="row" varStatus="loop">
									<!-- 리스트반복시작 -->
									<tr>
										<td class="text-center">${row.virtualNum }</td>
										<td class="text-left"><a
											href="./view.do?idx=${row.idx}
								&nowPage=${nowPage}">${row.title}</a>
										</td>
										<td class="text-center">관리자</td>
										<td class="text-center">${row.view_count }</td>
										<td class="text-center">${row.postdate }</td>
										<!-- <td class="text-center">--</td> -->
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
	</div>


		<br /> <br />
		<ul class="pagination justify-content-center">
		<table width="100%">
					<tr>
						<td align="center" style="font-weight: bold; font-size: 1.5em; ">
							${pagingImg }
						</td>
					</tr>
				</table>
		</ul>
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