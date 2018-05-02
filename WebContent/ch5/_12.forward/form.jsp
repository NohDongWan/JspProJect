<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form action="forwardTest2.jsp" method="post">

<!-- hidden 타입의 input 으로 다음 페이지에서 사용할 주소값을 지정하였습니다.  -->
	<input type = "hidden" name = forwardPage
		value = "forwardTest3.jsp">						<!-- forwardTest2번으로갈껀데 fowardTest3 번의 값을 가져 갈꺼다  -->
		<!--  
			forwardTest3.jsp 는 
						request가 갖고있는 모든 파라미터 6개가 출력됩니다.
		
		-->
		<table border=1>
			<tr>
				<td>이름</td>
				<td><input type=text name=name required></td>
			</tr>

			<tr>
				<td>나이</td>
				<td><input type="text" name=age required></td>
			</tr>

			<tr>
				<td>주소</td>
				<td><input type="text" name=address required></td>
			</tr>

			<tr>
				<td colspan=2><input type=submit value="전송"></td>
			</tr>

		</table>



	</form>
</body>
</html>