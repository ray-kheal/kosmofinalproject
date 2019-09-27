<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype HTML>
<html>
<head>
<title>편히점 - 로그인</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="google-signin-scope" content="profile email">
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="resources/newlogo.css" />
<link rel="stylesheet" type="text/css" href="assets/accountfind/css/common.css"/>
<link rel="stylesheet" type="text/css" href="assets/accountfind/css/layout.css"/>
<link rel="stylesheet" type="text/css" href="assets/accountfind/css/showCont.css"/>
<link rel="stylesheet" type="text/css" href="assets/accountfind/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="assets/accountfind/js/showCont.js"></script>
<script src="assets/accountfind/js/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<style type="text/css">
	
	#content {
		background-image: url("images/bgimg.jpg");
		margin: 0 auto;
		background-repeat: no-repeat;
		background-position: 50% 50%;
		background-attachment: fixed;
		background-size: cover;
		height: 700px;
	}
	
	#findMenu {
		margin: 0 auto;
	}
</style>
<script type="text/javascript">
	history.pushState(null, null, location.href);
		window.onpopstate = function () {
		   	history.go(1);
	};
</script>
<body class="is-preload left-sidebar">
	<div id="page-wrapper">
		<!-- 헤더 -->
		<%@ include file="../general/MainHeader.jsp"%>

		<!-- Main -->

		<div id="content">
			<div class="row" style="margin-top:10px;">
			<div id="findMenu" style="margin-top:100px;">
				<div class="findPop find" id="findPop find form" >
					<div class="findPop find" id="findPop find form" >
							
						<h3 id="Maintitle">4자리의 인증번호를 입력하세요.</h3>
	 				
						<div class="findPop" id="findPop IDfind">
				
								<form method="post"  class="" name="f" action="certification.do" onsubmit="sendIt(f);">
									<table summary="인증번호를 입력할 수 있습니다.">
										<caption>인증번호 입력폼</caption>
										<colgroup>
											<col width="100px">
											<col width="*">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="name">인증번호</label></th>
												<td>
													<div class="formbox">
														<% String cerOk = (String)session.getAttribute("rndPass"); %>
														<input type="hidden" id="cerOk" name="cerOk" value="<%=cerOk %>" />
														<input maxlength="4" type="text" id="rndPass" class="text" name="rndPass" />
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="btnWrap">
										<button type="submit" class="btn btn-success" style="width:70px;">확인</button>
										<button type="button" onclick="location.href='accountfind.do';" class="btn btn-danger" style="width:70px;">취소</button>
									</div>
								</form>
	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="../general/simpleFooter.jsp"%>

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