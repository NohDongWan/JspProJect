<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>

<html>
<head>
<%
     Calendar c=Calendar.getInstance();
     int hour=c.get(Calendar.HOUR_OF_DAY);
     int minute=c.get(Calendar.MINUTE);
     int second=c.get(Calendar.SECOND);
%>
<meta charset="EUC-KR">
<style>p{color:red}</style>
<title>Servlet Test</title>
</head>
<body>
<h1>현재시간은 <%=hour %>시 <%=minute %>분 <%=second %>초 입니다.</h1>
<p>나는 JSP 입니다.</p>
</body>
</html>