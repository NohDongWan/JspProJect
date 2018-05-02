<%--statement.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<%

	Connection conn = null;
	String sql = 
				"select * from student order by num asc";
	PreparedStatement pstmt = null;
	ResultSet rs = null;									//결과를 보기위해 사용한놈
	try{
		//JDNI 를 이용하여 연결된 Connection 객체를 가져옵니다.
		Context init = new InitialContext();
		DataSource ds =
				(DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		//가져온 Connection 개게를 사용하여 PrepaerdStatement 객체를 생성합니다
		//미리 사용할 SQL 문을 인자로 넘깁니다.
		pstmt = conn.prepareStatement(sql);					//차이점은 : 미리준비하고 있기때문에 우리는 '?' 안에 값만 넣어주면된다.같은 쿼리문을 사용하는데 값만 바뀐다면 얘를 사용해줘라
		rs = pstmt.executeQuery();							//select 문 쓸라면 쿼리
		
		
		out.println("<style>table{background : yellowgreen}</style>");
		out.println("<table border = 1 align = center><tr><td width = 300px>번호</td><td width = 300px>이름</td></tr></table>");
		
		while(rs.next()){		//레코드가 존재하지않을때까지 반복합니다. (한줄씩가져온다 라는뜻)
			int num = rs.getInt("num");
			String name = rs.getString("name");
			out.println("<table border = 1 align = center><tr><td width = 300px>"+num+"</td><td width = 300px>"+name+"</td></tr></table>");
		}
	}catch(Exception e){
		out.println("<h3>레코드가 등록되었습니다.</h3>");
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