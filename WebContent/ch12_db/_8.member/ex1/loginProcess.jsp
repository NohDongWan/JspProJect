<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	Connection conn = null;
	String sql = "select * from member where id = ?";				//쿼리문작성
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		Context init = new InitialContext();
		DataSource ds =
				(DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);									//첫번째 ? 에 리퀘스트로받아온 아이디입력
		rs = pstmt.executeQuery();								//rs 에 저장
		if(rs.next()){										
			if(pass.equals(rs.getString("password"))){	//입력한 비밀번호가 db 에있는 비밀번호 와 같을때
				session.setAttribute("id", id); //세션에 아이디를 저장합니다.
			out.println("<script>");
			out.println("alert('"+id + "님 로그인되었습니다.')");
			out.println("location.href ='main.jsp'");
			out.println("</script>");
			}
		else{
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.')");
			out.println("history.go(-1)");
			out.println("</script>");
		}
		}else{
			out.println("<script>");
			out.println("alert('아아디가 없습니다.')");
			out.println("history.go(-1)");
			out.println("</script>");
		}
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