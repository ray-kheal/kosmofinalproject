<%@page import="util.PagingUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>편히점-재고확인</title>

<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
   rel="stylesheet">

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/main.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
@media (min-width: 420px)  { 

   #cutboard { display: none; }
}
@media screen and (max-width: 420px) { 
   #wideboard { display: none; }

}
</style>
<style>
/* 해당 HTML문서의 기본 폰트 지정하기 */
body {
   font-family: 'verdana';
   font-size: 14px;
}

/* 애니메이션 지점 설정하기 */
/* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
@
keyframes blink {
   from {color: white;
}

30%
{
color :yellow;
}
to {
   color: red;
   font-weight: bold;
}
/* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
}
</style>


</head>
<script>
   $(function() {
      $("#stock").attr("class", "current");
   });
</script>
<body>



   <!-- 헤더파일 인클루드 -->
   <%@ include file="MainHeader.jsp"%>

	
	<div style="width: 100%; text-align: center;  display: table;">
         <p style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 3em; color: black; font-weight: bold;">
            
         </p> 
    </div>
    
	<div id="cutboard">
			<div style="width: 100%;  text-align: center;  display: table;" >
      
		      <p style="display: table-cell; text-align: center; vertical-align: middle; font-family: 'Goyang', cursive;
		         font-size: 40px; color: black; font-weight: bold;">
		         &nbsp;   
		      
		         상품 찾아보기
            <img src="https://image.flaticon.com/icons/svg/2/2215.svg" width="40px"   /> 
		      </p>
	      
	   		</div>
		</div>
	<div id="wideboard">
			<div style="width: 100%;  text-align: center;  display: table;" >
      
		      <p style="display: table-cell; text-align: center; vertical-align: middle; font-family: 'Goyang', cursive;
		         font-size: 60px; color: black; font-weight: bold;">
		         &nbsp;   
		      
                  상품 찾아보기
            <img src="https://image.flaticon.com/icons/svg/2/2215.svg" width="80px"   /> 
		      </p>
	      
	   		</div>
		
		</div>
		
	
	<div class="album py-5 ">

      <div class="container" style="color: black;">
         
      <!-- 가격검색기능 -->
      <form class="form-inline" style=" background-color:#fbfbfb;  border-top: 2px solid #c1c1c1;  border-bottom: 2px solid #c1c1c1; padding-bottom:10px; font-family: Goyang;">    
      <div class="container" style="display:inline-block;width: 40%; font-weight: bold; border-right: 1px solid grey; text-align: center; ">가격대별 검색</div>
      <div class="container" style="display:inline-block;width:60%; padding-top: 14px;" >   
         <ul style=" list-style:none; float: left; "> 
            <li style="float: left;" >
               <input style="float: left; margin-top: 8px;" type="radio" name="priceRange" value="&lt;1500" >
               <label style="float: left;"for="prs_01">&nbsp;1500원 미만</label>
            </li> 
            <li style="float: left; " >
               <input style="float: left; margin-top: 8px;"type="radio" name="priceRange" value="1500to5000" >
               <label style="float: left;"for="prs_02">&nbsp;1500원~5000원</label>
            </li>
            <li style="float: left;" >  
               <input style="float: left; margin-top: 8px;"type="radio" name="priceRange" value="&gt;5000" >
               <label style="float: left;"for="prs_03">&nbsp;5000원 이상</label>
            </li>
         <!--    <li style="float: left;">
               <button class="btn btn-dark" style="font-size: 0.7em;"><i class="fas fa-search"></i></button>
            </li>   -->
         </ul>  
      </div>
       <div class="container" style="display:inline-block;width: 40%; font-weight: bold; border-right: 1px solid grey;text-align: center;  ">상품명 검색</div>
       <div class="container" style=" display:inline-block;width:35%; " >  
             
          <input type="hidden" class="form-control" name="searchColumn" value="product_name" />
          <input type="text" name="searchWord"  style="width: 100%" />
      </div> 
      
        <div style=" display:inline-block; width:25%; text-align: left;">
        
        <button class="btn btn-dark" style=" font-size: 0.7em;"><i class="fas fa-search"></i></button>
        </div>
      </form> 

       <br />    

<<<<<<< HEAD

      
      <p style="font-family: Goyang;">※ 상품을 클릭하시면 제품이 있는 편의점의 재고를 알 수 있습니다.</p>
=======
>>>>>>> branch 'master' of https://github.com/ray-kheal/kosmofinalproject.git
         <!-- 상품 리스트 출력  -->  
         <div class="row ">   
            <c:choose>
               <c:when test="${empty viewRow }">
                  <p class="text-center">등록된 상품이 없습니다.</p>
               </c:when>             
               <c:otherwise>      
                  <c:forEach items="${viewRow }" var="row" varStatus="loop">
                     <div class="col-lg-4 col-md-3 col-4 " style="text-align: center; margin-top: 30px; height: auto;">
                        <!-- 리스트반복시작 -->  
                        <img style="text-align: center; width: 80%"  
                        
                           src="./resources/CSProduct/${row.product_imagename }"
                            /> 
                           <!-- <rect width="100%" height="100%" ></rect>
                           <text x="50%" y="50%" fill="#eceeef" dy=".3em"></text> -->
                           <div>
                           <a style="text-align: center; font-size: 0.8em; font-weight: bold; color: black;" 
                                 href="./product_view.do?product_code=${row.product_code}&name=${row.product_name}&price=${row.product_price }&nowPage=${nowPage}">${row.product_name}</a>
                                                           
                            
                           <p style="text-align: center; color: grey; font-size: 0.9em;  ">${row.product_value}</p>
                           
                           <p  style="margin-top: -15px; font-size: 0.9em;"><img src="images/coin2.png" width="20px" height="20px " />  ${row.product_price} 
                           </p>
                              
                                  
<!--                                  <a><img src="https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678087-heart-256.png" width="20px" height="20px"> -->
<!--                                  <button type="submit" class="btn" style="font-family: Goyang">관심상품!</button></a> -->
                              <%-- <a href="./product_view.do?product_code=${row.product_code}&nowPage=${nowPage}" style="color:black;"><i class="fas fa-heart" ></i></a> --%>
                              
                   	<c:if test="${not empty sessionScope.EMAIL }">
                      	<%
                      	String product_bookmark = (String)session.getAttribute("PRODUCTS_BOOKMARK");              	
                      	%>
                           	<c:set var="productBookmark" value="<%=product_bookmark %>" />
	                  		<c:choose>  
               					<c:when test="${not empty productBookmark }">
                         	   		<c:choose>      
	                              		<c:when test="${row.product_code eq productBookmark}">
			                           	 	 <a style="text-align: center; font-size: 0.8em; font-weight: bold; color: red;" 
				                             	href="deleteBookmarkProduct.do?product_bookmark=${productBookmark }">
				                             	<img src="./images/price_star_in.png" width="18px" />관심상품 해제
				                           	 </a>
		                           	 	</c:when>
		                           	 	 <c:otherwise>
				                             <a style="text-align: center; font-size: 0.8em; font-weight: bold; color: black;" 
				                             	href="bookmarkProduct.do?product_code=${row.product_code}">
				                             	<img src="./images/price_star_out.png" width="18px" />관심상품 등록
			                           	 	 </a>
	                        	  		</c:otherwise>
                       	  			</c:choose>   
                           	 </c:when>
                           	 
                      		 <c:otherwise>
	                           <a style="text-align: center; font-size: 0.8em; font-weight: bold; color: black;" 
	                           	href="bookmarkProduct.do?product_code=${row.product_code}">
	                           		<img src="./images/price_star_out.png" width="18px" />관심상품 등록
                       	 	 	</a>
                       	  	</c:otherwise>
                     	 </c:choose>    	
                   	</c:if>
                           </div>
                           <%-- <small   class="text-muted">
                            <img src="images/coin2.png" width="20px" height="20px" />${row.product_price}</small> --%>
                           
                        <%-- <a href="./product_view.do?product_code=${row.product_code}&nowPage=${nowPage}"
                           class="btn btn-sm btn-outline-secondary">${row.product_name }</a>  --%>
                           <!-- 리스트반복끝 -->
                     </div>
                  </c:forEach>  
               </c:otherwise> 
            </c:choose>
         </div>  
</div>

         <br /> <br />  
         <!--    <ul class="pagination justify-content-center"> -->
         <div class="container">
            <table style="width: 100%;">
               <tr>
                  <td align="center" style="font-weight: bold; font-size: 1.5em;">
                     ${pagingImg }</td>
               </tr>
            </table>
         </div>

         <!-- </ul> -->

         <!-- Footer -->
         <%@ include file="../general/simpleFooter.jsp"%>

         <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.dropotron.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>

      </div>
</body>
</html>   