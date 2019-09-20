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
             <h3 class="page-title" style="font-weight: bold;">점포관리</h3>
                
             <br /><br />
       <!--        <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">관리</a></li>
                  <li class="breadcrumb-item active" aria-current="page">공지사항</li>
                </ol>
              </nav>
        -->     
 
			<br />  
		
			<div class="card">
                  <div class="card-body">
                    <h4 class="card-title "><i class="mdi mdi-lead-pencil"></i>&nbsp;점포 등록하기</h4>
                    <form class="forms-sample">
                      <div class="form-group">
                        <label for="productName">점포코드</label>
                        <input type="text" class="form-control" id="place_code" >
                      </div>
                      <div class="form-group">
                        <label for="productName">점포명</label>
                        <input type="text" class="form-control" id="place_name" >
                      </div>
                      <div class="form-group">
                        <label for="producPrice">주소</label>
                        <input type="text" class="form-control" id="place_address" >
                      </div>
                      <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" class="form-control" id="password">
                      </div>
                      <div class="form-group">
                        <label for="productStock">전화번호</label>
                        <input type="password" class="form-control" id="productStock">
                      </div>
                      <div class="form-group">
                        <label for="exampleTextarea1">등록일</label>
                        <textarea class="form-control" id="exampleTextarea1" rows="10"></textarea>
                      </div>
                     
                    </form>
                  </div>
                </div>
			<br /><br />
			<div class="row text-right" style="float: right;">
				 <button type="submit" class="btn btn-gradient-info btn-rounded">Ok</button>
                 <button class="btn btn-light btn-rounded">Reset</button>
                 <button class="btn btn-dark btn-rounded"
                 		onclick="location.href='./placeManagement.do';">List</button>
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