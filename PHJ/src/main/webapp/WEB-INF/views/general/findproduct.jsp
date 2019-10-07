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
<!-- 텍스트 색상 강조  -->
   <script>
      $(function() {
         $('#foo').rainbow(
               {
                  animate : true,
                  animateInterval : 100,
                  colors : [ '#FF0000', '#f26522', '#fff200', '#00a651',
                        '#28abe2', '#2e3192', '#6868ff' ]
               });
         $('#bar').rainbow(
               {
                  animate : true,
                  animateInterval : 50,
                  pauseLength : 500,
                  pad : true,
                  colors : [ 'rgb(153, 204, 255);',
                        'rgb(173, 224, 255);', 'rgb(193, 244, 255);',
                        'rgb(213, 264, 255);', 'rgb(193, 244, 255);',
                        'rgb(173, 224, 255);', 'rgb(153, 204, 255);' ]
               });
         $('#baz').rainbow(
               {
                  animate : true,
                  animateInterval : 10,
                  colors : [ '#FF0000', '#f26522', '#fff200', '#00a651',
                        '#28abe2', '#2e3192', '#6868ff' ]
               });
      });
   </script>
<body>

   <!-- <div style="width:100%; height:200px; text-align: center; background-color: #82b9e4; display:table;"> 
       <p style="display:table-cell; text-align:center; vertical-align:middle; font-family:Arial; font-size: 60px; color: white; font-weight: bold;">
       BOARD
       </p> 
   </div> 
   <div style="width:100%; text-align: center;">
   <br /><br />
      <img src="./images/memo.png" alt="메모" style=" width:100px; height: 100px;"/>
   </div> -->

   
   
   <!-- 헤더파일 인클루드 -->
   <%@ include file="MainHeader.jsp" %>



   




 <!-- <div
         style="width: 100%; height: 200px; text-align: center;  display: table;">
         <p
            style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 60px; color: black; font-weight: bold;">
            
                  편의점 정보가 여기에!
            <img src="https://image.flaticon.com/icons/svg/2/2215.svg" width="80px" height="80px" /> 
         </p>
      </div>
   
   <div style="width: 100%; text-align: center;">
      <br /> <br />

   </div>

   <div class="container">
      <br /> <br />
      검색기능
      <form class="form-inline">

         <div class="form-group" style="text-align: center; display: block;"> -->
         <!--    <select name="keyField" class="form-control">
               <option value="">메뚜기가족</option>
               <option value="">지예쓰</option>
               <option value="">씨유~</option>
               <option value="">77777777777</option>
<<<<<<< HEAD
               <option value="">작은멈춤</option> </select>-->
             <!-- <select name="searchColumn" class="form-control">
=======
<<<<<<< HEAD
=======
               <option value="">작은멈춤</option> 
            </select>-->
<!--              <select name="searchColumn" class="form-control">
>>>>>>> branch 'master' of https://github.com/ray-kheal/kosmofinalproject.git
               <option value="product_value">종류</option>
                <option value="product_price">가격</option>
                               <option value="">씻을거리</option>
               <option value="">기타디리링~</option>

            </select> <select name="keyField" class="form-control">
               <option value="">하우머치?</option>
               <option value="">가격이 낮아요</option>
               <option value="">오 가격이 높네</option>
            </select> <input type="text" id="product" name="searchWord"  />

            <button type="submit" class="btn">검색 
            <img src="https://image.flaticon.com/icons/svg/148/148928.svg"
                  width="25px" height="25px" /><i
                  class="glyphicon glyphicon-search"></i>
            </button> -->
<!--          </div>
      </form>

      검색기능 끝
      <br />
      <button type="submit" onclick="" class="btn btn-info">EVENT</button>
      &nbsp;
      <button type="submit" onclick="" class="btn btn-danger">품절임박</button>
      &nbsp;
      <button type="submit" onclick="" class="btn btn-warning">BEST</button>
      &nbsp; <br /> <br /> -->
   
 
  
<div class="album py-5 ">
 <div style="width: 100%; height: 200px; text-align: center;  display: table;">
         <p style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 60px; color: black; font-weight: bold;"> 
                  편의점 정보가 여기에!
            <img src="https://image.flaticon.com/icons/svg/2/2215.svg" width="80px" height="80px" /> 
         </p>
      </div>
   <div style="width: 100%; text-align: center;">
      <br /> <br />

   </div>

   <div class="container">
      <br /> <br />
      <!-- 검색기능 -->
      <form class="form-inline">

         <div class="form-group" style="text-align: center; display: block;">
         <!--    <select name="keyField" class="form-control">
               <option value="">메뚜기가족</option>
               <option value="">지예쓰</option>
               <option value="">씨유~</option>
               <option value="">77777777777</option>
