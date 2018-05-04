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
		System.out.println("RequestURI = " + RequestURI); // 1. uri ��������

		// getContextPath() : ���ؽ�Ʈ ��ΰ� ��ȯ�˴ϴ�.
		// contextPath�� "/0420_jsp"�� ��ȯ�˴ϴ�.
		String contextPath = request.getContextPath(); // 2. ������Ʈ �̸� ��ȯ�ϰ�
		System.out.println("contextPath = " + contextPath);

		// RequestURI ���� ���ؽ�Ʈ ��� ���� ���� �ε��� ��ġ�� ���ں���
		// ������ ��ġ ���ڱ��� �����մϴ�.
		// command �� "/login.net" ��ȯ�˴ϴ�.
		String command = RequestURI.substring(contextPath.length()); // 3. uri ��ü���� 0420_jsp �� ¥���ڴ�.
		System.out.println("command = " + command);

		// �ʱ�ȭ
		ActionForward forward = null;
		Action action = null; // action �ʱⰪ ���ְ�

		if (command.equals("/loginForm.net")) { // ���⼭�̸������ְ�
			forward = new ActionForward();
			forward.setRedirect(false); // �ּҺ������ jsp ������ �̵�
			forward.setPath("/ch12_db/_8.member/ex1/loginForm.jsp"); // ��������� ������ �س��°Ŵ�

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

	// doprocess(request,response) �޼��带 �����Ͽ� ��û�� get ����̵�
	// post ������� ���۵Ǿ�

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
