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
#map{
	width:550px; 
	height:550px;
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
 
<script type="text/javascript">
	$(function() {
		$("#place").attr("class", "current");
	});
	
	var span;
	window.onload = function(){
		span = document.getElementById("result");
		
		if(navigator.geolocation){
			span.innerHTML = "Geolocation API를 지원합니다.";
			
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
		span.innerHTML = "위도:"+latitude+"<br/>경도:"+longitude;	
		
		
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
				['${row.place_name} '+'${row.place_name2}' ,  ${row.latitude },${row.longitude }], 
			</c:forEach>
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
	
	function setZoomable(zoomable) {
	    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
	    map.setZoomable(zoomable);    
	}
} 
</script>

<body class="is-preload no-sidebar">
	<div id="page-wrapper">
	
	

		<!-- 헤더파일 인클루드 -->
		<%@ include file="MainHeader.jsp"%>

		<!-- Main -->
		<div id="main-wrapper">
			<div class="container">
<!-- 			<button type="button" style="float: right" class="btn btn-outline-info">검색하기</button> -->
			
<!-- 			<input type="submit" style="float: right;" value="검색하기" />  -->
			<br/><br/>
			<table>
			
				<!-- <td rowspan="3">구글지도 위치</td>
				<td ><input type="text" placeholder="입력하세요"></td>
				
			<tr>
				<td ><input type="text" placeholder="입력하세요"></td>
			</tr>	
			
			<tr>
				<td ><input type="text" placeholder="입력하세요"></td>
			</tr> -->	
			
				<tr >
					<td rowspan="3" >
						
						<div id="map"></div>
						<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlhPQMCg8LPtFXgfQGPu87K7m6OsFn9Wg"></script>
						
						
					</td>
					<td style=" float: center;">
						
						<span id="result"></span>
					</td>
				</tr>			
				<tr>
					<!-- <td></td> -->
					<td style="float: center; ">
						<form name="searchFrm">
							<input type="hidden" id="latTxt" name="latTxt" />
							<input type="hidden" id="lngTxt" name="lngTxt" />
							<select name="distance" id="distance">
								<option value="2" <c:if test="${param.distance==2 }">selected</c:if>>100m</option>
								<option value="5" <c:if test="${param.distance==5 }">selected</c:if>>200m</option>
								<option value="10" <c:if test="${param.distance==10 }">selected</c:if>>500m</option>
								<option value="15" <c:if test="${param.distance==15 }">selected</c:if>>1Km</option>

							</select>
<!-- 							<input type="submit" value="검색하기" style ="text-align:center"/> -->
<!-- 								<input type="submit" style="float: right;" value="검색하기" />  -->
							<br/><br/>
							<input type="image"  src="images/searchbutton.png" width="150px" height="75px" style="text-align: center;"/>
						</form>
					
					</td>
				</tr>			
				
					<!-- <td></td> -->
					<td style=float: right;"><input type="text" placeholder="편의점 이름"></td>
				</tr>			
			</table>
			</div>
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