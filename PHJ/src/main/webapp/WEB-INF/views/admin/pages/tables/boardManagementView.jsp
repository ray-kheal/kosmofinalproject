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
              <% String board_type=request.getParameter("board_type");//게시판 타입 받아오기 
              	if(board_type.equals("1")) { %>
             		<h3 class="page-title" style="font-weight: bold;">공지사항 게시판</h3> 
			 <%}else if (board_type.equals("2")){ %>
             		<h3 class="page-title" style="font-weight: bold;">이벤트 게시판</h3> 
			 <%} %>
             <br /><br />
       <!--        <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">관리</a></li>
                  <li class="breadcrumb-item active" aria-current="page">공지사항</li>
                </ol>
              </nav>
        -->     
              	<form class="form-inline">
				 <div class="form-group ">
					<select name="keyField" class="form-control" style="width: 80px; height : 30px" >
						<option value="">제목</option>
						<option value="">작성자</option>
						<option value="">내용</option>
					</select>
				</div> 
				<div class="input-group">

					<input type="text" name="keyString" class="form-control"
						style="width: 120px; height : 30px" />

					<div class="input-group-btn">
						<button type="submit" class="btn btn-outline-secondary btn-sm">
							검색
						</button>
					</div>
				</div>
				
			</form>
			<!-- 검색기능 끝 -->

			<br />

			<!-- 내용시작 -->
			<div class="card">
                  <div class="card-body">
                    <h4 class="card-title">&nbsp;
                    <% if(board_type.equals("1")) { %>
                    	<i class="mdi mdi-book-multiple-variant"></i>&nbsp;공지사항 
                    <%}else if (board_type.equals("2")){ %>
                    	<i class="mdi mdi-checkbox-marked-circle-outline"></i>&nbsp;이벤트 
                    <%} %>
                    </h4>
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
					<tr>
						<th bgcolor="#f2efef" style="text-align: center;">제목</th>
						<td>${viewRow.title}</td>
					</tr>
					<tr>
						<th bgcolor="#f2efef" style="text-align: center;">작성자</th>
						<td>관리자</td>
					</tr>
					<!-- 	<th>작성자</th>
							<th>날짜</th>
							<th>조회</th> -->
					<!-- <tbody>
					</tbody> -->
				</table>
				
				<table class="table table-borderless">
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
				</table>

				
                  </div>
                </div>
              <!-- 내용끝 -->
			<br /><br />
			<div class="row text-right" style="float: right;">
				<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='./boardManagementView.do?idx=${viewRow.idx}&nowPage=${nowPage}&board_type=${viewRow.board_type };">수정하기</button>
				<button class = "btn btn-danger btn-sm">삭제</button>
				<% if(board_type.equals("1")) { %>
                    	<button type="button" class="btn btn-dark btn-sm" 
							onclick="location.href='./boardManagement.do';">리스트</button>
                    <%}else if (board_type.equals("2")){ %>
                    	<button type="button" class="btn btn-dark btn-sm" 
							onclick="location.href='./eventManagement.do';">리스트</button>
                    <%} %>
				
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