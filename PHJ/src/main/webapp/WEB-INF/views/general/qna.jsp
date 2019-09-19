<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>편히점 - QnA</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
		$("#service").attr("class", "current");
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
			style="width: 100%; height: 200px; text-align: center; background-color: #82b9e4; display: table;">
			<p
				style="display: table-cell; text-align: center; vertical-align: middle; font-family: Jua; font-size: 60px; color: white; font-weight: bold;">
				<img src="images/memo_w.png" alt="메모"
					style="width: 50px; height: 50px;" />무엇이든 물어보세요 ^ㅅ^
			</p>
		</div>
		 

		<div class="container">
			<br /> <br />
			<!-- 검색기능 -->
			<form class="form-inline">
				<div class="form-group">
					<select name="keyField" class="form-control" style="width: 100px;">
						<option value="">제목</option>
						<option value="">작성자</option>
						<option value="">내용</option>
					</select>
				</div>
				<div class="input-group">

					<input type="text" name="keyString" class="form-control"
						style="width: 120px;" />

					<div class="input-group-btn">
						<button type="submit" class="btn btn-outline-secondary ">
							검색 <i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
			<!-- 검색기능 끝 -->

			<br />
		<!-- 	<div class="row text-right"
				style="float: right; padding-bottom: 20px;">
				<button type="submit" class="btn btn-dark btn-sm">글쓰기</button>
			</div>
		 -->	<br /> <br />
			<div>
				<table class="table table-hover" style="text-align: center;">
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="120px" />
						<col width="120px" />
						<col width="80px" />
					</colgroup>
					<thead>
						<tr class="table-primary" style="color: white;">
							<th style="text-align: center;">번호</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">작성자</th>
							<th style="text-align: center;">날짜</th>
							<th style="text-align: center;">조회</th>
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
										<td class="text-center">${row.content }</td>
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
			<br /><br />
		 <div class="row text-right" style="float: right;">
		 <form action="write.do" method="post">
				<button type="submit" class="btn btn-dark btn-sm">글쓰기</button>
				</form>
			</div>

			<br /> <br />
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