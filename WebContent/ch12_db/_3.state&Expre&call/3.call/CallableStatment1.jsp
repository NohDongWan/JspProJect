<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- Connection 객체와 JNDI를 사용하기 위한 패키지를 import 합니다.  -->
   <%@ page import = "java.sql.*" %>
   <%@ page import = "javax.sql.*" %>
   <%@ page import = "javax.naming.*" %>
   
   <%
   	Connection conn = null;
   String sql;
   CallableStatement cs = null;
   
   
   try{
	   Context init = new InitialContext();
	   DataSource ds =
			   (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		sql = "{call del_all()}";
		
		//CallableStatement 를 객체를 생성합니다
		cs = conn.prepareCall(sql);
		cs.execute();
		out.println("성공적으로 프로시저를 실행했습니다.");
   }catch(Exception e){
	   out.println(e);
   }finally{
	  	if(cs != null)try{cs.close();}
	  	catch(SQLException ex){}
	  	if(conn!= null)
	  		//close() 메서드 시행 후에는 오라클에서 roll back 수행안됩니다.
	  		//자원 회수 되면서  오라클에서 자동커밋이되었기 때문입니다.
	  		
	  		try{conn.close();}
	  	catch(SQLException ex){}
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