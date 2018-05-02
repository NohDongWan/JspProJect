<%@page import="javax.naming.spi.InitialContextFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%@ page import = "java.io.*" %>
    <%
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	StringBuffer sb = null;
    	try{
    			
    		Context init = new InitialContext();
    		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    		 conn = ds.getConnection();	
			
    		 //CLOB 데이터를 읽어오기 위해서는 select 문으로 ResultSet 객체에 담습니다 
		pstmt = 
			conn.prepareStatement("select * from clobtable where num = 1");
		rs = pstmt.executeQuery();
		if(rs.next()){
			BufferedReader rd = 
					new BufferedReader(rs.getCharacterStream("content"));
			sb = new StringBuffer();
			char[] buf = new char[1024];
			int readcnt;
			
			//buf 안에 있는 데이터를 1024 만큼 읽어 옵니다.
			while((readcnt = rd.read(buf,0,1024))!= -1){
				System.out.println("readcon = " + readcnt);
				sb.append(buf,0,readcnt);
			}
			rd.close();
		}
			out.println(sb.toString());
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		if(rs != null)try{rs.close();}
    		catch(SQLException ex){ex.printStackTrace();}
    		if(pstmt != null)try{pstmt.close();}
    		catch(SQLException ex){ex.printStackTrace();}
    		if(conn != null)try{conn.close();}
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