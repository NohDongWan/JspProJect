<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>


<%

request.setCharacterEncoding("UTF-8");		//post 방식으로 가져올때는 인코딩을 꼭해줘야된다.
	String id =request.getParameter("id"); 
	String pass =request.getParameter("pass");
	String jumin1 = request.getParameter("jumin1");
	String jumin2 = request.getParameter("jumin2");
	String email = request.getParameter("email");
	String domain = request.getParameter("domain");
	
	String sel = request.getParameter("sel");
	
	String gender = request.getParameter("gender");
	
	String hobby[] = request.getParameterValues("hobby");
	String post1 = request.getParameter("post1");
	String post2 = request.getParameter("post2");
	String address = request.getParameter("address");
	String intro = request.getParameter("intro");
	
	
	out.println("아이디 = " + id+"<br>");
	out.println("비밀번호 = " + pass+"<br>");
	out.println("주민번호 = " + jumin1 + "-" + jumin2+"<br>");
	
	
	if(sel.equals("")){
		out.println("email = " + email +"@"+domain+"<br>");
	}
	else{
		out.println("email = " + email +"@"+sel+"<br>");
	}
	
	if(gender.equals("m")){
		out.println("성별 = 남<br>");
	}
	else{
		out.println("성별 = 여<br>");
	}
		
	//out.println("성별 = " + gender+"<br>");
	for(int i = 0 ; i < hobby.length;i++){
	out.println("취미 = " + hobby[i]+"<br>");
	}
	out.println("우편번호 = " + post1+"-"+post2+"<br>");
	out.println("주소 = " + address+"<br>");
	out.println("자기소개 = " + intro+"<br>");

%>

</body>
</html>