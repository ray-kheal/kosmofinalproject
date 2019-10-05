<%@page import="model.member.MemberDAO"%>
<%@page import="model.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%-- 
			<div class="row text-right" style="float: right;">
				<h5 style="color: #4c4c4c; font-weight: bold; padding-right: 20px;">
					<i class="fas fa-utensils"></i>&nbsp; 레시피자랑 
				</h5>
				
			</div>
			<input type="hidden" name="idx" value="${viewRow.idx }" />
			<input type="hidden" name="nowPage" value="${nowPage }" />
			
			<table class="table table-bordered" style="margin-bottom: -1px;">
				<colgroup>
					<col width="80px" />
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
					<col width="80px" />
					<col width="50px" />
				</colgroup>
							
				<tr>
					<th bgcolor="#f2efef"
						style="text-align: center; border-top: 5px solid #82b9e4;">제목</th>
					<td bgcolor="white" style="border-top: 5px solid #82b9e4;">${viewRow.title}</td>
				</tr>
				<tr>
					<th bgcolor="#f2efef" style="text-align: center;">작성자</th>
					<td bgcolor="white">${viewRow.name}
=======
>>>>>>> branch 'master' of https://github.com/ray-kheal/kosmofinalproject.git

<<<<<<< HEAD
					</td>
				</tr>
			
			</table>
		
			<table class="table" bgcolor="white">
				<colgroup>
					<col width="80px" />
					<col width="120px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
				</colgroup>
				<tr>
					<th
						style="text-align: center; border-left: 1px solid #EDEAEA; font-weight: normal;">작성일</th>
					<td>${viewRow.postdate}</td>
					<th style="text-align: center;">조회수</th>
					<td style="border-right: 1px solid #EDEAEA;">${viewRow.view_count }</td>
					<th style="text-align: center;">추천수</th>
					<td style="border: 1px solid #EDEAEA;">${viewRow.BTNRECOMMEND}</td>
				</tr>
				<tr>
					<td colspan="6"
						style="height: 500px; border-left: 1px solid #EDEAEA; border-right: 1px solid #EDEAEA; border-bottom: 5px solid #82b9e4;">${viewRow.content}
					</td>
				</tr>
			</table>
			
			
				
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
					<td style="text-align:center;  background-color:white;  text-align: center; padding-top:15px;  border-top: 5px solid #4c4c4c; border-bottom: 5px solid #4c4c4c;">
					
					
					<p style="font-size: 1.6em; font-weight: bold; font-style: italic; "> <mark>"${viewRow.title}"</mark> </p>
					
					 
					<p style="font-size: 1.2em; font-style: italic; font-family:Goyang; ">  <mark>by.${viewRow.name}  </mark></p> 
					<p style=" text-align:right; ">조회수: ${viewRow.view_count }</p>
					<p style=" text-align:right; ">게시일: ${viewRow.postdate} </p>
					<p style=" text-align:right; ">조회수: ${viewRow.view_count }</p>
					
					
	
					
					<p>${viewRow.content}</p>
					
					<p> </p> 
					</td>
					
				</tr>
			  
			
			</table>
			<p style="margin-left: 100px;">댓글 ?개</p>   --%>
			<%-- <table class="table table-borderless" style=" border-top: 1px solid #f6f6f6; " >
				<col width="20%" />
				<col width="*" />
				<col width="20%" />
				<tr>     
					<td style="text-align:right;">
						<img src="images/pic-2.png" alt="" />
					</td>
					<td>
						<input type="text" style=" width: 100%; height: 200%; " />
					</td>
					<td>
						<button class="btn btn-sm" style="background-color: #7f7b9e; color:white;">답글달기</button>
					</td>
				</tr>
			</table>   --%>
			<%-- <%@ include file ="./recipe_comment.jsp" %> --%>
<!-- 			<div> -->
<%-- 	<form id="commentForm" name="commentForm" method="post" action="recipe_commentAction.do">
		<table class="table table-borderless" style=" border-top: 1px solid #f6f6f6; " >
			<col width="20%" />
			<col width="*" />
			<col width="20%" />
			<tr>     
				<td style="text-align:right;">
				<%String b_code =request.getParameter("idx"); %>
					<input type="hid-den" id="b_code" name="b_code" value="<%=b_code %>"/>
					<input type="hid-den" id="writer" name="writer" value="<%=session.getAttribute("NAME") %>" />
					<img src="images/pic-2.png" alt="" />
				</td>
				<td>
					<input type="text" style=" width: 100%; height: 200%; "id="content" name="content" value="" />
				</td>
				<td>
					<button class="btn btn-sm"  style="background-color: #7f7b9e; color:white;">답글달기</button>
				</td>
			</tr>
		</table> 
	</form> 
