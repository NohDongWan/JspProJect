<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>include 된 페이지</title>
</head>
<body>
	<table>
		<tr>
			<td>이름</td>
			<td><%=request.getParameter("name") %>
		</tr>
	<tr>
		<td>나이</td>
		<td><%=request.getParameter("age") %></td>
	</tr>
	
	</table>
</body>
</html>