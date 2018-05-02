<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<style>

	.right{
		line-height : 50px;
	}
	
	.right>a:nth-child(1):hover{
		background: skyblue
	}
	
	.right>a:nth-child(2):hover{
		background: yellowgreen
	}

	h1{
		text-align : center;
		margin : 0 auto
	}
	#header{
		background : yellowgreen
	}
	#navigation{
		background : pink
	}
	#navigation >.right{
		float : right;
		
	}
	 a{
	text-decoration : none; 
	font-weight : bolder;
	font-size : x-large;
	color : white
	
	}
	#wrap{
		margin-top : 50px;
	}
	#wrap > #aside {
		width : 30%;
		display : inline-block;
		background : lightgray;
		float : left;
		height : 700px;
	}
	#wrap > #section {
		width : 70%;
		display : inline-block;
		background : skyblue;
		height : 700px;
		}
	
	#wrap > #aside > a{
	
		height : 230px;
		display : block;
	}
	
	#wrap > #aside > a:nth-child(1):hover{
		background-color : red;
	}
	#wrap > #aside > a:nth-child(2):hover{
		background-color : orange;
	}
	#wrap > #aside > a:nth-child(3):hover{
		background-color : green;
	}
	
</style>
</head>

<%	String pagefile = request.getParameter("page");
	if(pagefile == null){
		pagefile = "newitem";
	}


%>
<body>

	<div id = "header">
		<h1>상품 목록입니다.</h1>
	</div>
	
	<div id = "navigation">
		<jsp:include page = "top.jsp"/><br><br>
	</div>
	
	<div id = "wrap">
		<div id = "aside">
			<jsp:include page = "left.jsp"/>
		</div>
	<div id = "section">
			<jsp:include page='<%=pagefile+".jsp" %>'/>
		</div>
	</div>
	
	<div id = "footer">
		<jsp:include page="bottom.jsp"/>
	</div>

</body>
</html>