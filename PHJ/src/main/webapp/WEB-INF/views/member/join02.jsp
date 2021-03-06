<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>편히점 회원가입</title>
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
<style type="text/css">
@font-face { 
   font-family: 'Goyang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Goyang.woff') format('woff'); 
   font-weight: normal; font-style: normal;
}
.font-goyang {
   font-family: 'Goyang', cursive;
}
</style>
<script type = "text/javascript">


	function sendIt() {

		if (f.email1.value == "") {
			alert("이메일을 입력해주세요.");
			f.email1.focus();
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
		
		//아이디 중복확인을 마쳐야 회원가입을 할수있다.
		if (f.chkEmail.value == "0") {
			alert("아이디 중복확인을 해주세요.")
			return false;
		}
		
		f.action ="./regist.do";
		


		
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
	
	//패스워드 검증폼
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
	
		
		$("#emailCheck").click(function(){
// 			var idObj = document.registFrm.id;
// 			//아이디 입력후 중복확인
// 			if(idObj.value.length==0) {	
// 				alert('아이디를 기입하신다음 중복확인을 누르세요.') ;
// 				idObj.focus();
// 				return;
// 			}
// 			//아이디가 8~12자 사이가 아니면 false를 반환한다.
// 			if(!(idObj.value.length>=4 && idObj.value.length<=12))
// 			{	
// 				alert('아이디는 4~12자만 설정가능합니다.') ;
// 				return;
// 			}

// 			//아이디의 첫문자는 숫자로 시작할수 없다
// 			//isNumber는 따로 정의함.
// 			if(isNumber(idObj.value.substring(0,1))==true){		
// 				alert('아이디의 첫문자는 숫자로 시작할 수 없습니다..') ;
// 				return;
// 			}	

			
			$.ajax({
				url : "emailOverLap.do", 
				dataType : "json",
				type : "get",
				contentType : 'text/html;charset:utf-8',
				data : {
					email : $("#email1").val()+'@'+$("#email2").val()
				},
				success : function(d){
					if($("#email1").val() == ""){
						$("#overlap_result").html("<span style='color:red'>아이디를 입력해주세요..</span>");	
					}
					else{
					if(d.isMember == 1){
						$("#overlap_result").html("<span style='color:red'>사용 불가능한 아이디입니다.</span>");	
					} else {
						$("#overlap_result").html("<span style='color:blue'>사용 가능한 아이디입니다.</span>");
						$("#chkEmail").val("1");
						$("#email1").attr("readOnly",true);
						$("#email2").attr("readOnly",true);
						
					}
					}
				},
				error : function(errData){
					alert("실패 : "+errData.status+ " : " + errData.statusText);
				} 
				
			});
		});
	});
</script>

<%
//이메일쪼개기
String email = request.getParameter("email") != null ? request.getParameter("email") : " @ ";
String[] emailArr = email.split("@");
if (emailArr[0].equals(" ")){
	emailArr[0] = "";
	emailArr[1] = "";
}

