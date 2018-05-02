<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	Cookie cookie = new Cookie("language1",request.getParameter("language"));	

	//시간을 설정하지 않으면 setMaxAge()메소드 사용하지 않을 때
	//브라우저 종료시 쿠키도 삭제됩니다.
	//메서드를 호출할 때 인자 값으로 0을 주면 쿠키는 삭제 됩니다.
	
	cookie.setMaxAge(60*60*24);
	
	response.addCookie(cookie);	//클라이언트로 쿠키값을 전송합니다. //넘기는놈.
			 %>
			 
			 <script>
			 	location.href = "cookieExample.jsp"
			 </script>
</body>
</html>