<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>편히점 Admin페이지</title>
<link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">

<link rel="stylesheet" href="assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="assets/images/favicon.png" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
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
      <!-- partial:partials/_navbar.do -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="index.do"><img src="../resources/images/logo.png" alt="logo"  style=" width:145px; height:40px;"/></a>
       <!--    <a class="navbar-brand brand-logo-mini" href="index.do"><img src="assets/images/logo-mini.svg" alt="logo" /></a> -->
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
    
          <!----- 상단 오른쪽의 프로필 , 메세지, 알림 아이콘  ----->
           <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item nav-profile dropdown">
            <!-- 상단 프로필 -->
             <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="true">
               <div class="nav-profile-img">
                 <img src="assets/images/faces/login.png" alt="image">
                 <span class="availability-status online"></span>
               </div>
               <div class="nav-profile-text">
                 <p class="mb-1 text-black"><%=session.getAttribute("ADMINNAME") %></p>
               </div>
             </a>
             <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                <a class="dropdown-item" href="#">
                  <i class="mdi mdi-cached mr-2 text-success"></i> 일단 빈칸 </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="adminLogout.do">
                  <i class="mdi mdi-logout mr-2 text-primary"></i> 로그아웃 </a>
             </div>
            </li>
           </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->  <!------- 사이드바 시작 -------->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.do -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="#" class="nav-link">
                <div class="nav-profile-image">
                  <img src="assets/images/faces/login.png" alt="profile">
                  <span class="login-status online"></span>
                  <!--change to offline or busy as needed-->
                </div>
                <div class="nav-profile-text d-flex flex-column">
                  <span class="font-weight-bold mb-2"><%=session.getAttribute("ADMINNAME") %></span>
                  <span class="text-secondary text-small"><%=session.getAttribute("ADMINEMAIL") %></span>
                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.do">
                <span class="menu-title">메인</span>
                <i class="mdi mdi-home menu-icon"></i>
              </a>
            </li>
           
            <li class="nav-item">
              <a class="nav-link" href="pages/tables/memberManagement.do">
                <span class="menu-title">고객관리</span>
                <i class="mdi mdi-table-large menu-icon"></i>
              </a>
            </li> 
            <li class="nav-item"> 
              <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">편의점관리</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-table-large menu-icon"></i>
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="pages/tables/productManagement.do">상품관리</a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/tables/placeManagement.do">점포관리</a></li>
                </ul>
              </div>
            </li> 
             
            
            <li class="nav-item"> 
              <a class="nav-link" data-toggle="collapse" href="#board-pages" aria-expanded="false" aria-controls="board-pages">
                <span class="menu-title">게시판관리</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-table-large menu-icon"></i>
              </a>
              <div class="collapse" id="board-pages">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="pages/tables/boardManagement.do">공지사항</a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/tables/recipeManagement.do">레시피 게시판</a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/tables/eventManagement.do">이벤트 게시판</a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/tables/qnaManagement.do">QnA 게시판</a></li>
                </ul>
              </div>
            </li> 
             
           
      
          </ul>   
        </nav> 
        <!-- partial --> <!-- 사이드바 끝 -->

      

