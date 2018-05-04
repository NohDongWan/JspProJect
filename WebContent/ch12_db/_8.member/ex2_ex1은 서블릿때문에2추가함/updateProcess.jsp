<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>


<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");

	String sid = (String) session.getAttribute("id");
	Connection conn = null;
	String sql = "update member set name = ?,age = ?, gender=?,email= ? where id = ?";
	PreparedStatement pstmt = null;

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setInt(2, Integer.parseInt(age));
		pstmt.setString(3, gender);
		pstmt.setString(4, email);
		pstmt.setString(5,sid);
		pstmt.executeUpdate();
		out.println("<script>");
		out.println("alert('정보수정이 완료되었습니다.')");
		out.println("location.href = 'main.jsp'");
		out.println("</script>");
		
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>");
		out.println("alert('정보수정 실패.')");
		out.println("history.go(-1)");
		out.println("</script>");
	} finally {
		if (pstmt != null) {
			
			try {
				pstmt.close(); //객체를 사용하고 메모리에 반환합니다.
								//메모리 낭비를 막을 수 있습니다.
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
			if (conn != null){
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
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