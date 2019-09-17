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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<script>
	//인클루드 헤더 항목 선택구분.
	$(function() {
		$("#welcome").attr("class", "current");
	});

	function scroll_follow(id) {
		$(window).scroll(function() //스크롤이 움직일때마다 이벤트 발생
		{
			var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
			$(id).stop().animate({
				top : position + "px"
			}, 1); //해당 오브젝트 위치값 재설정
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
	z-index: 5;
}
</style>
    
<body class="is-preload homepage">
	<div id="page-wrapper">
	
		<!-- 메인페이지 우측 스크롤메뉴 -->
		<!-- <div id="scroll" style="position: absolute; right: 30; top: 200px;"> -->
		<div id="scroll" style="position: fixed; right: 50%; top: 100px; margin-right: -720px; text-align:center; width: 120px;"> 
		
		    


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
			<a href="#"><img src="images/scoll_welcome.png" alt="welcome" style="right: 30; top: 30;"/></a><br />
			<a href="#features-wrapper"><img src="images/scoll_product.png" alt="편의점 상품조회" /></a><br />
			<a href="#main-wrapper"><img src="images/scoll_recipe.png" alt="편의점 레시피" /></a><br />
			<a href="#notify"><img src="images/scoll_notice.png" alt="공지사항" /></a><br />
			<a href="#info"><img src="images/scoll_cs.png" alt="고객센터" /></a><br />
			
			<%if(session.getAttribute("EMAIL")==null) { %>
				<a href="login.do"><img src="images/scoll_login.png" alt="로그인" /></a>
			<%}else{ %>
				<a href="logout.do"><img src="images/scoll_logout.png" alt="로그아웃" /></a>
			<%} %>
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
								src="images/store_shadow.png" alt="" /></a>
							<div class="inner">
								<header>
									<h2>편의점 찾기</h2>
								</header>
								<p>원하시는 상품이 있는 편의점을 찾아 드립니다.</p>
							</div>
						</section>
					</div>
					<div class="col-6 col-12-medium">
						<!-- Box -->
						<section class="box feature">
							<a href="placemap.do" class="image featured"><img
								src="images/product_shadow.png" alt="" /></a>
							<div class="inner">
								<header>
									<h2>상품 찾기</h2>
								</header>
								<p>주변 편의점에 있는 상품을 알려드립니다</p>
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
					<!-- Sidebar -->
					<div id="recipe">
						<section class="widget thumbnails">
							<h2>레시피</h2>
							<div class="grid">
								<div class="row gtr-50" style="position: relative; display: inline-block; *display: inline;">
									<h3>요기에 레시피 게시판 미리보기</h3>
									<br />
									<table>
										<tr>
											<td style="width: 50%;">
												<div>
													<a href="#" class="image fit"><img
														src="images/pic04.jpg" alt=""  style="display: block;"/>레시피</a>
												</div>
											</td>
											<td>
												<div>
													<a href="#" class="image fit"><img
														src="images/pic05.jpg" alt="" />레시피2</a>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div>
													<a href="#" class="image fit"><img
														src="images/pic06.jpg" alt="" />레시피3</a>
												</div>
											</td>
											<td>
												<div>
													<a href="#" class="image fit"><img
														src="images/pic07.jpg" alt="" />레시피4</a>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<a href="recipe.do" class="button icon fa-file-alt">More</a>
						</section>
					</div>
					<div class="col-8 col-12-medium imp-medium">

						<!-- Content -->
						<div id="notify">
							<section class="last">
							<table>
								<td>
									<h2>공지사항</h2>
									<h3>이부분에 공지사항 미리보기 게시판 신설</h3>
									<a href="notice.do"
										class="button icon solid fa-arrow-circle-right">더보기</a> </td> 
								<td>
									<h2>이벤트</h2>
									<h3>이부분에 이벤트 미리보기 게시판 신설</h3>
									<a href="qna.do"
										class="button icon solid fa-arrow-circle-right">더보기</a></td>
							</section>
								</table>
						</div>
					</div>
					<div class="col-8 col-12-medium imp-medium">
						<!-- Content -->
						<div id="info">
							<section class="last">
								<h2>고객센터</h2>
								<h3>이부분에 고객센터 페이지 소개</h3>
								<a href="qna.do"
									class="button icon solid fa-arrow-circle-right">더보기</a>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<h2>개발중이니 관리자 페이지 링크 활성화.</h2>
			<a href="./admin/index.do">관리자 페이지 인덱스로 ㄱㄱ</a>
			<h4>로그인 한 이메일 : <%=session.getAttribute("EMAIL") %></h4>
			<h4>로그인 한 회원 이름 : <%=session.getAttribute("NAME") %></h4>
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
