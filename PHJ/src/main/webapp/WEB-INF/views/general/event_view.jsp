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
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">

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
			style="width: 100%; height: 200px; text-align: center; display: table;">
			<p
				style="display: table-cell; text-align: center; vertical-align: middle; font-family: 'Goyang', cursive; font-size: 60px; color: black; font-weight: bold;">
				<img src="https://iconmonstr.com/wp-content/g/gd/makefg.php?i=../assets/preview/2019/png/iconmonstr-party-16.png&r=0&g=0&b=0" width="80px" height="80px" /> 
						이벤트게시판
				<img src="https://cdns.iconmonstr.com/wp-content/assets/preview/2019/96/iconmonstr-party-20.png" width="80px" height="80px" /> 
			</p>
		</div>
		  
   
		<div class="container">
			<br /><br />
			
			<div class="row text-right" style="float: right;">
				<h5 style= "font-weight: bold; padding-right: 20px; font-family: 'Goyang'; color: black;"><i class="far fa-smile-wink"></i>&nbsp;이벤트를 확인하세요</h5>
			</div>
			
		<%-- 	<table class="table table-bordered" style="margin-bottom: -1px;">
				<colgroup>
					<col width="80px" />
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
					<col width="80px" />
					<col width="50px" />
				</colgroup>
				<input type="hidden" name="idx" value="${viewRow.idx }" />
				   
				<br /><br />
				
				<!-- <div style="border: 1px solid #82b9e4 ; height:2px;"></div> -->
				<tr >
					<th bgcolor="#f2efef" style="text-align: center; border-top: 5px solid #4c4c4c ;">제목</th>
					<td bgcolor="white" style="border-top: 5px solid #4c4c4c ;">${viewRow.title}</td>
				</tr>
				<tr>
					<th bgcolor="#f2efef" style="text-align: center;">작성자</th>
					<td bgcolor="white">관리자</td>
				</tr>
				<!-- 	<th>작성자</th>
						<th>날짜</th>
						<th>조회</th> -->
				<!-- <tbody>
				</tbody> -->
			</table>
			<!--  <div style="border: 1px solid #EDEAEA; padding-top: 10px;"> -->
			<table class="table" bgcolor="white">
				<colgroup> 
					<col width="80px" />
					<col width="120px" />
					<col width="80px" />
					<col width="*" />
				</colgroup>
				<tr>
					<th style="text-align: center; border-left:1px solid #EDEAEA; font-weight: normal; ">DATE</th>
					<td>${viewRow.postdate}</td>
					<th style="text-align: center;">조회수</th>
					<td style="border-right:1px solid #EDEAEA;">${viewRow.view_count }</td>
				</tr>
				<tr>
					<td colspan="4" style="height:500px; border-left:1px solid #EDEAEA; border-right:1px solid #EDEAEA; border-bottom:5px solid #4c4c4c;">${viewRow.content}
					</td>
				</tr>
			</table>	 --%>
			  
			<table class="table table-bordered" style="background-color: #f4f4f4; border-top: 5px solid #4c4c4c ; ">
			<tr>
				<td style="text-align: center;">
				<br />
					<p style="font-weight: bold;  font-size: 2em;"><mark class="bg-dark text-white">"${viewRow.title}"</mark></p>
					<div style="text-align: center; border:1px solid #eaeaea;  background-color: white; width: 50%; height: 300px; margin:0 auto;">
						<br />${viewRow.content}
					</div>
					<br />
					<p>| 조회수  ${viewRow.view_count }</p>
					<p>| 게시일  ${viewRow.postdate}</p>
				</td>
			</tr>   
			</table>	
				<p style="margin-left: 30px;">댓글 ?개</p>  
			<%-- <table class="table table-borderless" style=" border-top: 1px solid #f6f6f6; " >
				<col width="20%" />
				<col width="*" />
				<col width="20%" />
				<tr>     
					<td style="text-align:right;">
						<img src="images/pic-2.png" alt="" />
					</td>
					<td>
						<input type="text" style=" width: 100%; height: 200%; " />
					</td>
					<td>
						<button class="btn btn-sm" style="background-color: #7f7b9e; color:white;">답글달기</button>
					</td>
				</tr>
			</table>   --%><!-- include처리 -->
			    
			<!-- </div> --> 
			<%@ include file ="./recipe_comment.jsp" %>
		<br /> <br />
						
		<div class="row text-right" style="float: right;">
           	<button type="button" class="btn btn-dark btn-sm" 
					 onclick="location.href='./event.do';">리스트</button>
									
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