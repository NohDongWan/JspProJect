<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%

	String sid = (String)session.getAttribute("id");
	Connection conn = null;
	String sql = "select * from member where id = ?";				//쿼리문작성
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String id = null;
	String pass =null; 
	String name =null;
	int age = 0;
	String gender =null;
	String email =null;
	try{
		Context init = new InitialContext();
		DataSource ds =
				(DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sid);									//첫번째 ? 에 리퀘스트로받아온 아이디입력
		rs = pstmt.executeQuery();	
		
		while(rs.next()){
			 id = rs.getString("id");
			 pass = rs.getString("password");
			 name = rs.getString("name");
			 age = rs.getInt("age");
			gender = rs.getString("gender");
			 email = rs.getString("email");
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
<script src = 'js/jquery-3.3.1.js'></script>
<script>
	$(document).ready(function(){
		if(<%=gender.equals("남")%>){
			$(".gender1").attr("checked","checked");
		}
		else
			$(".gender2").attr("checked","checked");
		
		$('.canclebtn').click(function(){
			location.href = "main.jsp"
		})
		
	})
	
	
	
	
</script>

<form name = updateform action = updateProcess.jsp
		method = "post">
				<h1>회원수정 페이지</h1>
	<hr>
		<b>아이디</b>
		<input type = text name = id value = <%=id %> required="required" readonly><br>
		<b>비밀번호</b> <input type = password value=<%=pass %>name = pass  required="required" readonly><br>
		<b>이름</b><input type = text value =<%=name %> name = name  required="required"><br>
		<b>나이</b><input type = text value =<%=age %> name = age required="required"><br>
		
		
		<b>성별</b><div>
				<input type = radio class = gender1 name = gender value = 남 ><span>남자</span>
				<input type = radio class = gender2 name = gender value = 여 ><span>여자</span>
				</div>
				
		<b>이메일 주소</b><input type = text value = <%=email %> name = email  required="required"><br>
		<div class = clearfix>
		<button type = submit class = submitbtn>정보 수정</button>
		<button type = reset class = canclebtn>취소</button>
		</div>
		</form>
		
	<%-- <script>								/*  일부로 폼아래다하는거다 폼먼저읽고 이게 입력되라고*/	
		var pandan = '<%= gender%>';
	if(pandan == '남'){
		$('input:radio').eq(0).attr('checked','checked');
	}else{
		$('input:radio').eq(1).attr('checked','checked');
	}
		
	</script> --%>
</body>
</html>