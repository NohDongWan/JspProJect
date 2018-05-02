<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href ="ch5-11.css" rel = "stylesheet" type = "text/css"> 
</head>
<body>

	<%
	
	request.setCharacterEncoding("UTF-8");		//post 방식으로 가져올때는 인코딩을 꼭해줘야된다.
	
	
	String id = (String)application.getAttribute("id");
	String name = (String)application.getAttribute("name");
	
	String email = (String)session.getAttribute("email"); 
	String address = (String)session.getAttribute("address");
	String tel = (String)session.getAttribute("tel");
	
	%>
	
	<table border = 1>
		<%
			Enumeration<String> f = application.getAttributeNames();
		
		while(f.hasMoreElements()){											//f 는 배열이라고 보면된다.
			
			String attributename = f.nextElement();							//f의다음값 하나씩 넣어주고
			if(attributename.equals("name") || attributename.equals("id")){
				%>
			<tr>
			<td><%=attributename %></td>
			<td><%=application.getAttribute(attributename) %></td>
			</tr>
		<%				
			}
		%>
		
		
	
			<%} %>
	
	</table>
			<br><br>
	
	
	
	
	
		<table border = 1>
		<%
			Enumeration<String> e = session.getAttributeNames();
			while(e.hasMoreElements()){
				
				String attributeName = e.nextElement();
				String attributeValue =
						(String) session.getAttribute(attributeName);
				
				
		%>
		<tr>
			<td><%= attributeName %></td>
			<td><%= attributeValue %></td>
			
		</tr>
		<%} %>
	 
	</table>
	<br><br>

		 <table border= 1>
		<tr>
		<td colspan = 2>Application 객체의 저장된 내용들</td>
		</tr>
		
		<tr>
			<td>이름</td>
			<td><%=name %></td>
		</tr>
		
		<tr>
			<td>아이디</td>
			<td><%=id %></td>
		</tr>
	
	</table> 
			<br><br>

	 <table border = 1>
		<tr>
		<td colspan = 2>Session 객체의 저장된 내용들</td>
		</tr>
		<tr>
			<td>address</td>
			<td><%=address %></td>
		</tr>
		
		<tr>
			<td>eamil</td>
			<td><%= email %></td>
		</tr>
	
		<tr>
			<td>전화번호</td>
			<td><%= tel %></td>
		</tr>
	
	</table>
 


</body>
</html>