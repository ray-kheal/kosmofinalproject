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

			<%-- <div> 
				<form name="writeFrm" method="post" action="./writeAction.do" 
					onsubmit="return checkValidate(this);">
				<table class="table" style="text-align: center; border: 1px; ">
				<colgroup>
					<col width="25%"/>
					<col width="*"/>
				</colgroup>
					<tr> 
						<td class="table-primary" style="color: white;">작성자</td>
						<td style="background-color: white;">
							<input type="text" name="name" style ="width:100%; height: 100%; border:none;" />
						</td>
					</tr>
					<tr>
						<td class="table-primary" style="color: white;">패스워드</td>
						<td style="background-color: white;">
							<input type="password" name="pass" style ="width:100%; height: 100%; border:none;" />
						</td>
					</tr>
					<tr>
						<td class="table-primary" style="color: white;">제목</td>
						<td style="background-color: white;">
							<input type="text" name="title" style ="width:100%; height: 100%; border:none;" />
						</td>
					</tr>
					<tr>  
						<td class="table-primary" style="color: white;">내용</td>
						<td style="background-color: white;"> 
							<textarea name="contents" style="width:100%;height:200px; border:none;"></textarea>
						</td>
					</tr>
				
				</table>
				</form>
			</div> --%>
			    
			<div class="card">
                  <div class="card-body">
                    <h4 class="card-title">게시판 글쓰기</h4>
                    <form class="forms-sample">
                      <div class="form-group">
                        <label for="exampleInputName1">이름</label>
                        <input type="text" class="form-control" id="exampleInputName1" placeholder="관리자">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword4">비밀번호</label>
                        <input type="password" class="form-control" id="exampleInputPassword4" placeholder="Password">
                      </div>
                      <div class="form-group">
                        <label>파일업로드</label>
                        <input type="file" name="img[]" class="file-upload-default">
                        <div class="input-group col-xs-12">
                          <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
                          <span class="input-group-append">
                            <button class="file-upload-browse btn btn-gradient-primary" type="button">Upload</button>
                          </span>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="exampleTextarea1">내용</label>
                        <textarea class="form-control" id="exampleTextarea1" rows="10"></textarea>
                      </div>
                     
                    </form>
                  </div>
                </div>
			<br /><br />
			<div class="row text-right" style="float: right;">
				 <button type="submit" class="btn btn-gradient-primary btn-rounded">Ok</button>
                 <button class="btn btn-light btn-rounded">Reset</button>
                 <button class="btn btn-dark btn-rounded">List</button>
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