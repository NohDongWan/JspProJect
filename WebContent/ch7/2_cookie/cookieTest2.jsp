<!--  
	쿠키는 쿠키를 생성한 후에 클라이언트로 전송해야 합니다
	크롬 실행후 f12 -> Application 텝 -> 왼쪽 Cookies 선택 
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Cookie Test</title>
</head>
<body>
<%
		
		String name = "";
		String value = "";
		
		//쿠키가 생성되어 있는지 확인합니다.
		
		String cookie = request.getHeader("Cookie");		//getHeader("headerName") : headername 문자열은 이전페이지의 링크 URL 정보를 반환한다. 없을 시 null 리턴 
		
		//6초후에 사라지기떄문에 그전에는 잘표현된다 39번라인으로 바로넘어가기때문에 하지만 사라져서 24번 if 문으로 들어가면 쿠키배열선언해서 쿠키들을 넣어주고 쿠키의 정보를 넣어주고 39번라인가서 출력
		if(cookie !=null){
			//쿠키들을 배열로 가져옵니다.
			Cookie cookies[] =request.getCookies();
			
			//쿠키 배열에서 쿠키 이름이 "name" 인 것을 찾아서 쿠키의 이름과 값을 가져옵니다
			
			for(int i = 0 ; i <cookies.length;i++){
				if(cookies[i].getName().equals("name")){
					name = cookies[i].getName();	//쿠키의 이름을 가져옵니다.
					value = cookies[i].getValue();	//쿠키의 값을 가져옵니다.
				}
			}
		
%>

<h2>쿠키 이름 = <%=name %></h2>
<h2>쿠키 값 = <%=value %></h2>
<%
		}else{
			%>
			쿠키가 존재하지않습니다.
			<%
			
		}
%>
</body>
</html>