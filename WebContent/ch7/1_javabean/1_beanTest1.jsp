<%@page import="javabean.BeanTest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h1>자바빈 예제</h1>
<%
	BeanTest bean = new BeanTest();
		out.print(bean.getName());
		bean.setName("<br>안녕");	/* 셋팅은 값을 셋팅해준다 bean.setName("value") */
		out.print(bean.getName());		//값을 얻어서 출력한다.
%> 
</body>
</html>