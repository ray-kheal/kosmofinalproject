<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>편히점 - 상품찾기</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">

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

<style>
@media (min-width: 420px)  { 

   #cutboard { display: none; }
}
@media screen and (max-width: 420px) { 
   #wideboard { display: none; }

}
</style>
<script>
	$(function() {
		$("#stock").attr("class", "current");
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
		<!-- 메인헤더 인클루드 -->
		<%@ include file="MainHeader.jsp"%>

      	
      	<div id="cutboard">
			<div style="width: 100%;  text-align: center;  display: table;" >
      
		      <p style="display: table-cell; text-align: center; vertical-align: middle; font-family: 'Goyang', cursive;
		         font-size: 40px; color: black; font-weight: bold;">
		         &nbsp;   
		      
		         상품 찾아보기
            	<img src="https://image.flaticon.com/icons/svg/2/2215.svg" width="40px"   /> 
		      </p>
	      
	   		</div>
		</div>
		<div id="wideboard">
			<div style="width: 100%; height:200px; text-align: center;  display: table;" >
      
		      <p style="display: table-cell; text-align: center; vertical-align: middle; font-family: 'Goyang', cursive;
		         font-size: 60px; color: black; font-weight: bold;">
		         &nbsp;   
		      
                  상품 찾아보기
            <img src="https://image.flaticon.com/icons/svg/2/2215.svg" width="80px"   /> 
		      </p>
	      
	   		</div>
		    
		</div>
      	<br /><br />
   <%-- <div style="width: 100%; text-align: center;">

		<input type="hidden" name="product_code" value="${product_code }" />
		<input type="hidden" name="place_code" value="${place_code }" />

		
		<div class="container">
			<table class="table table-hover" style="text-align: center;">
				<tbody style="color: black;">
					<!-- 상품 리스트 출력  -->
						
					<c:choose>
						<c:when test="${empty listRows }">
							<tr>
								<td colspan="5" class="text-center">해상 상품이 등록된 편의점이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							
							<c:forEach items="${listRows }" var="row" varStatus="loop">
								<!-- 리스트반복시작 -->
								
								<tr>
									<th bgcolor="#f2efef"

										style="text-align: center; border-top: 5px solid #82b9e4; ">편의점</th>
									<td bgcolor="white" style="border-top: 5px solid #82b9e4;">${row.place_name}</td>

									
									<td bgcolor="white" style="border-top: 1px solid #82b9e4;">
									<a href="./findPlace.do?product_code=${product_code}&place_code=${row.place_code}"
									class="btn" style="text-align: center; font-family: Goyang;" > 편의점 찾기</a></td>  
								</tr>
								<tr>
									<th bgcolor="#f2efef"
										style="text-align: center; border-top: 1px solid #82b9e4;">재고</th>
									<td bgcolor="white" style="border-top: 1px solid #82b9e4;">${row.stock}</td>
								</tr>

								<!-- 리스트반복끝 -->
							</c:forEach>
						</c:otherwise>
					</c:choose>


				</tbody>
			</table>



			<br /> <br />

			<div class="row text-right" style="float: right;">
				<button type="button" class="btn"
					onclick="location.href='./findproduct.do';" style="font-family: Goyang;">리스트</button>

			</div>
		</div>

	</div> --%>   
   <%
   String  product_name = request.getParameter("name");
   //String  product_price = request.getParameter("price");
   %> 
		<div class="container">
		<input type="hidden" name="product_code" value="${product_code }" />
		  
		<%-- <div>
			코드 :${product_code } 이름:<%=productName %> 사진 : <img src="./resources/CSProduct/<%=product_imagename %>" alt="" />
		</div> --%>
		<%-- <div style="text-align: center;">
			<div style="display: inline-block; width: 50%;">   
				 <p style="font-family: Goyang; font-size: 1.5em;"> 내가 선택한 상품</p>
			</div> 
			<div style="display: inline-block; width: 50%;">
				<img style="width: 50%; "src="./resources/CSProduct/<%=product_imagename %>" alt="" />
			</div>
		 --%>
		<div class="container" style="text-align: center; border: 2px solid #f4f4f4; margin-bottom: 15px; padding-top: 20px;">
		<table >
		<col width="50%" />
		<col width="50%" />
		<tr> 
			<td style="font-family: Goyang; border-right: 3px solid #f3f3f3;" > 
				<p style=" font-size: 1.2em; color: grey;"> 내가 선택한 상품</p>
				<p style=" font-size: 1.6em;">"<%=product_name %>"</p>
				<p style=" font-size: 1.3em;">${product_price }원</p>  

			</td>
			
			<td> <img style="width: 45%; "src="./resources/CSProduct/<%=product_name %>.jpg" alt="" /></td>
		</tr>
		</table>    
		
		</div>  
		<table class="table " style="text-align: center;">
				<tbody style="color: black;">
					<!-- 상품 리스트 출력  -->
						
					<c:choose>
						<c:when test="${empty listRows }">
							<tr>
								<td colspan="5" class="text-center">해당 상품이 등록된 편의점이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							        
							<c:forEach items="${listRows }" var="row" varStatus="loop">
								<!-- 리스트반복시작 -->
								<tr>
									<td style="position: relative;"> 
										
										<a href="./findPlace.do?product_code=${product_code}&place_code=${row.place_code}" style="color:black;">
											<img src="images/online-store.png" style="width: 20%;" alt="" />
										</a>
										<c:choose>
										   
											<c:when test="${row.stock lt 3 }">
												<p style="font-family: Goyang; font-size: 1.5em; color: red; ">
												 <label class="badge badge-danger">HOT</label>
												'${row.stock}개' 남아있습니다!
												</p>
											</c:when>
											
											<c:otherwise>
												<p style="font-family: Goyang; font-size: 1.5em; ">'${row.stock}개' 남아있습니다. </p>
											</c:otherwise>
										
										</c:choose>
										<p style="font-family: Goyang; ">
										<a href="./findPlace.do?product_code=${product_code}&place_code=${row.place_code}" style="color:black;">
										${row.place_name}
										</a>
										
										</p>
									</td> 
									      
									<!-- <td></td> -->
									<%-- <td bgcolor="white" >
										<a href="./findPlace.do?product_code=${product_code}&place_code=${row.place_code}"
										class="btn btn-sm btn-outline-secondary" style="text-align: center"> 편의점 찾기</a>
									</td>   --%>
								</tr>
								
								<tr>
									<%-- <td bgcolor="#f2efef"
										style="text-align: center; border-top: 1px solid #82b9e4;">재고</td>
										
									<td bgcolor="white" style="border-top: 1px solid #82b9e4;">${row.stock}</td> --%>
								</tr>

								<!-- 리스트반복끝 -->
							</c:forEach>
						</c:otherwise>
					</c:choose>


				</tbody>
			</table>
		
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


