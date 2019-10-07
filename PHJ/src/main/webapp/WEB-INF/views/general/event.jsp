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
<style>
@media (min-width: 420px)  { 

   #cutboard { display: none; }
}
@media screen and (max-width: 420px) { 
   #wideboard { display: none; }

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
#nore{
	
	background-position: 50%;
	background-repeat:no-repeat;
}
</style>
<script>
	$(function() {
		$("#notice").attr("class", "current");
	});
</script>
<body>
	<div id="page-wrapper">
		<!-- 메인헤더 인클루드 -->
		<%@ include file="MainHeader.jsp"%>

		
		
		
		<!-- ------------------------------------------------------------------------pc용-->       
		
         <div id="wideboard" >
         <div id="nore"
		
			style="width: 100%; height: 200px; text-align: center; display: table;">
			<p
				style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 60px; color: black; font-weight: bold;">
					

					&nbsp;
					<img src="https://iconmonstr.com/wp-content/g/gd/makefg.php?i=../assets/preview/2019/png/iconmonstr-party-16.png&r=0&g=0&b=0" width="80px" height="80px" /> 
						이벤트게시판
					<img src="https://cdns.iconmonstr.com/wp-content/assets/preview/2019/96/iconmonstr-party-20.png" width="80px" height="80px" /> 
			</p>
		</div>
         <div class="container">
			<div class="container">
			<br /> <br />
			
                <!-- 검색기능 -->
		      <form class="form-inline" style=" background-color:#fbfbfb;  border-top: 2px solid #c1c1c1;  border-bottom: 2px solid #c1c1c1; padding-bottom:10px; font-family: Goyang;">    
		      
		       <div class="container" style="display:inline-block; text-align: right;  width: 40%; font-weight: bold; border-right: 1px solid grey; margin-top: 10px;" ">
					 <select name="searchColumn" class="form-control" style="margin-left:10px; width:50%;">
		                <option value="title">제목</option>
		                <option value="content">내용</option>
		                <option value="postdate">게시일</option>
		             </select>
				</div>
		       	<div class="container" style=" display:inline-block;width:35%; " >  
		             
		          <input type="text" name="searchWord"  style="width: 100%;  margin-top: 10px;" />
		      	</div> 
		      
		        <div style=" display:inline-block; width:25%; text-align: left;">
		        
		        <button class="btn btn-dark " style=" font-size: 0.7em;  margin-top: 10px;""><i class="fas fa-search"></i></button>
		        </div>
		      </form> 
		      
		      <br />
			</div>
	
			<!-- 검색기능 끝 -->

			<br /> <br />
		
				<table class="table table-hover" style="text-align: center;">

					<colgroup>
						<col width="10%" />
						<col width="*" />
						<col width="15%" />
						<col width="15%" />
						<col width="18%" />
					</colgroup>
					<thead>
						<tr class="" style="color: black; background-color:#fc8a32;">
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
												&nowPage=${nowPage}" style="color:black;"><label class="badge "style="background-color:#fc8a32; color:white;">공지</label>&nbsp;${row.title}</a>
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

	<!-- ------------------------------------------------------------------------mobile용-->      	
	
	<div id="cutboard" >
	<div id="nore"style="width: 100%;  text-align: center; display: table;">
		<p style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 40px; color: black; font-weight: bold;">
				&nbsp;
				<img src="https://iconmonstr.com/wp-content/g/gd/makefg.php?i=../assets/preview/2019/png/iconmonstr-party-16.png&r=0&g=0&b=0" width="40px"  /> 
					이벤트게시판
				<img src="https://cdns.iconmonstr.com/wp-content/assets/preview/2019/96/iconmonstr-party-20.png" width="40px" /> 
		</p>
		</div>
         <div class="container">  
			<div class="container">
			<br /><br />
                <!-- 검색기능 -->
		      <form class="form-inline" style=" background-color:#fbfbfb;  border-top: 2px solid #c1c1c1;  border-bottom: 2px solid #c1c1c1; padding-bottom:10px; font-family: Goyang;">    
		      
		       <div class="container" style="display:inline-block; font-size:0.8em;   text-align: right;  width: 40%; font-weight: bold; border-right: 1px solid grey; margin-top: 10px;" ">
					 <select name="searchColumn" class="form-control" style="margin-left:10px; width:90%;">
		                <option value="title">제목</option>
		                <option value="content">내용</option>
		                <option value="postdate">게시일</option>  
		             </select>
				</div>
		       	<div class="container" style=" display:inline-block;width:40%; " >  
		             
		          <input type="text" name="searchWord"  style="width: 100%;  margin-top: 10px;" />
		      	</div> 
		      
		        <div style=" display:inline-block; width:20%; font-size:0.8em; text-align: left;">
		        
		        <button class="btn btn-dark " style="width:50%; font-size: 0.7em;  margin-top: 10px;"><i class="fas fa-search"></i></button>
		        </div>
		      </form> 
		      
		      <br />
			</div>
	
			<!-- 검색기능 끝 -->

			<br /> <br />
		
				<table class="table table-hover" style="text-align: center; font-size: 0.7em;">

					<colgroup>
						<col width="15%" />
						<col width="*" />
						<col width="15%" />
						<col width="15%" />
						<col width="18%" />
					</colgroup>
					<thead>
						<tr class="" style="color: black; background-color:#fc8a32;">
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
												&nowPage=${nowPage}" style="color:black;"><label class="badge "style="background-color:#fc8a32; color:white;">이벤트</label>&nbsp;${row.title}</a>
										</td>
										<td class="text-center"style="font-size: 0.5em;">관리자</td> 
										<td class="text-center">${row.view_count }</td>
										<td class="text-center">${row.postdate }</td>
										
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