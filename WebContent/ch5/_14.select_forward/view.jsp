<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	 String name=request.getParameter("code")+".jsp"; 
	
	
	
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
%>
<jsp:forward page='<%=name %>'/>
</body>
</html>