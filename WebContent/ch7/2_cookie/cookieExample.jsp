<%--

	이페이지는 폼을 만들어놓고 폼이 먼저 데이터를 보내면  cookieExample2에 옵션을 얻어서
	다시 이페이지로 넘어와서 처리한다 

--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel = "stylesheet" href ="css.css"  type = "text/css"/>
</head>
<body>
<%
	String language = "korea";

	//header 의 이름 중에서 cookie 의 값을 가져옵니다.
	String cookie = request.getHeader("Cookie");	//Cookie 안에는 이전 페이지 링크 URL 정보를 반환한다 없을시 null 리턴
	
	
	//쿠키가 존재하는지 확인합니다.
	if(cookie != null){
		Cookie cookies[] = request.getCookies();
		
		
		//쿠키의 이름이 "language1"인 값을 찾기위해쿠기 배열들을 모두 확인합니다.
		
		for(int i = 0 ; i < cookies.length; i++){
			if(cookies[i].getName().equals("language1")){
				language = cookies[i].getValue();
			}
		}
		out.println(language);
	}

%>

<%
	if(language.equals("korea")){
		%>
		<h3>안녕하세요. 이것은 쿠키 예제입니다</h3>
		<%
	}
	else{
%>
	<h3>Hello This is Cookie example.</h3>
	<%
	} 
	%>
	
	<fieldset>
	<form action = "cookieExample2.jsp" method = post>
		<input type = radio name = language value = korea
		<%
			if(language.equals("korea"))
			{
		%>checked
		<%} %>
		>한국어
	
	
		<input type = radio name = language value = english
		<%
			if(language.equals("english"))
			{
		%>checked
		<%} %>
		>영어페이지 보기
		<input type = submit value = "설정">
		
	</form>

</fieldset>

</body>
</html>