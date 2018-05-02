<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>자바빈을 스크립트 요소로 접근한 경우</title>
</head>
<body>
	<h1>자바빈 예제</h1>
	<%
		javabean.BeanTest beantest = new javabean.BeanTest();
		pageContext.setAttribute("beantest",beantest);/*객체명,객체 로 값을 주는이유가 나중에 겟으로 받을때 객체명으로 받기 위해서이다.  */
		beantest.setName("봄입니다.");
	%>
	
	<h3><%=beantest.getName() %></h3>
	
	
</body>
</html>