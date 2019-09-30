<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%@ page trimDirectiveWhitespaces="true"%>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="summernote/summernote.css" type="text/css"/>
<script src = "summernote/summernote.min.js" type="text/javascript"></script>

<style type="text/css">
@font-face { 
   font-family: 'Goyang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Goyang.woff') format('woff'); 
   font-weight: normal; font-style: normal;
}
nav {
   font-family: 'Goyang', cursive;
} 
#dep {
   z-index : 0;
}
@media screen and (max-width: 995px) { #outer_btn_right { display: none; } }
@media screen and (min-width: 782px) { #nav_login { display: none; } }


@media screen and (max-width: 995px) { #place_web { display: none; } }
@media screen and (min-width: 782px) { #place_app { display: none; } }
</style>
<script>
function catchAlert(){
	alert("모바일웹에선 지원하지 않습니다. PC웹이나 어플리케이션을 통하여 실행해주세요");
	
}


</script>
 
<!-- Header -->
<div id="header-wrapper" 
   style="position:fixed; top:0; width: 100%; z-index:10; background-color: white; ">
   <div id="outer_btn_right" class="container" style=" text-align: right;margin-top: -50px; font-family: 'Goyang'; ">
      
       <%
            if (session.getAttribute("EMAIL") == null) {
         %>
          <i class="fas fa-child"></i> 
         <a href="login.do" style=" color: #565454;" >LOGIN</a>
       <%
            } else {   
         %>
         <i class="fas fa-user-check"></i> 
        <%=session.getAttribute("NAME") %>님&nbsp;&nbsp;
         <a href="logout.do" style=" color: #565454;" >LOGOUT</a>
       <%
            }
         %>
   </div>
   <div >
   <header id="header" class="container" >

      <!-- Logo -->
      <div id="logo">
         <h1>
            <a href="/phj"><img src="assets/css/images/편의점홈페이지로고.png" alt="" /></a>
         </h1>
      </div>
      
		<!-- Nav -->
		<nav id="nav" style="font-size: 20px;">
			<ul>
				<li id="stock"><a href="findproduct.do">편의점 상품 조회</a>
				<li id="place_web"><a href="placemap.do">전국 편의점 검색(웹)</a></li>
				<li id="place_app"><a href="javascript:catchAlert();">전국 편의점 검색(앱)</a></li>
				<li id="recipe" class=""><a href="recipe.do" id="link2">레시피</a></li>
				<li id="notice"><a href="#">공지사항</a>
					<ul>
						<li><a href="notice.do">공지사항</a></li>
						<li><a href="event.do">이벤트</a></li>
					</ul></li>
					
				<li id="service"><a href="#">고객센터</a>
					<ul id = "dep">
						<li><a href="qna.do">Q&A</a></li>
						<li><a href="mail.do">1:1 문의</a></li>
					</ul></li>
				<%
       		   		if (session.getAttribute("EMAIL") == null) {
      			 %>
					<li id="nav_login"><a href="login.do">로그인</a>
				<%} else{ %>
					<li  id="nav_login"><a href="logout.do">로그아웃</a>
			
				<%}%>
				
				
				
			</ul>
		</nav>
	</header>
	
	</div>
</div>
<div style="margin-bottom: 170px;">
</div>


