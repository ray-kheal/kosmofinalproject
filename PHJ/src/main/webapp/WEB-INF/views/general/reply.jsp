<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변글 </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type = "text/javascript">
function checkValidate(f){

	if(f.title.value==""){
		alert("제목을 입력하세요.");
		f.title.focus();
		return false;
	}
	if(f.contents.value==""){
		alert("내용을 입력하세요");
		f.content.focus();
		return false;
	}
	}
</script>
</head>
<style type="text/css">
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
	<div id="page-wrapper">
		<!-- 메인헤더 인클루드 -->
		<%@ include file="MainHeader.jsp"%>

		<div
			style="width: 100%; height: 200px; text-align: center; background-color: #82b9e4; display: table;">
			<p
				style="display: table-cell; text-align: center; vertical-align: middle; font-family: Jua; font-size: 60px; color: white; font-weight: bold;">
				<img src="images/memo_w.png" alt="메모"
					style="width: 50px; height: 50px;" /> QnA
			</p>
		</div>

<div class="container">
			<br />
			<br />

			<div class="row text-right" style="float: right;">
				<h5 style="color: #82b9e4; font-weight: bold; padding-right: 20px;">
					<i class="far fa-bell"></i>&nbsp;무엇이든 물어보세요~
				</h5>
			</div>                          

<form action="./replyAction.do" name = "writeFrm" method = "post" 
onsubmit="return checkValidate(this);">
<input type="hidden" name="idx" value = "${replyRow.idx }"  />
<input type="hidden" name="nowPage" value = "${param.nowPage }" />
<input type="hidden" name="bgroup" value = "${replyRow.bgroup }" />
<input type="hidden" name="bstep" value = "${replyRow.bstep }" />
<input type="hidden" name="bindent" value = "${replyRow.bindent }" />

<div class="container">
			<br /><br />
			<form action="replyAction.do" name = "writeFrm" method = "post" 
				onsubmit="return checkValidate(this);">
			
				<table class="table table-bordered" style="margin-bottom: -1px;">
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="120px" />
						<col width="120px" />
						<col width="80px" />
						<col width="50px" />
					</colgroup>
					<%-- <input type="hidden" name="idx" value="${viewRow.idx }" /> --%>
					   
					<br /><br />
					
					<!-- <div style="border: 1px solid #82b9e4 ; height:2px;"></div> -->
					<tr >
						<th bgcolor="#f2efef" style="text-align: center; border-top: 5px solid #82b9e4 ;">제목</th>
						<td bgcolor="white" style="border-top: 5px solid #82b9e4 ;">
						<input type="text" class="form-control" name ="title" style="border:none;"value="${replyRow.title}" /></td>
					</tr>
					<tr>
						<th bgcolor="#f2efef" style="text-align: center;">작성자</th>
						<td bgcolor="white">
						<input type="text" class="form-control" name ="name" style="border:none;" value="<%=session.getAttribute("NAME") %>" readonly/>
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
						<%-- <th style="text-align: center; border-left:1px solid #EDEAEA; font-weight: normal; ">DATE</th>
						<td>${viewRow.postdate}</td>
						<th style="text-align: center;">조회수</th>
						<td style="border-right:1px solid #EDEAEA;">${viewRow.view_count }</td> --%>
						<th bgcolor="#f2efef" style="text-align: center; border-left:1px solid #EDEAEA; border-right:1px solid #EDEAEA;  ">내용</th>
					</tr>
					<tr>
						<td colspan="4" style="height:500px; border-left:1px solid #EDEAEA; border-right:1px solid #EDEAEA; border-bottom:5px solid #82b9e4;">
						<textarea name="content" class="form-control" style ="height:500px; border:none;">${replyRow.content}</textarea>
						</td>
					</tr>
				</table>	
			
			<!-- </div> -->
		<br /> <br />
						
		<div class="row text-right" style="float: right; ">
		
           	<button type="submit" class="btn btn-dark btn-sm" >&nbsp;OK&nbsp;</button> 
           	<button type="reset" class="btn btn-secondary btn-sm" >&nbsp;Reset&nbsp;</button>
           	<button type="button" class="btn btn-info btn-sm" 
					onclick="location.href='./qna.do';">&nbsp;List&nbsp;</button>
				</form>					
		</div>
</div>
</body>
</html>