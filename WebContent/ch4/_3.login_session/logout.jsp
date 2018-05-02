<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%session.invalidate(); %>
	<script>
	alert("로그아웃했어요")
	location.href = "template.jsp";
	</script>
</body>
</html>