======= --%>
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
      <%--    
         <table class="table table-bordered" style="margin-bottom: -1px;">
            <colgroup>
               <col width="80px" />
               <col width="*" />
               <col width="120px" />
               <col width="120px" />
               <col width="80px" />
               <col width="50px" />
            </colgroup>
                     
            <tr>
               <th bgcolor="#f2efef"
                  style="text-align: center; border-top: 5px solid #82b9e4;">제목</th>
               <td bgcolor="white" style="border-top: 5px solid #82b9e4;">${viewRow.title}</td>
            </tr>
            <tr>
               <th bgcolor="#f2efef" style="text-align: center;">작성자</th>
               <td bgcolor="white">${viewRow.name}

               </td>
            </tr>
         
         </table>
      
         <table class="table" bgcolor="white">
            <colgroup>
               <col width="80px" />
               <col width="120px" />
               <col width="80px" />
               <col width="80px" />
               <col width="80px" />
               <col width="80px" />
            </colgroup>
            <tr>
               <th
                  style="text-align: center; border-left: 1px solid #EDEAEA; font-weight: normal;">작성일</th>
               <td>${viewRow.postdate}</td>
               <th style="text-align: center;">조회수</th>
               <td style="border-right: 1px solid #EDEAEA;">${viewRow.view_count }</td>
               <th style="text-align: center;">추천수</th>
               <td style="border: 1px solid #EDEAEA;">${viewRow.BTNRECOMMEND}</td>
            </tr>
            <tr>
               <td colspan="6"
                  style="height: 500px; border-left: 1px solid #EDEAEA; border-right: 1px solid #EDEAEA; border-bottom: 5px solid #82b9e4;">${viewRow.content}
               </td>
            </tr>
         </table> --%>
         
         
            
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
               <td style="text-align:center;  background-color:white;  text-align: center; padding-top:15px;  border-top: 5px solid #4c4c4c; border-bottom: 5px solid #4c4c4c;">
               
               
               <p style="font-size: 1.6em; font-weight: bold; font-style: italic; "> <mark>"${viewRow.title}"</mark> </p>
               
                
               <p style="font-size: 1.2em; font-style: italic; font-family:Goyang; ">  <mark>by.${viewRow.name}  </mark></p> 
               <p style=" text-align:right; ">조회수: ${viewRow.view_count }</p>
               <p style=" text-align:right; ">게시일: ${viewRow.postdate} </p>
               <p style=" text-align:right; ">조회수: ${viewRow.view_count }</p>
               
               
   
               
               <p>${viewRow.content}</p> 
          	 
               </td>
               
            </tr>
         
         </table>
        		<div id="replyList">
       			<div style="font-family:Goyang; font-weight:bolder; padding:10px; border-bottom: 1px solid #999999;">
        			<span>댓글 ${b_code }개</span>
				</div>
				<c:choose>
               <c:when test="${empty cDto }">
                  <p class="text-center">등록된 댓글이 없습니다.</p>
               </c:when>             
               <c:otherwise>      
                  <c:forEach items="${cDto }" var="commentdto" varStatus="loop">
                     <div>
                        <!-- 리스트반복시작 -->  
                          <table style="margin-bottom:1px; height: auto; border-bottom: 1px solid #999999;">
                          	<tr>
                          		<td> 
	                          		<span style="font-weight:bold;">${commentdto.writer}</span> <br />
	                          		${commentdto.content} <br />
	                          		<span style="font-size:14px; color:gray;">${commentdto.comment_date}</span> 
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
		               <input type="hidden" id="b_code" name="b_code" value="<%=b_code %>"/>
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
       
         <c:choose>
            <c:when test="${EMAIL eq viewRow.email}">
            <button type="button" class="btn" onclick="location.href='./edit.do?idx=${viewRow.idx}&nowPage=${nowPage}';" style="font-family: Goyang">수정하기</button>
             <button type="button" class="btn" id="deleteBtn" onclick="isDelete();" style="font-family: Goyang"">삭제하기</button>
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