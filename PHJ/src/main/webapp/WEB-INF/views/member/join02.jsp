<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>편히점 회원가입중...</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<script>
	function choiceInput(f, elem) {
		for (var i = 0; i < elem.length; i++) {
			if (elem.options[i].selected) {
				if (elem.options[elem.selectedIndex].value != "direct_input") {
					f.email2.value = elem.options[elem.selectedIndex].value
				} else {
					f.email2.value = "";
					f.email2.focus();
				}
			}
		}
	}
	function sendIt() {

		if (f.email1.value == "") {
			alert("이메일을 입력해주세요.");
			f.email1.focus();
			return false;
		}

		if (f.email2.value == "") {
			alert("이메일을 입력해주세요.");
			f.email.focus();
			return false;
		}

		for (var i = 0; i < f.email1.value.length; i++) {
			chm = f.email1.value.charAt(i)
			if (!(chm >= '0' && chm <= '9') && !(chm >= 'a' && chm <= 'z')
					&& !(chm >= 'A' && chm <= 'Z')) {
				alert("이메일은 영문 대소문자, 숫자만 입력가능합니다.")
				document.f.email1.focus();
				document.f.email1.select();
				return false;
			}
		}

		//닉네임 길이 체크 (4~12자)
		if (f.name.value.length<2 || f.name.value.length>8) {
			alert("닉네임을 2~8자까지 입력해주세요.")
			document.f.name.focus();
			document.f.name.select();
			return false;
		}
		//비밀번호 입력여부 체크
		if (f.pass1.value == "") {
			alert("비밀번호를 입력하지 않았습니다.")
			document.f.pass1.focus();
			return false;
		}
		//비밀번호 길이 체크(4~12자 까지 허용)
		if (f.pass1.value.length<4 || f.pass1.value.length>12) {
			alert("비밀번호를 4~12자까지 입력해주세요.")
			document.f.pass1.focus();
			document.f.pass1.select();
			return false;
		}
		//비밀번호와 비밀번호 확인 일치여부 체크
		if (f.pass1.value != f.pass2.value) {
			alert("비밀번호가 일치하지 않습니다")
			document.f.user_pw2.value = ""
			document.f.user_pw2.focus();
			return false;
		}

		if (f.mobile1.value == "") {
			alert("핸드폰번호를 입력해주세요.")
			document.f.mobile1.focus();
		}
		if (f.mobile2.value == "") {
			alert("핸드폰번호를 입력해주세요.")
			document.f.mobile2.focus();
		}
		if (f.mobile3.value == "") {
			alert("핸드폰번호를 입력해주세요.")
			document.f.mobile3.focus();
		}
		for (var i = 0; i < f.mobile1.value.length; i++) {
			chm = f.mobile1.value.charAt(i)
			if (!(chm >= '0' && chm <= '9')) {
				alert("핸드폰 번호는 숫자만 입력가능합니다.")
				document.f.mobile1.focus();
				document.f.mobile1.select();
				return false;
			}
		}
		for (var i = 0; i < f.mobile2.value.length; i++) {
			chm = f.mobile2.value.charAt(i)
			if (!(chm >= '0' && chm <= '9')) {
				alert("핸드폰 번호는 숫자만 입력가능합니다.")
				document.f.mobile2.focus();
				document.f.mobile2.select();
				return false;
			}
		}
		for (var i = 0; i < f.mobile3.value.length; i++) {
			chm = f.mobile3.value.charAt(i)
			if (!(chm >= '0' && chm <= '9')) {
				alert("핸드폰 번호는 숫자만 입력가능합니다.")
				document.f.mobile3.focus();
				document.f.mobile3.select();
				return false;
			}
		}
	}
	function nochk() {
		alert("메인으로 돌아갑니다.");
		location.href = "http://localhost:8080/phj/";
	}
</script>
<style type="text/css">
body {
	font-family: 'Mali', cursive;
}

.Terms {
	font-size: x-small;
}

