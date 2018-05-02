<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!--페이지 디렉티브 언어는 자바  내가보내는건 택스트로 html 로 보내 그니깐너는 html 로 번역해줘  -->
   
   
   
   
   
   
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
request 속성 : <%= request.getAttribute("food") %><br>
session 속성 : <%= session.getAttribute("food") %><br>
ServletContext 속성 <%= application.getAttribute("food") %>

</body>
</html>