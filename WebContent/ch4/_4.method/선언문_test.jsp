<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%!
   public int sum(){
	   int total = 0;
	   for(int i = 1 ; i <= 100; i++){
		   total += i;
	   }
	   return total;
   }
   %>
    
  <% String str = "1부터 100까지의 합"; %>
   
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
b{
color : red
}

</style>
</head>
<body>
<h3><%=str %>은<b> <%=sum()%></b> 입니다<br></h3>
<h3><%=str %>에 3을 곱하면<b> <%=sum() * 3%></b> 입니다<br></h3>
<h3><%=str %>을 1000으로 나누면<b> <%=/* (float) */sum()/1000.%></b> 입니다</h3>		<!--  뒤에 . 붙이면 실수가된다.-->
</body>
</html>