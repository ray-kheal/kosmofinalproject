<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bs05Table</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
/* 해당 HTML문서의 기본 폰트 지정하기 */
body {
	font-family: verdana;
	font-size: 12px;
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
	<%@ include file="MainHeader.jsp"%>
	<div
		style="width: 100%; height: 200px; text-align: center; background-color: #82b9e4; display: table;">
		<p
			style="display: table-cell; text-align: center; vertical-align: middle; font-family: Arial; font-size: 60px; color: white; font-weight: bold;">
			<img src="./images/memo_w.png" alt="메모"
				style="width: 50px; height: 50px;" /> 상품조회..
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
		<div class="row text-right"
			style="float: right; padding-bottom: 20px;">
			<button type="submit" class="btn btn-dark btn-sm">글쓰기</button>
			
			
		</div>
		
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
					<col width="80px" />
					<col width="100px" />
					<col width="*" />
					<col width="120px" />
					<col width="80px" />
					<col width="50px" />
				</colgroup>
				<thead>
					<tr class="table-primary" style="color: white;">
						<th>번호</th>
						<th>사진</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td>1</td>
						<td><img style="width: 100px;" alt="핫독"
							src="http://cdn2.bgfretail.com/bgfbrand/files/product/227743CDDAC242C59668F4E1087B7842.jpg">
						</td>
						<td style="text-align: left;">제목1</td>
						<td>john@example.com</td>
						<td>2019-09-07</td>
						<td>0</td>
					</tr>
					<tr>
						<td>2</td>
						<td><img style="width: 100px;" alt="핫독"
							src="http://cdn2.bgfretail.com/bgfbrand/files/product/227743CDDAC242C59668F4E1087B7842.jpg">
						</td>
						<td style="text-align: left;">제목2</td>
						<td>mary@example.com</td>
						<td>2019-09-07</td>
						<td>0</td>
					</tr>
					<tr>
						<td>3</td>
						<td><img style="width: 100px;" alt="핫독"
							src="http://cdn2.bgfretail.com/bgfbrand/files/product/227743CDDAC242C59668F4E1087B7842.jpg">
						</td>

						<td style="text-align: left;">제목3</td>
						<td>july@example.com</td>
						<td>2019-09-07</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row text-right" style="float: right;">
			
				
				<button type="submit" class="btn btn-dark btn-sm">글쓰기</button>
			
			
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
</body>
</html>