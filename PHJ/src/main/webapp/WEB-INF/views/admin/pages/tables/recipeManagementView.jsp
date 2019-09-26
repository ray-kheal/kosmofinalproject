<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>편히점 Admin페이지</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">

    <link rel="stylesheet" href="../../assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../assets/images/favicon.png" />
  </head>
<script>
var mst = '<%=session.getAttribute("MEMBERTYPE")%>';

if (mst == 'null') {
	alert("비로그인 사용자는 접근이 불가합니다. 메인 홈페이지로 이동합니다. \r\n 테스트중에는 관리자 로그인페이지로 이동합니다.");
	location.href = "../admin/pages/samples/login.do";
} 
if (mst == 'normal') {
	alert('관리자만 이용할 수 있습니다 일반회원은 사용이 불가능합니다..');
	location.href = "../admin/pages/samples/login.do";
} 
//삭제여부 확인
function isDelete(){
	result = confirm('삭제하시겠습니까?');
  if(result){
      location.href = "boardDelete.do?idx=${viewRow.idx}&nowPage=${nowPage}&board_type=1";
      //location.href = "boardDelete.do";
  }else{
  	return false;
  }
}
</script>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_navbar.do -->
    
      <!-- admin 메인헤더 인클루드 -->
      <%@ include file="../admin_general/AdminMainHeader.jsp"%> 
      
      <!-- 사이드바 시작 -->
      <div class="container-fluid page-body-wrapper">
      
      <!-- admin 사이드바 인클루드 -->
      <%@ include file="../admin_general/AdminSidebar.jsp"%>
      <!-- 사이드바 끝 -->
        <!-- 페이지 시작 -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <div class="container">
           
             	<h3 class="page-title" style="font-weight: bold;">레시피 게시판</h3> 
			 
             <br /><br />
      

			<!-- 내용시작 -->
			<div class="card">
                  <div class="card-body">
                    <h4 class="card-title">&nbsp;
                   
                    	<i class="mdi mdi-food"></i>&nbsp;레시피 보기
                 
                    
                    </h4>
                 <%--  <table class="table table-bordered" style="margin-bottom: -1px; color:black;">
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="120px" />
						<col width="120px" />
						<col width="80px" />
						<col width="50px" />
					</colgroup>
					<input type="hidden" name="idx" value="${viewRow.idx }" />
					<input type="hidden" name="nowPage" value="${nowPage }" />
					<tr>
						<th bgcolor="#f2efef" style="text-align: center;">제목</th>
						<td>${viewRow.title}</td>
					</tr>
					<tr>
						<th bgcolor="#f2efef" style="text-align: center;">작성자</th>
						<td>${viewRow.name}</td>
					</tr>
					<!-- 	<th>작성자</th>
							<th>날짜</th>
							<th>조회</th> -->
					<!-- <tbody>
					</tbody> -->
				</table>
				  
				<table class="table table-borderless" style="color:black;">
					<colgroup>
						<col width="80px" />
						<col width="100px" />
						<col width="80px" />
						<col width="*" />
					</colgroup>
					<tr>
						<th style="text-align: center; border-left:1px solid #EDEAEA; ">DATE</th>
						<td>${viewRow.postdate}</td>
						<th style="text-align: center;">조회수</th>
						<td style="border-right:1px solid #EDEAEA;">${viewRow.view_count }</td>
					</tr>
					<tr>
						<td colspan="4" style="valign:top; height:200px; border-left:1px solid #EDEAEA; border-right:1px solid #EDEAEA; border-bottom:1px solid #EDEAEA;">${viewRow.content}
						</td>
					</tr>
				</table> --%>
				<input type="hidden" name="idx" value="${viewRow.idx }" />
				<input type="hidden" name="nowPage" value="${nowPage }" />
				<table class="table" style="color:black; font-size: 0.7em;  ">
					<colgroup>  
						<col width="50%" />
						<col width="5%" />
						<col width="45%" />
					</colgroup> 
					<tr >     
						<td rowspan="5" style="border-top: 2px solid white;">
						     
						<img src="https://i1.wp.com/pizzaschool.net/wp-content/uploads/2015/11/%EC%BD%A4%EB%B9%84%EB%84%A4%EC%9D%B4%EC%85%98%ED%94%BC%EC%9E%90.jpg?resize=800%2C800" 
						style="width: 90%; border-radius: 0; height: auto;" />
						</td>
						 
						<td style="border-top: 2px solid white; font-weight: bold; text-align: center;">레시피명</td>
						<td style="border-top: 2px solid white;">
						${viewRow.title}
						</td>
					</tr> 
					<tr>
						<!-- <td></td> -->
						<td style="font-weight: bold; text-align: center;">작성자</td>
						<td> ${viewRow.name}</td>
					</tr>
					<tr>
						<!-- <td></td> -->
						<td style="font-weight: bold; text-align: center;">작성일</td>
						<td>${viewRow.postdate}</td>
					</tr>
					<tr>
						<!-- <td></td> -->
						<td style="font-weight: bold; text-align: center;">조회수</td>
						<td>${viewRow.view_count }</td>
					</tr>
					<tr>
						<!-- <td></td> -->
						<td colspan="2">${viewRow.content}</td>
						<!-- <td></td>  -->
					</tr>
					
				</table>
				
                  </div>
                </div>
              <!-- 내용끝 -->
			<br /><br />
			<div class="row text-right" style="float: right;">
			
			 
				<button class = "btn btn-danger btn-sm" onclick="isDelete();">삭제</button>
				<button type="button" class="btn btn-dark btn-sm" 
							onclick="location.href='./recipeManagement.do';">리스트</button>
				<%-- <% if(board_type.equals("1")) { %>
                    	<button type="button" class="btn btn-dark btn-sm" 
							onclick="location.href='./boardManagement.do';">리스트</button>
                    <%}else if (board_type.equals("2")){ %>
                    	<button type="button" class="btn btn-dark btn-sm" 
							onclick="location.href='./eventManagement.do';">리스트</button>
                    <%} %> --%>
				
			</div>
			  
            </div>
      </div>
          
      <!--  공지사항 게시판 끝 -->
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.do -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2017 <a href="https://www.bootstrapdash.com/" target="_blank">BootstrapDash</a>. All rights reserved.</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="mdi mdi-heart text-danger"></i></span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
  
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
  
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
   
  </body>
</html>