#content {
	margin: 0 auto;
	text-align: center;
	background-repeat: no-repeat;
	background-position: 50% 50%;
	background-attachment: fixed;
	background-size: cover;
}
label {
	font-size: 15px;
}
</style>
<body>

<div id="page-wrapper">
	<!-- 헤더 인클루드 -->
	<%@ include file="../general/MainHeader.jsp"%>

	
	<div id="main-wrapper">
		<div class="container" id="wrap">
			<div id="content">
				<h3>편히점 회원가입</h3>
				<form action="대충 가입완료됬다는 말" method="post" onsubmit="return sendIt();" class="form" name="f">
						
						<h4>가입정보</h4>
						<br /> <br /> <br />
						<div class="row" style="margin-left: 220px;">

							<input type="text" name="email1" value=""
								class="form-control input-lg" placeholder="이메일(아이디)"
								style="width: 150px;" /> <span style="font-size: 25px; padding-top: 3px">@&nbsp;</span> 
								<input type="text" class="form-control input-lg" name="email3" id="" style="width: 150px; padding-right: 30px;" />

							<!--  <div class="col-xs-6 col-md-6">  -->
							<!-- <input type="text" name="lastname" value="" class="form-control input-lg" placeholder="도메인"  />  -->
							<select name="email2" onchange="choiceInput(this.form, this)"
								style="padding-top: 3px; width: 150px;"
								class="form-control input-lg">
								<option selected="" value="">선택해주세요</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="google.com">google.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="">직접 입력</option>
							</select> <br />
						</div>
						<label style="font-size: 10px;"> <input type="radio" name="email" value="" id="email_alert" />
							메일 수신동의
						</label> 
						<label style="font-size: 10px;"> <input type="radio" name="email" value="" id="email_Noalert" />
							메일 수신거부
						</label>
						<span class="help-block" style="font-size: 10px;">
							메일 수신동의를 체크하시면 행사 및 공지사항을 메일로 보내드립니다. 
						</span> 
						<br /> 
						<input type="password" style="width: 400px; margin-left: 260px;" name="pass" value="" class="form-control input-lg" placeholder="비밀번호" />
						<br /> 
						<input type="password" style="width: 400px; margin-left: 260px;" name="confirm_password" value="" class="form-control input-lg" placeholder="비밀번호 확인" />
						<br /> 
						<input type="text" style="width: 400px; margin-left: 260px;" name="name" value="" class="form-control input-lg" placeholder="닉네임" /> 
						<br /> 
						<label style="font-size: 10px;">
							전화번호
						</label>
						<br /> <br /> <br />
						<div class="row"
							style="font-size: 1.5em; text-align: center; margin-left: 250px;">
							<input type="text" name="mobile1" class="form-control input-lg" style="width: 120px;" />
								<span style="height: 45px;">ㅡ</span> &nbsp;&nbsp; 
							<input type="text" name="mobile2" class="form-control input-lg" style="width: 120px;" />
								<span style="height: 45px;">ㅡ</span> &nbsp;&nbsp; 
							<input type="text" name="mobile3" class="form-control input-lg" style="width: 120px;" />

						</div>
						<span style="font-size: 10px;" class="help-block">휴대폰 메일
							수신동의를 체크하시면 행사 및 공지사항을 SMS로 보내드립니다. </span> <span class="help-block"></span>

						<label style="font-size: 10px;" class="radio-inline"> <input
							type="radio" name="mobile_alert" value="" id="" />SMS수신동의
						</label> <br /> <label style="font-size: 10px;" class="radio-inline">
							<input type="radio" name="mobile_Noalert" value="" id="" />SMS수신거부
						</label> <br /> <br />
						<button class="btn btn-lg btn-primary btn-block signup-btn"
							style="width: 200px; margin-left: 340px;"submit">가입완료하기
						</button>
						<br /> <br />
					
					<button class="btn btn-lg btn-primary btn-block signup-btn"
						style="width: 200px; margin-left: 340px;" nochk();" type="submit">
						돌아가기</button>
					</form>
						
						
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="../general/LoginFooter.jsp"%>
</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>