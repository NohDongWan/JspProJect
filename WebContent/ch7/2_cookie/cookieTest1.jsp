<!--  
	쿠키는 쿠키를 생성한 후에 클라이언트로 전송해야 합니다
	크롬 실행후 f12 -> Application 텝 -> 왼쪽 Cookies 선택 
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	a{
		text-decoration : none
	}

</style>
<title>Cookie Test</title>
</head>
<body>
<%
		//첫번째 요청하고 응답할때 세션아이디가간다. 그래야 다음에왔을떄 기억해준다.
		
		
		//쿠키를 생성합니다.
		// "name" : 쿠키의 이름
		// "hong" : 쿠키의 값
		
		
		Cookie cookie = new Cookie("name","hong");							//객체생성

		//cookie.setMaxAge(60*60*24); //쿠기 유지 시간을 지정합니다.
		//단위는 초로 하루를 지정합니다.
		cookie.setMaxAge(6);		//6초 동안 쿠키 유치 시간을 지정합니다.
		response.addCookie(cookie);		//생성한 쿠키를 클라이언트로 전송합니다.	나한테 전송해준다
%>

<h2> 
	쿠키 이름 : 
	<%=cookie.getName() %></h2>
	
<h2>
	쿠키 값
	<%=cookie.getValue() %>
</h2>

<h2>
	쿠키 유지시간 : <%=cookie.getMaxAge() %>초
	(이시간이 지난 후 아래의 anchor를 클릭해 보세요)
</h2>
<a href = "cookieTest2.jsp">쿠키 값 불러오기</a>



</body>
</html>