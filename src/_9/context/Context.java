//오전에 배운걸정리하자면
/*
	서블릿컨텍스트에 저장을하면 서버가 돌아가는동안은 값이 저장된다.
	
	1. 클라이언트에서 서버로 요청
	2. 서버는 응답
	3. 클라이언트가 두번째요청하면 - > 새로운 클라이언트로 인식
	
	 그래서 session 을사용
	 1. 요청하면 세션아이디값을 실어서 보낸다 이값은 클라이언트에 저장 -> 쿠키라고부름


궁금한거 method 를 생략하면 알아서 get 상태가되는지
*/
package _9.context;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Context
 */
@WebServlet("/ch3/_9.context/context")
public class Context extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Context() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=UTF-8");	//헤더부분을 먼저보내준다 text/html 파일형식으로 utf-8 을 웹브라우져로 보낸다		
		String value =request.getParameter("food");
		request.setAttribute("food", value);
		
		HttpSession session = request.getSession();
		session.setAttribute("food", value);
		
		//현재 페이지가 소속된 웹 애플리케이션의 ServletContext 객체를 구해옵니다.
		ServletContext sc = this.getServletContext();
		//ServletContext sc =
				//request.getSession().getServletContext();
		sc.setAttribute("food", value);
		
		response.sendRedirect("scope.jsp");
	}
}
