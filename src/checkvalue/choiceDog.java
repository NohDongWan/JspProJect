package checkvalue;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class choiceDog
 */
@WebServlet("/ch3/_4.checkvalue/choiceDog")
public class choiceDog extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request,
							HttpServletResponse response) 
							throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		/*
		  request.getparameterValues("dog")
		  �ϳ��� �Ķ���� �̸�(dog)���� ���� ���� �� ���۵Ǿ� �� ��쿡 ���
		  ���� �̸����� ���� ���� �Ķ���� ���� �����ϱ� ���ؼ� ����ϰ� �ִ�
		  üũ �ڽ��� �̸��� ���������� dog �� �����Ǿ� �����Ƿ�
		  �� üũ �ڽ��� ������ ������ �̹��� ���ϸ��� �����Ͽ� �Ķ���� ������
		  ������ �̹��� �̸��� ���۵ǵ��� �ϰ� �ֽ��ϴ�. 
		 */
		
		String[] dog=request.getParameterValues("dog");
		
		PrintWriter out = response.getWriter();
		
			out.println("<html><head><style>");
			out.println("body{background-color : black;}");
			out.println("table{background : yellow; margin : 0 auto;}");
			out.println("td{color : red; font-size : 20px; text-align : center}");
			out.println("</style>");
			out.println("<body><table><tr>");
			
			for(int i=0;i<dog.length;i++) {
				out.print("<td>"+dog[i]+"</td>");
			}
			out.println("</tr>");
			out.println("<tr>");
			for(int i = 0 ; i < dog.length; i++) {
				out.print("<td><img src = "+dog[i]+">"+"</td>");

			}
			
			out.print("</tr>");
			out.print("</table></body>");			
							
		}
		
	
	}

