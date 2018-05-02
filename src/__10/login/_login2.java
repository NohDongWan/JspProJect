package __10.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ch4/_3.login_session/login")
public class _login2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public _login2() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		
		response.sendRedirect("template.jsp");
		// String pw = request.getParameter("passwd");

		if (id == null) {
			System.out.println("null 입니다");
		}
		// 파라미터 값이 없는경우
		if (id.equals("")) {
			System.out.println("공백입니다.");
		}
		session.setAttribute("id", id);
	}
}
