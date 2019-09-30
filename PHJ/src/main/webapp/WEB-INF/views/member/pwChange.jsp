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
	function sendIt() {
		//비밀번호 입력여부 체크
		if (f.pass1.value == "") {
			alert("비밀번호를 입력하지 않았습니다.")
			document.f.pass1.focus();
			return;
		}
		//비밀번호 길이 체크(4~12자 까지 허용)
		if (f.pass1.value.length<4 || f.pass1.value.length>12) {
			alert("비밀번호를 4~12자까지 입력해주세요.")
			document.f.pass1.focus();
			document.f.pass1.select();
			return;
		}
		//비밀번호확인 공백체크
		if (f.pass2.value == "") {
			alert("비밀번호를 입력해주세요.")
			document.f.pass2.focus();
			document.f.pass2.select();
			return;
		}
		//비밀번호와 비밀번호 확인 일치여부 체크
		if (f.pass1.value != f.pass2.value) {
			alert("비밀번호가 일치하지 않습니다")
			document.f.user_pw2.value = ""
			document.f.user_pw2.focus();
			return;
		}
		else {
			alert("비밀번호가 변경되었습니다.");
		}
	}

	$(function(){
		$('#pass1').keyup(function(){
			$('font[name=checkPass]').text('');
		});
		
		$('#pass2').keyup(function(){
			if($('#pass1').val()!=$('#pass2').val()){
				$('font[name=checkPass]').text('');
				$('font[name=checkPass]').html("패스워드를 확인해주세요.");
				$('font[name=checkPass]').css('color','red');
			}else{
				$('font[name=checkPass]').text('');
				$('font[name=checkPass]').html("패스워드가 일치합니다.");
				$('font[name=checkPass]').css('color','green');
			}
		});
	});
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
							
						<h3 id="Maintitle">비밀번호를 변경합니다.</h3>
	 				
						<div class="findPop" id="findPop IDfind">
				
								<form method="post"  class="" name="f" action="changePass.do" onsubmit="sendIt();">
									<table summary="인증번호를 입력할 수 있습니다.">
										<caption>비밀번호 변경 입력폼</caption>
										<colgroup>
											<col width="100px">
											<col width="*">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="name">변경할<br /> 비밀번호</label></th>
												<td>
													<div class="formbox">
														<%
														String pass = request.getParameter("pass");
														String email = request.getParameter("email");
														String mobile = request.getParameter("mobile");
														%>
														<input type="hidden" id="email" name="email" value="<%=email %>" style="visibility:hidden;" />
														<input type="hidden" id="mobile" name="mobile" value="<%=mobile %>" style="visibility:hidden;" />
														<input type="password" id="pass1" class="text" name="pass" value="<%=pass %>" onblur="if(value=='') value = '<%=pass %>'" 
														    onfocus="if(value=='<%=pass %>') value = ''" required autofocus>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="name">비밀번호<br /> 확인</label></th>
												<td>
													<div class="formbox">
														<input type="password" id="pass2" class="text" name="pass2" value="">
														<font name="checkPass" size="2" color="red"></font>
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