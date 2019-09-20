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
<script src="assets/accountfind/js/placeholders.min.js"></script>
<script src="assets/accountfind/js/showCont.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://apis.google.com/js/api:client.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<style type="text/css">
	body {
		font-family: 'Mali', cursive;
		font-family: 'Gamja Flower', cursive
	}
	* {
		margin: 0px;
		padding: 0px;
	}
	
	#content {
		background-image: url("images/bgimg.jpg");
		margin: 0 auto;
		text-align: center;
		background-repeat: no-repeat;
		background-position: 50% 50%;
		background-attachment: fixed;
		background-size: cover;
		height: 700px;
	}
</style>
<script type="text/javascript">

function find_check(num){
	if(num=='1'){
		document.getElementById("findPop PWfind").style.display="none";
		document.getElementById("findPop IDfind").style.display="";
		var mb_ID=$("#mbID").val();
		var mbPWPhone1=$("#mbPWPhone1").val();
		var mbPWPhone2=$("#mbPWPhone2").val();
		var mbPWPhone3=$("#mbPWPhone3").val();
	}
	if(num=='2'){
		document.getElementById("findPop IDfind").style.display="none";
		document.getElementById("findPop PWfind").style.display="";
		$("#mbName").val("");
		$("#mbIDPhone1").val("");
		$("#mbIDPhone2").val("");
		$("#mbIDPhone3").val("");
	}
}

function find_PWcheck(){
	document.getElementById("findPop find form").style.display="";
	document.getElementById("findPop IDfind").style.display="none";
	document.getElementById("findPop PWfind").style.display="";
	document.getElementById("findPop IDok").style.display="none";
	$("#radioFindPW").attr("checked", true);
	$("#mbName").val("");
	$("#mbIDPhone1").val("");
	$("#mbIDPhone2").val("");
	$("#mbIDPhone3").val("");

}
function CloseWindow(url,intWidth,intHeight) { 
      window.close('/login/findPop','popup','width=600,height=400,left=0,top=0') ; 
} 
function ID_check(){
	var mb_Name=$("#mbName").val();
	var mbIDPhone1=$("#mbIDPhone1").val();
	var mbIDPhone2=$("#mbIDPhone2").val();
	var mbIDPhone3=$("#mbIDPhone3").val();
	var mb_Phone = mbIDPhone1+"-"+mbIDPhone2+"-"+mbIDPhone3;
		
		//alert(mb_Phone);

		$.get("/login/id_check" ,
			{
				mbName:mb_Name,
				mbPhone:mb_Phone
				
			},

function(result){

	if(mb_Name == ""){
		alert("이름과 휴대폰번호를 입력해주세요.");
		//$("#tmp_check_id").val("0");
		//document.getElementById("tmp_check_id-error").style.display="";
	}			

	else if(result == ""){
		alert("정보를 다시입력해주세요");
		//$("#tmp_check_id").val("0");
		//document.getElementById("tmp_check_id-error").style.display="";
	}
	else if(result != ""){
		//alert(result+"아이디를 찾았습니다.")
		document.getElementById("findPop find form").style.display="none";
		document.getElementById("findPop IDok").style.display="";
		document.getElementById("IDok Nameok").innerHTML = mb_Name;
		document.getElementById("IDok ID").innerHTML = result;
		
	}
});

}
function PW_check(){
		var mb_ID=$("#mbID").val();
		var mbPWPhone1=$("#mbPWPhone1").val();
		var mbPWPhone2=$("#mbPWPhone2").val();
		var mbPWPhone3=$("#mbPWPhone3").val();
		var mb_Phone = mbPWPhone1+"-"+mbPWPhone2+"-"+mbPWPhone3;
		
		//alert(mb_Phone);

		$.get("/login/pw_check" ,
			{
				mbID:mb_ID,
				mbPhone:mb_Phone
				
			},

		function(result){
			

			if(result != ""){
				alert("정보가 틀립니다. 다시 입력해주세요.");
				//$("#tmp_check_id").val("0");
				//document.getElementById("tmp_check_id-error").style.display="";
			}
			else if(result == ""){
				document.getElementById("findPop find form").style.display="none";
				//alert("아이디를 찾았습니다.")
				document.getElementById("findPop PWok").style.display="";
				document.getElementById("PWok PW").innerHTML = mb_Phone;
			}
		});

	}
