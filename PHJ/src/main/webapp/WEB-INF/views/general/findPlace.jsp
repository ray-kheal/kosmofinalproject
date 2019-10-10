<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype HTML>
<html>
<head>
<title>편의점 찾기 페이지(임시)</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


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
   
<style>
@media (min-width: 420px)  { 

   #cutboard { display: none; }
}
@media screen and (max-width: 420px) { 
   #wideboard { display: none; }

}
</style>
</head>
<script type="text/javascript">
   $(function() {
      $("#stock").attr("class", "current");
   });
   
   var span;
   window.onload = function(){
      span = document.getElementById("result");
      
      if(navigator.geolocation){
         
         
         var options = {   
            enableHighAccurcy:true, 
            timeout:5000,
            maximumAge:3000
         };
         navigator.geolocation.getCurrentPosition(showPosition,showError,options);
      }
      else{
         
      }   
   }
   
   var showPosition = function(position){
      //위도를 가져오는 부분
      var latitude = position.coords.latitude;
      //경도를 가져오는 부분
      var longitude = position.coords.longitude;
      
      
      
      //위경도를 text input에 입력
      //document.getElementById("latTxt").value = latitude;
      //document.getElementById("lngTxt").value = longitude;
      
      
         
      //위경도를 가져온후 지도 표시
      initMap(latitude, longitude) ;
   }
   
   function initMap(latVar, lngVar) {            
      var uluru = {lat: ${dto.latitude}, lng: ${dto.longitude }};
      var map = new google.maps.Map(document.getElementById('map'), {
         zoom: 15,
         center: uluru
      });
      
//       var marker = new google.maps.Marker({
//          position: uluru,
//          map: map,
//          icon: './images/icon_me.png'
         
//       });      
      
      var infowindow = new google.maps.InfoWindow();
      
       
      var locations = [      
         
            ['${dto.place_name}' ,  ${dto.latitude },${dto.longitude }], 
         
      ];
      
       var marker, i;

      for (i=0; i<locations.length; i++) {  
         marker = new google.maps.Marker({
            id:i,
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
            map: map,
            icon: './images/icon_facil.png'
         });
      
         google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
               
               infowindow.setContent(locations[i][0]+"<br/><a href='javascript:alert(\"편의점명:"+locations[i][0]+"\");'>바로가기</a>");
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
         span.innerHTML = "권한이 없습니다";break;
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
 
   
   		<div id="cutboard">
			<div style="width: 100%;  text-align: center;  display: table;" >
      
		      <p style="display: table-cell; text-align: center; vertical-align: middle; font-family: 'Goyang', cursive;
		         font-size: 40px; color: black; font-weight: bold;">
            	<img src="https://image.flaticon.com/icons/svg/10/10624.svg" width="30px" />
		        어디로 가야 할까?
		      </p>
	   		</div>
		</div>
		<div id="wideboard">
			<div style="width: 100%; height:200px; text-align: center;  display: table;" >
      
		      <p style="display: table-cell; text-align: center; vertical-align: middle; font-family: 'Goyang', cursive;
		         font-size: 60px; color: black; font-weight: bold;">
           		 <img src="https://image.flaticon.com/icons/svg/10/10624.svg" width="55px" />
                  어디로 가야 할까?
		      </p>
	   		</div>
		    
		</div>
      	<br />
   
   
      <!-- Main -->
      <div id="main-wrapper">
         <div class="container">

         
         <table style="border:2px solid gray; height: 600px; font-family:Goyang;">
            <colgroup>
            
               <%-- <col width="55%" />
               <col width="45%" /> --%>
            </colgroup>
            <tr height="400px"> 
               <td id=map>          
                  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlhPQMCg8LPtFXgfQGPu87K7m6OsFn9Wg"></script>
               </td> 
            </tr>
            <tr>   
               <td style="float: center; border-bottom: 2px solid gray; height: 600px;">
                  <table>
                     <tr>
                        <td style="text-align: center; font-size:1.3em; font-weight: bold; border-bottom: 1px white solid;">${dto.place_name } ${dto.place_name2 }</td>
                     </tr>
                     <tr>  
                        <td style="text-align: center; border-bottom: 2px solid #bfbfbf; padding-bottom: 20px;">${dto.place_address } <br /> (${dto.place_road_addr })</td>
                     </tr>
                  </table> 
                    <c:choose>
               <c:when test="${empty sdto }">
                  <p class="text-center">등록된 상품이 없습니다.</p>
               </c:when>             
               <c:otherwise>      
                  <c:forEach items="${sdto }" var="row" varStatus="loop">
                      <div>
                      <table >
                       <colgroup> 
                        <col width="40%" />
                        <col width="*" />
                    </colgroup>  
                    	<tr>    
                    		<td style="text-align: center; border-bottom: 2px solid #306DAA;"><img src="./resources/CSProduct/${row.product_name }.jpg" style="width: 60%;" alt="" /></td>
                    		<td style="border-bottom: 2px solid #306DAA; font-size: 1.2em;"> 
                    			<p> <${row.product_name}> </p> 
                    			<p style="color: grey;">가격 : ${row.product_price }원</p>
                    			<p>수량 : ${row.stock}개</p>
                    		</td>
                    	</tr>
                      </table>
                     </div>
                  </c:forEach> 
                   <div class="container" >
                     <table >
                        <tr>
                           <td align="center" style="font-weight: bold; font-size: 1.5em; ">
                              ${pagingImg }
                           </td>
                        </tr>
                     </table>    
                    </div>    
               </c:otherwise> 
            </c:choose>
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