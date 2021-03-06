<%--
	JSTL(JSP Standard Tag Library)
	- 자주 사용된는 기능을 모아둔 커스텀 태그(개발자가 직접 정의할 수 있는 태그)
	
	JSTL 다운로드
	1)- https://mvnrepository.com/접속
	
	https://mvnrepository.com/artifact/javax.servlet/jstl/1.2 다운
	jstl
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- *taglib 지시어 : JSTL 이나 커스텀 태그 등 태그 라이브러리를 JSP 에서 사용할 때 접두사를 지정하기 위해 사용합니다.
	
	-prefix 속성은 사용할 커스텀 태그의 네임스페이스를 지정합니다.
		명시된 값은 태그 라이브러리를 호출할 때 사용할 접두사를 의미합니다.
	-uri 속성은 태그 라이브러리에 정의한 태그와 속성 정보를 저장한 파일이 존재하는 위치를 지정합니다.

	*taglib 장점 : 사용하면 코드의 길이가 줄어들고 인식성이 좋아집니다.
 --%>
<%-- JSP 페이지에 core 라이브러리를 등록합니다. --%>
<%@ taglib prefix = "f"
				uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%-- <f:set> 변수에 값을 설정하는 태그입니다.
		var : 값을 저장할 변수 이름
		value : 저장할 값		
		 --%>
		<f:set var="test" value="Hello JSTL" />
		<h3>
			&lt;f:set&gt; 사용후 :				
			<f:out value="${test}"/>	<!-- 지정된 값을 출력하는 태그입니다. -->
		</h3>
		
		<f:remove var="test" /> <!--  설정된 속성을 제거하는 태그입니다. -->
		<h3>
			&lt;f:remove&gt; 사용후 :
			<f:out value="${test}"/>
		</h3>
		
		<f:catch var="err">				<!-- 예외 처리를 위한 태그입니다.
													예외가 발생하면 var 에 지정된 예외 객체가 할당됩니다. -->
			<%= 10/0 %>
			</f:catch>
		<h3>
			&lt;f:catch&gt;로 잡아낸 오류 :
			<f:out value="${err}"/>
		</h3>
			
		<!--  조건 처리를 위한 태그입니다.
			  if와 유사하지만 else 는 지원하지 않습니다. -->
		<f:if test="true">										<!-- 답을 true 로 줘서 무조건 수행 -->
			조선식이 참이어서 무조건 수행합니다.
			<h3>5는 10보다 작다</h3>
		</f:if>
		
		<f:if test="${6+3==8}">									<!-- 결과가 false 라서 실행안함  -->
			<h3>6 + 3 은 9 이다.</h3>
			</f:if>
		
	
		<%--
		1. <f:choose>, <f:when>, <f:otherwise> 태그
		- 조건절이 여러개인 경우 사용
			switch 문과 유사한 기능
				- 조건중에 만족하는 것이 있으면 실행하고 벗어납니다.
				(즉 한개만 실행 -if ~ else ~ else 문과 유사
					하나의 choose 태그에는 여러개의 when 태그가 존재
		
		2. 문법
			<f:choose>
				body content (<when> and  <otherwise> subtags)
				//조건을 만족하면 실행 - 여러 개 작성할 수 있습니다.
				<f:when test="testCondition">
					body content
				</f:when>
				<f:otherwise> //조건을 만족하지 않으면 실행
					conditional block
				</f:otherwise>
			  </f:choose>
		 --%>
		 
		 <f:choose>
		 <f:when test="${5+10 == 50 }">
					<h3>5+10은 50이다.</h3>
				</f:when>
				
				<f:otherwise>
					<h3>5+10은 50이 아니다.</h3>
				</f:otherwise>
			  </f:choose>
			  
		<%--
			1. 변수 a 에 3을 설정합니다
			2. 만약 a 의 값이 1이면 1입니다
				1또는 2가아니면 1또는 2가아니면 "1또는 2가 아닙니다."
				
				라고 출력합니다
		--%>
		 
		 
		
		 	<f:set var="a" value="2"/>
		 <f:choose>
		 <f:when test="${a==1}">
					<h3>1입니다.</h3>
				</f:when>
				
		<f:when test="${a==2}">					<!-- if 문  -->
					<h3>2입니다.</h3>
				</f:when>
				
				<f:otherwise>					<!-- else  -->
					<h3>1또는 2가아닙니다</h3>
				</f:otherwise>
			  </f:choose>
			  
		<f:set var ="a" value="${a+1}"/>
		<h3><f:out value="${a}"/></h3>
			
		
		
		
			
			<!--  
				set : 셋팅하는거, remove : 삭제하기, catch : 예외잡기
				
				out : 출력하는거
			-->

		
		
		
			
</body>
</html>