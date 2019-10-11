<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>재고</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
@font-face { 
   font-family: 'Goyang'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Goyang.woff') format('woff'); 
   font-weight: normal; font-style: normal;
}
</style>

<body>
	<div class="container">
		<h2 style="font-family:Goyang; font-weight:bold;">입고할 재고</h2>
		<form action="stockPlus.do">
			<table>
				<tr>
					<td>점포코드 <input type="text" class="form-control" name="place_code" /></td>
					<td>상품코드 <input type="text" class="form-control" name="product_code" /></td>
					<td>추가할 재고량 <input type="text" class="form-control" name="stock" /></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:right;"><br /><button type="submit" class="btn btn-info">보내기</button></td>
				</tr>
			</table>
		</form>
		
		<div id="result">
		<c:if test="${not empty success and success eq 1 }">
		성공함.
		</c:if>



		</div>
	</div>
</body>
</html>