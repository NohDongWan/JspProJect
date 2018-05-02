<%--statement.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<%

	Connection conn = null;
	String sql = 
				"INSERT INTO student(num,name) values(?,'홍길동')";
	PreparedStatement pstmt = null;
	try{
		//JDNI 를 이용하여 연결된 Connection 객체를 가져옵니다.
		Context init = new InitialContext();
		DataSource ds =
				(DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		//가져온 Connection 개게를 사용하여 PrepaerdStatement 객체를 생성합니다
		//미리 사용할 SQL 문을 인자로 넘깁니다.
		pstmt = conn.prepareStatement(sql);
		
		
		for(int i = 1 ; i <= 10; i++){
			pstmt.setInt(1, i);
			if(pstmt.executeUpdate() !=0){
			out.println("<h3>"+i +"레코드가 등록되었습니다.</h3>");
			}
		}
		
		
		int result = pstmt.executeUpdate();
		
		
		System.out.println("executeUpdate 결과는 = " + result);
		if(result != 0){
			out.println("<h3>레코드가 등록되었습니다.</h3>");
		}
	}catch(Exception e){
		out.println("<h3>레코드가 등록되었습니다.</h3>");
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