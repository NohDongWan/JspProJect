<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = 'c'
				uri="http://java.sun.com/jsp/jstl/core"
 %>  

<%request.setCharacterEncoding("euc-kr");  %>
<html>
 <head>
 <link href="../../../css/send.css" rel="stylesheet" type="text/css">
 <title>send2.jsp</title>
 </head>

 <body>
	<h1> 회원 가입한 데이터</h1>
	<table border='1'>
		<tr>
			<th> ID </th>
			<td>${param.id}</td>
			<%-- <td><%=request.getParameter("id")%></td> --%>
		</tr>
		<tr>
			<th> 비밀번호 </th>
			<td>${param.pass}</td>
			<%-- <td><%=request.getParameter("pass")%></td> --%>
		</tr>
		<tr>
			<th> 주민번호 </th>
			<td>${param.jumin1}-${param.jumin2}</td>
				<%-- <%=request.getParameter("jumin1")%> -
				<%=request.getParameter("jumin2")%> --%>
		</tr>
		<tr>
			<th> E-Mail </th>
			<td>
				${param.email}@
				
				<c:choose>
					<c:when test="${param.sel==null}">
						${param.domain}
					</c:when>
					
					<c:otherwise>
						${param.sel}						
					</c:otherwise>
				</c:choose>				
				<%-- <%=request.getParameter("email")%>@ --%>
				<%-- <% if(request.getParameter("sel").equals("")){ %>
				    <%=request.getParameter("domain")%>
				 <%}else{				 
				 %>   
				     <%=request.getParameter("sel")%>
				 <%} %>     --%>
			</td>
		</tr>
		<tr>
			<th> 성별 </th>
			<td>
			
				<c:choose>
					<c:when test="${param.gender=='man'}">
						남자
					</c:when>
					<c:otherwise>
						여자
					</c:otherwise>
				</c:choose>
			
			<%-- 	<%
					if(request.getParameter("gender").equals("man")){
				%>
				남자
				<%
					}else{
				%>
				여자
				<%
					}
				%> --%>
			</td>
		</tr>
		<tr>
			<th> 취미 </th>
			<td>
				<c:forEach var="hobby" items="${paramValues.hobby}">
							${hobby}
				</c:forEach>
			
				<%-- <%
				   String[] hobby = request.getParameterValues("hobby");
					for(int i=0; i<hobby.length; i++){
				%>
					<%=hobby[i]%>&nbsp;
				<%
					}
				%> --%>
			</td>
		</tr>
		<tr>
			<th> 우편번호 </th>
			
			
			<td>${param.post1}-${param.post2}</td>
			<%-- <td><%=request.getParameter("post1") %> - <%=request.getParameter("post2") %></td> --%>
		</tr>
		<tr>
			<th> 주소 </th>
			<td>${param.address}</td>
			<%-- <td><%=request.getParameter("address") %></td> --%>
		</tr>
		<tr>
			<th> 자기소개 </th>
			<td>${ param.intro}</td>
			<%-- <td><%=request.getParameter("intro") %></td> --%>
		</tr>
	</table>
</body>
</html>