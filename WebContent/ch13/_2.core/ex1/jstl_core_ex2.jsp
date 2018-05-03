<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c"
				uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<!--  자바의 for 문과 유사합니다.
	  items 속성에 컬렉션이나 배열 형태의 객체를 지정하여
	  객체의 인덱스만큼 반복할 수 있습니다.
	  begin : 시작 인덱스
	  end : 끝 인덱스
	  step : 증감식
	  var : 반복 중일 경우 현재 반복하고 있는 값을 기억하는 변수입니다.
 -->
 	<c:forEach var="test" begin="1" end="10" step="2">
 		<b>${test}</b>&nbsp;
 	</c:forEach>
 	<hr>
 	
 	
 	<%pageContext.setAttribute("nameList",new String[]{
 			"홍길동","신사임당","세종대왕","광개토대왕"});
 	%>
 	<%-- 배열의 모든 내용을 출력합니다.
 			items 에는 ${pageScope.nameList} 또는 ${nameList} 사용 가능 --%>
 	<c:forEach var="name" items="${pageScope.nameList}">			<!-- for 문의 이름을정해주고 pageContext 로 선언된 배열을 받아온뒤  -->
 			<li>${name}</li>										<!-- for 문 이름으로 출력 -->
 	</c:forEach>
 	<hr>
 	
	<!-- 배열의 인덱스 2부터 3까지의 내용을 출력합니다.
		  참조할 변수의 개수를 제한합니다.  -->
	<c:forEach var="name" items="${nameList}" begin="2" end="3">
		<li>${name}</li>
	</c:forEach>		  
	
	
	<%--varStatus 속성은 반복 정보를 담고 있는 객체(LoopTagStatus) 를 저장할 변수명을 값으로 갖습니다.
		varStatus="status"인 경우
		status.index : 반복 실행에서 현재의 인덱스 값을 의미합니다.
		status.count : 반복 실행의 횟수를 의미합니다.
	 --%>
	 <c:forEach var="name" items="${nameList}" begin="2" end="3" 
	 	varStatus="status">
	 		<li>${status.count}번째 -index[${status.index}]:${name}</li>
	 </c:forEach>
	<hr>
	
	
	<%
		java.util.HashMap<String, Object> m =
				new java.util.HashMap<String, Object>();
		m.put("name","홍길동");								//맵은 키,value 로 이뤄져있다.
		m.put("today",new java.util.Date());
	%>
		<c:set var="map" value="<%=m %>"/>
		<c:forEach var="data" items="${map}">
			<li>${data.key} - ${data.value}</li>
		</c:forEach>
		<hr>
		
		<!-- 자바의 for 문과 StringTokenizer 객체를 결합하였다고 볼 수 있습니다.
				items 에 지정한 갑을 delims 속성의 구분자로 나눈 후 나눠진 만큼 반복을 수행 -->
	<c:forTokens var="alphabet"
				items="a,b,c,d,e,f,g,h,i,j,k,l,m,n" delims=","	>
				<b>${alphabet}</b>
	</c:forTokens>
	<hr>
	
	<!--  변수 data 에 값을 설정합니다. -->
	<c:set var="data" value="홍길동,김길동,고길동"/>
	<c:forTokens var="name"
				items="${data}" delims=",">
				<b>${name}</b>&nbsp;
	</c:forTokens>
				
				
</body>
</html>