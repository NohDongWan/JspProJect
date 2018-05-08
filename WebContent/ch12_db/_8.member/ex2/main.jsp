<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%@ include file = "header.jsp" %>
<%
	if(id.equals("admin")){
		%>
		<a href = "member_list.jsp">관리자모드 접속</a>
		<% }%>
</body>
</html>