<%@page import="model.member.MemberDTO"%>
<%@page import="model.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편히점 - QnA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/main.css" />
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
   @font-face { 
   font-family: 'Goyang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Goyang.woff') format('woff'); 
   font-weight: normal; font-style: normal;
}
nav {
   font-family: 'Goyang', cursive;
}
<style type="text/css">
/* 해당 HTML문서의 기본 폰트 지정하기 */
body {
   font-family: verdana;
   font-size: 12px;
}
</style>
<script>
   $(function() {
      $("#service").attr("class", "current");
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
   
</script>
<body>
   <div id="page-wrapper">
      <!-- 메인헤더 인클루드 -->
      <%@ include file="MainHeader.jsp"%>

      <div
         style="width: 100%; height: 200px; text-align: center; display: table;">
         <p
            style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 60px; color: black; font-weight: bold;">
            <img src="https://image.flaticon.com/icons/svg/263/263062.svg" width="80px" height="80px" /> 
                  QnA
         </p>
      </div>
   
      <div class="container">
         <br />
         <br />

         <div class="row text-right" style="float: right;">
            <h5 style="color: #4c4c4c; font-weight: bold; padding-right: 20px; font-family: Goyang">
               <i class="far fa-bell"></i>&nbsp;무엇이든 물어보세요~
            </h5>
         </div>



         <table class="table table-bordered" style="margin-bottom: -1px;">
            <colgroup>
               <col width="80px" />
               <col width="*" />
               <col width="120px" />
               <col width="120px" />
               <col width="80px" />
               <col width="50px" />
            </colgroup>
            <input type="hidden" name="idx" value="${viewRow.idx }" />
            <br />
            <br />
            <tr>
               <th bgcolor="#f2efef"
                  style="text-align: center; border-top: 5px solid #4c4c4c;border-left: 5px solid #4c4c4c; ">제목</th>
               <td bgcolor="white" style="border-top: 5px solid #4c4c4c; border-right: 5px solid #4c4c4c">${viewRow.title}</td>
            </tr>
            <tr>
               <th bgcolor="#f2efef" style="text-align: center;border-left: 5px solid #4c4c4c; " >작성자</th>
               <td bgcolor="white" style="border-right: 5px solid #4c4c4c">${viewRow.name}
               
               </td>
            </tr>
         
         </table>
      
         <table class="table" bgcolor="white">
            <colgroup>
               <col width="80px" />
               <col width="120px" />
               <col width="80px" />
               <col width="*" />
            </colgroup>
            <tr>
               <th
                  style="text-align: center; border-left: 5px solid #4c4c4c; font-weight: normal;">작성일</th>
               <td>${viewRow.postdate}</td>
               <th style="text-align: center;">조회수</th>
               <td style="border-right: 1px solid #EDEAEA; border-right: 5px solid #4c4c4c">${viewRow.view_count }</td>
            </tr>
            <tr>
               <td colspan="4"
                  style="height: 500px; border-left: 1px solid #EDEAEA;border-left: 5px solid #4c4c4c; border-right: 5px solid #4c4c4c; border-bottom: 5px solid #4c4c4c;">${viewRow.content}
               </td>
            </tr>
         </table>
         <!-- </div> -->
         <br /> <br />
         <input type="hidden" name="email" value="${viewRow.email}" />
         <% if(session.getAttribute("EMAIL")!=null){ %>
         <button type="button" class="btn" onclick="location.href='./reply.do?idx=${viewRow.idx}&nowPage=${nowPage}'; " style="font-family: Goyang">답변글달기</button>
         <% } %>
         <c:choose>
            <c:when test="${EMAIL eq viewRow.email}">
            <button type="button" class="btn" onclick="location.href='./edit.do?idx=${viewRow.idx}&nowPage=${nowPage}';" style="font-family: Goyang">수정하기</button>
         <button type="button" class="btn" id="deleteBtn" onclick="isDelete();" style="font-family: Goyang"">삭제하기</button>
            </c:when>
            <c:otherwise>
               
            </c:otherwise>
         </c:choose>
         
            <button type="button" class="btn btn-dark btn-sm"
               onclick="location.href='./qna.do';" style="font-family: Goyang">리스트</button>
         
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