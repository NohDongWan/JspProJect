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
	<h1> ȸ�� ������ ������</h1>
	<table border='1'>
		<tr>
			<th> ID </th>
			<td>${param.id}</td>
			<%-- <td><%=request.getParameter("id")%></td> --%>
		</tr>
		<tr>
			<th> ��й�ȣ </th>
			<td>${param.pass}</td>
			<%-- <td><%=request.getParameter("pass")%></td> --%>
		</tr>
		<tr>
			<th> �ֹι�ȣ </th>
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
			<th> ���� </th>
			<td>
			
				<c:choose>
					<c:when test="${param.gender=='man'}">
						����
					</c:when>
					<c:otherwise>
						����
					</c:otherwise>
				</c:choose>
			
			<%-- 	<%
					if(request.getParameter("gender").equals("man")){
				%>
				����
				<%
					}else{
				%>
				����
				<%
					}
				%> --%>
			</td>
		</tr>
		<tr>
			<th> ��� </th>
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
			<th> �����ȣ </th>
			
			
			<td>${param.post1}-${param.post2}</td>
			<%-- <td><%=request.getParameter("post1") %> - <%=request.getParameter("post2") %></td> --%>
		</tr>
		<tr>
			<th> �ּ� </th>
			<td>${param.address}</td>
			<%-- <td><%=request.getParameter("address") %></td> --%>
		</tr>
		<tr>
			<th> �ڱ�Ұ� </th>
			<td>${ param.intro}</td>
			<%-- <td><%=request.getParameter("intro") %></td> --%>
		</tr>
	</table>
</body>
</html>