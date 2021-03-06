<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype HTML>
<html>
<head>
<title>편의점 찾기 페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
@media (min-width: 420px) { 

   #cutboard { display: none; }
}
@media screen and (max-width: 420px) { 
   #wideboard { display: none; }

}
</style>
<style>
@font-face { 
   font-family: 'Goyang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Goyang.woff') format('woff'); 
   font-weight: normal; font-style: normal;
}

#map{
   max-width: 100%; height: auto;
   }
   
body {
   font-family: Goyang;
   
}
</style>
   
</head>
<c:choose>
   <c:when test="${param.distance eq 2 }">
      <c:set var="zoomLevel" value="15" />
   </c:when>
   <c:when test="${param.distance eq 5 }">
      <c:set var="zoomLevel" value="15" />
   </c:when>
   <c:when test="${param.distance eq 10 }">
      <c:set var="zoomLevel" value="14" />
   </c:when>
   <c:when test="${param.distance eq 15 }">
      <c:set var="zoomLevel" value="14" />
   </c:when>
   <c:otherwise>
      <c:set var="zoomLevel" value="13" />
   </c:otherwise>
</c:choose>
 <script>
$(function () {
	
	$('#searchbutton').click(function() {
		var loadingImg = "<img src='./images/loading.gif' alt='로딩중' /><br />";
		$('#placeResult').append(loadingImg);
	});
	
	
});
</script>
<script type="text/javascript">



   $(function() {
      $("#place_web").attr("class", "current");
   });
   
   var span;
   window.onload = function(){
      span = document.getElementById("result");
      
      if(navigator.geolocation){
        // span.innerHTML = "Geolocation API를 지원합니다.";
         
         var options = {   
            enableHighAccurcy:true, 
            timeout:5000,
            maximumAge:3000
         };
         navigator.geolocation.getCurrentPosition(showPosition,showError,options);
      }
      else{
         span.innerHTML = "이 브라우저는 Geolocation API를 지원하지 않습니다.";
      }   
   }
   
   var showPosition = function(position){
      //위도를 가져오는 부분
      var latitude = position.coords.latitude;
      //경도를 가져오는 부분
      var longitude = position.coords.longitude;
    
      //위경도를 text input에 입력
      document.getElementById("latTxt").value = latitude;
      document.getElementById("lngTxt").value = longitude;
      
      
         
      //위경도를 가져온후 지도 표시
      initMap(latitude, longitude) ;
   }
   
   function initMap(latVar, lngVar) {            
      var uluru = {lat: latVar, lng: lngVar};
      var map = new google.maps.Map(document.getElementById('map'), {
         zoom: ${zoomLevel},
         center: uluru
      });
      
      var marker = new google.maps.Marker({
         position: uluru,
         map: map,
         
         
         icon: './images/icon_me.png'
         
      });      
      
      var infowindow = new google.maps.InfoWindow();
      
       
      var locations = [      
         <c:forEach items="${searchLists }" var="row">
            ['${row.place_name}' ,  ${row.latitude },${row.longitude }, ${row.place_code}], 
         </c:forEach> 
      ];
      
       var marker, i;
      var place_bookmark = '<%=session.getAttribute("PLACE_BOOKMARK")%>';
      var email = '<%=session.getAttribute("EMAIL")%>';
      for (i=0; i<locations.length; i++) {
         var bookmark = '';
         
         
         marker = new google.maps.Marker({
            id:i,
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
            map: map,
            icon: './images/icon_facil.png'
         });
      
         google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
               if(email != 'null'){
                  if (place_bookmark == locations[i][3]){
                     bookmark = "<br/><a href='./deleteBookmarkPlace.do'>관심점포에서 해제하기 </a>";
                  } else {
                     bookmark = "<br/><a href='./bookmarkPlace.do?place_code="+locations[i][3]+"' id='bookmarkPlace'>관심점포로 등록하기 </a>";
                     
                  }
               }   
                  infowindow.setContent(locations[i][0]+"<br/><a href='javascript:alert(\"편의점명:"+locations[i][0]+"\");'></a>" + bookmark);
                  infowindow.open(map, marker);
               
            }
         })(marker, i));
      
         if(marker)
         {
            marker.addListener('click', function() {
               map.setZoom(16);
               map.setCenter(this.getPosition());
            });
         }
      }   
   }
   var showError = function(error){
   switch(error.code){
      case error.UNKNOWN_ERROR:
         span.innerHTML = "알수없는오류발생";break;
      case error.PERMISSION_DENIED:
         span.innerHTML = "권한이 없습니다";
         alert('모바일웹에선 지원하지 않습니다. PC웹이나 어플리케이션을 통하여 실행해주세요');
         break;
      case error.POSITION_UNAVAILABLE:                                                    
         span.innerHTML = "위치 확인불가";break;
      case error.TIMEOUT:
         span.innerHTML = "시간초과";break;
   }
   
   

} 
</script>

