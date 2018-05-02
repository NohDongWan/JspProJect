
<!-- 

	서블릿은 특정페이지의 값이 필요할때 웹.xml에 저장해여 
	싹다불러온다.
	

	어플리케이션과
	서블릿 의 차이는 어플리케이션은 어디든 사용할 수 있고
	서블릿은 내가 써준 경로만 사용할 수 있는 차이점이 있다




	config내장 객체는 JSP 페이지가 서블릿 클래스로 변환되어 서블릿 인스턴스가
	생성될 때 참조해야 할 초기 설정 정보들을 저장해 놓은 객체입니다.
	이러한 초키 설정 정보들은 웹 컨테이너가 구동될 떄 자체적으로 생성/관리되며
	서블릿 당 1개만의 객체가 생성되어 같은 서블릿 인스턴스는 동일한 config 객체를 참조하게 됩니다.
	실행방법 1. 이클립스 Servers 뷰에서 start 를 선택
		  2. 브라우저에서 
		  	http://localhost:8088/JspProject/configTest
		  		입력합니다.

 -->

<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
		<table border =1>
			<tr>
				<td>초기 파라미터 이름</td>
				<td>초기 파라미터 값</td>
			</tr>
	
	<%
		Enumeration<String> e = config.getInitParameterNames();
		while(e.hasMoreElements()){
			String init_paramName = e.nextElement();
	%>
	<tr>
		<td><%=init_paramName %></td>
		<td><%= config.getInitParameter(init_paramName) %></td>
	</tr>	
		<%
		}
		%>	
		</table>
</body>
</html>


