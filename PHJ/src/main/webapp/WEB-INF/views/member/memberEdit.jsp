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

	$(document).ready( function(){
	    $("#deleteBox").click( function() {
	        if(confirm("관심점포를 제거하시겠습니까?")) {
	        	$("#phj_place").empty();
	        	$("#place_bookmark").val('');
	        	
	        }
	    });
	});

	
		
	
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
<style>
div label input {
	/*  margin-right:100px; */
}

#ck-button {
	margin: 4px;
	border-radius: 4px;
	/*border: 1px solid #D0D0D0;*/
	/*overflow: auto;*/
	float: left;  
}

#ck-button label {
	float: left;
	width: 4.0em;  
} 

#ck-button label span {
	text-align: center;
	padding: 3px 0px;
	display: block;
	border-radius: 4px;
}

#ck-button label input {
	position: absolute;
	top: -20px;
}

#ck-button input:checked+span { 
	background-color: #4f9fc6;
	color: #fff;
}
</style>




<body>

<div id="page-wrapper">
	<!-- 헤더 인클루드 -->    

	<%@ include file="../general/MainHeader.jsp"%>
	<!-- <div id="content"> -->
	<br/><br/>
		<div class="container">
		<!-- <div class="container" id="wrap"  style="width:100%; height:1000px;"> -->
			
			<form method="post" onsubmit="return sendIt();" class="" name="f">
			<table class="table table-borderless font-goyang">
				
					<colgroup>
						<col width="20%"/>
						<col width="*"/> 

					</colgroup>
					<tr>
						<td colspan='2' style="font-size:24px; text-align: center; border-bottom: 6px solid #343a40">회원정보 수정</td>
						
					</tr>
					<tr>
						<td  colspan='2' bgcolor="white"  style="font-size:18px; text-align: center;"><i class="fas fa-user-edit"></i> &nbsp;수정정보</td>
						
					</tr>
					<!-- <tr>
						<td colspan='4'></td>    
					</tr> -->
					<tr>
						<td bgcolor="#f7f4f4" style="text-align: center; " bgcolor="white">이메일</td>
						<td bgcolor="white">
							<div class="form-inline"  >
								<input type="text" name="email" id="email" value="${dto.email }"
								class="form-control" style="width:50%" readonly placeholder="이메일(아이디)"/>
								<select name="email_choice" onChange="choiceInput(this.form, this);"
									class="custom-select" style="width:30%" readonly>  
									<option disabled="disabled" selected value="">*변경불가</option>
								</select> 
							</div>
							<%-- <div class="custom-control custom-radio custom-control-inline ">
								<input type="radio" class="" id="emailY" name="email_alert" value="Y" ${emailY } />
								<label class="" for="emailY">메일 수신동의</label>
						  	</div>
						  	<div class="custom-control custom-radio custom-control-inline" >
						  		<input type="radio" class="" id="emailN" name="email_alert" value="N" ${emailN }  />
						  		<label class="" for="emailN">메일 수신거부</label>
						  	</div> --%>
						  	 
													  	 
							<div>
								<span style="text-align: left;">
								
								※메일 수신동의를 체크하시면 행사 및 공지사항을 메일로 보내드립니다.
								</span>
								
							</div>
						  	 <div style="text-align: center;">
							  	 <div id="ck-button" style=" height: 31px; width: 70px;">
									<label> 
									<input type="radio" name="email_alert" id="emailY" value="Y" ${emailY }>
										<span style="font-size: 0.6em; width:75px; border: 1px solid #D0D0D0;">메일수신동의</span>
									</label>
								
								</div>
								
								<div id="ck-button"  style=" height: 31px; width: 70px;">
									<label> 
									<input type="radio" name="email_alert" id="emailN" value="N" ${emailN } >
										<span style="font-size: 0.6em; width:75px; border: 1px solid #D0D0D0;">메일수신거부</span>
									</label>
							
								</div>
							</div>	
								 
								
							<%-- <div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="" id="emailY" name="email_alert" value="Y" ${emailY }
									style="margin:3px 3px 0px 5px; "/>
								<label class="" for="emailY">&nbsp;메일 수신동의</label>
						  	</div>     
						  	<div class="custom-control custom-radio custom-control-inline">
						  		<input type="radio" class="" id="emailN" name="email_alert" value="N" ${emailN }
						  			style="margin:3px 3px 0px 5px; "/>
						  		<label class="" for="emailN">&nbsp;메일 수신거부</label>
						  	</div>  --%>
							<br /> 
						</td>			
						 
					</tr> 
					 
					<tr>
						<td bgcolor="#f7f4f4" style="text-align: center; ">비밀번호</td>
						<td bgcolor="white"><input type="password" style="width: 50%; font-family: verdana; " id="pass1" name="pass" value="${dto.pass }" 
						 class="form-control input-lg" placeholder="비밀번호" bgcolor="white" 
						 	onblur="if(value=='${dto.pass}'"  onfocus="if(value=='${dto.pass }') value = ''" /></td>
						
					</tr>
					<tr>
						<td bgcolor="#f7f4f4"  style="text-align: center; ">비밀번호확인</td>
						<td bgcolor="white"><input type="password" style="width: 50%; font-family: verdana; background-color: white;" id="pass2" name="confirm_password" value=""  
						class="form-control input-lg" placeholder="비밀번호 확인" /></td>
						 
					</tr>  
					<tr>
						<td bgcolor="#f7f4f4"  style="text-align: center; ">이름</td>
						<td bgcolor="white"><input type="text" style="width: 50%;" name="name" value="${dto.name }" class="form-control input-lg" placeholder="닉네임" /> </td>
						 
					</tr>
					
					<tr>
						<td bgcolor="#f7f4f4"  style="text-align: center; ">휴대전화</td>
						<td bgcolor="white">
							<div class="form-inline">
								<input type="text" name="mobile1" class="form-control input-lg" style="width:25%" value="${mobile1 }"/>&nbsp;-&nbsp; 
								<input type="text" name="mobile2" class="form-control input-lg" style="width:25%" value="${mobile2 }"/>&nbsp;-&nbsp; 	
								<input type="text" name="mobile3" class="form-control input-lg" style="width:25%" value="${mobile3 }"/>&nbsp;
							</div>
							
							<%--  <div class="custom-control custom-radio custom-control-inline">	
								<input type="radio" name="mobile_alert" class="custom-control-input" value="Y" id="mobileY" ${mobileY }/>
								<label class="custom-control-label" for="SMSY">SMS 수신동의</label>
							</div> 
							<div class="custom-control custom-radio custom-control-inline">	
								<input type="radio"  class="" id="mobileY" name="mobile_alert" value="Y"  ${mobileY }
									style="margin:3px 3px 0px 5px; "/>
								<label class="" for="SMSY">&nbsp;SMS 수신동의</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">	
								<input type="radio" name="mobile_alert" class="custom-control-input" value="N" id="mobileN" ${mobileN }/>
								<label class="custom-control-label" for="SMSN">SMS 수신거부</label>
							</div>  --%>
							 <%-- <div class="custom-control custom-radio custom-control-inline">	
								<input type="radio" name="mobile_alert" class="" value="Y" id="mobileY" ${mobileY }/>
								<label class="" for="SMSY">SMS 수신동의</label>
							</div> 
							<div class="custom-control custom-radio custom-control-inline">	
								<input type="radio" name="mobile_alert" class="" value="N" id="mobileN" ${mobileN }/>
								<label class="" for="SMSN">SMS 수신거부</label>
							</div>  --%>
							<%-- 	<input type="radio" class=""  name="mobile_alert" value="N"  ${mobileN }
									style="margin:3px 3px 0px 5px; "/> 
								<label class="" for="SMSN">&nbsp;SMS 수신거부</label> 
								 --%>
							

							
							<div>
								<span style="text-align: left;">
								
								※SMS 수신동의를 체크하시면 행사 및 공지사항을 SMS로 보내드립니다.
								</span>
								
							</div>
							<div style="text-align: center;">
							  	 <div id="ck-button" style=" height: 31px; width: 70px;">
									<label> 
									<input type="radio" name="mobile_alert" id="mobileY" value="Y" ${mobileY }>
										<span style="font-size: 0.6em; width:80px; border: 1px solid #D0D0D0;">SMS 수신동의</span>
									</label>
								
								</div>
								
								<div id="ck-button"  style=" height: 31px; width: 70px;">
									<label> 
									<input type="radio" name="mobile_alert" id="mobileN" value="N"  ${mobileN } >
										<span  style="font-size: 0.6em; width:80px; border: 1px solid #D0D0D0;">SMS 수신거부</span>
									</label>
							
								</div>
							</div>	

						</td>
						  
					</tr>
					<tr>
						<td bgcolor="#f7f4f4"  style="text-align: center; border-bottom: 6px solid #343a40;">관심점포</td>
						<input type="hidden" name="place_bookmark" id ="place_bookmark" value="${dto.place_bookmark }"/>
						<td bgcolor="white" id="phj_place"  style="border-bottom: 6px solid #343a40;">${place_bookmark} &nbsp; <img type="button" id="deleteBox" src="images/Eraser.jpg" style="text-align:center; width:20px; height:20px;"  /></td>
					</tr>																			
			</table>
			<br /><br />
			<div class="form-inline">
				<button type="submit" class="btn btn-lg btn-dark font-goyang"  style="width:25%; margin-left:20%;margin-right:5%; ">
							수정완료
						</button>
				<button type="button" class="btn btn-lg font-goyang"
						  		style="width:25%;margin-right:20%;  margin-left:5%; color:white; background-color:#5ea8ed;" onclick="location.href='../phj'">
						  		돌아가기
						</button>
			</div>
			</form>	
		</div>
<!-- 	</div> -->
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