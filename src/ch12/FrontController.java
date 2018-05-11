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

		String RequestURI = request.getRequestURI();		// 1. uri ��������
		System.out.println("RequestURI = " + RequestURI); 

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

		if (command.equals("/loginForm.net")) { 									//1. �̰ɷε�����
			forward = new ActionForward();
			forward.setRedirect(false); // �����̷�Ʈ �Ⱦ����� ������� �ּҺ��� ���̰�����.��¶�
			forward.setPath("/ch12_db/_8.member/ex1/loginForm.jsp"); //�����̷�Ʈ�� ���ּҸ����ٸ� �ּҰ��� �̰����� ����ȴ�.

		} else if (command.equals("/loginProcess.net")) {			//���ּҷ� �� ������
			action = new LoginProcessAction();						//
			try {
				forward = action.execute(request, response);		//loginProcessAction ���� �����尪�� ���Ϲ޾ƿ´�.
																		// �׸��� �ǾƷ� if ������ ��������
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/member_list.net")) {
			action = new ListAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/member_info.net")) {
			action = new Member_infoAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/member_delete.net")) {
			action = new Member_deleteAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/updateForm.net")) {
			action = new Member_updateAction();
			try {
				forward = new ActionForward();
				forward = action.execute(request, response);
				forward.setRedirect(false); // �ּҺ������ jsp ������ �̵�
				forward.setPath("/ch12_db/_8.member/ex1/updateForm.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/updateProcess.net")) {
			action = new UpdateProcessAction();
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/logOut.net")) {
			action = new LogoutAction();
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		

		else if (command.equals("/joinForm.net")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/ch12_db/_8.member/ex1/joinForm.jsp");
			
			
			}else if (command.equals("/joinProcess.net")) {
				action = new JoinProcessAction();
				try {
				forward = action.execute(request, response);
				}catch (Exception e) {
					e.printStackTrace();
				}
				
			}else if(command.equals("/main.net")) { 									//1. �̰ɷε�����
				forward = new ActionForward();
				forward.setRedirect(false); // �ּҺ������ jsp ������ �̵�
				forward.setPath("/ch12_db/_8.member/ex1/main.jsp");
			}
			
		
		
		

			if (forward != null) {									//���Ϲ޾ƿ� ������ ���� ���̾ƴ϶��
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
