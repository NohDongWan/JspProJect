<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<script src = 'js/jquery-3.3.1.js'></script>
	
<%
		/*나알았다 불린으로 해야된다.  선생님꺼랑*/

		boolean check = false;
		String checkId = "";
		String cookie = request.getHeader("Cookie");
		
		if(cookie != null){
			Cookie cookies[] = request.getCookies();
			
			for(int i = 0 ; i < cookies.length; i++){
				if(cookies[i].getName().equals("id1")){
					check = true;
					checkId = cookies[i].getValue();
				}
			}
		}

	

		String id = application.getInitParameter("ID");
		String pass = application.getInitParameter("Pass");
		
%>
	<script>
		$(document).ready(function(){
			$('form').submit(function (){
				if($('#id').val() != '<%=id%>'){
					alert("로그인 ID 가 다릅니다")
					return false
			}
			
			if($('#pass').val()!= '<%=pass%>'){
				alert("비밀번호가 다릅니다")
				return false
			}
			
			if($('#id').val() == '<%=id%>' && $('#pass').val() == '<%=pass%>'){
				alert($('#id').val()+"님 환영합니다.")
			}
			})
				
			var id = '<%=id%>'
			if(check){
				$("#id").val('<%=id%>');
				$("#check").attr("checked","checked");
			}
			else{
				$("#id").val("");
				$("#check").attr("checked",false);
			}
		})
		
		
		
	
	</script>
		


	<form action = loginprocess.jsp>
		ID : <input type = text id = id name = id required >
		<input type = checkbox name = check id = check value = check
		>ID기억하기
		<br>
		password : <input type = password id = pass name = pass required><br>
			<input type = submit value = "전송">   
	
	</form>

</body>
</html>