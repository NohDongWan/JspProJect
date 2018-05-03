<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = 'c'
				uri="http://java.sun.com/jsp/jstl/core"
 %>
    

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%-- <h3>넘어온 이름은 : ${param.name}</h3>
<h3>넘어온 취미는 : ${paramValues.hobby[0]}  ${paramValues.hobby[1]}</h3> --%>

	<c:out value="${param.name}"/>	<br>
	<c:forEach var="Hname" items="${paramValues.hobby}">
			<c:out value="${Hname}"/>					<!-- 출력도 c로하기 -->		
	</c:forEach>

</body>
</html>