<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page trimDirectiveWhitespaces="false" %>
    
    <%--
    	실행 후 페이지 소스 보기를 봅니다. 
    	html 태그 시작전에 줄바꿈 공백 문자가 있습니다.
    	이것을 삭제하기 위해 trimDirectiveWhitespaces ="true" 으로 설정합니다
    	JSP 페이지의 응답 결과 페이지에서 디렉티브나
    	스크립트가 있던 부분이 공백으로
    	표시되던 것을 응답 결과에 포함되지 않도록 합니다.
    	
    	--%>
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
		<%session.invalidate(); %>
		
		<h1>로그아웃 되었습니다</h1>
		
		<a href = login.jsp>로그인 페이지로 이동</a>
</body>
</html>