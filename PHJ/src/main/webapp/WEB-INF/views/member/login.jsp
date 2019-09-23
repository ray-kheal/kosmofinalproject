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
	
	.back {
		height: 98%;
		border: 3px solid blue;
	}
	
	.account-box {
		left: 100%;
		margin: auto;
		diso
	}
	
	#saveId {
		z-index: 100;
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
	
	#account-box {
		margin-top:50px;
		margin-left: auto;
		margin-right: auto;
	}
	
	.form-group {
		width:400px;
	}
</style>
<script type="text/javascript">
	var googleUser = {};
	
	//로그인창 띄움
	var loginWithGoogle = function() {
		gapi.load('auth2', function(){
			auth2 = gapi.auth2.init({
				client_id: '708132528526-dseogiod9l6sutittpbtp0oq4bu3c1em.apps.googleusercontent.com',
				cookiepolicy: 'single_host_origin',
			});
		attachSignin(document.getElementById('loginButton'));
		});
	};
	
	//사용자 정보 얻기
	function attachSignin(element) {
		auth2.attachClickHandler(element, {}, function(googleUser) {
			alert(JSON.stringify(googleUser));//google api에 저장된 사용자 정보를 json으로 출력
			console.log(googleUser.getBasicProfile().getId());
			console.log(googleUser.getBasicProfile().getName());
			console.log(googleUser.getBasicProfile().getEmail());
			
			var access_token = googleUser.getAuthResponse().access_token;
			console.log(access_token);
			
			location.href="googlelogin.do?email="+googleUser.getBasicProfile().getEmail()+"&pass="+access_token+"&name="+googleUser.getBasicProfile().getName();
		}, function(error) {
			  alert(JSON.stringify(error, undefined, 2)); //로그인 에러
			});
		}
</script>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('fbc37d1de83e19f124176d0578a0cf59');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
		success: function(authObj) {
			Kakao.API.request({
				url: '/v1/user/me',
				success:function(res){
					alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
					alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
					console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
					console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
					console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근. res.properties.nickname으로도 접근 가능 )
					console.log(authObj.access_token);
					
					location.href="kakaologin.do?email="+res.kaccount_email+"&kakao_id="+res.id+"&name="+res.properties['nickname']; 
				}
			})
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
  //]]>
</script>

<body class="is-preload left-sidebar">
	<div id="page-wrapper">
		<!-- 헤더 -->
		<%@ include file="../general/MainHeader.jsp"%>

		<!-- Main -->

		<div id="content">
			<div class="row" style="margin-top:10px;">
				<div id="account-box">
					<div class="account-box">
						<form class="loginForm" action="loginAction.do">
							<div class="form-group">
								<input type="text" class="form-control" name="email" placeholder="이메일"
									required autofocus />
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="pass" placeholder="암호"
									required />
							</div>
							<div class="idCheck" style="color: white;">
								<input type="checkbox" value="remember-me" /> 아이디를 저장합니다.
							</div>
							<span style="color:red;font-size:1em;">
								${loginError }
							</span>
							<br />
							<button class="btn btn-lg btn-success btn-block" type="submit">
								로그인</button>
						</form>
						<div class="or-box">
							<span class="or" style="text-align: center; color: white;">
								또는 </span>
							<div id="OtherLogin">
								<div class="kakao" style="margin-bottom:15px;">
									<a href="javascript:loginWithKakao();">
										<button type="button" class="btn btn-kakao btn-warning"></button> 
									</a>
								</div>
								<div class="google" style="margin-top:10px;">
									<a href="javascript:loginWithGoogle();"> 
										<button type="button" id="loginButton" class="btn btn-google btn-light"></button>
									</a>
								</div>
							</div>
						</div>
						<div class="or-box row-block">
							<a class="forgotLnk" href="accountfind.do"
								style="color: blue;">로그인이 되지 않으시나요?</a><br /> <span
								style="color: white;">아직 계정이 없으신가요?</span> <a
								href="join1.do"
								class="btn btn-primary btn-block" style="color: white;">회원가입
								하기</a>
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