%>


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
	<!-- <div id="content"> -->
	<br /><br />
	<div class="container">
		<!-- <div class="container" id="wrap"  style="width:100%; height:1000px;"> -->
		 
		<form method="post" onsubmit="return sendIt(this);" class="" name="f">
		<input type="hidden" name="kakao_id" value="${dto.kakao_id }"/>
		<input type="hidden" name="google_id" value="${dto.google_id }"/>
		<input type="hidden" id="chkEmail" value="0"/>
				<table class="table table-borderless font-goyang">
					
						<colgroup>
							<col width="20%"/>
							<col width="*"/> 
						</colgroup> 
						<tr>
							<td colspan='2' style="font-size:24px; font-weight: bold; text-align: center; border-bottom: 6px solid #343a40">회원가입</td>
						</tr> 
						<tr>
							<td  colspan='2'  bgcolor="white" style="font-size:18px; text-align: center;"><i class="fas fa-user-edit"></i> &nbsp;가입정보를 입력해주세요</td>
							
						</tr>
						<!-- <tr>
							<td colspan='4'></td>    
						</tr> --> 
						<tr valign="middle">
							<td bgcolor="#f7f4f4"  style="text-align: center; ">이메일</td>
							<td  bgcolor="white" >
								<div class="form-inline" >
									<input type="text" name="email1" id="email1" value="<%=emailArr[0] %>"
									class="form-control" style="width:30%"  placeholder="이메일(아이디)" />@
								
									<input type="text" id="email2" name="email2" value="<%=emailArr[1] %>" 
									 class="form-control input-lg" style="width:25%"  />							
									<select name="email_choice" onChange="choiceInput(this.form, this);"
										class="custom-select" style="width:15%" >  
										<option selected value="">선택</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">google.com</option>
										<option value="yahoo.co.kr">yahoo.co.kr</option>
										<option value="direct_input">직접 입력</option>
									</select>&nbsp; 
									<button type="button" class="btn btn-secondary input-sm"
										style="width:15%; vartical-align:middle" id="emailCheck">중복체크</button>
								</div>
								<span id="overlap_result"></span>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" class="custom-control-input" id="emailY" name="email_alert" value="Y"/>
									<label class="custom-control-label" for="emailY">메일 수신동의</label>
							  	</div>
							  	<div class="custom-control custom-radio custom-control-inline">
							  		<input type="radio" class="custom-control-input" id="emailN" name="email_alert" value="N"/>
							  		<label class="custom-control-label" for="emailN">메일 수신거부</label>
							  	</div>  
								<br />
								※ 메일 수신동의를 체크하시면 행사 및 공지사항을 메일로 보내드립니다.   
							</td>
						 
						<tr  valign="middle">
							<td bgcolor="#f7f4f4" style="text-align: center; ">비밀번호</td>
							<td bgcolor="white"><input type="password" style="font-family:verdana; width: 50%;" id="pass1" name="pass" value=""  class="form-control input-lg" placeholder="비밀번호" /></td>
							
						</tr>
						<tr  valign="middle">
							<td bgcolor="#f7f4f4"  style="text-align: center; ">비밀번호확인</td>

							<td bgcolor="white">
								<input type="password" style="font-family:verdana; width: 50%;" id="pass2" name="confirm_password" value=""  class="form-control input-lg" placeholder="비밀번호 확인" />
								<font name="checkPass" size="2" color="red"></font>
							</td>
							<td>
						</td>

						</tr>  
						<tr valign="middle">
							<td bgcolor="#f7f4f4" valign="middle"  style="text-align: center; ">이름</td>
							<td bgcolor="white"><input type="text" style="width: 50%;" name="name" value="${dto.name}" class="form-control input-lg" placeholder="닉네임" /> </td>
							 
						</tr>
						
						<tr valign="middle">
							<td bgcolor="#f7f4f4"  style="text-align: center; border-bottom: 6px solid #343a40;">휴대전화</td>
							<td style="border-bottom: 6px solid #343a40;" bgcolor="white">
								<div class="form-inline">
									<input type="text" name="mobile1" class="form-control input-lg" style="width:25%"/>&nbsp;-&nbsp; 
									<input type="text" name="mobile2" class="form-control input-lg" style="width:25%"/>&nbsp;-&nbsp; 	
									<input type="text" name="mobile3" class="form-control input-lg" style="width:25%"/>&nbsp;
								</div>
								<div class="custom-control custom-radio custom-control-inline">	
									<input type="radio" name="mobile_alert" class="custom-control-input" value="Y" id="SMSY" />
									<label class="custom-control-label" for="SMSY">모바일 알림 ON</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">	
									<input type="radio" name="mobile_alert" class="custom-control-input" value="N" id="SMSN" />
									<label class="custom-control-label" for="SMSN">모바일 알림 OFF</label>
								</div>
								
								<br />※ SMS 수신동의를 체크하시면 행사 및 공지사항을 SMS로 보내드립니다.
							</td>
							  
						</tr>
						<!-- <tr>
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
						</tr>			 -->	
					</table>
						<br /><br />
				<!-- 	<div class="form-inline">
						<button type="submit" class="btn btn-lg btn-dark"  style="width:25%; margin-left:20%;margin-right:5%; border-radius: 20px; ">
							가입완료
						</button>
						&nbsp;&nbsp;가입완료&nbsp;<i class="fas fa-child" style="color:white;"></i>&nbsp;&nbsp;
						<button type="button" class="btn btn-lg btn-primary signup-btn"
						  		style="width:25%;margin-right:20%;margin-left:5%;" onclick="location.href='../phj'">돌아가기
						</button>
			   
						<button type="button" class="btn btn-lg "
						  		style="width:25%;margin-right:20%; border-radius: 20px; margin-left:5%; color:white; background-color:#5ea8ed;" onclick="location.href='../phj'">돌아가기
						</button> 
					</div> -->
					
					<div class="form-inline ">
						<button type="submit" class="btn btn-lg btn-dark font-goyang"  style="width:25%; margin-left:20%;margin-right:5%; ">
							가입완료
						</button>
						<!-- &nbsp;&nbsp;가입완료&nbsp;<i class="fas fa-child" style="color:white;"></i>&nbsp;&nbsp; -->
						<!-- <button type="button" class="btn btn-lg btn-primary signup-btn"
						  		style="width:25%;margin-right:20%;margin-left:5%;" onclick="location.href='../phj'">돌아가기
						</button> -->
			   
						<button type="button" class="btn btn-lg font-goyang"
						  		style="width:25%;margin-right:20%;  margin-left:5%; color:white; background-color:#5ea8ed;" onclick="location.href='../phj'">돌아가기
						</button> 
					</div>
					
			</form>	 

		
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