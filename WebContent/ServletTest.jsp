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
<h1>����ð��� <%=hour %>�� <%=minute %>�� <%=second %>�� �Դϴ�.</h1>
<p>���� JSP �Դϴ�.</p>
</body>
</html>