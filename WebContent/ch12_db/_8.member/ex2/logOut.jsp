<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<%
	session.invalidate();
%>

	<script>
		alert("로그아웃이 완료되었습니다.")
		location.href = "loginForm.jsp"
	</script>
</body>
</html>