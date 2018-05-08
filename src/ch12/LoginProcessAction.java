
//���� �θ��� FrontController��.

package ch12;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ch12.db.MemberDAO;

public class LoginProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, // execute �� ������
			HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		MemberDAO mdao = new MemberDAO();
		int result = mdao.isId(id, pass);
		System.out.println("����� " + result);		//�α��μ����� result 1 ����
		if (result == 1) {								//�α����� �����ߴٸ�
			HttpSession session = request.getSession();		//������ �������� 
			// �α��� ����
			session.setAttribute("id", id);					//���ǰ��� ����ְ�
			forward.setRedirect(false);						//�����̷�Ʈ�� ���Ҳ���.
			forward.setPath("/ch12_db/_8.member/ex1/main.jsp");		//
			return forward;
		} else {
			String message = "";
			if (result == -1)
				message = "���̵� �������� �ʽ��ϴ�.";
			else
				message = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";

			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("location.href='./loginForm.net';");
			out.println("</script>");
			out.close();
			return null;
		}
	}
}
