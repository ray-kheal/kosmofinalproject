<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>편히점 회원정보수정</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/join02.css" /> 
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower|Mali&display=swap" rel="stylesheet">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<script type = "text/javascript">


	function sendIt() {

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
		//비밀번호확인 공백체크
		if (f.pass2.value == "") {
			alert("비밀번호를 입력해주세요.")
			document.f.pass2.focus();
			document.f.pass2.select();
			return false;
		}
		//비밀번호와 비밀번호 확인 일치여부 체크
		if (f.pass1.value != f.pass2.value) {
			alert("비밀번호가 일치하지 않습니다")
			document.f.user_pw2.value = ""
			document.f.user_pw2.focus();
			return false;
		}

		if (f.mobile1.value == "" || f.mobile2.value == "" || f.mobile3.value == "") {
			alert("휴대전화번호를 입력해주세요.")
			document.f.mobile1.focus(); 
			return false;
		
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
		
		alert("수정완료");
		
		f.action ="./modify.do";
		


		
	}

	function choiceInput(frm, elem) {
		for (var i = 0; i < elem.length; i++) {
			if (elem.options[i].selected) {
				if (elem.options[elem.selectedIndex].value!="direct_input") {
					frm.email2.value = elem.options[elem.selectedIndex].value
				} else {
					frm.email2.value="";
					frm.email2.focus();
				}
			}
		}
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
	<div id="content">
		<div class="container" id="wrap"  style="width:100%; height:1000px;">
			
			<form method="post" onsubmit="return sendIt();" class="" name="f">
			<table  style="width:100%;">
				
					<colgroup>
						<col width="20%"/>
						<col width="*"/> 

					</colgroup>
					<tr>
						<td colspan='2' style="font-size:24px;">회원정보 수정</td>
						
					</tr>
					<tr>
						<td  colspan='2' style="font-size:18px;">수정정보</td>
						
					</tr>
					<tr>
						<td colspan='4'></td>    
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<div class="form-inline" >
								<input type="text" name="email" id="email" value="${dto.email }"
								class="form-control" style="width:50%" readonly placeholder="이메일(아이디)"/>
								<select name="email_choice" onChange="choiceInput(this.form, this);"
									class="custom-select" style="width:30%" readonly>  
									<option disabled="disabled" selected value="">*변경불가</option>
								</select> 
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" id="emailY" name="email_alert" value="Y" ${emailY }/>
								<label class="custom-control-label" for="emailY">메일 수신동의</label>
						  	</div>
						  	<div class="custom-control custom-radio custom-control-inline">
						  		<input type="radio" class="custom-control-input" id="emailN" name="email_alert" value="N" ${emailN }/>
						  		<label class="custom-control-label" for="emailN">메일 수신거부</label>
						  	</div>
							<br />
							※메일 수신동의를 체크하시면 행사 및 공지사항을 메일로 보내드립니다.
						</td>			
					</tr> 
					 
					<tr>
						<td>비밀번호</td>
						<td><input type="password" style="width: 50%;" id="pass1" name="pass" value="${dto.pass }"  class="form-control input-lg" placeholder="비밀번호" /></td>
						
					</tr>
					<tr>
						<td>비밀번호확인</td>
						<td><input type="password" style="width: 50%;" id="pass2" name="confirm_password" value="${dto.pass }"  class="form-control input-lg" placeholder="비밀번호 확인" /></td>
						
					</tr>  
					<tr>
						<td>이름</td>
						<td><input type="text" style="width: 50%;" name="name" value="${dto.name }" class="form-control input-lg" placeholder="닉네임" /> </td>
						 
					</tr>
					
					<tr>
						<td>휴대전화</td>
						<td>
							<div class="form-inline">
								<input type="text" name="mobile1" class="form-control input-lg" style="width:25%" value="${mobile1 }"/>&nbsp;-&nbsp; 
								<input type="text" name="mobile2" class="form-control input-lg" style="width:25%" value="${mobile2 }"/>&nbsp;-&nbsp; 	
								<input type="text" name="mobile3" class="form-control input-lg" style="width:25%" value="${mobile3 }"/>&nbsp;
							</div>
							<div class="custom-control custom-radio custom-control-inline">	
								<input type="radio" name="mobile_alert" class="custom-control-input" value="Y" id="mobileY" ${mobileY }/>
								<label class="custom-control-label" for="SMSY">SMS 수신동의</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">	
								<input type="radio" name="mobile_alert" class="custom-control-input" value="N" id="mobileN" ${mobileN }/>
								<label class="custom-control-label" for="SMSN">SMS 수신거부</label>
							</div>
							
							<br />※SMS 수신동의를 체크하시면 행사 및 공지사항을 SMS로 보내드립니다.
						</td>
						  
					</tr>
					<tr>
						<td colspan='2'>
							
					</tr>
					<tr>
						<td></td>
						<td></td>
						
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>				
			</table>
			<div class="form-inline">
				<button type="submit" class="btn btn-lg btn-primary  signup-btn"
					style="width:25%; margin-left:20%;margin-right:5%;">수정완료
				</button>
				<button type="button" class="btn btn-lg btn-primary signup-btn"
				  		style="width:25%;margin-right:20%;margin-left:5%;" onclick="location.href='../phj'">돌아가기
				</button>
			</div>
			</form>	
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="../general/simpleFooter.jsp"%>
</div>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>