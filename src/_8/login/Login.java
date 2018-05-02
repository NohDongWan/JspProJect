package _8.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ch3/_8.login/login_ok")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		
		if(id.equals("java") && pw.equals("java")) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("passwd", pw);
			response.sendRedirect("login_success.jsp");	
		}
		
		else if(id.equals("java")){
		out.println("<script>");
		out.println("alert('비밀번호가 일치하지않습니다')");
		out.println("history.back()");
		out.println("</script>");
		out.close();
		}
		
		else if(pw.equals("java")){
			out.println("<script>");
			out.println("alert('아이디가 일치하지 않습니다')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			}
		
		else {
			out.println("<script>");
			out.println("alert('아이디와 비밀번호가 일치하지않습니다')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			}
			
		}
	}

