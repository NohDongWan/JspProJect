<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="beantest" class = "javabean.BeanTest2"/>											<!--  1.여기값이 정해져있다 이름은 beantest --> 
<!-- 위는 BeanTest2 beantest = new BeanTest2() 와같은의미  -->
<jsp:setProperty  name="beantest" property="*"/>
<!-- beantest 에다 *(전체) 를 설정해준다 ///// beantest.se-->



<h1>자바빈 예제</h1>
<%-- <h3><jsp:getProperty name = "beantest" property = "*"/></h3> 
			
--%>

아디 : <jsp:getProperty name="beantest" property="id" /><br>
비밀번호 : <jsp:getProperty name="beantest" property="pass" /><br>	
이름 : <jsp:getProperty name="beantest" property="name" />	<br>
<%
if(beantest.getGender().equals("1"))
{
	out.println("성별 : 남자"+"<br>");
}
else
{
	out.println("성별 : 여자"+"<br>");
}
%>
나이 : <jsp:getProperty name="beantest" property="age" />	<br>
이메일 : <jsp:getProperty name="beantest" property="email" />	<br>	

	<hr>
	<hr>
	
<%="아이디 : "+ beantest.getId() %><br>
<%="패스워드 : "+ beantest.getPass() %><br>
<%="이름 : "+ beantest.getName() %><br>
<%
if(beantest.getGender().equals("1"))
{
	out.println("성별 : 남자"+"<br>");
}
else
{
	out.println("성별 : 여자"+"<br>");
}
	 %>
<%="나이 : "+ beantest.getAge() %><br>
<%="이메일 : "+ beantest.getEmail() %><br>

	
</body>
</html>