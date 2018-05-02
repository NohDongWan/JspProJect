<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	String getpage = request.getParameter("code");
	String movepage = getpage + ".jsp";

%>
<jsp:forward page='<%=movepage %>'/>
</body>
</html>