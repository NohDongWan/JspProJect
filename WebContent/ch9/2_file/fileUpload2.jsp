<%--webContent 폴더 아래upload 폴더 생성후 실행하세요~ --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--업로드하기 위해 MultipartRequest 객체를 import 합니다. --%>
    <%@ page import = "com.oreilly.servlet.MultipartRequest" %>
    
    <%-- 파일 이름 중복 처리를 하기 위해 DefaultFileRenamePolicy 객체를 import 합니다. --%>
    
    <%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
    
    
    <%
    	//application.getRealPath(path);
    	//웹 어플리케이션 path 에 대한 로컬상의 실제 경로를 얻어옵니다.
    	String uploadPath = application.getRealPath("upload");
    	out.println(uploadPath);
    	
    	int size = 10*1024*1024;		//파일 최대 크기를 10MB 로 지정합니다.
    	String name = "";
    	String subject = "";
    	String filename1= "";
    	String filename2= "";
    	String origfilename1="";
    	String origfilename2="";
    	
    	
    	try{
    		/*  
    			업로드를 담당하는 부분입니다.
    			-첫 번째 인자 request : 폼에서 가져온 값을 얻기 위해 request 객체를 전달해줍니다.
    			-두 번째 인자 uploadPath : 업로드될 파일의 위치 입니다.
    			-세 번째 인자 size : 업로드 할 크기이며 지정 크기보다 크면 Excetption 발생합니다.
    			-네 번째 인자 "euc-kr" : 파일 이름이 한글인 경우 처리하는 부분입니다.
    			-다섯 번째 인자 : 똑같은 파일을 업로드 할 경우 중복되지 않도록 자동으로 파일이름을 변환해주는 기능을 합니다.
    		*/
    		
    		
    		
    		MultipartRequest multi =
    			new MultipartRequest(request, uploadPath, size, "UTF-8",
    								new DefaultFileRenamePolicy());
    	
    	name = multi.getParameter("name");
    	subject = multi.getParameter("subject");
    		
    	//업로드된 파일의 시스템 상에 업로드된 실제 파일명을 얻어 옵니다.
    	filename1 = multi.getFilesystemName("fileName1");
    	out.println("<br>multi.getFilesystemName(fileName1) = " + filename1 );				/* 
    																							getOriginalFileName() 은 사용자가 지정해서 업로드되는 파일명을 반환하고,

    																							getFileSystemName()  메소드는 파일명이 중복되는 경우 변경된 파일명을 반환한다. 
    																						*/
    	
    	origfilename1 = multi.getOriginalFileName("fileName1");
    	out.println("<br>multi.getOriginalFileName(fileName1) = " + origfilename1);
    	
    	filename2 = multi.getFilesystemName("fileName2");
    	out.println("<br>multi.getFilesystemName(fileName2) = " + filename2 );
    	
    	origfilename2 = multi.getOriginalFileName("fileName2");
    	out.println("<br>multi.getOriginalFileName(fileName2) = " + origfilename2);
    	
    	
    	}catch(Exception e){
    		e.printStackTrace();
    		out.print("에러입니다.");
    	}
    	
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<title>file 업로드 처리</title>
</head>
<body>
<form name = filecheck action = fileCheck.jsp method = "post">
	<input type = hidden name = name value = <%=name %>>
	<input type = hidden name = subject value = <%=subject %>>
	
	<input type = hidden name = filename1 value = <%=filename1 %>>
			
	<input type = hidden name = filename2 value = <%=filename2 %>>
				
				
	<input type = hidden name = origfilename1 value = <%=origfilename1 %>>
	<input type = hidden name = origfilename2 value = <%=origfilename2 %>>

</form>

<!-- 링크를 클릭했을 때 폼 영역의 데이터들을 filecheck.jsp 페이지로 전송처리하는 부분입니다. -->

<a href = "#" onclick = "javascript:filecheck.submit()">
업로드 확인 및 다운로드 페이지이동</a>
</body>
</html>