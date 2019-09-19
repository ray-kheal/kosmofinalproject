<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">

<h2>QnA 상세보기 </h2>
<!-- 비회원제게시판의 경우 삭제할 때 패스워드 입력창으로 이동되어야한다. 
따라서 상세보기 페이지에는 <form>태그가 필요없다. 모든 인증은 패스워드를 통해서 이루어지기 때문이다. -->
<table border = 1 width=800>
<colgroup>
<col width ="20%"/>
<col width ="30%"/>
<col width ="20%"/>
<col width ="*"/>
</colgroup>
<tbody>

	<tr>
		<th>No</th>
		<td>${viewRow.idx }</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${viewRow.postdate }</td>
		<td>조회수</td>
		<td>${viewRow.view_count }</td>
	</tr>
	
	<tr>
		<td>제목</td>
		<td colspan =3>${viewRow.title }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan =3 style="height :150px">
		${viewRow.content}
		</td>
	</tr>
	
	</tbody>

	<tr>
		<td colspan =4 align="center">
		<button type="button" onclick="location.href='./qna.do?nowPage=${param.nowPage}';">리스트바로가기</button>
		</td>
	</tr>
	</table>


</div>

</body>
</html>