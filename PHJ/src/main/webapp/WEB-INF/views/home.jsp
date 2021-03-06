<%@page import="org.springframework.ui.Model"%> 
<%@page import="java.util.List"%> 
<%@page import="java.util.Map"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="model.board.noticeDAO"%> 
<%@page import="model.board.noticeDTO"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
   pageEncoding="UTF-8"%> 
<%@ page session="true"%> 
<html> 
<head> 
<title>편히점</title> 
<meta charset="utf-8" /> 
<meta name="viewport" 
   content="width=device-width, initial-scale=1, user-scalable=no" /> 
<link rel="stylesheet" href="assets/css/main.css" /> 
<script 
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<script 
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> 
<script 
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
<link href="https://fonts.googleapis.com/css?family=Goyang&display=swap" 
   rel="stylesheet"> 
    
<style type="text/css"> 
@font-face {  
   font-family: 'Goyang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Goyang.woff') format('woff');  
   font-weight: normal; font-style: normal; 
} 
nav { 
   font-family: 'Goyang', cursive; 
} 


</style> 
<style>
@media screen and (min-width: 420px) { 

   #cutboard { display: none; }
}
@media screen and (max-width: 420px) { 
   #wideboard { display: none; }

}

</style>

</head> 

<script> 
   function scroll_follow(id) { 
      $(window).scroll(function() //스크롤이 움직일때마다 이벤트 발생 
      { 
         var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 
         var stop = 230; //상단 무조건 230px로 고정하기 위해 쓴 변수. 
         $(id).stop().animate({ 
            top : stop + 'px' 
         }, 0); 
         //해당 오브젝트 위치값 재설정 
      }); 
   }  
   scroll_follow("#scroll"); 
</script> 
<style type="text/css"> 
body { 
   font-family: 'Mali', cursive; 
   font-family: '나눔고딕코딩', cursive 
} 

#scroll { 
   z-index: 10; 
} 
</style> 
<!-- 슬라이드 쇼  -->
 <style>
  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 100%;
  }
  </style>



<style type="text/css"> 
@font-face { 
   font-family: 'Goyang'; 
   src: 
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Goyang.woff') 
      format('woff'); 
   font-weight: normal; 
   font-style: normal; 
} 

nav { 
   font-family: 'Goyang', cursive; 
} 
</style> 
<style>/**** 마우스오버 js *****/ 
/* Demo purposes only */ 
$(" 
.hover 
  
") 
.mouseleave 
  
( 
function 
  
(){ 
$( 
this 
  
) 
.removeClass 
("hover"); 

    

} 
); 


</style> 

<!--  마우스오버 css start  --> 
<style> 
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700); 

@import 
   url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css) 
   ; 

figure.recipePhoto { 
   font-family: 'Raleway', Arial, sans-serif; 
   position: relative; 
   overflow: hidden; 
   margin: 10px; 
   min-width: 230px; 
   max-width: 315px; 
   width: 100%; 
   color: #ffffff; 
   text-align: left; 
   font-size: 16px; 
   background-color: #000000; 
   border-radius: 10px; 
} 

figure.recipePhoto * { 
   -webkit-box-sizing: border-box; 
   box-sizing: border-box; 
   -webkit-transition: all 0.35s ease; 
   transition: all 0.35s ease; 
} 

figure.recipePhoto img { 
   max-width: 100%; 
   backface-visibility: hidden; 
   vertical-align: top; 
} 

figure.recipePhoto:after, figure.recipePhoto figcaption { 
   position: absolute; 
   top: 0; 
   bottom: 0; 
   left: 0; 
   right: 0; 
} 

figure.recipePhoto:after { 
   content: ''; 
   background-color: rgba(0, 0, 0, 0.65); 
   -webkit-transition: all 0.35s ease; 
   transition: all 0.35s ease; 
   opacity: 0; 
} 

figure.recipePhoto figcaption { 
   z-index: 1; 
   padding: 40px; 
} 

figure.recipePhoto h3, figure.recipePhoto .links { 
   width: 100%; 
   margin: 5px 0; 
   padding: 0; 
} 

figure.recipePhoto h3 { 
   line-height: 1.1em; 
   font-weight: 700; 
   font-size: 1.4em; 
   text-transform: uppercase; 
   opacity: 0; 
} 

