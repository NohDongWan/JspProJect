package _6.redirect;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Redirect
 */
@WebServlet("/ch3/_6_2.redirect/RedirectServlet")
public class Redirect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Redirect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String value = request.getParameter("food");
		request.setAttribute("food",value);
		response.sendRedirect("redirect.jsp");		//다시 응답을해라 == 이거는 다시요청을한거와 똑같아서 리퀘스트값이 새로생긴다고 봐야한다 그렇다면 이전의 값은 사라진다
		//sendRedirect 새로 요청을하고 , dispactcher 은 쿠키를 저장해서 보낸다
		//쿠키는 클라이언트 세션은 서버쪽
		
		
	}
}
