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
<script>

function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
       amPm = 'PM';
       currentHours = addZeros(currentHours - 12,2);
    }

    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }
    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:1em;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
     var zero = '';
     num = num.toString();
     if (num.length < digit) {
       for (i = 0; i < digit - num.length; i++) {
         zero += '0';
       }
     }
     return zero + num;
}
</script>


<script type="text/javascript">
        var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
        var date = new Date();//today의 Date를 세어주는 역할
        function prevCalendar() {//이전 달
        // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
        //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
        //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
         today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
         buildCalendar(); //달력 cell 만들어 출력 
        }
 
        function nextCalendar() {//다음 달
            // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
            //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
             today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
             buildCalendar();//달력 cell 만들어 출력
        }
        function buildCalendar(){//현재 달 달력 만들기
            var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
            //이번 달의 첫째 날,
            //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
            //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
            //왜냐면 getMonth()는 0~11을 반환하기 때문
            var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
            //이번 달의 마지막 날
            //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
            //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
            //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
            var tbCalendar = document.getElementById("calendar");
            //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
            var tbCalendarYM = document.getElementById("tbCalendarYM");
            //테이블에 정확한 날짜 찍는 변수
            //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
            //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
             tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
 
             /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
            while (tbCalendar.rows.length > 2) {
            //열을 지워줌
            //기본 열 크기는 body 부분에서 2로 고정되어 있다.
                  tbCalendar.deleteRow(tbCalendar.rows.length-1);
                  //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
                //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
             }
             var row = null;
             row = tbCalendar.insertRow();
             //테이블에 새로운 열 삽입//즉, 초기화
             var cnt = 0;// count, 셀의 갯수를 세어주는 역할
            // 1일이 시작되는 칸을 맞추어 줌
             for (i=0; i<doMonth.getDay(); i++) {
             /*이번달의 day만큼 돌림*/
                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
             }
            /*달력 출력*/
             for (i=1; i<=lastDate.getDate(); i++) { 
             //1일부터 마지막 일까지 돌림
                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                  cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
              if (cnt % 7 == 1) {/*일요일 계산*/
                  //1주일이 7일 이므로 일요일 구하기
                  //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
                cell.innerHTML = "<font color=#FE8996>" + i
                //1번째의 cell에만 색칠
            }    
              if (cnt%7 == 0){/* 1주일이 7일 이므로 토요일 구하기*/
                  //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
                  cell.innerHTML = "<font color=#3D93E6>" + i
                  //7번째의 cell에만 색칠
                   row = calendar.insertRow();
                   //토요일 다음에 올 셀을 추가
              }
              /*오늘의 날짜에 노란색 칠하기*/
              if (today.getFullYear() == date.getFullYear()
                 && today.getMonth() == date.getMonth()
                 && i == date.getDate()) {
                  //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
                cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
               
               }
             }
        }
 </script>
