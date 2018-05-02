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
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	
	if(name!=null && id!=null){
		application.setAttribute("name", name);
		application.setAttribute("id", id);
	}
	
	%>

	<h1>영역과 속성 테스트</h1>

	<h2><%= name + "님 반갑습니다 <br>" %></h2>
	<h2><%= name + "님의 아이디는 " + id + "입니다<br>" %></h2>



	<form action="attributeTest2.jsp" method="post">
		<table border=1>
			<tr>
				<td colspan=2>session 영역에 저장할 내용들</td>
			</tr>
			<tr>
				<td>email 주소</td>
				<td><input type=text name=email required></td>
			</tr>

			<tr>
				<td>집주소</td>
				<td><input type="text" name=address required></td>
			</tr>

			<tr>
				<td>전화번호</td>
				<td><input type="text" name=tel required></td>
			</tr>

			<tr>
				<td colspan=2><input type=submit value="전송"></td>
			</tr>

		</table>



	</form>

</body>
</html>