<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>

	table{
		margin : 0 auto;
		text-align : center;		
	}
	td:first-child{
		width : 100px;
	}
	td:last-child{
		width : 300px;
	}
</style>
</head>
<body>
<% 
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String hobby[] = request.getParameterValues("hobby");
%>

	<h1 align = center>Request 예제입니다.</h1>

	<table border = 1 >
	<tr>
		<td>이름</td>
		<td><%=name %></td>
	</tr>
	<tr>
		<td>성별</td>
		<%-- <td><%=gender %></td> --%>
		<td>
		<% if(gender.equals("male"))
		{
			out.print("남자");
		}
		else
			out.print("여자");
			%>
		
		</td>
	</tr>
	<tr>
		<td>취미</td>
		<td><%for(int i = 0 ; i < hobby.length;i++){
				out.print(hobby[i]+ " ");
			}
				 %></td>
	</tr>
	
	</table>



</body>
</html>