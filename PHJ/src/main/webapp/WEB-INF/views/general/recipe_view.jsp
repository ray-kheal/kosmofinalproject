<%@page import="model.member.MemberDAO"%>
<%@page import="model.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편히점 - 레시피</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		$("#recipe").attr("class", "current");
	});
	
	//삭제여부 확인
	function isDelete(){
	 	result = confirm('삭제하시겠습니까?');
	 	
	    if(result){
	        location.href = "delete.do?idx=${viewRow.idx}&nowPage=${nowPage}";
	    }else{
	    	return false;
	    }
	}
	//추천하기 	
	function isRecommend(){
	 	result = confirm('추천하시겠습니까?');
	 	
	    if(result){
	        location.href = "recommend.do?idx=${viewRow.idx}&nowPage=${nowPage}";
	    }else{
	    	return false;
	    }
	}
	
	
</script>
<body>
	<div id="page-wrapper">
		<!-- 메인헤더 인클루드 -->
		<%@ include file="MainHeader.jsp"%>


		<div
			style="width: 100%; height: 200px; text-align: center;display: table;">
			<p
			style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 60px; color: black; font-weight: bold;">
					RECIPE
				<img src="https://image.flaticon.com/icons/svg/1411/1411258.svg" width="80px" height="80px" /> 
		</p>
		</div>


		<div class="container">
			<br />
			<br />

			<div class="row text-right" style="float: right;">
				<h5 style="color:#82b9e4; font-weight: bold; padding-right: 20px; font-family: 'Goyang' ">
					<i class="far fa-smile-wink"></i>&nbsp;레시피</h5>
			</div>
			<input type="hidden" name="idx" value="${viewRow.idx }" />
			<input type="hidden" name="nowPage" value="${nowPage }" />
			
			<table class="table table-bordered" style="margin-bottom: -1px;">
				<colgroup>
					<col width="80px" />
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
					<col width="80px" />
					<col width="50px" />
				</colgroup>
							
				<tr>
					<th bgcolor="#f2efef"
						style="text-align: center; border-top: 5px solid #82b9e4;">제목</th>
					<td bgcolor="white" style="border-top: 5px solid #82b9e4;">${viewRow.title}</td>
				</tr>
				<tr>
					<th bgcolor="#f2efef" style="text-align: center;">작성자</th>
					<td bgcolor="white">${viewRow.name}

					</td>
				</tr>
			
			</table>
		
			<table class="table" bgcolor="white">
				<colgroup>
					<col width="80px" />
					<col width="120px" />
					<col width="80px" />
					<col width="*" />
				</colgroup>
				<tr>
					<th
						style="text-align: center; border-left: 1px solid #EDEAEA; font-weight: normal;">작성일</th>
					<td>${viewRow.postdate}</td>
					<th style="text-align: center;">조회수</th>
					<td style="border-right: 1px solid #EDEAEA;">${viewRow.view_count }</td>
				</tr>
				<tr>
					<td colspan="4"
						style="height: 500px; border-left: 1px solid #EDEAEA; border-right: 1px solid #EDEAEA; border-bottom: 5px solid #82b9e4;">${viewRow.content}
					</td>
				</tr>
			</table>
			<!-- </div> -->
			<br /> <br />

			<%-- <button type="button" onclick="location.href='./reply.do?idx=${viewRow.idx}&nowPage=${nowPage}';">답변글달기</button>
			<button type="button" onclick="location.href='./edit.do?idx=${viewRow.idx}&nowPage=${nowPage}';">수정하기</button>--%>
			  <%-- <button type="button" id="deleteBtn" onclick="location.href='./delete.do?idx=${viewRow.idx}&nowPage=${nowPage}';">삭제하기</button> --%>
			<%
			String email = (String)session.getAttribute("EMAIL");
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.memberView(email);
		  
			if(session.getAttribute("EMAIL") != null &&session.getAttribute("EMAIL").toString().equals(dto.getEmail()))  { %> 
			<button type="button" id="deleteBtn" onclick="isDelete();">삭제하기</button>
			<%} %>
			<button type = "button" class="btn" id ="recommendBtn" onclick = "isRecommend();" style="font-family: 'Goyang';" >
			<img src="https://image.flaticon.com/icons/svg/470/470289.svg" width="40px" height="40px"/>	 추천하기</button>
			<div class="row text-right" style="float: right;">
				<button type="button" class="btn"
					onclick="location.href='./recipe.do';" style="font-family: 'Goyang'; font-size: 30px;">
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