
<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.board.noticeDAO"%>
<%@page import="model.board.noticeDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>
<head>
<title>í¸íì  ìì ì¤</title>
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

</head>

<script>
   function scroll_follow(id) {
      $(window).scroll(function() //ì¤í¬ë¡¤ì´ ìì§ì¼ëë§ë¤ ì´ë²¤í¸ ë°ì
      {
         var position = $(window).scrollTop(); // íì¬ ì¤í¬ë¡¤ë°ì ìì¹ê°ì ë°íí©ëë¤.
         var stop = 100; //ìë¨ ë¬´ì¡°ê±´ 100pxë¡ ê³ ì íê¸° ìí´ ì´ ë³ì.
         $(id).stop().animate({
            top : stop + 'px'
         }, 0);
         //í´ë¹ ì¤ë¸ì í¸ ìì¹ê° ì¬ì¤ì 
      });
   }
   scroll_follow("#scroll");
</script>
<style type="text/css">
body {
   font-family: 'Mali', cursive;
   font-family: 'ëëê³ ëì½ë©', cursive
}

#scroll {
   z-index: 10;
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
<style>/**** ë§ì°ì¤ì¤ë² js *****/
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
<!--  ë§ì°ì¤ì¤ë² css start  -->
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
<!-- ë§ì°ì¤ ì¤ë² end  -->
<body class="is-preload homepage">
   <div id="page-wrapper">

      <!-- ë©ì¸íì´ì§ ì°ì¸¡ ì¤í¬ë¡¤ë©ë´ -->
      <!-- <div id="scroll" style="position: absolute; right: 30; top: 200px;"> -->
      <div id="scroll"
         style="position: fixed; right: 50%; top: 100px; margin-right: -720px; text-align: center; width: 120px;">




         <%-- <ul>
            <li><a href="#header">Welcome</a></li>
            <li><a href="#features-wrapper">í¸ìì  ìíì¡°í</a></li>
            <li><a href="#main-wrapper">í¸ìì  ë ìí¼</a></li>
            <li><a href="#notify">ê³µì§ì¬í­</a></li>
            <li><a href="#info">ê³ ê°ì¼í°</a></li>
            <%if(session.getAttribute("EMAIL")==null) { %>
               <li><a href="login.do">ë¡ê·¸ì¸</a></li>
            <%}else{ %>
               <li><a href="logout.do">ë¡ê·¸ìì</a></li>
            <%} %>
         </ul> --%>

         <!-- ì´ë¯¸ì§ë¡ ì¤í¬ë¡¤ ë©ë´ ë³ê²½í¨ -->
         <a href="#"> <img src="images/scoll_welcome.png" alt="welcome"
            style="right: 30; top: 30;" />
         </a> <br /> <a href="#features-wrapper"> <img
            src="images/scoll_product.png" alt="í¸ìì  ìíì¡°í" />
         </a><br /> <a href="#main-wrapper"> <img
            src="images/scoll_recipe.png" alt="í¸ìì  ë ìí¼" />
         </a><br /> <a href="#notify"> <img src="images/scoll_notice.png"
            alt="ê³µì§ì¬í­" />
         </a><br />
         <!--          <a href="#info"> -->
         <!--             <img src="images/scoll_cs.png" alt="ê³ ê°ì¼í°" /> -->
         <!--          </a><br /> -->

         <%
            if (session.getAttribute("EMAIL") == null) {
         %>
         <a href="login.do"><img src="images/scoll_login.png" alt="ë¡ê·¸ì¸" /></a>
         <%
            } else {
         %>
         <a href="memberEdit.do"> <img src="images/scoll_modify.png"
            alt="ì ë³´ìì " />
         </a> <a href="logout.do"> <img src="images/scoll_logout.png"
            alt="ë¡ê·¸ìì" />
         </a>
         <%
            }
         %>
      </div>

      <!-- ë©ì¸ í¤ë ì¸í´ë£¨ë -->
      <%@ include file="general/MainHeader.jsp"%>

      <!-- ë°°ë -->
      <div id="banner-wrapper">
         <div id="banner" class="box container">
            <div class="row">
               <div class="col-7 col-12-medium">
                  <h2>í¸ìì ì í¸íê² :)</h2>
                  <p></p>
               </div>
               <div class="col-5 col-12-medium">
                  <ul>
                     <li><a href="#"
                        class="button large icon solid fa-arrow-circle-right">í¸ìì  ìì ì¤</a></li>
                     <li><a href="#"
                        class="button alt large icon solid fa-question-circle">ë ìì</a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>

      <!-- Features -->
      <div id="features-wrapper">
         <div class="container">
            <div class="row">
               <div class="col-6 col-12-medium">
                  <!-- Box -->
                  <section class="box feature">
                     <a href="right-sidebar.do" class="image featured"><img
                        src="images/store_shadow.png" alt="" /></a>
                     <div class="inner"
                        style="text-align: center; font-family: Goyang;">
                        <header>
                           <h2 style="font-family: Goyang;">í¸ìì  ì°¾ê¸°</h2>
                        </header>
                        <p style="font-family: Goyang; font-size: 25px;">ìíìë ìíì´ ìë
                           í¸ìì ì ì°¾ì ëë¦½ëë¤.</p>
                     </div>
                  </section>
               </div>
               <div class="col-6 col-12-medium">
                  <!-- Box -->
                  <section class="box feature">
                     <a href="placemap.do" class="image featured"><img
                        src="images/product_shadow.png" alt="" /></a>
                     <div class="inner" style="text-align: center;">
                        <header>
                           <h2 style="font-family: Goyang;">ìí ì°¾ê¸°</h2>
                        </header>
                        <p style="font-family: Goyang; font-size: 25px;">ì£¼ë³ í¸ìì ì ìë
                           ìíì ìë ¤ëë¦½ëë¤</p>
                     </div>
                  </section>
               </div>
            </div>
         </div>
      </div>

      <!-- Main -->
      <div id="main-wrapper"> 
         <div class="container">
            <!-- <div class="row gtr-200" style="border :1px solid blue;"> -->
            <div class="row" >

               <!-- preview board  ìì  -->
            <div id="recipe">
                  <section class="widget thumbnails">
                     <h2>ë ìí¼</h2>
                     <div class="row " style=" margin-left: -60px;">

                        <c:choose>
                           <c:when test="${empty recipeRows }">
                              <div>
                                 <span>ê²°ê³¼ê° ììµëë¤.</span>
                              </div>
                           </c:when>
                           <c:otherwise>
                              <c:forEach items="${recipeRows }" var="row" varStatus="loop">
                                 <c:choose>
                                    <c:when
                                       test="${row.recommend eq 3 || row.recommend eq 2 || row.recommend eq 1 }">

                                       <div class="col-lg-3 col-md-4 col-6 effect ">
                                          <figure class="recipePhoto">
                                             <img class="img-fluid img-thumbnail effect"
                                                src="https://www.paris.co.kr/data/product/[2]ham%20egg.jpg"
                                                alt="">
                                             <figcaption>
                                                <h3>${row.title }</h3>
                                                <p>${row.content }</p>
                                                <i class="ion-ios-arrow-right"></i>
                                             </figcaption>
                                             <a href="#" class="d-block mb-4 h-100"></a>
                                          </figure>
                                       </div>

                                    </c:when>
                                    <c:otherwise>

                                       <div class="col-lg-3 col-md-4 col-6 " >
                                          <figure class="recipePhoto">
                                             <img class="img-fluid img-thumbnail effect"
                                                src="https://www.paris.co.kr/data/product/[2]ham%20egg.jpg"
                                                alt="">
                                             <figcaption>
                                                <h3>${row.title }</h3>
                                                <p>${row.content }</p>
                                                <i class="ion-ios-arrow-right"></i>
                                             </figcaption>
                                             <a href="#" class="d-block mb-4 h-100"></a>
                                          </figure>
                                       </div>

                                    </c:otherwise>
                                 </c:choose>
                              </c:forEach>
                           </c:otherwise>
                        </c:choose>
                     </div>
                  </section>
                  <a href="recipe.do" class="button icon solid fa-arrow-circle-right" style="margin-top: -50px;">ëë³´ê¸°</a>
               </div>
            </div>
            <div class="row" >
               <!-- <div class="col-6 col-12-medium" style="border :1px solid grey; width: 100%;"> -->
               <div class="" style=" width: 100%;"> 
                  <!-- Content -->
                  <div id="notify">
                     <section class="last">
                        <table>
                           <tr >
                              <td style=" width: 50%;">
                                 <h2>ê³µì§ì¬í­</h2>
                                 <ul class="main_board_list">
                                    <!-- <div> -->
                                       <table class="table table-hover" style="text-align: center;  margin-left: -50px; " >
                                          <colgroup>
                                             <col width="80px" />
                                             <col width="*" />
                                             <col width="120px" />
                                             <col width="120px" />
                                             
                                          </colgroup>
                                          <thead>
                                             <tr class="table-primary" style="color: white; width: 120%; ">
                                                <th style="text-align: center;"></th>
                                                <th style="text-align: center;">ì ëª©</th>
                                                <th style="text-align: center;">ìì±ì</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <c:choose>
                                                <c:when test="${empty listRows }">
                                                   <tr>
                                                      <td colspan="6" class="text-center">ë±ë¡ë ê²ìë¬¼ì´ ììµëë¤^^*</td>
                                                   </tr>
                                                </c:when>
                                                <c:otherwise>
                                                   <c:forEach items="${listRows }" var="row"
                                                      varStatus="loop">
                                                      <!-- ë¦¬ì¤í¸ë°ë³µìì -->
                                                      <tr>
                                                         <td class="text-center"><i class="fas fa-clipboard-check"  style="color: #608ac9;"></i></td>
                                                         <td class="text-left">
                                                            <a href="./view.do?idx=${row.idx}&nowPage=${nowPage}">${row.title}</a>
                                                         </td>
                                                         <td class="text-center">${row.content }</td>
                                                         <%-- <td class="text-center">${row.view_count }</td> --%>
                                                      </tr>
                                                   </c:forEach>
                                                </c:otherwise>
                                             </c:choose>
                                          </tbody>
                                       </table>
                                    </div>
                                 </ul>
                                 <a href="notice.do" class="button icon solid fa-arrow-circle-right">ëë³´ê¸°</a>
                              </td>
                              <td >
                             
                                 <h2 style="padding-left: 20px;" >ì´ë²¤í¸</h2>
                            
                                 <div>
                                    <table class="table table-hover" style="text-align: center; margin-left: -10px;">

                                       <colgroup>
                                          <col width="80px" />
                                          <col width="*" />
                                          <col width="120px" />
                                          <col width="120px" />
                                       </colgroup>
                                       <thead>
                                          <tr class="table-primary" style="color: white;">
                                             <th style="text-align: center;"></th>
                                             <th style="text-align: center;">ì ëª©</th>
                                             <th style="text-align: center;">ìì±ì</th>
                                            <!--  <th style="text-align: center;">ì¡°íì</th> -->
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <c:choose>
                                             <c:when test="${empty eventRows }">
                                                <tr>
                                                   <td colspan="6" class="text-center">ë±ë¡ë ê²ìë¬¼ì´ ììµëë¤
                                                      ^^*</td>
                                                </tr>
                                             </c:when>
                                             <c:otherwise>
                                                <c:forEach items="${eventRows }" var="row"
                                                   varStatus="loop">
                                                   <!-- ë¦¬ì¤í¸ë°ë³µìì -->
                                                   <tr>
                                                      <%-- <td class="text-center">${row.virtualNum }</td> --%>
                                                      <td class="text-center"><i class="fas fa-gift" style="color: #608ac9;"></i></td>
                                                      <td class="text-left"><a
                                                         href="./Eview.do?idx=${row.idx}   &nowPage=${nowPage}">${row.title}</a>
                                                      </td>
                                                      <td class="text-center">${row.content }</td>
                                                      <%-- <td class="text-center">${row.view_count }</td> --%>
                                                   </tr>
                                                </c:forEach>
                                             </c:otherwise>
                                          </c:choose>
                                       </tbody>
                                    </table>
                                 </div> 
                                 <a href="event.do" class="button icon solid fa-arrow-circle-right" width="40px" height="40px">ëë³´ê¸°</a>
                              </td>
                           </tr>
                        </table>   
                     </section>
                  </div>
               </div>
            </div>
            <!--             <div class="col-7 col-16-medium imp-medium"> -->
            <!--                Content -->
            <!--                <div id="info"> -->
            <!--                   <section class="last"> -->
            <!--                      <h2>ê³ ê°ì¼í°</h2> -->
            <!--                      <h3>ì´ë¶ë¶ì ê³ ê°ì¼í° íì´ì§ ìê°</h3> -->
            <!--                      <a href="qna.do" class="button icon solid fa-arrow-circle-right">ëë³´ê¸°</a> -->
            <!--                   </section> -->
            <!--                </div> -->
            <!--             </div> -->
         </div>
      </div>
      <div class="container">
         <h2>ê°ë°ì¤ì´ë ê´ë¦¬ì íì´ì§ ë§í¬ íì±í.</h2>
         <a href="./admin/index.do">ê´ë¦¬ì íì´ì§ ì¸ë±ì¤ë¡ ã±ã±</a>
         <h4>
            ë¡ê·¸ì¸ í ì´ë©ì¼ :
            <%=session.getAttribute("EMAIL")%></h4>
         <h4>
            ë¡ê·¸ì¸ í íì ì´ë¦ :
            <%=session.getAttribute("NAME")%></h4>
      </div>
      <!-- Footer ì¸í´ë£¨ë. -->
      <%@ include file="general/MainFooter.jsp"%>

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

