<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.board.noticeDAO"%>
<%@page import="model.board.noticeDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>
<head>
<title>편히점 작업 중</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Goyang&display=swap"
	rel="stylesheet">

<%
	   
%>
</head>
<script>
	function scroll_follow(id) {
		$(window).scroll(function() //스크롤이 움직일때마다 이벤트 발생
		{
			var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
			var stop = 100; //상단 무조건 100px로 고정하기 위해 쓴 변수.
			$(id).stop().animate({
				top : stop + 'px'
			}, 0);
			//해당 오브젝트 위치값 재설정
		});
	}
	scroll_follow("#scroll");
</script>
<style type="text/css">
body {
	font-family: 'Mali', cursive;
	font-family: '나눔고딕코딩', cursive
}

#scroll {
	z-index: 10;
}
</style>

<style type="text/css">
@font-face {
	font-family: 'Goyang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Goyang.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

nav {
	font-family: 'Goyang', cursive;
}
</style>

<body class="is-preload homepage">
	<div id="page-wrapper">

		<!-- 메인페이지 우측 스크롤메뉴 -->
		<!-- <div id="scroll" style="position: absolute; right: 30; top: 200px;"> -->
		<div id="scroll"
			style="position: fixed; right: 50%; top: 100px; margin-right: -720px; text-align: center; width: 120px;">




			<%-- <ul>
				<li><a href="#header">Welcome</a></li>
				<li><a href="#features-wrapper">편의점 상품조회</a></li>
				<li><a href="#main-wrapper">편의점 레시피</a></li>
				<li><a href="#notify">공지사항</a></li>
				<li><a href="#info">고객센터</a></li>
				<%if(session.getAttribute("EMAIL")==null) { %>
					<li><a href="login.do">로그인</a></li>
				<%}else{ %>
					<li><a href="logout.do">로그아웃</a></li>
				<%} %>
			</ul> --%>

			<!-- 이미지로 스크롤 메뉴 변경함 -->
			<a href="#"> <img src="images/scoll_welcome.png" alt="welcome"
				style="right: 30; top: 30;" />
			</a> <br /> <a href="#features-wrapper"> <img
				src="images/scoll_product.png" alt="편의점 상품조회" />
			</a><br /> <a href="#main-wrapper"> <img
				src="images/scoll_recipe.png" alt="편의점 레시피" />
			</a><br /> <a href="#notify"> <img src="images/scoll_notice.png"
				alt="공지사항" />
			</a><br />
			<!-- 			<a href="#info"> -->
			<!-- 				<img src="images/scoll_cs.png" alt="고객센터" /> -->
			<!-- 			</a><br /> -->

			<%
				if (session.getAttribute("EMAIL") == null) {
			%>
			<a href="login.do"><img src="images/scoll_login.png" alt="로그인" /></a>
			<%
				} else {
			%>
			<a href="memberEdit.do"> <img src="images/scoll_modify.png"
				alt="정보수정" />
			</a> <a href="logout.do"> <img src="images/scoll_logout.png"
				alt="로그아웃" />
			</a>
			<%
				}
			%>
		</div>

		<!-- 메인 헤더 인클루드 -->
		<%@ include file="general/MainHeader.jsp"%>

		<!-- 배너 -->
		<div id="banner-wrapper">
			<div id="banner" class="box container">
				<div class="row">
					<div class="col-7 col-12-medium">
						<h2>편의점을 편하게 :)</h2>
						<p></p>
					</div>
					<div class="col-5 col-12-medium">
						<ul>
							<li><a href="#"
								class="button large icon solid fa-arrow-circle-right">편의점 작업
									중</a></li>
							<li><a href="#"
								class="button alt large icon solid fa-question-circle">더 없음</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- Features -->
		<div id="features-wrapper">
			<div class="container">
				<div class="row">
					<div class="col-6 col-12-medium">
						<!-- Box -->
						<section class="box feature">
							<a href="right-sidebar.do" class="image featured"><img
								src="images/store_shadow.png" alt="" 
									style="border-radius: 5%;" /></a>
							<div class="inner"
								style="text-align: center; font-family: Goyang;">
								<header>
									<h2 style="font-family: Goyang;">편의점 찾기</h2>
								</header>
								<p style="font-family: Goyang; font-size: 25px;">원하시는 상품이 있는
									편의점을 찾아 드립니다.</p>
							</div>
						</section>
					</div>
					<div class="col-6 col-12-medium">
						<!-- Box -->
						<section class="box feature">
							<a href="placemap.do" class="image featured"><img
								src="images/product_shadow.png" alt=""
									style="border-radius: 5%;" /></a>
							<div class="inner" style="text-align: center;">
								<header>
									<h2 style="font-family: Goyang;">상품 찾기</h2>
								</header>
								<p style="font-family: Goyang; font-size: 25px;">주변 편의점에 있는
									상품을 알려드립니다</p>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>

		<!-- Main -->
		<div id="main-wrapper">
			<div class="container">
				<div class="row gtr-200">

					<!-- preview board  시작  -->
				<div id="recipe">
						<section class="widget thumbnails">
							<h2>레시피</h2>
							<div class="row text-center text-lg-left">

								<c:choose>
									<c:when test="${empty recipeRows }">
										<div>
											<span>결과가 없습니다.</span>
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach items="${recipeRows }" var="row" varStatus="loop">
											<c:choose>
												<c:when
													test="${row.recommend eq 3 || row.recommend eq 2 || row.recommend eq 1 }">

													<div class="col-lg-3 col-md-4 col-6 effect ">
														<figure class="recipePhoto">
															<img class="img-fluid img-thumbnail effect"
																src="https://www.paris.co.kr/data/product/[2]ham%20egg.jpg"
																alt="">
															<figcaption>
																<h3>${row.title }</h3>
																<p>${row.content }</p>
																<i class="ion-ios-arrow-right"></i>
															</figcaption>
															<a href="#" class="d-block mb-4 h-100"></a>
														</figure>
													</div>

												</c:when>
												<c:otherwise>

													<div class="col-lg-3 col-md-4 col-6 ">
														<figure class="recipePhoto">
															<img class="img-fluid img-thumbnail effect"
																src="https://www.paris.co.kr/data/product/[2]ham%20egg.jpg"
																alt="">
															<figcaption>
																<h3>${row.title }</h3>
																<p>${row.content }</p>
																<i class="ion-ios-arrow-right"></i>
															</figcaption>
															<a href="#" class="d-block mb-4 h-100"></a>
														</figure>
													</div>

												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
						</section>
						<a href="recipe.do" class="button icon solid fa-arrow-circle-right">더보기</a>
					</div>
				</div>
				<div class="row">
					<div class="col-6 col-12-medium">
						<!-- Content -->
						<div id="notify">
							<section class="last">
								<table>
									<tr>
										<td>
											<h2>공지사항</h2>
											<ul class="main_board_list">
												<div>
													<table class="table table-hover" style="text-align: center;">
														<colgroup>
															<col width="80px" />
															<col width="*" />
															<col width="120px" />
															<col width="120px" />
															<col width="120px" />
														</colgroup>
														<thead>
															<tr class="table-primary" style="color: white;">
																<th style="text-align: center;">번호</th>
																<th style="text-align: center;">제목</th>
																<th style="text-align: center;">작성자</th>
																<th style="text-align: center;">조회수</th>
																<th style="text-align: center;">등록날짜</th>
															</tr>
														</thead>
														<tbody>
															<c:choose>
																<c:when test="${empty listRows }">
																	<tr>
																		<td colspan="6" class="text-center">등록된 게시물이 없습니다^^*</td>
																	</tr>
																</c:when>
																<c:otherwise>
																	<c:forEach items="${listRows }" var="row"
																		varStatus="loop">
																		<!-- 리스트반복시작 -->
																		<tr>
																			<td class="text-center">${row.virtualNum }</td>
																			<td class="text-left">
																				<a href="./view.do?idx=${row.idx}&nowPage=${nowPage}">${row.title}</a>
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
											</ul>
											<a href="notice.do" class="button icon solid fa-arrow-circle-right">더보기</a>
										</td>
										<td>
											<h2>이벤트</h2>
											<div>
												<table class="table table-hover" style="text-align: center;">

													<colgroup>
														<col width="80px" />
														<col width="*" />
														<col width="120px" />
														<col width="120px" />
														<col width="120px" />
													</colgroup>
													<thead>
														<tr class="table-primary" style="color: white;">
															<th style="text-align: center;">번호</th>
															<th style="text-align: center;">제목</th>
															<th style="text-align: center;">작성자</th>
															<th style="text-align: center;">조회수</th>
															<th style="text-align: center;">등록날짜</th>
														</tr>
													</thead>
													<tbody>
														<c:choose>
															<c:when test="${empty eventRows }">
																<tr>
																	<td colspan="6" class="text-center">등록된 게시물이 없습니다
																		^^*</td>
																</tr>
															</c:when>
															<c:otherwise>
																<c:forEach items="${eventRows }" var="row"
																	varStatus="loop">
																	<!-- 리스트반복시작 -->
																	<tr>
																		<td class="text-center">${row.virtualNum }</td>
																		<td class="text-left"><a
																			href="./Eview.do?idx=${row.idx}	&nowPage=${nowPage}">${row.title}</a>
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
											<a href="event.do" class="button icon solid fa-arrow-circle-right" width="40px" height="40px">더보기</a>
										</td>
									</tr>
								</table>	
							</section>
						</div>
					</div>
				</div>
				<!-- 				<div class="col-7 col-16-medium imp-medium"> -->
				<!-- 					Content -->
				<!-- 					<div id="info"> -->
				<!-- 						<section class="last"> -->
				<!-- 							<h2>고객센터</h2> -->
				<!-- 							<h3>이부분에 고객센터 페이지 소개</h3> -->
				<!-- 							<a href="qna.do" class="button icon solid fa-arrow-circle-right">더보기</a> -->
				<!-- 						</section> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
			</div>
		</div>
		<div class="container">
			<h2>개발중이니 관리자 페이지 링크 활성화.</h2>
			<a href="./admin/index.do">관리자 페이지 인덱스로 ㄱㄱ</a>
			<h4>
				로그인 한 이메일 :
				<%=session.getAttribute("EMAIL")%></h4>
			<h4>
				로그인 한 회원 이름 :
				<%=session.getAttribute("NAME")%></h4>
		</div>
		<!-- Footer 인클루드. -->
		<%@ include file="general/MainFooter.jsp"%>

	</div>

	<!-- Scripts -->

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>
