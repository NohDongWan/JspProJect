<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<table>
	<%
		Enumeration<String> e = request.getParameterNames();
		while(e.hasMoreElements()){
			String attributeName = e.nextElement();
			String attributeValue = 
							request.getParameter(attributeName);
	%>
		<tr>
			<td><%=attributeName%></td>
			<td><%=attributeValue %></td>
		</tr>
	
		<%
		}
		%>
		</table>
</body>
</html>