//내가 이해한
/*
 * 
 * 마크업 바꾸기			window -> preferences -> temp 검색 -> jsp -> markup -> edit 들어가서 아래껄로바꿔준다
  <%@ page language="java" contentType="text/html; charset=${encoding}"
    pageEncoding="${encoding}"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
${cursor}
</body>
</html>
 
 
 Dispatcher 은 쿠키같은느낌. 여기서받은 푸드값을  dipatcher.jsp 로 보낼수 있다.
 
 
 */


package _6.dispatcher;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Dispatcher
 */
@WebServlet("/ch3/_6.dispatcher/DispatcherServlet")
public class Dispatcher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dispatcher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    
    /*	페이지 이동방법
     
     	1. Dispatcher 방식
     	- 클라이언트로부터 요청 받은 Servlet 프로그램이 응답을 하지 않고
     			다른 서블릿이나 JSP 페이지 등에 전달합니다. (요청 재지정)		//쿠키같은 느낌.
     	- 이 방식으로 이동하면 주소 표시줄의 주소가 변경되지 않습니다.
     	- request 영역을 공유하게 됩니다.
     	- 방법 : RequestDispatcher 에서 제공하는
     	 		메소드 (foward()) 을 사용하여 요청을 재지정합니다.
      */
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String value = request.getParameter("food");
		
		//dispatcher.jsp : 이동할 페이지 주소
		RequestDispatcher dispatcher =
					request.getRequestDispatcher("dispatcher.jsp");
		
		//request 객체에  "food" 속성에 value 값 을 저장합니다.
		request.setAttribute("food", value);
		
		//이동합니다
			dispatcher.forward(request, response);
	}
}
















