package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ch3/_2.member/memReg")
public class memReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void doPost(HttpServletRequest request,
						HttpServletResponse response) 
					throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		String hobby = request.getParameter("hobby");
		out.println("<br> 회사이름 : "+name);
		out.println("<br> 주소 : "+addr);
		out.println("<br> 전화번호 : "+tel);
		out.println("<br> 취미 : "+hobby);
		
	}

}
