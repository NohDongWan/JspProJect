<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>


	<h2><%=session.getAttribute("id") %>로 로그인 한 상태입니다</h2>
			<a href = "logout.jsp">로그아웃</a>
				
</body>
</html>