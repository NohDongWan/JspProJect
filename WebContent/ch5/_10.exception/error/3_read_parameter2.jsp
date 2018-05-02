<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 에러가 발생할 경우 errorPage 속성에 지정한 페이지를 보여줍니다. --%>
    <%@ page errorPage = "viewErrorMessage.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
		<%-- 
			파라미터 name 으로 요청된 것이 없기 때문에
			request.getParameter("name") 은 NullPointerException 발생합니다.
		 --%>
		 
		name 파라미터 값 :
		<%= request.getParameter("name").toUpperCase() %>
		<%--위는 name 파라미터 값을 대문자로 변환하여 출력합니다.라는뜻 --%>
</body>
</html>