<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
	
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String tel = request.getParameter("tel");
	
	if(email !=null && address !=null && tel !=null){
		session.setAttribute("email", email);
		session.setAttribute("address", address);
		session.setAttribute("tel", tel);
	}
	
		String name = (String)application.getAttribute("name");
	%>

<h1>영역과 속성 테스트</h1>
<h2><%=name + "님의 정보가 모두 저장되었습니다" %></h2>
<a href = "attributeTest3.jsp">확인하러 가기</a>
</body>
</html>