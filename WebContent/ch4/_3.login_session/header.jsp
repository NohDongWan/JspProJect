<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
div{
height : 100px;
background : green;
text-align : right;
}
a{
color : white;
text-decoration: none;
line-height : 100px; 

}
span{
color : white

}
</style>
</head>
<body>
	
	<%String sessionID = (String)session.getAttribute("id");				//				sessionId 에 담기
	
	if(/* session.getAttribute("id") */sessionID == null){
	%>	<div><a href = "login.jsp"><span>로그인</span></a></div>
		
	<%		
	
	}
	else{
	%>
		
	
		<div><span><%= /* session.getAttribute("id") */sessionID%>님 로그인에 성공하셨습니다." 
		<a href = "logout.jsp">로그아웃</a></span></div>
		<%
		
	}
	%>
	
		

 

</body>
</html>