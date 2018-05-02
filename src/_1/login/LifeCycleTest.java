package _1.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeCycleTest
 */
@WebServlet("/ch3/_1.login/LifeCycleTest")
public class LifeCycleTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LifeCycleTest() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void service(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException{
	System.out.println("���� service() �Դϴ�.~");
	doGet(request, response);
}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//�����ϴ� ������ Ÿ���� html �̰�
		//charset = euc-kr �� �����ϸ鼭 ����Ǵ� ����Ʈ���� �ѱ�ó���� �Ѻκ��Դϴ�.
		response.setContentType("text/html;charset=UTF-8");

		//getContextPath() : �� ���ø����̼� ��� ������ ��ȯ�մϴ�.
		//URL ���� ��Ʈ��ȣ�� ������ ���� �� ���ø����̼� �̸��� �����մϴ�.
		//�� ���� �����ϴ� �޼ҵ��Դϴ�.
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//getParameter() �޼��� : 
		//name ���� ���۵Ǿ� �� �Ķ���� ���� ��ȯ�� �ִ� �޼��� �Դϴ�.
		//Ŭ���̾�Ʈ���� ���۵�� ���� id ��� �̸��� �Ķ���� ����
		//passwd ��� �̸��� �Ķ���� ���� �޴� �κ��Դϴ�.
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		PrintWriter out = response.getWriter();
		//out.write("<HTML><HEAD></HEAD><BODY> <br>  <p>ID = "+id +"</p>  <p>PWD = "+ passwd + "</p></BODY></HTML");
		out.println("<br>" + "���̵� = " + id + "<br>");
		out.println("��� = " + passwd + "<br>");
		
		out.close();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