<body class="is-preload no-sidebar">
   <div id="page-wrapper">
   
   

      <!-- 헤더파일 인클루드 -->
      <%@ include file="MainHeader.jsp"%>

      <div id="wideboard">
         <div style="width: 100%; height: 200px; text-align: center;  display: table;" >
      
            <p style="display: table-cell; text-align: center; vertical-align: middle; font-family: 'Goyang', cursive;
               font-size: 60px; color: black; font-weight: bold;">
               &nbsp;   
            
               <img src="https://image.flaticon.com/icons/svg/485/485394.svg" width="80px" height="80px" /> 
               편의점을 찾아보아요
               <img src="https://image.flaticon.com/icons/svg/263/263072.svg" width="80px" height="80px" /> 
            </p>
         
            </div>
      
      </div>
   <!--    <div id="cutboard">
         <div style="width: 100%; height: 200px; text-align: center;  display: table;" >
      
            <p style="display: table-cell; text-align: center; vertical-align: middle; font-family: 'Goyang', cursive;
               font-size: 40px; color: black; font-weight: bold;">
               &nbsp;   
            
               편의점을 찾아보아요
               <img src="https://image.flaticon.com/icons/svg/485/485394.svg" width="40px"   /> 
            </p>
         
            </div>
      </div> -->
          
            
      </div>
      
      <!-- Main -->
      <div id="main-wrapper">
         <div class="container">
   
         <br/><br/><br/> 
         
         <table style="border:1px solid gray; height: 600px;">
         <tr height="400px" >
            <td id=map>
               <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB72L9djU32QhHnDTm9QLNmO9385Drfbpg"></script>
            </td>
         </tr>
         <tr>
            <td style="text-align: center;">
               <span id="result"></span> 
                  <form name="searchFrm">
                     <input type="hidden" id="latTxt" name="latTxt" />
                     <input type="hidden" id="lngTxt" name="lngTxt" />
                     <br />
                      <h5 style="font-family:Goyang; font-weight: bold; ">근처 편의점 검색</h5> 
                      <div>
                      
                          <table>
                           <col width="60%" />
                          <col width="40%" />
                          <tr>
                             <td style="text-align: right;">
                                <select name="distance" id="distance" style="width: 60%; height:50px; display: inline; ">
                                 <option value="2" <c:if test="${param.distance==2 }">selected</c:if>>200m</option>
                                 <option value="5" <c:if test="${param.distance==5 }">selected</c:if>>500m</option>
                                 <option value="10" <c:if test="${param.distance==10 }">selected</c:if>>1Km</option>
                                 <option value="15" <c:if test="${param.distance==15 }">selected</c:if>>1.5Km</option>
                              </select>
                             </td>
                             <td style="text-align: left;">
                                  <input type="image" id="searchbutton"  src="images/searchbutton.png"   style="width:100px;  display: inline; text-align: center;  border-radius: 15px;"/>  
                             </td>
                          </tr>
                          </table>
                      </div>
                     <br />     
                    </form> 
              
            
               <h5 style="font-family:Goyang; font-weight: bold;">근처 편의점 목록</h5> <br />
               <div id="placeResult" ></div>
                  <table class="table table-bordered" style="border:2px solid gray; height: 200px; font-family:Goyang;">
              	 <c:choose>
                     <c:when test="${empty searchLists }">
                        <tr>
                           <td colspan="2" class="text-center">
                              등록된 점포가 없습니다.
                           </td>
                        </tr>
                     </c:when>
                     <c:otherwise>
                        <c:forEach items="${searchLists }" var="row" 
                           varStatus="loop">
                           <!-- 리스트반복시작 -->
                           <tr>
                               <td class="text-center" >${row.place_name }</td>
                              <td class="text-left">${row.place_address}</td>
                           </tr>
                           
                           <!-- 리스트반복끝 -->
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
                  <tr>
                     <td colspan="2" align="center" style="font-weight: bold; font-size: 1.5em; ">
                        ${pagingImg }
                     </td>
                  </tr>
                  </table>
            
            
            </td>
            
         
         </tr>
         
         </table>
         
         
        
         </div><!-- container -->
      </div>

      <!-- Footer -->
      <%@ include file="MainFooter.jsp"%>

   </div>

   <!-- Scripts -->

   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/jquery.dropotron.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>

</body>
</html>