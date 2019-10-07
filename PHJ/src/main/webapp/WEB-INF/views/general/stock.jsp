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
		<table>
			<tr>
			<c:forEach items="${listRows }" var="row" varStatus="loop">
				<td>점포명: ${row.getPlace_code }</td>
				<td>상품명: ${row.getProduct_code }</td>
				<td>재고량: ${row.getStock }</td>
				<td>재고백업량: ${row.getStock_backup }</td>
			</c:forEach>
			</tr>
		</table>
	</div>
</body>
</html>