<body onload="printClock()">
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
              <div class="col-9">
                  <h3 class="page-title">
                <span class="page-title-icon bg-gradient-info text-white mr-2">
                  <i class="mdi mdi-home"></i>
                </span> Dashboard </h3>
              </div>
            </div>
            <div class="page-header">
              <!-- <h3 class="page-title">
                <span class="page-title-icon bg-gradient-info text-white mr-2">
                  <i class="mdi mdi-home"></i>
                </span> Dashboard </h3> -->
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
                <div class="card bg-gradient-info card-img-holder text-white">
                  <div class="card-body">
                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                    <h4 class=" mb-3">Total Member<i class="mdi mdi-account-plus mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5">${member_totalRecordCount } People</h2>
                    <br />
                    <h6 class="card-text">Increased by 60%</h6>
                  </div>  
                </div>
              </div>
              <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-success card-img-holder text-white">
                  <div class="card-body">
                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                    <h4 class="font-weight-normal mb-3">Total Recipe <i class="mdi mdi-food-fork-drink mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5">${recipe_totalRecordCount } Recipe</h2>
                    <br />
                    <h6 class="card-text">Increased by 10%</h6>
                  </div>
                </div>
              </div>
              <%-- <div class="col-md-3 stretch-card grid-margin">
                <div class="card bg-gradient-success card-img-holder text-white">
                  <div class="card-body">
                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                    <h4 class="font-weight-normal mb-3">Total QnA <i class="mdi mdi-shopping mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5">${totalRecordCount }</h2>
                    <h6 class="card-text">Increased by 5%</h6>
                  </div>
                </div>
              </div> --%>
              
              <!-- 달력부분 -->  
              <div class="col-md-4 stretch-card grid-margin">
                <div class="card">
                  <div class="card-body container">

                  	<table>
                  	<col width="50%" /> 
				    <col width="50%" /> 
                  	 <tr>
                  	 	<td id="clock" style="text-align: center; font-size: 1.4em; font-family: Corbel;"><!-- 왼졲 칸에 나올 시계 -->
                  	 	
						
                  	 	</td>
                  	 	<td><!-- 오른쪽 칸에 나올 달력 -->
                  	 			 <table id="calendar" border="0" align="center"  style="text-align: center; font-size: 1.2em; font-family: Corbel;">
								   <colgroup>
				                          <col width="14%" /> 
				                          <col width="14%" /> 
				                          <col width="14%" /> 
				                          <col width="14%" /> 
				                          <col width="14%" /> 
				                          <col width="14%" /> 
				                          <col width="14%" /> 
				                          <col width="14%" /> 
				                   </colgroup>
				                   	
								    <tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
								        
								        <td>
								        	<label onclick="prevCalendar()"><i class="mdi mdi-arrow-left"></i></label>
								        </td>
								        
								        <td align="center" id="tbCalendarYM" colspan="5">
								        	yyyy년 m월
								        </td>
								        <td>
								        	<label onclick="nextCalendar()"><i class="mdi mdi-arrow-right"></i></label>
								        </td>
								    </tr>
								    <tr style="font-size: 0.9em;">
								        <td align="center" style="color: #FE8996" >Sun</td>
								        <td align="center">Mon</td>
								        <td align="center">Tue</td>
								        <td align="center">Wed</td>
								        <td align="center">Thu</td>
								        <td align="center">Fri</td>
								        <td align="center" style="color: #3D93E6">Sat</td>
								    </tr> 
								</table>
								<script language="javascript" type="text/javascript">
								    buildCalendar();//
								</script>
                  	 	
                  	 	
                  	 	
                  	 	</td>
                  	 </tr>
                  	</table>
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
                     <div class="table-responsive">
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
              </div>
              
              
          
              
              
              
              
              
              
              
            <!-- -------------------------------------------------------------------최근문의사항 -->
              
              
              
              <div class="col-md-8 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body"> 
                    <h4 class="card-title float-left" style="font-weight: bold;">답변을 기다리고 있어요!</h4>
                          <br />
                       <h5 class="card-title float-right"><i class="mdi mdi-comment-question-outline"></i><a href="pages/tables/qnaManagement.do" style="color:black;">최근문의사항</a></h5>
                      <div class="table-responsive">
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
                        <c:when test="${empty qnaviewRow_noreply }">
                           <tr>
                              <td colspan="5" class="text-center">
                                 등록된 게시물이 없습니다.
                              </td> 
                           </tr> 
                        </c:when> 
                        <c:otherwise>   
                         <c:forEach items="${qnaviewRow_noreply }" var="row" varStatus="status"> 

                              <!-- 리스트반복시작 --> 
                              
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
            
            
            
              <!-- -------------------------------------------------------------------최근레시피 -->
            
            <div class="row">
              <div class="col-md-7 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="clearfix">
                       <h4 class="card-title float-left">Recent Recipe</h4>
                       <br />  
                       <h5 class="card-title float-right"><i class="mdi mdi-login-variant"></i><a href="pages/tables/recipeManagement.do" style="color:black;">레시피게시판</a></h5>
                     <div class="table-responsive">
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
              </div>
              
               <!-- -------------------------------------------------------------------최근공지-->
              
            
              
              
              <div class="col-md-5 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title float-left">Recent Notice</h4>
                        <br />  
                       <h5 class="card-title float-right"><i class="mdi mdi-comment-question-outline"></i><a href="pages/tables/boardManagement.do" style="color:black;">최근공지사항</a></h5>
                      <div class="table-responsive">
                   <table class="table " style="text-align: center;">
                   <col width="20%" /> 
                         <col width="*" /> 
                         <col width="20%" /> 
                         <col width="20%" /> 
                  <tbody style="color:black;"> 
                  
                           <!-- 공지 리스트 출력  -->
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
                                    <label class="badge badge-gradient-info">공지</label>&nbsp;  ${row.title}
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
            
            
            
             
              <!-- -------------------------------------------------------------------인기게시물 -->
            
            <div class="row">
              <div class="col-md-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="clearfix">
                       <h4 class="card-title float-left">Popular posts</h4>
                       <br />  
                      <div class="table-responsive">
                      <h6>notice</h6>
                   <table class="table " style="text-align: center;">
                  <col width="20%" /> 
                         <col width="*" /> 
                         <col width="20%" /> 
                         <col width="20%" /> 
                  <tbody style="color:black;"> 
                       
                           <!-- 공지 리스트 출력  -->
                           <c:choose>
                        <c:when test="${empty pop_noticeviewRow }">
                           <tr>
                              <td colspan="6" class="text-center">
                                 등록된 회원이 없습니다. 
                              </td>
                           </tr>
                        </c:when>   
                        <c:otherwise>
                           <c:forEach items="${pop_noticeviewRow }" var="row" 
                              varStatus="loop">   
                              <!-- 리스트반복시작 --> 
                              <tr>
                                 
                                  <td class="text-left">
                                    <p style="font-weight: bold;">
                                    <label class="badge badge-gradient-success">HOT</label>&nbsp;
                                    
                                     
                                    <a href="pages/tables/boardManagementView.do?idx=${row.idx}&nowPage=${nowPage}&board_type=1" style="color:black;  ">
                                           ${row.title} 
                                    </a> 
                                    <!-- <i class="mdi mdi-checkbox-marked-circle-outline"></i>  -->
                                    </p>
                                 </td >    
                                 <td class="text-left" style="vertical-align: center;">   
                                    ${row.content }
                                 </td >  
                                  <td class="text-left">
                                    <p style="color:gray; text-align: center;">${row.postdate }</p>
                                 </td >  
                                  <td class="text-left">
                                    <p style="color:gray; text-align: center;"> ${row.view_count } hits</p>
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
               <h6>recipe</h6>
                   <table class="table " style="text-align: center;">
                  <col width="20%" /> 
                         <col width="*" /> 
                         <col width="20%" /> 
                         <col width="20%" /> 
                  <tbody style="color:black;"> 
                       
                           <!-- 레시피 리스트 출력  -->
                           <c:choose>
                        <c:when test="${empty pop_recipeviewRow }">
                           <tr>
                              <td colspan="6" class="text-center">
                                 등록된 회원이 없습니다. 
                              </td>
                           </tr>
                        </c:when>   
                        <c:otherwise>
                           <c:forEach items="${pop_recipeviewRow }" var="row" 
                              varStatus="loop"> 
                              <!-- 리스트반복시작 --> 
                              <tr>
                                 
                                  <td class="text-left">
                                    <p style="font-weight: bold;">
                                    <label class="badge badge-gradient-success">HOT</label>&nbsp;  
                                    <a href="pages/tables/recipeManagementView.do?idx=${row.idx}&nowPage=${nowPage}" style="color:black;  ">
                                           ${row.title} 
                                    </a> 
                                    <!-- <i class="mdi mdi-checkbox-marked-circle-outline"></i>  -->
                                    </p>
                                 </td >    
                                 <td class="text-left" style="vertical-align: center;">   
                                    ${row.content }
                                 </td >  
                                  <td class="text-left">
                                    <p style="color:gray; text-align: center;">${row.postdate }</p>
                                 </td >  
                                  <td class="text-left">
                                    <p style="color:gray; text-align: center;"> ${row.view_count } hits</p>
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