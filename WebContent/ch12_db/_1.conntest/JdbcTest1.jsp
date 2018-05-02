<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	Connection conn = null;		//Connection 객체 생성
	
	//JDBC 드라이버 이름을 설정합니다. (DBMS 마다 다르니다.)
	String driver = "oracle.jdbc.driver.OracleDriver";
	
	//JDBC 드라이버를 사용하여 접속할 URL 입니다.
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Boolean connect = false;
	try{
		//JDBC 드라이버 이름으로 드라이버를 로드합니다.
		Class.forName(driver);
		
		//설정했던 JDBC URL 을 이용하여 Connection 객체를 얻어 옵니다.
		conn = 
				DriverManager.getConnection(url,"scott","tiger");
		connect = true;
		conn.close(); //데이터 베이스와의 연결을 해제합니다.
	}catch(Exception e){
		connect = false;
	}

%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
		<h3>
			<%
				if(connect == true){
					out.print("연결되었습니다.");
				}
				
				else{
					out.print("연결실패.");
				}
			%>
		</h3>





</body>
</html>