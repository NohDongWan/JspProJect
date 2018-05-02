<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int sum = 0;
    for(int i = 1 ; i <= 100; i++){
    	sum +=i;
    }
    out.print("<h2>" + sum + "입니다.</h2>");
    System.out.println("<h2>" + sum + "입니다.</h2>");
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>