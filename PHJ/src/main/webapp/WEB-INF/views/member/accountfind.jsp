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

<c:if test="${'ERROR' ne resultEmail and not empty resultEmail}">
	<script>
		alert('${name}님의 이메일은 ${resultEmail} 입니다.');
		location.href="login.do";
	</script>
</c:if> 
<c:if test="${'ERROR' eq resultEmail }">
	<script>
		alert('회원 정보가 없습니다.');
		location.href="accountfind.do";
	</script>
</c:if>
<c:if test="${'ERROR' ne resultPass and not empty resultPass}">
	<script>
		alert('인증번호를 보내드렸습니다.');
		location.href="login.do";
	</script>
</c:if> 
<c:if test="${'ERROR' eq resultPass }">
	<script>
		alert('회원 정보가 없습니다.');
		location.href="accountfind.do";
	</script>
</c:if>
<script type="text/javascript">
function find_check(num){
	if(num=='1'){
		document.getElementById("findPop PWfind").style.display="none";
		document.getElementById("findPop IDfind").style.display="";
		var email=$("#email").val();
		var mobile1=$("#mobile1").val();
		var mobile2=$("#mobile2").val();
		var mobile3=$("#mobile3").val();
	}
	if(num=='2'){
		document.getElementById("findPop IDfind").style.display="none";
		document.getElementById("findPop PWfind").style.display="";
		$("#name").val("");
		$("#mobile1").val("");
		$("#mobile2").val("");
		$("#mobile3").val("");
	}
	
}

function find_PWcheck(){
	document.getElementById("findPop find form").style.display="";
	document.getElementById("findPop IDfind").style.display="none";
	document.getElementById("findPop PWfind").style.display="";
	document.getElementById("findPop IDok").style.display="none";
	$("#radioFindPW").attr("checked", true);
	$("#email").val("");
	$("#mobile1").val("");
	$("#mobile2").val("");
	$("#mobile3").val("");

}

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
						
							<h3 id="Maintitle">아이디/비밀번호 찾기</h3>
		 				
							<div class="findTop clear_g custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" name="radio_find2" id="radioFindID" checked="checked" onclick="find_check(1)" />
								<label for="radioFindID" class="custom-control-label">아이디</label>
							</div>
							<div class="findTop clear_g custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" name="radio_find2" id="radioFindPW" onclick="find_check(2)"/>
								<label for="radioFindPW" class="custom-control-label">비밀번호</label>
							</div>
						<div class="findPop" id="findPop IDfind">

							<form method="post"  class="" name="f" action="emailFindAction.do">
								<table summary="아이디, 비밀번호를 입력할 수 있습니다.">
									<caption>아이디, 비밀번호 입력폼</caption>
									<colgroup>
										<col width="100px">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="name">이름</label></th>
											<td>
												<div class="formbox"><input maxlength="40" type="text" id="name" class="text" name="name"></div>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for="hp_no_ins01">휴대폰</label></th>
											<td>
												<div class="formbox">
													<input type="text" title="휴대폰 앞 번호" value="" name="mobile1" id="mobile1" maxlength="3" class="text hp"><span class="dash"></span>
													<input type="text" title="휴대폰 중간 번호" value="" name="mobile2" id="mobile2" maxlength="4" class="text hp"><span class="dash"></span>
													<input type="text" title="휴대폰 끝 번호" value="" name="mobile3" id="mobile3" maxlength="4" class="text hp">
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="btnWrap">
									<button type="submit" class="btn btn-success" style="width:70px;">확인</button>
									<button type="button" onclick="location.href='login.do';" class="btn btn-danger" style="width:70px;">취소</button>
								</div>
							</form>

						</div>
			
						<div class="findPop" id="findPop PWfind">

							<form action="pwFindAction.do">
								<table summary="아이디, 비밀번호를 입력할 수 있습니다.">
									<caption>아이디, 비밀번호 입력폼</caption>
									<colgroup>
										<col width="91px">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="name">이메일</label></th>
											<td>
												<div class="formbox"><input maxlength="40" type="text" id="email" class="text" name="email"></div>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for="hp_no_ins01">휴대폰</label></th>
											<td>
												<div class="formbox">
													<input type="text" title="휴대폰 앞 번호" value="" name="mobile1" id="mobile1" maxlength="3" class="text hp"><span class="dash"></span>
													<input type="text" title="휴대폰 중간 번호" value="" name="mobile2" id="mobile2" maxlength="4" class="text hp"><span class="dash"></span>
													<input type="text" title="휴대폰 끝 번호" value="" name="mobile3" id="mobile3" maxlength="4" class="text hp">
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="btnWrap">
									<button type="submit" class="btn btn-success"  style="width:70px;">확인</button>
									<button type="button" onclick="location.href='login.do';" class="btn btn-danger" style="width:70px;">취소</button>
								</div>
							</form>

						</div>
					</div>
			
				<div class="findPop" id="findPop PWok" style="display:none">
					<h3 id="Maintitle">아이디/비밀번호 찾기</h3>
					<div class="findTop clear_g">
						<ul>
							<li>입력하신 휴대폰으로 <span>임시 비밀번호</span>를 발급해드렸습니다.</li>
							<li>로그인 후 회원정보에서 <span>비밀번호를 변경</span>해 주시기 바랍니다.</li>
						</ul>
					</div>
					
					<div class="resultBox">
						휴대폰 번호 : <span id="PWok PW"></span>
					</div>
			
					<div class="btnWrap">
						<button type="submit" class="btn btn-success" style="width:70px;">확인</button>
					</div>
				</div>
			
				<div class="findPop" id="findPop IDok"style="display:none">
					<h3>아이디/비밀번호 찾기</h3>
					<div class="findTop clear_g">
						<p><span id="IDok Nameok"></span>님의 아이디입니다.</p>
					</div>
					
					<div class="resultBox" id="IDok ID">
						
					</div>
			
					<div class="btnWrap">
						<button type="button" onclick="location.href='login.do';" class="btn btn-success" style="width:70px;">확인</button>
						<a href="javascript:find_PWcheck();"><button type="button" class="btn btn-warning" style="width:70px;">비밀번호 찾기</button></a>
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