//������ �����������ڸ�
/*
	�������ؽ�Ʈ�� �������ϸ� ������ ���ư��µ����� ���� ����ȴ�.
	
	1. Ŭ���̾�Ʈ���� ������ ��û
	2. ������ ����
	3. Ŭ���̾�Ʈ�� �ι�°��û�ϸ� - > ���ο� Ŭ���̾�Ʈ�� �ν�
	
	 �׷��� session �����
	 1. ��û�ϸ� ���Ǿ��̵��� �Ǿ ������ �̰��� Ŭ���̾�Ʈ�� ���� -> ��Ű���θ�


�ñ��Ѱ� method �� �����ϸ� �˾Ƽ� get ���°��Ǵ���
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
		
		response.setContentType("text/html;charset=UTF-8");	//����κ��� ���������ش� text/html ������������ utf-8 �� ���������� ������		
		String value =request.getParameter("food");
		request.setAttribute("food", value);
		
		HttpSession session = request.getSession();
		session.setAttribute("food", value);
		
		//���� �������� �Ҽӵ� �� ���ø����̼��� ServletContext ��ü�� ���ؿɴϴ�.
		ServletContext sc = this.getServletContext();
		//ServletContext sc =
				//request.getSession().getServletContext();
		sc.setAttribute("food", value);
		
		response.sendRedirect("scope.jsp");
	}
}
