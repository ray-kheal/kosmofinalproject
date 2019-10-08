<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- Footer -->
<div id="footer-wrapper">
	<footer id="footer" class="container">
			<div class="col-12">
				<div id="copyright">
					<ul class="menu" style="margin: 0 auto;">
						<li>&copy; 2019. 편히점 All rights reserved.</li>
					</ul>
				</div>
			</div>
	</footer>
</div>

<script>

window.onload =function(){
	if(window.Notification){
		Notification.requestPermission();
	} else{
		alert("웹노티를 지원하지않음");
	}
}
function calculate(){
	setTimeout(function(){
		norify();
	}, 1000);
}

function notify(){
	if(Notification.permission!='granted'){
		alert('웹노티 지원 X');
	} else{
		var notification = new Notification(
			'편히점',
			{
				icon : '../resources/images/logo.png',
				body : '관심상품으로 등록하신 물품이 관심점포에입고 되었습니다.',
			}
		);
		
		notification.onclick = function(){
			window.open('http://localhost:8080/phj');
		}
	}
}

</script>