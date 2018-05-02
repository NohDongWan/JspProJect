<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

   <%@ include file = "header.jsp"  %>
    <h1>includeTest.jsp 파일입니다.</h1>
    <span>header.jsp 의 id 값입니다. : <%=sessionID %></span>
    <%@ include file = "footer.jsp"  %>



</body>
</html>