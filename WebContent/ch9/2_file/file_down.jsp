<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.io.*" %>			<!-- 읽고 쓰기 때문에 io 필요 -->
    
    
    <%--html 화면에서 jsp페이지의 공백 없애는 JSP 코드 --%>
    <%@ page trimDirectiveWhitespaces="true" %>
    
    <% 
    	String fileName = request.getParameter("file_name");			//엥커태그로 보낸 이름 받고
    	System.out.println("fileName = " + fileName);					
    	
    	String savePath = "upload";										//파일업로드주소
    	
    	//서블릿의 실행 환경 정보를 담고 있는 객체를 리턴합니다.
    	//(application 내장 객체를 리턴합니다.)
    	ServletContext context = pageContext.getServletContext();		
    	String sDownloadPath = context.getRealPath(savePath);						//get realPath 는 경로
    	//위 두문장을 한 문장으로 나타내면 다음과 같습니다.
    	//String sDownloadPath = application.getRealPath(savePath)		//실제업로드의 어플리케이션의 위치가 나온다.
    	
    	//String  sFilePath = sDownloadPath + "\\" + fileName;
    	String sFilePath = sDownloadPath + "/" + fileName;				//★실질적으로 파일이있을 위치 
    	System.out.println(sFilePath);									
    	
    	byte b[] = new byte[4096];
    	
    	//sFilePath에  있는 파일의 MimeType 을 구해옵니다 
    	String sMimeType = context.getMimeType(sFilePath);			//페이지에 뿌려줄때 나타내는 방식 ex) html, png, jpg 이런거 나타내는애
    	System.out.println("sMimeType >>>" + sMimeType);
    	
    	
    	/*  
    		Content-Type : 전송되는 Content 가 어떤 유형인지 알려주는
    		  목적을 가지고 있습니다.
    		text.html, image/png, application/octet-stream
    		  등의 값을 가집니다
    		Content-Type 을 통해서 브라우저는 해당 데이터를 어떻게 처리해야 할 지 판단할 수 있게 됩니다.
    			예)- image/png: 브라우저는 해당 컨텐트를 이미지로써 간주하게 됩니다.
				  -application/octet-steram : 미확인 Binary 정보를 의미하며,
			이 경우 브라우저는 파일을 다운로드 하는 형태로 동작합니다.
				-text/javscript : 브라우저는 Content 를 Javascript 문서로 취급하게 됩니다.
    	*/
    	
    	
    	/* 
    	
    		-octet-stream 은 8비트로 된 일련의 데이터를 뜻합니다.
    		-지정되지 않은 파일 형식을 의미합니다.
    	*/
    	if(sMimeType == null)
    		sMimeType = "application/octet-stream";					//마임타입이 없는애들은 이렇게 나타내줘라
    	response.setContentType(sMimeType);
    	
    		
    		
    		
    	/*  
    		이 부분이 한글 파일명이 깨지는 것을 방지해줍니다.
    		- getBytes(캐릭터셋) : 자바 내부에 관리되는 유니코드 문자열을
    			인자로 지정된 캐릭터셋의 바이트 배열로 반환하는 메서드입니다.
    		-String(byte[] bytes, Charset charset)
    			new String(바이트 배열, 캐릭터셋) 생성자 : 해당 바이트 배열을 주어진
    												캐릭터 셋으로 스트링을 만드는 생성자입니다.
    	*/
    	String sEncoding =
    				new String(fileName.getBytes("UTF-8"),"ISO-8859-1");			//iso : 서버가 갖고 있는 캐릭터
    			System.out.println(sEncoding);
    			
    	/*  
    		-Content-Disposition : 
    				Content 가 어떻게 처리되어야 하는지 나타냅니다.
    			1)Content-Disposition : 
    				inline : 브라우저가 Content 를 즉시 출력해야 함을 나타냅ㄴ다.
    						이미지인경우 브라우저 내에서 즉시 출력하며,
    						문서인 경우 텍스트로 출력합니다.
    			2)Content-Disposition :
    					attachment : 브라우저는 해당 Content 를 처리하지 않고, 다운로드 하게 됩니다.
    	*/
    	
    	//content-Disposition 이란 content 브라우저가 어떻게 처리도ㅓㅣ어야 하는지 나타낸다. 
    	response.setHeader("Content-Disposition","attachment; filename = " + sEncoding);		//response 는 요청에 대해 응답을 전달해주는 객체이다 
    			
    	/*  
    		response.setHeader("Content-Disposition","inline; filename = " + sEncoding); 
    	*/
    	
    	ServletOutputStream so = response.getOutputStream();						//응답에다가 나의 출력(데이터를) 보내겠다, 1.여기서 응답을하고
    	BufferedOutputStream out2 = null;
    	BufferedInputStream in = null;
    	try{
    		//웹 브라우저로의 출력 스트림 생성합니다.
    		out2 = new BufferedOutputStream(so);									//2. 보낼때 속도향상을 위해 버퍼를써준다	파일에다보내는게아니라 파일아웃풋스트림을쓰는게아니다 우리는 응답에 보낼꺼다, 응답을하면 브라우저에 나온다
    		//sFilePath 로 지정한 파일에 대한 입력 스트림을 생성합니다.																																				
    		in = new BufferedInputStream(new FileInputStream(sFilePath));		//파일경로 적어주고
    		
    		int numRead;
    		
    		//read(b,0,b.length) : 바이트 배열 b의 0번 부터 b.length
    		//크기 만큼 읽어옵니다.
    		while((numRead = in.read(b,0,b.length)) != -1){//읽을게업으면
    			//바이트 배열 b 의 0 번 부터 numRead 크기 만큼 브라우저로 출력
    			out2.write(b,0,numRead);
    		}
    	}catch (Exception e){
    		e.printStackTrace();
    	}finally{
    		try{
    			if(out2 != null){
    				out2.flush();
    				out2.close();
    			}
				if(in != null){
					in.close();
				}
    		}catch(Exception e){
    			e.getStackTrace();
    		}
    	}
    	
    			
    %>
    <!-- 출력은 웹브라우져로  -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>