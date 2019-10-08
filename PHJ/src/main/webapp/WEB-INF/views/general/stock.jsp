<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>재고량</h2>
		<form action="stockPlus.do">
			<table>
				<tr>
					<td>점포코드: <input type="text" name="place_code" /></td>
					<td>상품코드: <input type="text" name="product_code" /></td>
					<td>추가할 재고량: <input type="text" name="stock" /></td>
					<td><button type="submit" class="btn btn-info">보내기</button></td>
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