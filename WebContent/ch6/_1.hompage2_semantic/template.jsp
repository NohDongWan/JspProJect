<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<link rel = "stylesheet" href ="style.css"  type = "text/css"/>
</head>
<%	String pagefile = request.getParameter("page");
	if(pagefile == null){
		pagefile = "newitem";
	}


%>
<body>
	<header>
			<h1>상품 목록입니다.</h1>
	</header>

	<nav>
			<jsp:include page="top.jsp" /><br> <br>
	</nav>


	<div id="wrap">
		<aside>
			<jsp:include page="left.jsp" />
		</aside>
		<section>
			<jsp:include page='<%=pagefile+".jsp" %>' />
		</section>
	</div>


	<footer>
		<jsp:include page="bottom.jsp" />
	</footer>

</body>
</html>