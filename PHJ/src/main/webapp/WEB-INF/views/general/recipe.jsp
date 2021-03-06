<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.board.recipeDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.board.recipeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>편히점 - 레시피</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
@media (min-width: 420px) { 

   #cutboard { display: none; }
}
@media screen and (max-width: 420px) { 
   #wideboard { display: none; }

}
</style>
<style>
/* 해당 HTML문서의 기본 폰트 지정하기 */
body {
   font-family: verdana;
   font-size: 12px;
}

/*** 뱃지 css ***/
.effect {
   position: relative;
   display: inline-block;
   overflow: hidden; /* 불필요한 부분 가리기 */
   padding: 1px 0 0 -10px;
}

.effect:after {
   content: "";
   position: absolute;
   z-index: 5;
   width: 150px;
   height: auto;
   background: #ffa126;
   content: "BEST RECIPE"; /* 보여주는 텍스트 */
   text-align: center;
   color: #fff;
   font-family: 'Arial';
   font-weight: bold;
   padding: 5px 10px;
   left: 25px;
   top: 35px; 
   transform: rotate(0deg);
   box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
}
</style>
<style>
.pattern {
   background-color: #ffffff;
   background-image: linear-gradient(90deg, rgba(0, 0, 0, .5) 50%,
      transparent 50%), linear-gradient(rgba(0, 0, 0, .5) 50%, transparent
      50%);
   background-size: 50px 50px;

}

/* 뱃지2 */
.effect2 {
  position: relative;
  display: inline-block;
  overflow: hidden; /* 불필요한 부분 가리기 */
  padding: 1px;
}
.effect2:after {
  content: "";
  position: absolute;
  z-index: 1;
  width: 100px;
  height: auto;
  background: red;
  content: "New";  /* 보여주는 텍스트 */
  text-align: center;
  color: #fff;
  font-family: 'Arial';
  font-weight: bold;
  padding: 5px 10px;
  left: -30px;
  top: 3px;
  transform: rotate(-30deg);
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
}
</style>
<style>
.pattern {
   background-color: #ffffff;
   background-image: linear-gradient(90deg, rgba(0, 0, 0, .5) 50%,
      transparent 50%), linear-gradient(rgba(0, 0, 0, .5) 50%, transparent
      50%);
   background-size: 50px 50px;

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
<style>/**** 마우스오버 css *****/
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
#nore{
   
   background-repeat:no-repeat;
   background-position: 50%;
   background-size: 700px;
}
</style> 
<script>
   $(function() {
      $("#recipe").attr("class", "current");
   });
   
   function InputSearch(f){
      if(f.searchWord.value==""){
         alert("검색어를 입력하세요");
         f.searchWord.focus();
         return false;
      }
   }
