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
/*       background-image: url("images/bgimg.jpg"); */
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
      width:350px;
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
         
         location.href="googlelogin.do?email="+googleUser.getBasicProfile().getEmail()+"&google_id="+googleUser.getBasicProfile().getId()+"&name="+googleUser.getBasicProfile().getName();
      }, function(error) {
           //alert(JSON.stringify(error, undefined, 2)); //로그인 에러
         });
      }
</script>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('7a2905afcebe181b9164d6c16c08474d');
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
<script type="text/javascript">
   $(document).ready(function(){
       var email = getCookie("email");
       $("input[name='email']").val(email); 
        
       if($("input[name='email']").val() != ""){ 
           $("input[name='saveCheck']").attr("checked", true); 
       }
        
       $("input[name='saveCheck']").change(function(){ 
           if($("input[name='saveCheck']").is(":checked")){ 
               var userId = $("input[name='email']").val();
               setCookie("email", email, 7); 
           }else{ 
               deleteCookie("email");
           }
       });
        
       $("input[name='email']").keyup(function(){ 
           if($("input[name='saveCheck']").is(":checked")){ 
               var userId = $("input[name='email']").val();
               setCookie("email", email, 7);
           }
       });
       
       function setCookie(cookieName, value, exdays){
           var exdate = new Date();
           exdate.setDate(exdate.getDate() + exdays);
           var cookieValue = escape(value) + ((exdays==null)?"":";expires="+exdate.toGMTString());
           document.cookie = cookieName + "=" + cookieValue;
       }
        
       function deleteCookie(cookieName){
           var expireDate = new Date();
           expireDate.setDate(expireDate.getDate() - 1);
           document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
       }
        
       function getCookie(cookieName) {
           cookieName = cookieName + '=';
           var cookieData = document.cookie;
           var start = cookieData.indexOf(cookieName);
           var cookieValue = '';
           if(start != -1){
               start += cookieName.length;
               var end = cookieData.indexOf(';', start);
               if(end == -1)end = cookieData.length;
               cookieValue = cookieData.substring(start, end);
           }
           return unescape(cookieValue);
       }
       
   });
</script>
<%
String user = "";
Cookie[] cookies = request.getCookies();

if(cookies!=null){
   for(Cookie ck : cookies){
      if(ck.getName().equals("email")){
         user = ck.getValue();
      }
   }   
}
%>  
<body class="is-preload left-sidebar">         
   <div id="page-wrapper"> 
      <!-- 헤더 -->
      <%@ include file="../general/MainHeader.jsp"%>
       
      <!-- Main -->   
          
     <div id="content" class="container" >
         <div class="" style="margin-top:30px; display:inline-block;" >
         
         <div id="" style="display:inline-block; width: 50%; float:left; " >

         	

         </div>
         
           <div id="" style="display:inline-block;  width: 50%;  float:left; font-family: Goyang;" >
                
               <div class="" style="display:inline-block; background:#f1f1f1; border-radius:10px;   padding : 35px 35px 35px 35px; " >
                  <form class="loginForm" action="loginAction.do">
                     <div class="form-group"> 
                        <input type="text" style="font-family: Verdana;" class="form-control" name="email" placeholder="이메일(계정명)" value="<%=user==null ? "" : user %>"
                           required autofocus />
                     </div>
                     <div class="form-group">
                        <input style="font-family: Verdana; "type="password" class="form-control" name="pass" placeholder="암호"
                           required />
                     </div>
                     <div class="idCheck custom-control custom-checkbox" style="color: white;">
                        <input type="checkbox" name="saveCheck" id="defaultUnchecked" value="1" <% if(user.length()!=0){ %> checked = "checked" <% } %>
                           class="custom-control-input" /> 
                        <label class="custom-control-label" for="defaultUnchecked" style="color: black">이메일 계정을 저장합니다.</label>
                     </div>
                     <span style="color:red;font-size:1em;"> 
                        ${loginError }
                     </span>
                     <br />
                     <button class="btn btn-lg btn-primary btn-block" type="submit">
                        로그인</button>
                  </form>
                  <div class="or-box">  
                     <span class="or" style="text-align: center; color: black;">
                        또는 </span>
                     <div id="OtherLogin">
                        <div class="kakao" style="margin-bottom:15px;">
                           <a href="javascript:loginWithKakao();">
                              <button type="button" class="btn btn-kakao btn-warning"></button> 
                           </a>
                        </div>
                        <div class="google" style="margin-top:10px;" id="loginButton"> 
                           <script type="text/javascript">loginWithGoogle();</script>
                           <button type="button" class="btn btn-google btn-light"></button>
                        </div>
                     </div>
                  </div>
                  <div class="or-box row-block">
                     <a class="forgotLnk" href="accountfind.do"
                        style="color: navy;"><i class="fas fa-exclamation-triangle"></i>로그인이 되지 않으시나요?</a><br /> <span
                        style="color: black; font-weight: bold;">아직 계정이 없으신가요?</span> <a
                        href="join1.do"
                        class="btn btn-dark btn-block" style="color: white;">회원가입
                        하기</a>
                  </div>
               </div> 
               
            </div>
         </div>  
      </div> 
   </div> 
 
   
 
      <!-- Footer -->
      <%@ include file="../general/simpleFooter.jsp"%>

   
    <!-- Scripts -->
  
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/jquery.dropotron.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>

</body>
</html>