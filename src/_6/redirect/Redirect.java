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
		response.sendRedirect("redirect.jsp");		//�ٽ� �������ض� == �̰Ŵ� �ٽÿ�û���Ѱſ� �Ȱ��Ƽ� ������Ʈ���� ���λ���ٰ� �����Ѵ� �׷��ٸ� ������ ���� �������
		//sendRedirect ���� ��û���ϰ� , dispactcher �� ��Ű�� �����ؼ� ������
		//��Ű�� Ŭ���̾�Ʈ ������ ������
		
		
	}
}
