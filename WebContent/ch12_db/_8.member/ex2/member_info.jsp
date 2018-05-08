<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>


	<%
	
	String id =request.getParameter("id");
	Connection conn = null;
	String sql = "select * from member where id = ?";
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		
		
		
		out.println("<table border = 1>");
		while(rs.next()){
			out.print("<tr><td>ID</td><td>"+rs.getString(1)+ "</td></tr>");
			out.print("<tr><td>비번</td><td>"+rs.getString(2)+ "</td></tr>");
			out.print("<tr><td>이름</td><td>"+rs.getString(3)+ "</td></tr>");
			out.print("<tr><td>나이</td><td>"+rs.getInt(4)+ "</td></tr>");
			out.print("<tr><td>성별</td><td>"+rs.getString(5)+ "</td></tr>");
			out.print("<tr><td>이메일</td><td>"+rs.getString(6)+ "</td></tr>");
			out.println("");
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

    
    
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>