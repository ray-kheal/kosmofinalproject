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
<script type = "text/javascript">
function checkValidate(f){
   if(f.title.value==""){
      alert("제목을 입력하세요.");
      f.title.focus();
      return false;
   }
   if(f.content.value==""){
      alert("내용을 입력하세요");
      f.content.focus();
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
                <%-- <% String board_type=request.getParameter("board_type");//게시판 타입 받아오기 
              		if(board_type.equals("1")) { %>
             			<h3 class="page-title" style="font-weight: bold;">공지사항</h3> 
			 	<%}else if (board_type.equals("2")){ %>
             			<h3 class="page-title" style="font-weight: bold;">이벤트</h3> 
			 	<%} %> --%>
			 	<h3 class="page-title" style="font-weight: bold;">공지사항</h3> 
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
	                    <h4 class="card-title "><i class="mdi mdi-lead-pencil"></i>&nbsp;게시판 글쓰기</h4>
		 <form action="boardManagementWriteAction.do" name="writeFrm" method="post" 
							onsubmit="return checkValidate(this);">
			             
							<input type="hid-den" name="board_type" value="1" /> 
		                      <div class="form-group">
		                        <label for="exampleInputName1">이름</label>
		                        <input type="text" class="form-control" name="name" value="관리자">
		                      </div>
		                      <!-- <div class="form-group">
		                        <label for="exampleInputPassword4">비밀번호</label>
		                        <input type="password" class="form-control" id="exampleInputPassword4" placeholder="Password">
		                      </div> -->
		                      <div class="form-group">
		                        <label for="exampleInputPassword4">제목</label>
		                        <input type="text" class="form-control" name="title" placeholder="Title">
		                      </div>
		                     <!--  <div class="form-group">
		                        <label>파일업로드</label>
		                        <input type="file" name="img[]" class="file-upload-default">
		                        <div class="input-group col-xs-12">
		                          <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
		                          <span class="input-group-append">
		                            <button class="file-upload-browse btn btn-gradient-info" type="button">Upload</button>
		                          </span>
		                        </div>
		                      </div> -->
		                     <div class="form-group">
		                       <label for="exampleTextarea1">내용</label>
		                       <textarea class="form-control" name="content" rows="10"></textarea>
		                     </div>
	                     
	                    
	                </div>
             	</div>
                
				<br /><br />
			
				<div class="row text-right" style="float: right;">
					 <button type="submit" class="btn btn-gradient-info btn-rounded">Ok</button>
					    </form>
	                 <button type="reset" class="btn btn-light btn-rounded">Reset</button>
	
	                 <button class="btn btn-dark btn-rounded"
	                 	onclick="location.href='./boardManagement.do';">List</button>
	
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