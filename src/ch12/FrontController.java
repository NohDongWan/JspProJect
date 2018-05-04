package ch12;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.net")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI); // 1. uri 값얻어오고

		// getContextPath() : 컨텍스트 경로가 반환됩니다.
		// contextPath는 "/0420_jsp"가 반환됩니다.
		String contextPath = request.getContextPath(); // 2. 프로젝트 이름 반환하고
		System.out.println("contextPath = " + contextPath);

		// RequestURI 에서 컨텍스트 경로 길이 값의 인덱스 위치의 문자부터
		// 마지막 위치 문자까지 추출합니다.
		// command 는 "/login.net" 반환됩니다.
		String command = RequestURI.substring(contextPath.length()); // 3. uri 전체에서 0420_jsp 만 짜르겠다.
		System.out.println("command = " + command);

		// 초기화
		ActionForward forward = null;
		Action action = null; // action 초기값 해주고

		if (command.equals("/loginForm.net")) { // 여기서이름정해주고
			forward = new ActionForward();
			forward.setRedirect(false); // 주소변경없이 jsp 페이지 이동
			forward.setPath("/ch12_db/_8.member/ex1/loginForm.jsp"); // 여기까지는 설정만 해놓는거다

		} else if (command.equals("/loginProcess.net")) {
			action = new LoginProcessAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (command.equals("/joinForm.net")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/ch12_db/_8.member/ex1/joinForm.jsp");
			}
		
			if (command.equals("/joinProcess.net")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/ch12_db/_8.member/ex1/joinProcess.jsp");
			}

			if (forward != null) {
				if (forward.isRedirect()) {
					response.sendRedirect(forward.getPath());
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}

			}
		}

		/*
		 * RequestDispatcher dispatcher =
		 * request.getRequestDispatcher("/ch12_db/_8.member/ex1/loginForm.jsp");
		 * dispatcher.forward(request, response);
		 */

	public FrontController() {
		super();
	}

	// doprocess(request,response) 메서드를 구현하여 요청이 get 방식이든
	// post 방식으로 전송되어

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
