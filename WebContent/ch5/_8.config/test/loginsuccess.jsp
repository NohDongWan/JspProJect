<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
	String fid = request.getParameter("id");
	String fpass = request.getParameter("passwd");
	
	String id = config.getInitParameter("id"); 
	String pass = config.getInitParameter("pass");
	
	if(fid.equals(id)&&fpass.equals(pass)){
		out.print("로그인 성공");		
	}
	else
		out.print("로그인실패");
	%>
	
</body>
</html>