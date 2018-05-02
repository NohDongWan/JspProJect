<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	session.setMaxInactiveInterval(10);//10초도안 세션유지
 	//실행방법 - 실행 후 10초 안에 새로고침 (F5) 해 보세요
 	//			실행 후 10초 후에 새로고침 (F5) 해 보세요.
 	//		10 초후 새로운 세션 ID로 생성됩니다.
 %>   
 
    
<!DOCTYPE html>
<html>
<head>
<title>Session Test</title>
</head>
<body>
	<%SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd E요일 h:m:ss"); 
	%>
	

	<h2>세션 테스트</h2>
	isNew():<%=session.isNew() %><br>					<!--세션이 최신거냐?  -->
	세션 생성시간 : <%= f.format(session.getCreationTime())%><br>
	최종 접속시간 : <%=f.format(session.getLastAccessedTime())%><br>
	세션 ID : <%=session.getId() %><br>


</body>
</html>