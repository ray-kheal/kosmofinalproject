<%@page import="model.board.serviceDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>편히점 - QnA</title>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no">
<link href="https://fonts.googleapis.com/css?family=Goyang&display=swap" rel="stylesheet">

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
/* 해당 HTML문서의 기본 폰트 지정하기 */
body {
   font-family: verdana;
   font-size: 12px;
}
</style>
<style>
@media  (min-width: 420px) { 

   #cutboard { display: none; }
}
@media screen and (max-width: 420px) { 
   #wideboard { display: none; }

}
</style>
<style type="text/css">
@font-face { 
   font-family: 'Goyang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Goyang.woff') format('woff'); 
   font-weight: normal; font-style: normal;
}
nav {
   font-family: 'Goyang', cursive;
}
#nore{
   background-position:50%; 
   background-repeat:no-repeat;
   
}

/*    .container { */
/*        background-image: url("images/backimg1.png");  */
/*       margin: 0 auto; */
/*       text-align: center; */
/*       background-repeat: no-repeat; */
/*       background-position: 50% 50%; */
/*       background-attachment: fixed; */
/*       background-size: cover; */
/*       height: 700px; */
/*    } */
</style>
<script>
   $(function() {
      $("#service").attr("class", "current");
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
   <div id="page-wrapper" >
      <!-- 메인헤더 인클루드 -->
      <%@ include file="MainHeader.jsp"%>

     

      

         <!-- ------------------------------------------------------------------------pc용-->       
         <div id="wideboard" >
          <div id="nore"
            style="width: 100%; height: 200px; text-align: center;  display: table; ">
            <p
               style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 60px; color: black; font-weight: bold;">
               <!-- <img src="images/memo_w.png" alt="메모"
                  style="width: 50px; height: 50px;" /> -->
   
                  <img src="https://iconmonstr.com/wp-content/g/gd/makefg.php?i=../assets/preview/2018/png/iconmonstr-marketing-23.png&r=0&g=0&b=0" width="80px" height="80px" /> 
                     QnA 
                  <img src="https://image.flaticon.com/icons/svg/76/76818.svg" width="80px" height="80px" /> 
   
            </p>
         </div>
         <div class="container">
<<<<<<< HEAD
	         <div class="container" >
	         <br /> <br /> 
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
	              
	              <button class="btn btn-dark " style=" font-size: 0.7em;  margin-top: 10px;"><i class="fas fa-search"></i></button>
	              </div>
	            </form> 
	            
	            <br />
	         <!-- 검색기능 끝 -->
	
	         <br />
	  	 </div> 
       		  <div style="text-align: right; font-family: Goyang;">
               <%if(session.getAttribute("EMAIL") != null) { %> 
=======
            <div class="container" >
            <br /> <br /> 
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
                 
                 <button class="btn btn-dark " style=" font-size: 0.7em;  margin-top: 10px;"><i class="fas fa-search"></i></button>
                 </div>
               </form> 
               
               <br />
            <!-- 검색기능 끝 -->
   
            <br />
         </div>
               <div style="text-align: right; font-family: Goyang;">
               <%if(session.getAttribute("EMAIL") != null) { %> 
>>>>>>> branch 'master' of https://github.com/ray-kheal/kosmofinalproject.git

<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/ray-kheal/kosmofinalproject.git
                  <form action="write.do" method="post">
               		<button type="submit" class="btn btn-dark btn-sm">글쓰기</button>
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/ray-kheal/kosmofinalproject.git

                  </form>
                  <%} %>
                  <br />
             </div>
         
            <table class="table table-hover" style="text-align: center;">
               <colgroup>
                  <col width="10%" />
                  <col width="*" />
                  <col width="15%" />
                  <col width="15%" />
                  <col width="18%" />
               </colgroup>  
               <thead>
                  <tr class="" style="color: black; background-color:#81d1d1;">
                     <th style="text-align: center; font-family: Goyang">번호</th>
                     <th style="text-align: center; font-family: Goyang">제목</th>
                     <th style="text-align: center; font-family: Goyang">작성자</th>
                     <th style="text-align: center; font-family: Goyang">조회수</th>
                     <th style="text-align: center; font-family: Goyang">등록날짜</th>
                  </tr>
               </thead>
               <tbody>
               <c:choose>
                     <c:when test="${empty listRows }">
                        <tr>
                           <td colspan="6" class="text-center">등록된 게시물이 없습니다 ^^*</td>
                        </tr>
                     </c:when>
                     <c:otherwise>
                        <c:forEach items="${listRows }" var="row" varStatus="loop">
                           <!-- 리스트반복시작 -->
                           <tr>
                              <td class="text-center">${row.virtualNum }</td>
                              <td class="text-left">
                              
                              <c:set var="now" value="<%=new java.util.Date()%>" />
                              <c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
                                 
                                 
                                 <!-- 화면에 뿌릴때 -->
                                 
                                 
                                 
                                 <fmt:parseDate value="${str_plan_date }" var="strPlanDate" pattern="yyyy-MM-dd"/>
                                 <fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
                                 
                                 <fmt:parseDate value="${end_plan_date }" var="endPlanDate" pattern="yyyy-MM-dd"/>
                                 <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
<<<<<<< HEAD
											<fmt:parseDate value="${row.postdate }" var="postDate" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${postDate.time / (1000*60*60*24)}" integerOnly="true" var="post_date"></fmt:parseNumber>
											
											<fmt:parseDate value="${today }" var="toDay" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${toDay.time / (1000*60*60*24)}" integerOnly="true" var="to_day"></fmt:parseNumber>
										
											 
										 <c:choose>
										   
											<c:when test="${(to_day-post_date) eq 000 }">
												<a href="./qna_view.do?idx=${row.idx}&nowPage=${nowPage}"  style="color:black;">
														${row.title} &nbsp; <label class="badge "style="background-color:red; color:white;">new</label>
												</a>
											</c:when>
										
											<c:otherwise> 
													<a href="./qna_view.do?idx=${row.idx}&nowPage=${nowPage}"  style="color:black;">
														${row.title}
													</a>
											 </c:otherwise>
										</c:choose> 
										
										</td>
										<td class="text-center" style="font-size: 0.5em;">${row.name}</td>
										<td class="text-center">${row.view_count }</td>
										<td class="text-center">${row.postdate  }</td>
										
										<!-- <td class="text-center">--</td> -->
									</tr>
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
							</c:otherwise>
						</c:choose>
						
					</tbody>
				</table>
			</div>
			
         <!-- ------------------------------------------------------------------------mobile용-->       
         <div id="cutboard" >
          <div 
	         style="width: 100%; text-align: center;  display: table; ">
	         <p
	            style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 40px; color: black; font-weight: bold;">
	
	               <img src="https://iconmonstr.com/wp-content/g/gd/makefg.php?i=../assets/preview/2018/png/iconmonstr-marketing-23.png&r=0&g=0&b=0" width="80px" height="80px" /> 
	                  QnA 
	               <img src="https://image.flaticon.com/icons/svg/76/76818.svg" width="40px"/> 
	
	         </p>
	      </div>
         <div class="container">
	         <div class="container" >
	         <br /> <br /> 
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
	         <!-- 검색기능 끝 -->
	
	         <br />
	  	 </div> 
       		  <div style="text-align: right; font-family: Goyang;">
               <%if(session.getAttribute("EMAIL") != null) { %> 


                  <form action="write.do" method="post">
               		<button type="submit" class="btn btn-dark btn-sm">글쓰기</button>


                  </form>
                  <%} %>
                  <br />
             </div>
         
            <table class="table table-hover" style="text-align: center; font-size: 0.7em;">
               <colgroup>
                 <col width="15%" />
						<col width="*" />
						<col width="15%" />
						<col width="15%" />
						<col width="18%" />
               </colgroup>  
               <thead>
                  <tr class="" style="color: black; background-color:#81d1d1;">
                     <th style="text-align: center; font-family: Goyang">번호</th>
                     <th style="text-align: center; font-family: Goyang">제목</th>
                     <th style="text-align: center; font-family: Goyang">작성자</th>
                     <th style="text-align: center; font-family: Goyang">조회수</th>
                     <th style="text-align: center; font-family: Goyang">등록날짜</th>
                  </tr>
               </thead>
               <tbody>
               <c:choose>
                     <c:when test="${empty listRows }">
                        <tr>
                           <td colspan="6" class="text-center">등록된 게시물이 없습니다 ^^*</td>
                        </tr>
                     </c:when>
                     <c:otherwise>
                        <c:forEach items="${listRows }" var="row" varStatus="loop">
                           <!-- 리스트반복시작 -->
                           <tr>
                              <td class="text-center">${row.virtualNum }</td>
                              <td class="text-left">
                              
                              <c:set var="now" value="<%=new java.util.Date()%>" />
                              <c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
                                 
                                 
                                 <!-- 화면에 뿌릴때 -->
                                 
                                 
                                 
                                 <fmt:parseDate value="${str_plan_date }" var="strPlanDate" pattern="yyyy-MM-dd"/>
                                 <fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
                                 
                                 <fmt:parseDate value="${end_plan_date }" var="endPlanDate" pattern="yyyy-MM-dd"/>
                                 <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
											<fmt:parseDate value="${row.postdate }" var="postDate" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${postDate.time / (1000*60*60*24)}" integerOnly="true" var="post_date"></fmt:parseNumber>
											
											<fmt:parseDate value="${today }" var="toDay" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${toDay.time / (1000*60*60*24)}" integerOnly="true" var="to_day"></fmt:parseNumber>
										
											 
										 <c:choose>
										   
											<c:when test="${(to_day-post_date) eq 000 }">
												<a href="./qna_view.do?idx=${row.idx}&nowPage=${nowPage}"  style="color:black;">
														${row.title} &nbsp; <label class="badge "style="background-color:red; color:white;">new</label>
												</a>
											</c:when>
										
											<c:otherwise> 
													<a href="./qna_view.do?idx=${row.idx}&nowPage=${nowPage}"  style="color:black;">
														${row.title}
													</a>
											 </c:otherwise>
										</c:choose> 
										
										
										</td>
										<td class="text-center">${row.name}</td>
										<td class="text-center">${row.view_count }</td>
										<td class="text-center">${row.postdate  }</td>
										
										<!-- <td class="text-center">--</td> -->
									</tr>
								</c:forEach>
								<div class="container">
                     <table width="100%">
=======
                                 

                                 <fmt:parseDate value="${row.postdate }" var="postDate" pattern="yyyy-MM-dd"/>
                                 <fmt:parseNumber value="${postDate.time / (1000*60*60*24)}" integerOnly="true" var="post_date"></fmt:parseNumber>
                                 
                                 <fmt:parseDate value="${today }" var="toDay" pattern="yyyy-MM-dd"/>
                                 <fmt:parseNumber value="${toDay.time / (1000*60*60*24)}" integerOnly="true" var="to_day"></fmt:parseNumber>
                              
                                  
                               <c:choose>
                                 
                                 <c:when test="${(to_day-post_date) eq 000 }">
                                    <a href="./qna_view.do?idx=${row.idx}&nowPage=${nowPage}"  style="color:black;">
                                          ${row.title} &nbsp; <label class="badge "style="background-color:red; color:white;">new</label>
                                    </a>
                                 </c:when>
                              
                                 <c:otherwise> 
                                       <a href="./qna_view.do?idx=${row.idx}&nowPage=${nowPage}"  style="color:black;">
                                          ${row.title}
                                       </a>
                                  </c:otherwise>
                              </c:choose> 
                              
                              
                              </td>
                              <td class="text-center">${row.name}</td>
                              <td class="text-center">${row.view_count }</td>
                              <td class="text-center">${row.postdate  }</td>
                              
                              <!-- <td class="text-center">--</td> -->
                           </tr>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
               </tbody>
            </table>
         </div>
         </div>
         
         <!-- ------------------------------------------------------------------------mobile용-->      
         
         <div id="cutboard">
          <div id="nore" style="width: 100%;  text-align: center;  display: table; ">
            <p
               style="display: table-cell; text-align: center; vertical-align: middle; font-family: Goyang; font-size: 40px; color: black; font-weight: bold;">
   
                  <img src="https://iconmonstr.com/wp-content/g/gd/makefg.php?i=../assets/preview/2018/png/iconmonstr-marketing-23.png&r=0&g=0&b=0" width="40px"  /> 
                     QnA 
                  <img src="https://image.flaticon.com/icons/svg/76/76818.svg" width="40px"  /> 
   
            </p>
         </div>
         <div class="container">
         <div class="container" >
         <br /> <br /> 
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
             
         
         <!-- 검색기능 끝 -->

         <br />
      </div>
         <div style="text-align: right; font-family: Goyang;">
               <%if(session.getAttribute("EMAIL") != null) { %> 
                  <form action="recipe_edit.do" method="post">
                     <button type="submit" class="btn btn-dark btn-sm">글쓰기</button>
                  </form>
                  <%} %>
                  <br />
             </div>
         
            <table class="table table-hover" style="text-align: center; font-size: 0.7em;">
               <colgroup>
                  <col width="15%" />  
                  <col width="*" />
                  <col width="15%" />
                  <col width="15%" />
                  <col width="18%" />
               </colgroup>  
               <thead>
                  <tr class="" style="color: black; background-color:#81d1d1;">
                     <th style="text-align: center; font-family: Goyang">번호</th>
                     <th style="text-align: center; font-family: Goyang">제목</th>
                     <th style="text-align: center; font-family: Goyang">작성자</th>
                     <th style="text-align: center; font-family: Goyang">조회수</th>
                     <th style="text-align: center; font-family: Goyang">등록날짜</th>
                  </tr>
               </thead>
               <tbody>
               <c:choose>
                     <c:when test="${empty listRows }">
>>>>>>> branch 'master' of https://github.com/ray-kheal/kosmofinalproject.git
                        <tr>
                           <td colspan="6" class="text-center">등록된 게시물이 없습니다 ^^*</td>
                        </tr>
                     </c:when>
                     <c:otherwise>
                        <c:forEach items="${listRows }" var="row" varStatus="loop">
                           <!-- 리스트반복시작 -->
                           <tr>
                              <td class="text-center">${row.virtualNum }</td>
                              <td class="text-left">
                              
                              <c:set var="now" value="<%=new java.util.Date()%>" />
                              <c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
                                 
                                 
                                 <fmt:parseDate value="${str_plan_date }" var="strPlanDate" pattern="yyyy-MM-dd"/>
                                 <fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
                                 
                                 <fmt:parseDate value="${end_plan_date }" var="endPlanDate" pattern="yyyy-MM-dd"/>
                                 <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
                                 

                                 <fmt:parseDate value="${row.postdate }" var="postDate" pattern="yyyy-MM-dd"/>
                                 <fmt:parseNumber value="${postDate.time / (1000*60*60*24)}" integerOnly="true" var="post_date"></fmt:parseNumber>
                                 
                                 <fmt:parseDate value="${today }" var="toDay" pattern="yyyy-MM-dd"/>
                                 <fmt:parseNumber value="${toDay.time / (1000*60*60*24)}" integerOnly="true" var="to_day"></fmt:parseNumber>
                              
                                  
                               <c:choose>
                                 
                                 <c:when test="${(to_day-post_date) eq 000 }">
                                    <a href="./qna_view.do?idx=${row.idx}&nowPage=${nowPage}"  style="color:black;">
                                          ${row.title} &nbsp; <label class="badge "style="background-color:red; color:white;">new</label>
                                    </a>
                                 </c:when>
                              
                                 <c:otherwise> 
                                       <a href="./qna_view.do?idx=${row.idx}&nowPage=${nowPage}"  style="color:black;">
                                          ${row.title}
                                       </a>
                                  </c:otherwise>
                              </c:choose>  
                              
                              
                              </td>
                              <td class="text-center" style="font-size: 0.5em;">${row.name}</td>
                              <td class="text-center">${row.view_count }</td>
                              
                              <c:set var="postDate"><fmt:formatDate value="${row.postdate}" pattern="yy/MM/dd" /></c:set> 
                              <td class="text-center">${postDate  }</td>
                                
                              <!-- <td class="text-center">--</td> -->
                           </tr>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
               </tbody>
            </table>
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