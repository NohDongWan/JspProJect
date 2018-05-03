<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");


		String sql = "insert into member(id,password,name,age,gender,email) values(?,?,?,?,?,?)";
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
					
			int age2 = Integer.parseInt(age);
			
			pstmt = conn.prepareStatement("select * from member where id = ?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				out.println("<script>");
				out.println("alert('중복된 아이디입니다.')");
				out.println("history.back();");
				out.println("</script>");
			}else{
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id );
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			pstmt.setInt(4, age2);
			pstmt.setString(5, gender);
			pstmt.setString(6, email);
			int result = pstmt.executeUpdate();
			
			
			
			if(result != 0){
				out.println("<script>");
				out.println("alert('회원가입을 축하드립니다.')");
				out.println("location.href = 'loginForm.jsp'");
				out.println("</script>");
			}
			else{
				out.println("<script>");
				out.println("alert('회원가입에 실패하셨습니다.')");
				out.println("location.href = 'joinForm.jsp'");
				out.println("</script>");
			}
			}
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