<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
<meta charset="UTF-8">
<title>레시피 상세보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="summernote/summernote.css" type="text/css"/>
<script src = "summernote/summernote.min.js" type="text/javascript">

function checkValidate(f){
	if(f.name.value==""){
		alert("이름을 입력하세요.");
		f.name.focus();
		return false;
	}
	if(f.pass.value==""){
		alert("패스워드를 입력하세요.");
		f.pass.focus();
		return false;
	}
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
<script>
$(function(){
	$('#summernote').summernote();
	height:"1000px"
});
</script>
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
</script>
<body>
<div id="page-wrapper">
		<!-- 메인헤더 인클루드 -->
		<%@ include file="MainHeader.jsp"%>

		<div
		style="width: 100%; height: 200px; text-align: center; background-color: #ffd74d; display: table;">
		<br /> <br /> <br />
		<p
			style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 60px; color: white; font-weight: bold;">
			<img src="images/fork_round.png" alt="포크"
				style="width: 50px; height: 50px;" /> RECIPE <br />
		</p>
	</div>
		<div class="container">
			<br /><br />
			
			<!-- <div class="row text-right" style="float: right;">
				<h5 style="color:#82b9e4; font-weight: bold; padding-right: 20px;"><i class="far fa-question-circle"></i>&nbsp;궁금한 점이 있으신가요</h5>
			</div> -->
<form action="./editAction.do" name = "writeFrm" method = "post" 
onsubmit="return checkValidate(this);">
<input type="hidden" name="idx" value = "${viewRow.idx }"  />
<input type="hidden" name="nowPage" value = "${param.nowPage }" />
<table border = 1 width =800>
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
						<th bgcolor="#f2efef" style="text-align: center; border-top: 5px solid #ffd74d ;">제목</th>
						<td bgcolor="white" style="border-top: 5px solid #ffd74d ;">
						<input type="text" class="form-control" name ="title" style="border:none;" value="${viewRow.title}"/></td>
					</tr>
					<tr>
						<th bgcolor="#f2efef" style="text-align: center;">작성자</th>
						<td bgcolor="white"><input type="text" class="form-control" name ="name" style="border:none;" value="${viewRow.name}" /></td>
					</tr>
					<tr>
						<th bgcolor="#f2efef" style="text-align: center; border-left:1px solid #EDEAEA; border-right:1px solid #EDEAEA;border-bottom:5px solid #ffd74d;  ">내용</th>
						
						<td style="height:500px; border-left:1px solid #EDEAEA; border-right:1px solid #EDEAEA; border-bottom:5px solid #ffd74d;">
						<div id="summernote" >
							
							</div>
						</td>
					</tr>
				</table>	
			
			<!-- </div> -->
		<br /> <br />
						
		<div class="row text-right" style="float: right; ">
		
           	<button type="submit" class="btn btn-dark btn-sm" >&nbsp;OK&nbsp;</button> 
           	<button type="reset" class="btn btn-secondary btn-sm" >&nbsp;Reset&nbsp;</button>
           	<button type="button" class="btn btn-info btn-sm" 
					onclick="location.href='./recipe.do';">&nbsp;List&nbsp;</button>
				</form>					
		</div>
	</div>
		       
	
</body>
</html>