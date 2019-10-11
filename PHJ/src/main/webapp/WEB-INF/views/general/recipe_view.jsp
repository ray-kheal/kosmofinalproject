<%@page import="model.member.MemberDAO"%>
<%@page import="model.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편히점 - 레시피</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<style type="text/css">
/* 해당 HTML문서의 기본 폰트 지정하기 */
body {
   font-family: verdana;
   font-size: 12px;
}
</style>
<script>
   $(function() { 
      $("#recipe").attr("class", "current");
   });
   
   //삭제여부 확인
   function isDelete(){
       result = confirm('삭제하시겠습니까?');
       
       if(result){
           location.href = "delete.do?idx=${viewRow.idx}&nowPage=${nowPage}";
       }else{
          return false;
       }
   }
   
   //추천하기    
   function isRecommend(){
       result = confirm('추천하시겠습니까?');
       
       if(result){
           location.href = "recommend.do?idx=${viewRow.idx}&nowPage=${nowPage}";
       }else{
          return false;
       }
   }
   //코멘트 삭제여부 확인
	   function isCommentDelete(){
	       result = confirm('삭제하시겠습니까?');
	       
	       if(result){
	           location.href = "commentDelete.do?idx=${viewRow.idx}&nowPage=${nowPage}";
	       }else{
	          return false;
	       }
	   }
   
   
