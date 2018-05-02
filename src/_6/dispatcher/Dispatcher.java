//���� ������
/*
 * 
 * ��ũ�� �ٲٱ�			window -> preferences -> temp �˻� -> jsp -> markup -> edit ���� �Ʒ����ιٲ��ش�
  <%@ page language="java" contentType="text/html; charset=${encoding}"
    pageEncoding="${encoding}"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
${cursor}
</body>
</html>
 
 
 Dispatcher �� ��Ű��������. ���⼭���� Ǫ�尪��  dipatcher.jsp �� ������ �ִ�.
 
 
 */


package _6.dispatcher;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Dispatcher
 */
@WebServlet("/ch3/_6.dispatcher/DispatcherServlet")
public class Dispatcher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dispatcher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    
    /*	������ �̵����
     
     	1. Dispatcher ���
     	- Ŭ���̾�Ʈ�κ��� ��û ���� Servlet ���α׷��� ������ ���� �ʰ�
     			�ٸ� �����̳� JSP ������ � �����մϴ�. (��û ������)		//��Ű���� ����.
     	- �� ������� �̵��ϸ� �ּ� ǥ������ �ּҰ� ������� �ʽ��ϴ�.
     	- request ������ �����ϰ� �˴ϴ�.
     	- ��� : RequestDispatcher ���� �����ϴ�
     	 		�޼ҵ� (foward()) �� ����Ͽ� ��û�� �������մϴ�.
      */
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String value = request.getParameter("food");
		
		//dispatcher.jsp : �̵��� ������ �ּ�
		RequestDispatcher dispatcher =
					request.getRequestDispatcher("dispatcher.jsp");
		
		//request ��ü��  "food" �Ӽ��� value �� �� �����մϴ�.
		request.setAttribute("food", value);
		
		//�̵��մϴ�
			dispatcher.forward(request, response);
	}
}
















