<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<%
	String id = request.getParameter("id");

	
	Connection conn = null;
	String sql = "delete member where id = ? ";
	PreparedStatement pstmt = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id );
		pstmt.executeUpdate();
		out.println("<script>");
		out.println("location.href = 'member_list.jsp'");
		out.println("</script>");
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt !=null){		
			try{
				pstmt.close();		//객체를 사용하고 메모리에 반환합니다.
									//메모리 낭비를 막을 수 있습니다.
			}catch(SQLException ex){ex.printStackTrace();}
			if(conn != null)
				try{conn.close();}
			catch(SQLException ex){ex.printStackTrace();}
		}
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