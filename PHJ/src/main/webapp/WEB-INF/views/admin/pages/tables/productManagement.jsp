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
             	<h3 class="page-title" style="font-weight: bold;">상품관리</h3> 
             	<br /><br />
             	<h3>전체페이지:${totalPage }(현재페이지:${nowPage })</h3>
            <!-- 
            	<nav aria-label="breadcrumb">
               	 <ol class="breadcrumb">
                  	<li class="breadcrumb-item"><a href="#">상품관리</a></li>
                  	<li class="breadcrumb-item active" aria-current="page">편의점관리</li>
                </ol>
            	</nav> -->
         	<!-- 검색기능 시작 -->
              	<form class="form-inline">
				 <div class="form-group ">
					<select name="searchColumn" class="form-control" style="width: 80px; height : 30px" >
						<option value="">제목</option>
						<option value="">작성자</option>
						<option value="">내용</option>
					</select>
				</div> 
				<div class="input-group">

					<input type="text" name="searchWord" class="form-control"
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
                    <h4 class="card-title">&nbsp;<i class="mdi mdi-basket"></i>&nbsp;상품조회</h4>
                    <table class="table table-hover" style="text-align: center;">
                      <colgroup>
						<col width="20px" />
						<col width="50px" />
						<col width="*" />
						<col width="80px" />
						<col width="120px" />
					</colgroup>  
                        
                      <thead>
                        <tr class="table-info" style="color: white;">
                          <th>no</th>
                          <th>상품코드</th>
                          <th>상품명</th>
                          <th>가격</th>
                          <th>분류</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<!-- 상품 리스트 출력  -->
                        <c:choose>
							<c:when test="${empty viewRow }">
								<tr>
									<td colspan="5" class="text-center">
										등록된 상품이 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${viewRow }" var="row" 
									varStatus="loop">
									<!-- 리스트반복시작 -->
									<tr>
										 <td class="text-center">${row.virtualNum }</td>
										<td class="text-center">${row.product_code }</td>
										<td class="text-left">
											<a href="./view.do?idx=${row.product_code}
												&nowPage=${nowPage}">${row.product_name}</a>
										</td >
										<td class="text-left">${row.product_price}
										</td>
										<td class="text-center">${row.product_value }</td>
									</tr>
									<!-- 리스트반복끝 -->
								</c:forEach>
							</c:otherwise>
						</c:choose>
                      
                                 
                      </tbody>
                    </table>
                  </div>
                </div>
              <!-- 내용끝 -->
			<br /><br />
			<!-- 페이지번호 -->
                <div class="container">
				<table width="100%">
					<tr>
						<td align="center" style="font-weight: bold; font-size: 1.5em; ">
							${pagingImg }
						</td>
					</tr>
				</table>
                
                </div>
            <br /><br />
			<div class="row text-right" style="float: right;">
				<button type="button" class="btn btn-dark btn-sm" 
				onclick="location.href='./productManagementWrite.do';">상품등록</button>
				<button class = "btn btn-danger btn-sm">삭제</button>
			</div>


			<br /> <br />
			
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