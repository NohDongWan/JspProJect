<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
String id = (String)session.getAttribute("id");

if(id.equals("admin")){
	%>
	<div><%="관리자"+ id + "님 환영합니다"  %></div>
	<%
}
else{
	%>
	<div><%="일반회원"+ id + "님 환영합니다"  %></div>
	<% }
%>
(<a href = "updateForm.jsp">정보수정</a>)
(<a href = "logOut.jsp">로그아웃</a>)
</body>
</html>