</script>
<body class="is-preload left-sidebar">
	<div id="page-wrapper">
		<!-- 헤더 -->
		<%@ include file="../general/MainHeader.jsp"%>

		<!-- Main -->

		<div id="content">
			<div class="row" style="margin-top:10px;">
				<div class="findPop find" id="findPop find form" >
					<h3>아이디/비밀번호 찾기</h3>
	
					<div class="findTop clear_g">
						<label for="radioFindID"><input type="radio" name="radio_find2" id="radioFindID" checked="checked" onclick="find_check(1)" /> 아이디</label>
						<label for="radioFindPW"><input type="radio" name="radio_find2" id="radioFindPW" onclick="find_check(2)"/> 비밀번호</label>
					</div>
				<div class="findPop" id="findPop IDfind">
					<table summary="아이디, 비밀번호를 입력할 수 있습니다.">
						<caption>아이디, 비밀번호 입력폼</caption>
						<colgroup>
							<col width="91px">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="name">이름</label></th>
								<td>
									<div class="formbox"><input maxlength="40" type="text" id="mbName" class="text" name="name"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="hp_no_ins01">휴대폰</label></th>
								<td>
									<div class="formbox">
										<input type="text" title="휴대폰 앞 번호" value="" name="hp_no_ins" id="mbIDPhone1" maxlength="3" class="text hp"><span class="dash"></span>
										<input type="text" title="휴대폰 중간 번호" value="" name="hp_no_ins" id="mbIDPhone2" maxlength="4" class="text hp"><span class="dash"></span>
										<input type="text" title="휴대폰 끝 번호" value="" name="hp_no_ins" id="mbIDPhone3" maxlength="4" class="text hp">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btnWrap">
						<a href="javascript:CloseWindow();"><img src="/images/member/btn_cancel.gif" alt="취소" /></a>
						<a href="javascript:ID_check();"><img src="/images/member/btn_ok.gif" alt="확인" /></a>
					</div>
				</div>
	
				<div class="findPop" id="findPop PWfind">
					<table summary="아이디, 비밀번호를 입력할 수 있습니다.">
						<caption>아이디, 비밀번호 입력폼</caption>
						<colgroup>
							<col width="91px">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="name">아이디</label></th>
								<td>
									<div class="formbox"><input maxlength="40" type="text" id="mbID" class="text" name="name"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="hp_no_ins01">휴대폰</label></th>
								<td>
									<div class="formbox">
										<input type="text" title="휴대폰 앞 번호" value="" name="hp_no_ins" id="mbPWPhone1" maxlength="3" class="text hp"><span class="dash"></span>
										<input type="text" title="휴대폰 중간 번호" value="" name="hp_no_ins" id="mbPWPhone2" maxlength="4" class="text hp"><span class="dash"></span>
										<input type="text" title="휴대폰 끝 번호" value="" name="hp_no_ins" id="mbPWPhone3" maxlength="4" class="text hp">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btnWrap">
						<a href="javascript:CloseWindow();"><img src="/images/member/btn_cancel.gif" alt="취소" /></a>
						<a href="javascript:PW_check();"><img src="/images/member/btn_ok.gif" alt="확인" /></a>
					</div>
				</div>
			</div>
	
		<div class="findPop" id="findPop PWok" style="display:none">
			<h3>아이디/비밀번호 찾기</h3>
			<div class="findTop clear_g">
				<ul>
					<li>입력하신 휴대폰으로 <span>임시비밀번호</span>를 발급해드렸습니다.</li>
					<li>로그인 후 회원정보에서 <span>비밀번호를 변경</span>해 주시기 바랍니다.</li>
				</ul>
			</div>
			
			<div class="resultBox">
				휴대폰 번호 : <span id="PWok PW"></span>
			</div>
	
			<div class="btnWrap">
				<a href="javascript:CloseWindow();"><img src="/images/member/btn_ok.gif" alt="확인" /></a>
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
				<a href="javascript:CloseWindow();"><img src="/images/member/btn_ok.gif" alt="확인" /></a>
				<a href="javascript:find_PWcheck();"><img src="/images/member/btn_findPW.gif" alt="비밀번호찾기" /></a>
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