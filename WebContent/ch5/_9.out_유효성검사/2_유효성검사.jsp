<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
 <!-- <link href ="validate.css" rel = "stylesheet" type = "text/css"> -->
<script src = 'js/jquery-3.3.1.js'></script>
<script src = "validate.js"></script>
</head>
<body>
 <fieldset>
  <legend>유효성 검사</legend>
 <form  name=myform id="myform" method="post" action="send.jsp">
 <label>ID</label><input type=text size=30 name=id id=id>
  <input type=button value="ID중복검사" id=idcheck><br>
  <label>비밀번호</label><input type=password name=pass id=pass size="43"><br>
<label>주민번호</label><input  type=text size=18 name=jumin1 id=jumin1 maxlength=6> -
     <input type=text size=17 name=jumin2 id=jumin2 maxlength=7><br>
 <label>E-Mail</label><input type=text name=email id=email size=10>@
         <input type=text name=domain id=domain size=10>
   <select name=sel id=sel>
     <option value="">직접입력</option>
     <option value="naver.com">naver.com</option>
     <option value="daum.net">daum.net</option>
     <option value="nate.com">nate.com</option>
     <option value="gmail.com">gmail.com</option>
   </select><br>
 <label>성별</label><span>  
 <input type=radio name=gender id=gender1 value=m><sup>남자</sup>
    <input type=radio name=gender id=gender2 value=f><sup>여자</sup>
    </span>  
    <br>
<label>취미</label><span> 
 <input type=checkbox name=hobby id=hobby1 value="공부"><sup>공부</sup>
    <input type=checkbox name=hobby id=hobby2 value="게임"><sup>게임</sup>
    <input type=checkbox name=hobby id=hobby3 value="운동"><sup>운동</sup>
    <input type=checkbox name=hobby id=hobby4 value="등산"><sup>등산</sup>
    <input type=checkbox name=hobby id=hobby5 value="낚시"><sup>낚시</sup>
    </span> 
    <br>
 <label>우편번호</label><input type=text size=12 name=post1 id=post1 maxlength=3>-
    <input type=text size=12 name=post2 id=post2 maxlength=3>
    <input type=button value="우편검색" id=postcode><br>
 <label>주소</label><input type=text size=42 name=address id=address><br>
<label>자기소개</label><br><textarea rows=10 cols=60 name=intro id=intro></textarea><br><br>

 <input type=submit value="회원가입">
 <input type=reset value="취소">

 </form>

</fieldset>
 </body>
</html>