figure.recipePhoto p { 
   font-size: 0.8em; 
   font-weight: 300; 
   letter-spacing: 1px; 
   opacity: 0; 
   top: 50%; 
   -webkit-transform: translateY(40px); 
   transform: translateY(40px); 
} 

figure.recipePhoto i { 
   position: absolute; 
   bottom: 10px; 
   right: 10px; 
   padding: 20px 25px; 
   font-size: 34px; 
   opacity: 0; 
   -webkit-transform: translateX(-10px); 
   transform: translateX(-10px); 
} 

figure.recipePhoto a { 
   position: absolute; 
   top: 0; 
   bottom: 0; 
   left: 0; 
   right: 0; 
   z-index: 1; 
} 

figure.recipePhoto:hover img, figure.recipePhoto.hover img { 
   zoom: 1; 
   filter: alpha(opacity = 50); 
   -webkit-opacity: 0.5; 
   opacity: 0.5; 
} 

figure.recipePhoto:hover:after, figure.recipePhoto.hover:after { 
   opacity: 1; 
   position: absolute; 
   top: 10px; 
   bottom: 10px; 
   left: 10px; 
   right: 10px; 
} 

figure.recipePhoto:hover h3, figure.recipePhoto.hover h3, figure.recipePhoto:hover p, 
   figure.recipePhoto.hover p, figure.recipePhoto:hover i, figure.recipePhoto.hover i 
   { 
   -webkit-transform: translate(0px, 0px); 
   transform: translate(0px, 0px); 
   opacity: 1; 
} 
</style> 
<!-- 마우스 오버 end  --> 
<script>
function textLengthOverCut(txt, len, lastTxt) {
    if (len == "" || len == null) { // 기본값
        len = 20;
    }
    if (lastTxt == "" || lastTxt == null) { // 기본값
        lastTxt = "...";
    }
    if (txt.length > len) {
        txt = txt.substr(0, len) + lastTxt;
    }
    return txt;
    alert("txt")
}