</script>
</head>
<body>
   <!-- <div style="width:100%; height:200px; text-align: center; background-color: #ffd74d; display:table;"> 
       <p style="display:table-cell; text-align:center; vertical-align:middle; font-family:Arial; font-size: 60px; color: white; font-weight: bold;">
       RECIPE
       </p>
   </div>  
    
   <div style="width:100%; text-align: center;">
   <br /><br />
      <img src="./images/fork.png" alt="포크" style=" width:100px; height: 100px;"/>
   </div> -->

   <!-- 메인헤더 인클루드 -->
   <%@ include file="MainHeader.jsp"%>

   <div id= "nore"
      style="width: 100%; height: 200px; text-align: center;  display: table;">
      <br /> <br /> <br />
      <p
         style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 60px; color: white; font-weight: bold; color: black;">
         <img src="https://image.flaticon.com/icons/svg/2035/2035184.svg" width="55px" height="55px"/>
          RECIPE
          <img src="https://image.flaticon.com/icons/svg/2035/2035184.svg" width="55px" height="55px"/>
      </p>
   </div> 
 <%--     <input type="hidden" name="nowPage" value="${nowPage }" /> --%>
   
	
			
   		
   		
      <!-- Page Content --> 
     
     	
         <div class="container">
               <br />
                <div class="container" style="text-align: center;  margin-bottom: 20px;"> 
           
           <div id="wideboard">
                    
                <!-- 검색기능 -->
            <form class="form-inline" style=" background-color:#fbfbfb;  border-top: 2px solid #c1c1c1;  border-bottom: 2px solid #c1c1c1; padding-bottom:10px; font-family: Goyang;">    
            
             <div class="container" style="display:inline-block; text-align: right;  width: 40%; font-weight: bold; border-right: 1px solid grey; margin-top: 10px;" ">
                <select name="searchColumn" class="form-control" style="margin-left:10px; width:50%;">
                      <option value="title">제목</option>
                      <option value="content">내용</option>
                      <option value="postdate">게시일</option>
                   </select>
            </div>
                <div class="container" style=" display:inline-block;width:35%; " >  
                   
                <input type="text" name="searchWord"  style="width: 100%;  margin-top: 10px;" />
               </div> 
            
              <div style=" display:inline-block; width:25%; text-align: left;">
              
              <button class="btn btn-dark " style=" font-size: 0.7em;  margin-top: 10px;""><i class="fas fa-search"></i></button>
              </div>
            </form> 
            
            <br />
         </div>
         
         <div id="cutboard">
           <!-- 검색기능 -->
		      <form class="form-inline" style=" background-color:#fbfbfb;  border-top: 2px solid #c1c1c1;  border-bottom: 2px solid #c1c1c1; padding-bottom:10px; font-family: Goyang;">    
		      
		       <div class="container" style="display:inline-block; font-size:0.8em;   text-align: right;  width: 40%; font-weight: bold; border-right: 1px solid grey; margin-top: 10px;" ">
					 <select name="searchColumn" class="form-control" style="margin-left:10px; width:90%;">
		                <option value="title">제목</option>
		                <option value="content">내용</option>
		                <option value="postdate">게시일</option>
		             </select>
				</div>
		       	<div class="container" style=" display:inline-block;width:40%; " >  
		             
		          <input type="text" name="searchWord"  style="width: 100%;  margin-top: 10px;" />
		      	</div> 
		      
		        <div style=" display:inline-block; width:20%; font-size:0.8em; text-align: left;">
		        
		        <button class="btn btn-dark " style="width:50%; font-size: 0.7em;  margin-top: 10px;"><i class="fas fa-search"></i></button>
		        </div>
		      </form> 
		      
		      <br />
         
         
         </div>
   
         <!-- 검색기능 끝 -->
                <div style="border: 2px solid gold;" >
       		  <c:if test="${nowPage ne 2}">

                 <div class=" text-center"  style="text-align: center; "> 
                 <div style="">
                 <img src="images/cup.png" style="width: 10%; padding-top:20px; "alt="" />
                 <br /><br />
                 <p style="font-family:verdana; font-size: 1.8em; font-weight: bold;"><mark>Best Recipe</mark></p>
                 </div>
                  <c:forEach items="${listRows }" var="row" varStatus="loop">
                  <c:choose>  
                     <c:when test="${row.recommend eq 3 || row.recommend eq 2 || row.recommend eq 1 }">
                        <!-- 베스트게시물 s-->
                        <div class="  " style="display:inline-block;">
                         
                           <div style="postion:relative;  color:#4389cc; font-weight: bold; font-size: 1.3em;  ">
                             ${loop.index+1 }  
                           </div>
                           <div style="position: relative; display:inline-block;">
                              <input  type="hidden" value="${row.thumbnail }"/>
                              
                              <figure class="recipePhoto " style="width:100px; height:200px; border: 1px solid white; border-radius: 0px;">
                                 <img class="img-fluid img-thumbnail " style=" height:100%; width:100%;  border-radius: 0px;"
                                    src="./resources/imageUpload/${row.thumbnail }"
                                    alt="">
                                    <img src="images/best.png" alt="" style="width: 50px; margin-top: 60px; z-index: 50px;"/>  
                                 <figcaption>  
                                    <h3 style="color:white; text-align:center; vertical-align:middle;">${row.title }</h3>
                                    <p>${row.content }</p>
                                    <i class="ion-ios-arrow-right"></i>
                                 </figcaption>
                                 <a href="./Rview.do?idx=${row.idx}&nowPage=${nowPage}" class="d-block mb-4 h-100"></a>
                              </figure>
                              
                              <div style="position: relative; left:80px; top: -230px;" >
                                 <img src="images/best.png" alt="" style="width: 80px; " />  
                              </div>
                           </div>
                        </div>
                        
                        </c:when>
                        </c:choose>  
                        </c:forEach> 
                        </div>
         </c:if>

                </div>
                <br /><br />
             <div style="text-align: right; font-family: Goyang;">
               <%if(session.getAttribute("EMAIL") != null) { %> 
                  <form action="recipe_edit.do" method="post">
                     <button type="submit" class="btn btn-dark btn-sm">글쓰기</button>
                  </form>
                  <%} %>
                  <br />
               </div>
         
         
            <c:choose>
               <c:when test="${empty listRows }">
                  <br /><div class="row text-center" style="margin-left:auto; margin-right:auto;"><p>등록된 게시물이 없습니다.</p></div>
               </c:when>
               <c:otherwise>
               <div class="row text-center text-lg-left">   
                  <c:forEach items="${listRows }" var="row" varStatus="loop">
                  <c:choose>
                     <c:when test="${row.recommend eq 3 || row.recommend eq 2 || row.recommend eq 1 }">
                    
                     </c:when>
                     <c:otherwise>
                        <!-- 일반게시물 s-->
                        <!-- <div class="col-lg-3 col-md-3 col-4 "> -->
                        <div class="col-lg-3  col-md-3 col-sm-1 col-xs-1">
                           <input type="hidden" value="${row.thumbnail }"/>
                           <figure class="recipePhoto" style="width:100px; height:200px;">
                              <img class="img-fluid img-thumbnail"  style="height:100%; width:100%;"
                                 src="./resources/imageUpload/${row.thumbnail }"
                                 alt="">
                              <figcaption>
                                 <h3 style="color:white; text-align:center; vertical-align:middle;">${row.title }</h3>
                                 <p>${row.content }</p>
                                 <i class="ion-ios-arrow-right"></i>
                              </figcaption>
                              <a href="./Rview.do?idx=${row.idx}&nowPage=${nowPage}" class="d-block mb-4 h-100"></a>
                           </figure>
                        </div>
                        <!-- 일반게시물 e-->
                     </c:otherwise>
                  </c:choose>
               </c:forEach>
                  <div class="container">
                     <table width="100%">
                        <tr>
                           <td align="center" style="font-weight: bold; font-size: 1.5em; ">
                              ${pagingImg }
                           </td>
                        </tr>
                     </table>    
                    </div>
               </div>
            </c:otherwise>
         </c:choose>
         <!-- /.container -->
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