<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page isELIgnored="true" %>
<%-- isELIgnored 값이 true 이면 EL 을 일반 문자열로 처리합니다. --%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%-- empty 연산자
		형식) empty 값
		: 값이 비어 있거나 null 인지를 조사할 때 사용하는 연산자 입니다.
			값이 null 이면 true 를 반환합니다.
			문자열과 배열의 크기가 0 인 경우에도 true 를 반환합니다.
			
 --%>
	
<%
	pageContext.setAttribute("food", "과자");
%>

	<h1>\${pageScope.food } = ${pageScope.food }</h1>
	<h1>\${food} = ${food}</h1>
	
	<h3>\${empty food}=${empty food}</h3>
	<h3>\${empty food2}=${empty food2}</h3>		<!--값이 널이기에 true  -->
	
	<h3>\${null==food} = ${null==food}</h3>
	<h3>\${null==food2} = ${null==food2}</h3>		<!-- food2 는 없기때문에 true  -->
	
	<%-- name 이라는 파라미터가 존재하지 않을 경우 아무 것도 출력되지 않습니다 --%>
	<h3>\${param.name}=${param.name}</h3> 
</body>
</html>