</script>
<body class="is-preload homepage"> 
   <div id="page-wrapper" > 
  
      <!-- 메인페이지 우측 스크롤메뉴 --> 
      <!-- <div id="scroll" style="position: absolute; right: 30; top: 200px;"> --> 
      <div id="scroll"   
         style=" position: fixed; right: 50%; top: 230px; margin-right: -800px; text-align: center; width: 180px;"> 
  	     <!-- 이미지로 스크롤 메뉴 변경함 --> 
         <a href="#"> <img  style="width:90%" src="images/welcome.png" alt="welcome"  
            style="right: 30;" /> 
         </a> <br />  
         <a href="#search"> <img  style="width:90%"
            src="images/findproduct.png" alt="편의점 상품조회" /> 
         </a><br />  
         <a href="#reci"> <img  style="width:90%"
            src="images/recipe.png" alt="편의점 레시피" /> 
         </a><br />  
         <a href="#notify"> <img   style="width:90%" src="images/notice.png" 
            alt="공지사항" /> 
         </a><br /> 
         <% 
            if (session.getAttribute("EMAIL") == null) { 
         %> 
         <a href="login.do"><img  style="width:90%" src="images/login.png" alt="로그인" /></a> 
         <% 
            } else { 
         %> 
      <a href="memberEdit.do"> <img  style="width:90%" src="images/modify.png" 
            alt="정보수정" /> 
         </a> <a href="logout.do"> <img  style="width:90%" src="images/logout.png" 
            alt="로그아웃" /> 
         </a>   
         <% 
            } 
         %> 
         
         

      </div> 

      <!-- 메인 헤더 인클루드 --> 
      <%@ include file="general/MainHeader.jsp"%> 
       
 		<!-- <img class="effect" 
                src="images/mainpic2.jpg" 
                alt="메인이미지" style="width: 100%;"> -->
                
         <!-------------------------------- 메인 이미지 시작 -->
         <!----------------------------- pc용  -->
         <div id="wideboard">
         

         
		<div id="demo" class="carousel slide" data-ride="carousel" style="height:60%;">
		
		  <!-- Indicators -->
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active"></li>
		    <li data-target="#demo" data-slide-to="1"></li>
		    <li data-target="#demo" data-slide-to="2"></li>
		  </ul>
		  
		  <!-- The slideshow -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		     <img class="effect" 
		                src="images/main333.png" 
		                alt="메인이미지" style="width: 100%; height: 100%">
		    </div>
		    <div class="carousel-item">
		      <img src="images/main111.png" style="width: 100%; height: 100% " >
		    </div>
		    <div class="carousel-item">
		      <img src="images/main222.png" style="width: 100%; height: 100%">     
		    </div>
		  </div>
		  
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#demo" data-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </a>
		  <a class="carousel-control-next" href="#demo" data-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </a>
		</div>
		
		</div>
		
		<!----------------------------- mobile용  -->
         <div id="cutboard">
         
           
		<div id="demo" class="carousel slide" data-ride="carousel" style="height:400px;">
		
		  <!-- Indicators -->
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active"></li>
		    <li data-target="#demo" data-slide-to="1"></li>
		    <li data-target="#demo" data-slide-to="2"></li>
		  </ul>
		  
		  <!-- The slideshow -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		     <img class="effect" 
		                src="images/main3333.png" 
		                alt="메인이미지" style="width: 100%; height: 100%">
		    </div>
		    <div class="carousel-item">
		      <img src="images/main1111.png" style="width: 100%; height: 100% " >
		    </div>
		    <div class="carousel-item">
		      <img src="images/main2222.png" style="width: 100%; height: 100%">     
		    </div>
		  </div>
		  
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#demo" data-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </a>
		  <a class="carousel-control-next" href="#demo" data-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </a>
		</div>
		
		</div>
       <!-------------------------------- 메인 이미지 끝 -->

      
      <div id="search"  style="height: 40px;"><br /></div>
      <!-- Features -->   
      <div id="features-wrapper">
     	<div class="container" > </div>    
         <div class="container" > 
            <div class="row" > 
                   <div class="col-6 col-12-medium"> 
                  <!-- Box --> 
             
                  <section class="box feature" style="border : 1px solid #f7f4f4;"> 
                     <a href="placemap.do" class="image featured"><img 
                        src="images/store_shadow.png" alt="" /></a> 
                     <div class="inner" 
                        style="text-align: center; font-family: Goyang;"> 
                        <header> 
                           <h2 style="font-family: Goyang;">매장 찾기</h2> 
                        </header> 
                        <p style="font-family: Goyang; font-size: 25px;"> 
                           내 주변 편의점 찾기</p> 
                     </div> 
                  </section> 
               </div> 
         
               <div class="col-6 col-12-medium"> 
                  <!-- Box --> 
 
                  <section class="box feature" style="border : 1px solid #f7f4f4;"> 
                     <a href="findproduct.do" class="image featured"><img 
                        src="images/product_shadow.png" alt="" /></a> 
                     <div class="inner" style="text-align: center;"> 
                        <header> 
                           <h2 style="font-family: Goyang;">상품 찾기</h2> 
                        </header> 
                        <p style="font-family: Goyang; font-size: 25px;"> 
                           맛Eat는 먹거리 찾기</p> 
                     </div> 
                  </section> 
               </div> 
             
         </div> 
      </div> 
    </div> 

      <!-- Main --> 
       
      <div id="reci" style="height: 40px;"><br /></div>  
      <div id="main-wrapper" >
      
      <!-- -------------------------------------------------------------------레시피 -->
           <!--------------------------------------------------- 공지,이벤트(pc용) -->

            <div id="recipe" style="height: 20px;">&nbsp;<br /></div> 
            <div class="container" id="wideboard">
      	 <!------------------------------------------------------------- 레시피 레시피 -->
           <div class="row container" >  
               <!-- preview board  시작  --> 
                  <section class="widget thumbnails"> 
                     <h2 style="font-family: Goyang; font-size: 40px;" >레시피</h2> 
                     <div style="text-align: right;"> 
                     <a class="float-right" href="recipe.do"  style="margin-top: -50px;"> 
                     <img src="images/moreView.png" alt="" style="width: 90px"/>
                     </a> 
                     </div>  
                        <!-- <div class="container">  -->
                        <div class="row " style=" margin-left: -60px;"> 
                        <c:choose> 
                           <c:when test="${empty recipeRows }"> 
                              <div> 
                                 <span>결과가 없습니다.</span> 
                              </div> 
                           </c:when>  
                           <c:otherwise> 
                              <c:forEach items="${recipeRows }" var="row" varStatus="loop"> 
                                 <c:choose> 
                                    <c:when 
                                       test="${row.recommend eq 3 || row.recommend eq 2 || row.recommend eq 1 }"> 

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 effect "> 

                                          <figure class="recipePhoto" style="width:100px; height:200px;"> 
                                             <img class="img-fluid img-thumbnail effect" 
                                                src="./resources/imageUpload/${row.thumbnail }" style="height:100%; width:100%;"
                                                alt=""> 
                                             <figcaption> 
                                                <h3>${row.title }</h3> 
                                                <p>${row.content }</p> 
                                                <i class="ion-ios-arrow-right"></i> 
                                             </figcaption> 
                                             <a href="./Rview.do?idx=${row.idx}&nowPage=${nowPage}" class=""></a> 
                                          </figure> 
                                       </div> 
   
                                    </c:when> 
                                    <c:otherwise> 
                                       <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 " > 
                                          <figure class="recipePhoto" style="width:100px; height:200px;"> 
                                             <img class="img-fluid img-thumbnail effect" 
                                                src="./resources/imageUpload/${row.thumbnail }" style="height:100%; width:100%;"
                                                alt=""> 
                                             <figcaption> 
                                                <h3>${row.title }</h3> 
                                                <p>${row.content }</p> 
                                                <i class="ion-ios-arrow-right"></i> 
                                             </figcaption> 
                                          <a href="./Rview.do?idx=${row.idx}&nowPage=${nowPage}" class=""></a> 
                                          </figure> 
                                       </div> 
                                    </c:otherwise>
                                 </c:choose>
                              </c:forEach>
                           </c:otherwise>
                        </c:choose>
                     </div>

                  </section>  
               </div>
            </div>
            
            <!--------------------------------------------------- 공지,이벤트(pc용) -->


           
           
           <p id="notify" style="width:200px;" /> 

            <br /><br />
            <div class="container" id="wideboard">
            <div class="row" >
            
              <div class="col-md-6 grid-margin stretch-card" >
                <div class="card">
                  <div class="card-body">
                    <div class="clearfix">
                      <h4 class="card-title float-left" >공지</h4>
                      <a class="float-right" href="notice.do"><img src="images/moreView.png" alt="" style="width: 90px"/> </a>
                     <div class="table-responsive">
                         <table class="table" style="text-align: center;  " >
                        <colgroup>
                           <col width="80px" />
                           <col width="*" />
                           <col width="120px" />
                        </colgroup>
                         
                        <tbody>
                           <c:choose>
                              <c:when test="${empty listRows }">
                                 <tr>
                                    <td colspan="6" class="text-center">등록된 게시물이 없습니다^^*</td>
                                 </tr>
                              </c:when>
                              <c:otherwise>
                                 <c:forEach items="${listRows }" var="row"
                                    varStatus="loop">
                                    <!-- 리스트반복시작 -->
                                    <tr>  
                                       <td class="text-center"> <label class="badge badge-danger">공지</label></td>
                                       <td class="text-left" style="color: black;">
                                          <a href="./view.do?idx=${row.idx}&nowPage=${nowPage}" style="color: black;">
                                          ${row.title}
                                          </a> 
                                       </td>
                                       <%-- <td class="text-center">${row.content }</td> --%>
                                      <td class="text-center">${row.postdate }</td> 
                                    </tr>
                                 </c:forEach>
                              </c:otherwise>
                           </c:choose>
                        </tbody>
                     </table>
                      
                      
                        
                     </div> 
                    </div>
                  </div>
                </div>
              </div>
  
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body"> 
                    <h4 class="card-title float-left" >이벤트</h4>
                    <a class="float-right" href="event.do">
                   		 <img src="images/moreView.png" alt="" style="width: 90px"/> 
                    </a>
                      <div class="table-responsive">  
                        <table class="table" style="text-align: center;  " >
                        <colgroup>
                           <col width="80px" />
                           <col width="*" />
                           <col width="120px" />                           
                        </colgroup>
                         
                        <tbody>
                            <c:choose>
                                <c:when test="${empty eventRows }">
                                   <tr>
                                      <td colspan="6" class="text-center">등록된 게시물이 없습니다
                                         ^^*</td>
                                   </tr>
                                </c:when>
                                <c:otherwise>
                                   <c:forEach items="${eventRows }" var="row"
                                      varStatus="loop">
                                      <!-- 리스트반복시작 -->
                                      <tr>
                                         <%-- <td class="text-center">${row.virtualNum }</td> --%>
                                         <td class="text-center"><label class="badge badge-info">이벤트</label></td>
                                         <td class="text-left">
                                         
                                         <a href="./Eview.do?idx=${row.idx}&nowPage=${nowPage}" style="color: black;">
                                          ${row.title}
                                          </a> 
                                         </td>
                                         <td class="text-center">${row.postdate }</td>
                                         <%-- <td class="text-center">${row.view_count }</td> --%>
                                      </tr>
                                   </c:forEach>
                                </c:otherwise>
                             </c:choose>
                        </tbody>
                     </table>


                   </div>   
                  </div>
                </div>
              </div> 
              
            </div>   <!-- row --> 
            
                     </div>
            </div>
            
            
            <!--------------------------------------------------- 공지,이벤트(모바일용) -->
            
            <div class="container" id="cutboard">
            
             <h4 style="font-family: Goyang; font-size: 40px;" >레시피</h4> 
             <div style="text-align: right;"> 
             <a class="float-right" href="recipe.do"  style="margin-top: -50px;"> 
             <img src="images/moreView.png" alt="" style="width: 90px"/>
             </a> 
             </div>
            <!------------------------------------------------------------- 슬라이드 레시피 -->
	            <div id="demo" class="carousel slide" data-ride="carousel">
	
				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <!-- <li data-target="#demo" data-slide-to="0"></li> -->
				    <li data-target="#demo" data-slide-to="1" class="active"></li>
				    <li data-target="#demo" data-slide-to="2"></li>
				    <li data-target="#demo" data-slide-to="3"></li>
				    <li data-target="#demo" data-slide-to="4"></li>
				    <li data-target="#demo" data-slide-to="5"></li>
				    <li data-target="#demo" data-slide-to="6"></li>
				    <li data-target="#demo" data-slide-to="7"></li>
				    <li data-target="#demo" data-slide-to="8"></li>
				  </ul>
				  
				  <!-- The slideshow -->
				 
				 <!-- 슬라이드 첫번째 -->
 			 <div class="carousel-inner">
			   	 <div class="carousel-item active" id="item">
			      	<img src="images/reciBanner.png" alt="" style="width:100%; height: 50%;" />
			     </div>
			 <div class="carousel-inner active">
				  <!--   <div class="carousel-item">
				    <!--  슬라이드 이후 --> 
				       <c:choose> 
	                           <c:when test="${empty recipeRows }"> 
	                              <div> 
	                                 <span>결과가 없습니다.</span> 
	                              </div> 
	                           </c:when>  
	                           <c:otherwise> 
	                              <c:forEach items="${recipeRows }" var="row" varStatus="loop"> 
	                                  <div class="carousel-item">
	                                     <figure class="recipePhoto" style="width:100%; height: 50%;"> 
	                                        <img class="img-fluid img-thumbnail effect" 
	                                           src="./resources/imageUpload/${row.thumbnail }" style="width:100%; height: 100%;"
	                                           alt=""> 
	                                        <figcaption> 
	                                           <h3>${row.title }</h3> 
	                                           <p>${row.content }</p> 
	                                           <i class="ion-ios-arrow-right"></i> 
	                                        </figcaption> 
	                                     <a href="./Rview.do?idx=${row.idx}&nowPage=${nowPage}" class=""></a> 
	                                     </figure> 
	                               	 </div>
	                              </c:forEach>
	                           </c:otherwise>
	                       </c:choose>
	
				   <!--  </div> -->
				    
				  </div> 
			  
			  <!-- Left and right controls -->
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
			</div>
			</div>
			
			
            <br /><br />
             
            
            
            <div class="row">
            
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="clearfix">
                      <h5 class="card-title float-left">공지</h5>
                      <a class="float-right" href="notice.do"><img src="images/moreView.png" alt="" style="width: 90px"/> </a>
                     <div class="table-responsive">
                         <table class="table" style="text-align: center;  " >
                        <colgroup>
                           <col width="80px" />
                           <col width="*" />
                           <col width="120px" />
                        </colgroup>
                         
                        <tbody>
                           <c:choose>
                              <c:when test="${empty listRows }">
                                 <tr>
                                    <td colspan="6" class="text-center">등록된 게시물이 없습니다^^*</td>
                                 </tr>
                              </c:when>
                              <c:otherwise>
                                 <c:forEach items="${listRows }" var="row"
                                    varStatus="loop">
                                    <!-- 리스트반복시작 -->
                                    <tr>
                                       <td class="text-center"> <label class="badge badge-danger">공지</label></td>
                                       <td class="text-left" style="color: black;">
                                          <a href="./view.do?idx=${row.idx}&nowPage=${nowPage}" style="color: black;">
                                          <c:choose>
                                      <c:when test="${fn:length(row.title) gt 3}">
                                      <c:out value="${fn:substring(row.title, 0, 2)}"/>...
                                      </c:when>
                                      <c:otherwise>
                                      <c:out value="${row.title}"/>
                                      </c:otherwise>
                                 </c:choose>

                                          </a>
                                       </td>
                                       <%-- <td class="text-center">${row.content }</td> --%>
                                      <td class="text-center">${row.postdate }</td> 
                                    </tr>
                                 </c:forEach>
                              </c:otherwise>
                           </c:choose>
                        </tbody>
                     </table>
                      
                      
                      
                     </div> 
                    </div>
                  </div>
                </div>
              </div>
              
              
          
                
              
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body"> 
                    <h4 class="card-title float-left" >이벤트</h4>
                    <a class="float-right" href="event.do"><img src="images/moreView.png" alt="" style="width: 90px"/> </a>
                      <div class="table-responsive">  
                        <table class="table" style="text-align: center;  " >
                        <colgroup>
                           <col width="80px" />
                           <col width="*" />
                           <col width="120px" />
                           
                        </colgroup>
                         
                        <tbody>
                            <c:choose>
                                <c:when test="${empty eventRows }">
                                   <tr>
                                      <td colspan="6" class="text-center">등록된 게시물이 없습니다
                                         ^^*</td>
                                   </tr>
                                </c:when>
                                <c:otherwise>
                                   <c:forEach items="${eventRows }" var="row"
                                      varStatus="loop">
                                      <!-- 리스트반복시작 -->
                                      <tr>
                                         <%-- <td class="text-center">${row.virtualNum }</td> --%>
                                         <td class="text-center"><label class="badge badge-info">이벤트</label></td>
                                         <td class="text-left">
                                         
                                         <a href="./Eview.do?idx=${row.idx}&nowPage=${nowPage}" style="color: black;">
                                          <c:choose>
                                      <c:when test="${fn:length(row.title) gt 3}">
                                      <c:out value="${fn:substring(row.title, 0, 2)}"/>...
                                      </c:when>
                                      <c:otherwise>
                                      <c:out value="${row.title}"/>
                                      </c:otherwise>
                                 </c:choose>
                                          </a> 
                                         </td>
                                         <td class="text-center">${row.postdate }</td>
                                         <%-- <td class="text-center">${row.view_count }</td> --%>
                                      </tr>
                                   </c:forEach>
                                </c:otherwise>
                             </c:choose>
                        </tbody>
                     </table>


                   </div>   

                  </div>
                </div>
              </div> 
              
            </div>   <!-- row --> 
            
            
            </div>

      </div>

      <!-- Footer 인클루드. -->
      <%@ include file="general/MainFooter.jsp"%>

   <!-- Scripts --> 

   <script src="assets/js/jquery.min.js"></script> 
   <script src="assets/js/jquery.dropotron.min.js"></script> 
   <script src="assets/js/browser.min.js"></script> 
   <script src="assets/js/breakpoints.min.js"></script> 
   <script src="assets/js/util.js"></script> 
   <script src="assets/js/main.js"></script> 
</body> 

</html> 