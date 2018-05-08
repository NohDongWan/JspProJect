<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>


	
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%

String sid = (String)session.getAttribute("id");
Connection conn = null;
String sql = "select id from member";


PreparedStatement pstmt = null;
ResultSet rs = null;	

try{
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	conn = ds.getConnection();
	
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(sid == null){
		out.println("<script>");
		out.println("alert('로그인을하셔야합니다.')");
		out.println("location.href = 'loginForm.jsp'");
		out.println("</script>");
	}
	
	out.println("<table border = 1>");
	out.println("<tr><td colspan = 2>회원목록</td></tr>");
	while(rs.next()){
		String id = rs.getString("id");
		%>
		<tr>
			<td><a href = "member_info.jsp?id=<%=id %>"><%=rs.getString("id") %>
			</a></td>
			<td>
				<a href = "member_delete.jsp?id=<%=id %>">삭제</a>
			</td>	
		</tr>
		<%
	}
	out.println("</table>");
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs != null)try{rs.close();}
	catch(SQLException ex){ex.printStackTrace();}
	if(pstmt !=null)
		try{pstmt.close();}		//객체를 사용하고 메모리에 반환합니다. //메모리 낭비를 막을 수 있습니다.
		catch(SQLException ex){ex.printStackTrace();}
		if(conn != null)
			try{conn.close();}
		catch(SQLException ex){ex.printStackTrace();}
}

%>

</body>
</html>