>>>>>>> branch 'master' of https://github.com/ray-kheal/kosmofinalproject.git
               <option value="">작은멈춤</option> </select>-->
             <!-- <select name="searchColumn" class="form-control">
               <option value="product_value">종류</option>
                <option value="product_price">가격</option>
                               <option value="">씻을거리</option>
               <option value="">기타디리링~</option>

            </select> <select name="keyField" class="form-control">
               <option value="">하우머치?</option>
               <option value="">가격이 낮아요</option>
               <option value="">오 가격이 높네</option>
            </select> <input type="text" id="product" name="searchWord"  />

            <button type="submit" class="btn">검색 
            <img src="https://image.flaticon.com/icons/svg/148/148928.svg"
                  width="25px" height="25px" /><i
                  class="glyphicon glyphicon-search"></i>
            </button> -->
         </div>
      </form>

<!--       검색기능 끝
      <br />
      <button type="submit" onclick="" class="btn btn-info">EVENT</button>
      &nbsp;
      <button type="submit" onclick="" class="btn btn-danger">품절임박</button>
      &nbsp;
      <button type="submit" onclick="" class="btn btn-warning">BEST</button>
      &nbsp; <br /> <br />
   
<<<<<<< HEAD
<div class="album py-5 ">
 -->
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
<!-- =======
<<<<<<< HEAD
      
      
      가격검색기능
      <form class="form-inline" style="border-top: 3px solid #448ad6;  border-bottom: 1px solid #c1c1c1; font-family: Goyang;">    
      <div class="container" style="display:inline-block;width: 40%; font-weight: bold; border-right: 1px solid grey; ">가격대별 검색</div>
      <div class="container" style="display:inline-block;width:60%; padding-top: 14px;" >   
         <ul style=" list-style:none; float: left; "> 
            <li style="float: left;"> 
               <label for="prs_01">가격대 검색</label>
            </li>
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
            <li style="float: left;">
               <button class="btn btn-dark" style="font-size: 0.7em;"><i class="fas fa-search"></i></button>
            </li>  
         </ul>  
      </div>
      </form> 
          
         
      <br />    
      
    
=======
         
      가격검색기능
      <form class="form-inline" style=" background-color:#fbfbfb;  border-top: 2px solid #c1c1c1;  border-bottom: 2px solid #c1c1c1; padding-bottom:10px; font-family: Goyang;">    
      <div class="container" style="display:inline-block;width: 40%; font-weight: bold; border-right: 1px solid grey; ">가격대별 검색</div>
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
            <li style="float: left;">
               <button class="btn btn-dark" style="font-size: 0.7em;"><i class="fas fa-search"></i></button>
            </li>  
         </ul>  
      </div>
       <div class="container" style="display:inline-block;width: 40%; font-weight: bold; border-right: 1px solid grey; ">상품명 검색</div>
       <div class="container" style=" display:inline-block;width:35%; " >  
             
          <input type="hidden" class="form-control" name="searchColumn" value="product_name" />
          <input type="text" name="searchWord"  style="width: 100%" />
      </div> 
      
        <div style=" display:inline-block; width:25%; text-align: left;">
        
        <button class="btn btn-dark" style=" font-size: 0.7em;"><i class="fas fa-search"></i></button>
        </div>
      </form> 
       <br />    
>>>>>>> branch 'master' of https://github.com/ray-kheal/kosmofinalproject.git
>>>>>>> branch 'master' of https://github.com/ray-kheal/kosmofinalproject.git -->
       <br />  
       
         
<!-- 

      
      가격검색기능
      <form class="form-inline" style="border-top: 3px solid #448ad6;  border-bottom: 1px solid #c1c1c1; font-family: Goyang;">    
      <div class="container" style="display:inline-block;width: 40%; font-weight: bold; border-right: 1px solid grey; ">가격대별 검색</div>
      <div class="container" style="display:inline-block;width:60%; padding-top: 14px;" >   
         <ul style=" list-style:none; float: left; "> 
            <li style="float: left;"> 
               <label for="prs_01">가격대 검색</label>
            </li>
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
            <li style="float: left;">
               <button class="btn btn-dark" style="font-size: 0.7em;"><i class="fas fa-search"></i></button>
            </li>  
         </ul>  
      </div>
      </form> 
          
         
      <br />    
      

>>>>>>> branch 'master' of https://github.com/ray-kheal/kosmofinalproject.git
      
      <p style="font-family: Goyang;">※ 상품을 클릭하시면 제품이 있는 편의점의 재고를 알 수 있습니다.</p>
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
                        <img style="text-align: center;"  
                           src="./resources/CSProduct/${row.product_imagename }"
                           width="80%" height="80%" ; /> 
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
			                           	 	 <a style="text-align: center; font-size: 0.8em; font-weight: bold; color: black;" 
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