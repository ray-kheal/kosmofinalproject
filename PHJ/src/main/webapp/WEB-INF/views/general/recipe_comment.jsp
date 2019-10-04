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
<script>
window.onload = function(){
	   loadComments();
	}

var contextPath ="${requestScope['javax.servlet.include.context_path']}";
var loadComments = function(){//ajax 구현
   var http;
   var url ="Rview.do"+${param.b_code};
   if(window.XMLHttpRequest){
      http=new XMLHttpRequest();
   }else if(window.ActiveXObject){
      http=new ActiveXObject("Microsoft.XMLHTTP");
   }
   http.onreadystatechange = function(){
      if(this.readyState==4 && this.status==200){
         var comlist = JSON.parse(this.responseText);
         commmentList(comlist["list"]);
         //컨트롤러에서 보내온 BAD_REQUEST(400)을 받는다.
      }else if(this.status == 400){
          alert("comments를 읽어오지 못했습니다.");
      }
   }
   http.open("GET",url,true);
   http.send();
}

function commmentList(comlist){
	   var tableList = document.querySelector("#commentsList .list");
	   var htmlList = "";
	   for(var i=0;i<comlist.length;i++){
	      htmlList +="<tr>";
	      htmlList +="<td>"+comlist[i]["C_CODE"]+"</td>";
	      htmlList +="<td>"+comlist[i]["B_CODE"]+"</td>";
	      htmlList +="<td>"+comlist[i]["WRITER"]+"</td>";
	      htmlList +="<td>"+comlist[i]["CONTET"]+"</td>";
	
	      htmlList +="</tr>";
	   }
	   tableList.innerHTML = htmlList;
	}



</script>
<body>
<div>
	<form id="commentForm" name="commentForm" method="post">
	<table class="table table-borderless" style=" border-top: 1px solid #f6f6f6; " >
		<col width="20%" />
		<col width="*" />
		<col width="20%" />
		<tr>     
			<td style="text-align:right;">
			<%= String b_code =request.getParameter("idx") %>
				<input type="hid-den" id="b_code" name="b_code" value="<%=b_code %>"/>
				<input type="hid-den" id="b_code" name="writer" value="<%=session.getAttribute("NAME") %>" />
				<img src="images/pic-2.png" alt="" />
			</td>
			<td>
				<input type="text" style=" width: 100%; height: 200%; " />
			</td>
			<td>
				<button class="btn btn-sm"  style="background-color: #7f7b9e; color:white;">답글달기</button>
			</td>
		</tr>
	</table> 
	</form> 
</div>

<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
</body>
</html>