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
      <!-- 메인 페이지 시작 -->
        
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <div class="container">
             <h3 class="page-title">회원 관리 게시판 </h3> 
             
             <br /><br />
       <!--        <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">관리</a></li>
                  <li class="breadcrumb-item active" aria-current="page">공지사항</li>
                </ol>
              </nav>
        -->     
              	<form class="form-inline">
				 <div class="form-group">
					<select name="keyField" class="form-control" style="width: 80px; height : 30px" >
						<option value="">이름</option>
						<option value="">가입일</option>
						<option value="">편의점 북마크</option>
						<option value="">상품 북마크</option>
					</select>
		</div> 
				<div class="input-group">

					<input type="text" name="keyString" class="form-control"
						style="width: 120px; height : 30px" />

					<div class="input-group-btn">
						<button type="submit" class="btn btn-outline-secondary btn-sm">
							검색 <i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
			<!-- 검색기능 끝 -->

			<br />

			<div>
				<table class="table table-hover" style="text-align: center;">
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
					</colgroup>
					<thead>
						<tr class="table-primary" style="color: white;">
							<th>번호</th>
							<th>회원 이름</th>
							<th>이메일</th>
							<th>핸드폰 번호</th>
							<th>알림 서비스 </th>
							<th>가입일 </th>
							<th>편의점 북마크</th>
							<th>상품 북마크</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td style="text-align: left;">angelriun</td>
							<td>john@example.com</td>
							<td>010-8761-4737</td>
							<td>0</td>
							<td>2019-09-07</td>
							<td>CU 가산디지털단지역점 </td>
							<td>CU 백종원 도시락 </td>
						</tr>
					
					</tbody>
				</table>
			</div>
			<br /><br />
			<div class="row text-right" style="float: right;">
			
				<button class = "btn btn-danger btn-sm">삭제</button>
			</div>
		
<!-- 메인 페이지 끝  -->

			<br /> <br />
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="javascript:void(0);">←</a></li>
				<li class="page-item"><a class="page-link"
					href="javascript:void(0);">1</a></li>
				<li class="page-item"><a class="page-link"
					href="javascript:void(0);">2</a></li>
				<li class="page-item"><a class="page-link"
					href="javascript:void(0);">→</a></li>
			</ul>
            </div>
      </div>
      
      
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
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
 
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>