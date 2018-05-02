<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h1>로그인에 성공했습니다.</h1>
		<%
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		session.setAttribute("id", id);
		session.setAttribute("pass", pass);
		
		String check = request.getParameter("check");
		Cookie cookie = new Cookie("id1",request.getParameter("id"));		//체크1로이름 설정 체크네임을 받아들인다
		
		
		if(check !=null && check.equals("check")){
		cookie.setMaxAge(60*2);
		response.addCookie(cookie);	//클라이언트로 쿠키값을 전송합니다. //넘기는놈.
		}
		
		else{
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			
		}
		
		
		%>
		<%
		
		if(check == null){
			%>
			<a href = loginCheck.jsp>로그인체크</a>
			<%}else if(check.equals("check"))
		{
		%>
		<a href = loginCheck.jsp>로그인체크</a>
		<a href = login.jsp>로그인화면 다시보기</a>
		<%}
	%>
		
		
		
</body>
</html>