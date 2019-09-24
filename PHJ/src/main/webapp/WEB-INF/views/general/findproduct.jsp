<%@page import="util.PagingUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bs05Table</title>

<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
/* 해당 HTML문서의 기본 폰트 지정하기 */
body {
	font-family: 'verdana';
	font-size: 14px;
}

/* 애니메이션 지점 설정하기 */
/* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
@
keyframes blink {
	from {color: white;
}

30%
{
color
:
 
yellow
;
}
to {
	color: red;
	font-weight: bold;
}
/* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
}
</style>


</head>
<script>
	$(function(){
		$("#stock").attr("class","current");
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

   
   <!-- 헤더파일 인클루드 -->
	<%@ include file="MainHeader.jsp" %>


	<div
		style="width: 100%; height: 200px; text-align: center; background-color: #82b9e4; display: table;">
		
		<p
			style="display: table-cell; text-align: center; vertical-align: middle; font-family: 'Goyang', cursive;
			font-size: 60px; color: white; font-weight: bold;">
			<!-- <img src="./images/memo_w.png" alt="메모"
				style="width: 50px; height: 50px;" /> -->
			<i class="fas fa-store" style="width: 45px; height: 45px;"></i>
			&nbsp;	

				 편의점 정보가 여기에!
		</p>
	</div>
	<div style="width: 100%; text-align: center;">
		<br />
		<br />

	</div>

	<div class="container">
		<br /> <br />
		<!-- 검색기능 -->
		<form class="form-inline">
  
			<div class="form-group" style="text-align: center; display:block;">
				<select name="keyField" class="form-control">
					<option value="">편의점목록</option>
					<option value="">지예쓰</option>
					<option value="">씨유~</option>
					<option value="">77777777777</option>
					<option value="">작은멈춤</option>
				</select> <select name="keyField" class="form-control">
					<option value="">분류</option>
					<option value="">먹거리</option>
					<option value="">씻을거리</option>
					<option value="">기타디리링~</option>

				</select> <select name="keyField" class="form-control">
					<option value="">하우머치?</option>
					<option value="">가격이 낮아요</option>
					<option value="">오 가격이 높네</option>
				</select> &nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-outline-secondary ">
					검색 <i class="glyphicon glyphicon-search"></i>
				</button>

			
				
			</div>     
 			&nbsp;&nbsp;
 			<br/>
 			<br/>
 			
 			
		 

		</form>

		<!-- 검색기능 끝 -->

		<br />
				<button type="submit" onclick="" class="btn btn-info">EVENT</button>
				&nbsp;
				<button type="submit" onclick="" class="btn btn-danger">품절임박</button>
				&nbsp;
				<button type="submit" onclick="" class="btn btn-warning" >BEST</button>
				&nbsp;
		<br /> <br />
		<div>
			<table class="table table-hover" style="text-align: center;">
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="25%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr class="table-primary" style="color: white;">
						<th>번호</th>
						<th>상품</th>
						<th>분류</th>
						<th>가격</th> 
					</tr>
				</thead>
				<tbody>
				<!-- 상품 리스트 출력  -->
                        <c:choose>
							<c:when test="${empty listRows }">
								<tr>
									<td colspan="5" class="text-center">
										등록된 상품이 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${listRows }" var="row" varStatus="loop">
									<!-- 리스트반복시작 -->
									<tr>
										 <td class="text-left">${row.virtualNum }</td>
										<td class="text-left">
											<a href="./view.do?idx=${row.product_code}
												&nowPage=${nowPage}">${row.product_name}</a>
										</td >
										<td class="text-left">${row.product_value_code }
										</td>
										<td class="text-left">${row.product_price}
										</td>
									</tr>
									<!-- 리스트반복끝 -->
								</c:forEach>
							</c:otherwise>
						</c:choose>
				</tbody>
			</table>
		</div>

		<br /> <br />
		<!-- 	<ul class="pagination justify-content-center"> -->
		  <div class="container">
				<table style="width:100%;">
					<tr>
						<td align="center" style="font-weight: bold; font-size: 1.5em; ">
							${pagingImg }
						</td>
					</tr>
				</table>
			</div>
			<!-- </ul> -->
		
		<!-- Footer -->
		<%@ include file="../general/simpleFooter.jsp"%>
		
		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
		
	</div>
</body>
</html>