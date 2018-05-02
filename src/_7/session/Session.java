package _7.session;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Session
 */
@WebServlet("/ch3/_7.session/SessionServlet")
public class Session extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Session() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//request.getSession() : 세션 객체 생성하는 메서드입니다.
		HttpSession session = request.getSession();
		
		String value = request.getParameter("food");
		request.setAttribute("food", value);				//리퀘스트에 집어넣듯이
		session.setAttribute("food", value);				//세션에도 값을 집어넣는다
		response.sendRedirect("redirect.jsp");
		
		//세션의값은 살아있따.
		
	}
}
