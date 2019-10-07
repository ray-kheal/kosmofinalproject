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
				<h5 style="color:#4c4c4c; font-weight: bold; padding-right: 20px; font-family: 'Goyang' "><i class="far fa-bell"></i>&nbsp;알려드립니다</h5>
			</div>
			
			<table class="table table-bordered" style="margin-bottom: -1px;">
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
				
				<!-- <div style="border: 1px solid #4c4c4c ; height:2px;"></div> -->
				<tr >
					<th bgcolor="#f2efef" style="text-align: center; border-top: 5px solid #4c4c4c ; border-left:5px solid #4c4c4c;">제목</th>
					<td bgcolor="white" style="border-top: 5px solid #4c4c4c ; border-right:5px solid #4c4c4c;">${viewRow.title}</td>
				</tr>
				<tr>
					<th bgcolor="#f2efef" style="text-align: center; border-left:5px solid #4c4c4c;">작성자</th>
					<td bgcolor="white" style="border-right:5px solid #4c4c4c;">관리자</td>
				</tr>
				<!-- 	<th>작성자</th>
						<th>날짜</th>
						<th>조회</th> -->
				<!-- <tbody>
				</tbody> -->
			</table>
			<!--  <div style="border: 1px solid #4c4c4c; padding-top: 10px;"> -->
			<table class="table" bgcolor="white">
				<colgroup> 
					<col width="80px" />
					<col width="120px" />
					<col width="80px" /> 
					<col width="*" />
				</colgroup>
				<tr>
					<th style="text-align: center; border-left:1px solid #4c4c4c; font-weight: normal; border-left:5px solid #4c4c4c; ">DATE</th>
					<td>${viewRow.postdate}</td>
					<th style="text-align: center; ">조회수</th>
					<td style="border-right:5px solid #4c4c4c;">${viewRow.view_count }</td>
				</tr>
				<tr>
					<td colspan="4" style="height:500px; border-left:5px solid #4c4c4c; border-right:5px solid #4c4c4c; border-bottom:5px solid #4c4c4c;">${viewRow.content}
					</td>
				</tr>
			</table>	  
			<!-- </div> -->
		<br /> <br />
						
		<div class="row text-right" style="float: right;">
           	<button type="button" class="btn" 
					onclick="location.href='./notice.do';" style="font-family: 'Goyang'; font-size: 30px;">
						<img src="https://image.flaticon.com/icons/svg/1086/1086563.svg" width="30px" height="30px"/>리스트</button>
									
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