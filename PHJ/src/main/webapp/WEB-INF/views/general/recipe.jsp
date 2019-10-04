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
      style="width: 100%; height: 200px; text-align: center;  display: table; background-image:url(images/fork2.png);">
      <br /> <br /> <br />
      <p
         style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 60px; color: white; font-weight: bold;">
          RECIPE <br />
      </p>
   </div> 

      <!-- Page Content --> 
      <div class="container">
         <div class="container">
            <hr class="mt-2 mb-2">
               <form id="buttonBox" class="form-inline" onsubmit="return InputSearch(this);">
                  <select name="searchColumn" class="form-control" style="margin-left:10px; width:100px;">
                     <option value="title">제목</option>
                     <option value="content">내용</option>
                  </select>
                  <input type="text" name="searchWord" class="form-control"
                     style="width:230px; margin-left:5px;" />
                  <div style="margin-left:10px;">
                     <button type="submit" class="btn">
                     검색 <img src="https://image.flaticon.com/icons/svg/148/148928.svg" width="25px" height="25px"/>
                  </button>
                  </div>
               </form>
               <hr class="mt-2 mb-2">  
               <br />
               <div class="row text-right">
               <%if(session.getAttribute("EMAIL") != null) { %> 
                   <form action="recipe_edit.do" method="post">
               <button type="submit" class="btn btn-dark btn-sm">글쓰기</button>
                     </form>
                  <%} %>
               </div>
         
                <div class="container" style="text-align: center;  margin-bottom: 20px;"> 
                <div style="border: 2px solid gold; width: " >
                 <div class=" text-center"  style="text-align: center; "> 
                  <c:forEach items="${listRows }" var="row" varStatus="loop">
                  <c:choose>  
                     <c:when test="${row.recommend eq 3 || row.recommend eq 2 || row.recommend eq 1 }">
                        <!-- 베스트게시물 s-->
                        <div class="  " style=" display:inline-block;">
                           <!-- <span class="badge badge-primary">BEST</span> -->
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
                           <div style="  color: #444444 ; font-size: 4em; font-weight: 650; height: 100px; position: relative; z-index: 2;">
            BEST RECIPE 
            </div>  
            <div style=" color: #4398D1; font-size: 4em; font-weight: 650; height: 100px; position: relative; left: 5px;  top: -95px; z-index: 1;">
            BEST RECIPE  
            </div>  
                        </div>
                          
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
                       <%--  <!-- 베스트게시물 s-->
                        <div class="col-lg-3 col-md-4 col-6 effect ">
                           <input type="hidden" value="${row.thumbnail }"/>
                           <figure class="recipePhoto" style="width:100px; height:200px;">
                              <img class="img-fluid img-thumbnail effect" style="height:100%; width:100%;"
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
                        <!-- 베스트게시물 e-->        --%>              

                     </c:when>
                     <c:otherwise>
                        <!-- 일반게시물 s-->
                        <div class="col-lg-3 col-md-4 col-6 ">
                           <input type="hidden" value="${row.thumbnail }"/>
                           <figure class="recipePhoto" style="width:100px; height:200px;">
                              <img class="img-fluid img-thumbnail effect" style="height:100%; width:100%;"
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