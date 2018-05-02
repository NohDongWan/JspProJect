<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	p{background : <%= application.getInitParameter("color") %>}

</style>
<title>Insert title here</title>
</head>
<body>
<h1>web.xml 에서 설정한 색상으로 지정</h1>
<p>나는 무슨 색인가요?</p>



<%--   
  <h2>web.xml에서 설정한 색상으로 지정</h2>
   <% String color = application.getInitParameter("color");
   %>
   <div style="background=<%=color%>">나는 무슨 색인가요>
   </div> 
 --%>

</body>
</html>