</script>
<body>
   <div id="page-wrapper">
      <!-- 메인헤더 인클루드 -->
      <%@ include file="MainHeader.jsp"%>


      <div
         style="width: 100%; height: 200px; text-align: center;display: table;">
         <p
         style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 60px; color: black; font-weight: bold;">
               RECIPE
            <img src="https://image.flaticon.com/icons/svg/1411/1411258.svg" width="80px" height="80px" /> 
      </p>
      </div>



      <div class="container">
         <br />
         <br />

         <div class="row text-right" style="float: right;">
            <h5 style="color: #4c4c4c; font-weight: bold; padding-right: 20px;">
               <i class="fas fa-utensils"></i>&nbsp; 레시피자랑 
            </h5>
            
         </div>
         <input type="hidden" name="idx" value="${viewRow.idx }" />
         <input type="hidden" name="nowPage" value="${nowPage }" />
   
         
         
            
         <table class="table " style="margin-bottom: -1px;">
            <colgroup>
               <col width="80px" />
               <col width="*" />
               <col width="120px" />
               <col width="120px" />
               <col width="80px" />
               <col width="50px" />
            </colgroup>
                     
            <tr>  
               <td style="text-align:center; width: 70%; background-color:white;  text-align: center; padding-top:15px;  border-top: 5px solid #4c4c4c; border-bottom: 5px solid #4c4c4c;">
               
               
               <div style="font-size: 1.6em; font-weight: bold; font-style: italic; "> <mark>"${viewRow.title}"</mark> </div>
               
                
               <p style="font-size: 1.2em; font-style: italic; font-family:Goyang; ">  <mark>by.${viewRow.name}  </mark></p> 
               <p style=" text-align:right; ">조회수: ${viewRow.view_count }</p>
               <p style=" text-align:right; ">게시일: ${viewRow.postdate} </p>
               <p style=" text-align:right; ">추천수: ${viewRow.BTNRECOMMEND }</p>
               
   

               <p style="font-size: 0.8em; ">${viewRow.content}</p> 
               </td>
               
            </tr> 
         </table>
         <br />
         
         
         <c:forEach items="${fn:split(viewRow.content, '#') }" var="item" varStatus="status">
		    <c:if test="${status.index eq 1}"><!-- 1번째(#뒤에꺼)-->
		    
		    	 <c:forEach items="${fn:split(item, '</p>') }" var="item2" varStatus="status">
				    <c:if test="${status.index eq 0}"><!-- 0번째(앞꺼)-->
				    		 <div>
				    		 	<p style="font-size: 1.2em; font-weight: bold;">이 상품을 사용했어요! </p>  
				    		 	<p>&nbsp;&nbsp;<mark style="background-color: #f2f2f2; color: #3b72e2; border-radius: 7px;">#${item2 }</mark></p>
			         			<input type="hidden" name="item2" value="${item2 }" />
			         			<input type="hidden" name="nowPage" value="${nowPage }" />
								<a href="./reci_product_view.do?name=${item2 }">
								
								<img style="text-align: center; width: 25%"  src="./resources/CSProduct/${item2 }.jpg"   />
								</a>
			         		</div>
					</c:if>	
				</c:forEach>
			</c:if>	
		</c:forEach>
		
		
	<%-- 	<c:set var="spliContent" value="${fn:split(spliContent, '</p>') }"></c:set> --%>
         
		    	
			
        		<div id="replyList">
       			<div style="font-family:Goyang; font-weight:bolder; padding:10px; border-bottom: 1px solid #999999;">
        			<span>댓글  ${TotalCount }개</span>
				</div>
				<c:choose>

               <c:when test="${empty cDto }">
                  <p class="text-center">등록된 댓글이 없습니다.</p>
               </c:when>             
               <c:otherwise>      
                  <c:forEach items="${cDto }" var="commentdto" varStatus="loop">
                     <div>
                        <!-- 리스트반복시작 -->  
                          <table style="margin-bottom:1px; height: auto; border-bottom: 1px solid #999999; font-family: Goyang;">
                          <col width="15%" />
             			  <col width="*" />
             			  <col width="30%" />
                             <tr >
                                <td rowspan="2" style="margin-left: 20px;text-align: center;"> 
                                    <img src="images/pic-2.png" style="text-align: center; width: 35px;" alt="" />
                                 </td>
                                 <td style="border-bottom: 1px solid white;">
                                   <span style="font-weight: bold; font-size: 0.9em;">${commentdto.writer}</span>
                                </td>
                                  
                                <td style="border-bottom: 1px solid white;"> 
                                	<span style="font-size:14px; color:gray; float: right">${commentdto.comment_date}</span>
                                </td>
                             </tr>
                             <tr>
                               <td >  
                               ${commentdto.content}
                               </td>
                                   
                                <td>  
                                	<c:choose>
           							<c:when test="${EMAIL eq commentdto.email}">
                                   		<button type="button"  class="btn" onclick="isCommentDelete();" style="font-family: Goyang; float: right">삭제하기 </button>
                                   	 </c:when>
							            <c:otherwise>
							               
							            </c:otherwise>
							         </c:choose>
							    </td>
                             </tr>
                             
                           
                          </table>   
                      </div> 
                  </c:forEach>  
               </c:otherwise> 
            </c:choose>
         
         </div>
         <%if(session.getAttribute("EMAIL")!=null){ %>
         <div>
         <form id="commentForm" name="commentForm" method="post" action="recipe_commentAction.do">
            <table class="table table-borderless" style=" border-top: 1px solid #f6f6f6; " >
               <col width="20%" />
               <col width="*" />
               <col width="20%" />
               <tr>     
                  <td style="text-align:right;">
                  <%String b_code =request.getParameter("idx"); %>
                     <input type="hidden" id="b_code" name="idx" value="<%=b_code %>"/>
                     <input type="hidden" id="writer" name="writer" value="<%=session.getAttribute("NAME") %>" />
                     <img src="images/pic-2.png" alt="" />
                  </td>
                 
                  <td>
                     <input type="text" class="" style=" width: 100%; height: 200%; "id="content" name="content" />
                  </td>
                  <td>
                     <button class="btn btn-sm"  style="background-color: #7f7b9e; color:white;">답글달기</button>
                  </td>
            
               </tr>
            </table> 
         </form> 
      </div>
              <% } %> 
         <!-- </div> -->
         <br /> <br />

       <input type="hidden" name="email" value="${viewRow.email}" />
       <div class="container">
                     <table width="100%">
                        <tr>
                           <td align="center" style="font-weight: bold; font-size: 1.5em; ">
                              ${pagingImg }
                           </td>
                        </tr>
                     </table>    
                    </div>
         <c:choose>
            <c:when test="${EMAIL eq viewRow.email}">
            <button type="button" class="btn" onclick="location.href='./edit.do?idx=${viewRow.idx}&nowPage=${nowPage}';" style="font-family: Goyang">수정하기</button>
             <button type="button" class="btn" id="deleteBtn" onclick="isDelete();" style="font-family: Goyang">삭제하기</button>
              
                    
            </c:when>
            <c:otherwise>
               
            </c:otherwise>
                  
            
         </c:choose>
         <button type = "button" class="btn" id ="recommendBtn" onclick = "isRecommend();" style="font-family: 'Goyang';" >
         <img src="https://image.flaticon.com/icons/svg/470/470289.svg" width="40px" height="40px"/>    추천하기</button>
         <div class="row text-right" style="float: right;">
            <button type="button" class="btn"
               onclick="location.href='./recipe.do';" style="font-family: 'Goyang'; font-size: 30px;">
                  <img src="https://image.flaticon.com/icons/svg/1086/1086563.svg" width="30px" height="30px"/>리스트</button>

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