<div class="main-panel">
          <div class="content-wrapper">
            <div class="row" id="proBanner">
              <div class="col-12">
                 <i class="mdi mdi-close" id="bannerClose"></i> 
              </div>
            </div>
            <div class="page-header">
              <h3 class="page-title">
                <span class="page-title-icon bg-gradient-info text-white mr-2">
                  <i class="mdi mdi-home"></i>
                </span> Dashboard </h3>
              <!-- <nav aria-label="breadcrumb">
                <ul class="breadcrumb">
                  <li class="breadcrumb-item active" aria-current="page">
                    <span></span>Overview <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                  </li>
                </ul>
              </nav>  -->
            </div>
            <div class="row">
              <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-danger card-img-holder text-white">
                  <div class="card-body">
                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                    <h4 class=" mb-3">Total Member<i class="mdi mdi-account-plus mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5">${member_totalRecordCount } People</h2>
                    <h6 class="card-text">Increased by 60%</h6>
                  </div>  
                </div>
              </div>
              <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-info card-img-holder text-white">
                  <div class="card-body">
                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                    <h4 class="font-weight-normal mb-3">Total Recipe <i class="mdi mdi-food-fork-drink mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5">${recipe_totalRecordCount } Recipe</h2>
                    <h6 class="card-text">Increased by 10%</h6>
                  </div>
                </div>
              </div>
              <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-success card-img-holder text-white">
                  <div class="card-body">
                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                    <h4 class="font-weight-normal mb-3">Total QnA <i class="mdi mdi-shopping mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5">${totalRecordCount }</h2>
                    <h6 class="card-text">Increased by 5%</h6>
                  </div>
                </div>
              </div>
            </div>
            
            
            
            
            
          <!-- -------------------------------------------------------------------최근가입회원 -->
            
            
            <div class="row">
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="clearfix">
                      <h4 class="card-title float-left">Recent Updates</h4>
                    <br />
                       <h5 class="card-title float-right"><i class="mdi mdi-account-multiple"></i><a href="pages/tables/memberManagement.do" style="color:black;">최근가입회원</a></h5>
                     
                       <table class="table " style="text-align: center;">
                           <tbody style="color:black;"> 
                       
                           <!-- 회원 리스트 출력  -->
                           <c:choose>
                        <c:when test="${empty viewRow }">
                           <tr>
                              <td colspan="6" class="text-center">
                                 등록된 회원이 없습니다. 
                              </td>
                           </tr>
                        </c:when>   
                        <c:otherwise>
                           <c:forEach items="${viewRow }" var="row" 
                              varStatus="loop"> 
                              <!-- 리스트반복시작 --> 
                              <tr>
                                 <%-- <td class="text-center">${row.virtualNum } 님이 가입했습니다.</td>--%>
                                  <td class="text-left">
                                    <p style="font-weight: bold;"><img src="assets/images/faces-clipart/pic-4.png" alt="image"> &nbsp;  ${row.name}님이 가입했습니다.</p>
                                 </td >  
                                  <td class="text-left">
                                    <p style="color:gray; text-align: center;">${row.regidate }</p>
                                 </td >  
                                 <%--<td class="text-center">${row.email }</td>
                                 <td class="text-center">${row.mobile }</td>
                                 <td class="text-center">${row.regidate }</td> --%>
                              </tr>
                              <!-- 리스트반복끝 -->
                           </c:forEach>
                        </c:otherwise>
                     </c:choose>
          
                  </tbody>
                        </table>
                      
                      
                      
                      
                      
                    </div>
                  </div>
                </div>
              </div>
              
              
          
              
              
              
              
              
              
              
            <!-- -------------------------------------------------------------------최근문의사항 -->
              
              
              
              <div class="col-md-8 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title float-left">Recent Updates</h4>
                         <br />  
                       <h5 class="card-title float-right"><i class="mdi mdi-comment-question-outline"></i><a href="pages/tables/qnaManagement.do" style="color:black;">최근문의사항</a></h5>
                      
                   <table class="table table-bordered" style="text-align: center; font-size: 1.5em; border-radius: 20px;">
                        <colgroup>
                          <col width="20%" /> 
                         <col width="20%" /> 
                         <col width="20%" /> 
                         <col width="20%" /> 
                         <col width="20%" /> 
                         <col width="20%" /> 
                        </colgroup>
                           <tbody style="color: black;">
                             <!-- 게시판 리스트 출력  -->
                           <c:choose> 
                        <c:when test="${empty qnaviewRow }">
                           <tr>
                              <td colspan="5" class="text-center">
                                 등록된 게시물이 없습니다.
                              </td> 
                           </tr> 
                        </c:when> 
                        <c:otherwise>   
                           <c:forEach items="${qnaviewRow }" var="row" 
                              varStatus="loop">
                              


                              <!-- 리스트반복시작 --> 
                                 <%--  <td class="text-center">${row.virtualNum }</td> --%>
                              <c:if test="${row.bstep eq '0'}"> <!-- 댓글이 안달린 게시물만 보이게 -->
                                 <td >
                                    <br /><br />
                                    <!-- <img src="assets/images/faces-clipart/pic-2.png" alt="image"> -->
                                     <p style="color:#6ea2d3;"><i class="mdi mdi-human-greeting icon-lg" ></i> </p>
                                    <br />
                                    <label class="badge badge-danger">new</label><br /><br />
                                    <a href="pages/tables/qnaManagementView.do?idx=${row.idx}&nowPage=${nowPage}" style="color:black; font-weight: bold; font-size: 1.2em;">
                                          " ${row.title} "
                                    </a> 
                                    <br /><br /><br /><br /><br />
                                    <p style="color:gray; text-align: center;">${row.name}</p>
                                    <p style="color:gray; text-align: center; font-size: 0.7em;" >${row.postdate}</p>
                                    <button type="button" class="btn btn-outline-info btn-fw" onclick="location.href='pages/tables/qnaReply.do?idx=${row.idx}&nowPage=${nowPage}';">
                                       <i class="mdi mdi-arrow-right-bold-hexagon-outline"></i>&nbsp;답글달기
                                    </button>
                                    <!-- <button type="button" class="btn btn-gradient-info btn-sm"><i class="mdi mdi-lead-pencil"></i>답글달기</button> -->
                                 </td>
                              </c:if>
                           </c:forEach> 
                        </c:otherwise>
                     </c:choose>
                           
                         </tbody>
                  
                  
                  
                       </table>



                  </div>
                </div>
              </div> 
            </div>    
            
            
            
              <!-- -------------------------------------------------------------------최근레시피 -->
            
            <div class="row">
              <div class="col-md-7 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="clearfix">
                       <h4 class="card-title float-left">Recent Recipe</h4>
                       <br />  
                       <h5 class="card-title float-right"><i class="mdi mdi-login-variant"></i><a href="pages/tables/recipeManagement.do" style="color:black;">레시피게시판</a></h5>
                  
                      <table class="table table-bordered" style="text-align: center; font-size: 1.5em; border-radius: 20px;">
                            <col width="20%" /> 
                            <col width="20%" /> 
                            <col width="20%" /> 
                            <col width="20%" /> 
                            <col width="20%" /> 
                            <col width="20%" /> 
                         <tbody style="color: black;">
                     <!-- 게시판 리스트 출력  -->
                           <c:choose> 
                        <c:when test="${empty recipeviewRow }">
                           <tr>
                              <td colspan="5" class="text-center">
                                 등록된 게시물이 없습니다.
                              </td> 
                           </tr> 
                        </c:when> 
                        <c:otherwise>   
                           <c:forEach items="${recipeviewRow }" var="row" 
                              varStatus="loop">
                              


                              <!-- 리스트반복시작 --> 
                                 <%--  <td class="text-center">${row.virtualNum }</td> --%>
                                 <td >
                                    <br /><br />
                                    <!-- <img src="assets/images/faces-clipart/pic-2.png" alt="image"> -->
                                     <p style="color:#EC9A00;"><i class="mdi mdi-food icon-lg" ></i> </p>
                                    <br /><br />
                                    <!-- <mark class="bg-warning text-white" > -->
                                    <a href="pages/tables/recipeManagementView.do?idx=${row.idx}&nowPage=${nowPage}" style="color:black; font-weight: bold; font-size: 1.2em;">
                                           ${row.title} 
                                    </a> 
                                    <!--  </mark> -->
                                    <br /><br /><br /><br /><br />
                                    <p style="color:gray; text-align: center;">${row.name}</p>
                                    
                                    <p style="color:gray; text-align: center; font-size: 0.7em;" >${row.postdate}</p>
                                    <!-- <button type="button" class="btn btn-outline-info btn-fw"><i class="mdi mdi-arrow-right-bold-hexagon-outline"></i>&nbsp;답글달기</button> -->
                                    <!-- <button type="button" class="btn btn-gradient-info btn-sm"><i class="mdi mdi-lead-pencil"></i>답글달기</button> -->
                                 </td>
                           </c:forEach> 
                        </c:otherwise>
                     </c:choose>
                           
                         </tbody>
                        </table>
                      
                      
                      
                      
                      
                    </div>
                  </div>
                </div>
              </div>
              
               <!-- -------------------------------------------------------------------최근공지-->
              
            
              
              
              <div class="col-md-5 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title float-left">Recent Notice</h4>
                        <br />  
                       <h5 class="card-title float-right"><i class="mdi mdi-comment-question-outline"></i><a href="pages/tables/boardManagement.do" style="color:black;">최근공지사항</a></h5>
                   
                   <table class="table " style="text-align: center;">
                  <tbody style="color:black;"> 
                       
                           <!-- 회원 리스트 출력  -->
                           <c:choose>
                        <c:when test="${empty noticeviewRow }">
                           <tr>
                              <td colspan="6" class="text-center">
                                 등록된 회원이 없습니다. 
                              </td>
                           </tr>
                        </c:when>   
                        <c:otherwise>
                           <c:forEach items="${noticeviewRow }" var="row" 
                              varStatus="loop"> 
                              <!-- 리스트반복시작 --> 
                              <tr>
                                 
                                  <td class="text-left">
                                    <p style="font-weight: bold;">
                                    <label class="badge badge-gradient-success">공지</label>&nbsp;  ${row.title}
                                    <!-- <i class="mdi mdi-checkbox-marked-circle-outline"></i>  -->
                                    </p>
                                 </td >    
                                 <td class="text-left" style="vertical-align: center;">   
                                    ${row.content }
                                 </td >  
                                  <td class="text-left">
                                    <p style="color:gray; text-align: center;">${row.postdate }</p>
                                 </td >  
                                 <%--<td class="text-center">${row.email }</td>
                                 <td class="text-center">${row.mobile }</td>
                                 <td class="text-center">${row.regidate }</td> --%>
                              </tr>
                              <!-- 리스트반복끝 -->
                           </c:forEach>
                        </c:otherwise>
                     </c:choose>
          
                  </tbody>
               </table>



                  </div>
                </div>
              </div>
            </div>    
            
            
            
            
            
            
            
                    </div>
                  </div>
                </div> 
               </div>
                  </div>
                </div>
              </div>














   
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.do -->
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
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/Chart.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="assets/js/dashboard.js"></script>
    <script src="assets/js/todolist.js"></script>
    <!-- End custom js for this page -->
</body>
</html>