package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class send
 */
@WebServlet("/ch3/_5.Test/send")
public class send extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public send() {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String jumin1 = request.getParameter("jumin1");
		String jumin2 = request.getParameter("jumin2");
		String email = request.getParameter("email");
		String domain = request.getParameter("domain");
		
		
		String sel = request.getParameter("sel");
		String gender = request.getParameter("gender");
		String[] hobby = request.getParameterValues("hobby");
		String post1 = request.getParameter("post1");
		String post2 = request.getParameter("post2");
		
		
		String address = request.getParameter("address");
		String intro = request.getParameter("intro");
		
		
		
		PrintWriter out = response.getWriter();
		
		out.println("�Ƶ�"+id+"<br>");
		out.println("���"+pass+"<br>");
		out.println("���ڸ� : "+jumin1 +" ���ڸ� : " + jumin2+"<br>");
		
		/*
		 �������� ������ ��� ��ȿ�� �˻翡��
		 $("#domain").attr("disabled","disabled"); �� ��Ȱ��ȭ�� ���״�
		 	��Ȱ��ȭ�� ��� ������ �� ������ �̷������ �ʴ´�.
		 -�ּ�â�� Ȯ���غ��� �������� ������ ��� domain �� ���۵��� �ʰ�
		 	sel �� ���۵ȴ�.
		 - ���� �Է��� ��쿡�� domain �� ���� ����Ǿ� ���۵ǰ�
		 	sel �� ���� ���� ���·� ���۵ȴ�. 
		  */
		
		if(sel.equals(""))
			out.println("e-mail = " + email + "@" + domain + "<br>");
		else
			out.println("e-mail = " + email + "@" + sel + "<br>");
		out.println("���� : " + gender+"<br>");
		for(int i = 0 ; i < hobby.length; i++) {
		out.println("��� : "+ hobby[i]+"<br>"); 
		}
		out.println("�����ȣ �� : " + post1 + " �� : "+ post2+"<br>");
		out.println("�ּ� : " + address+"<br>");
		out.println("�ڱ�Ұ� :" + intro+"<br>");
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
