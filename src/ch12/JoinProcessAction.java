package ch12;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch12.db.Member;
import ch12.db.MemberDAO;

public class JoinProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
		/*ActionForward forward = new ActionForward();*/
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		
		MemberDAO mdao = new MemberDAO();
		Member m = new Member();
		m.setId(id);
		m.setAge(age);
		m.setEmail(email);
		m.setGender(gender);
		m.setName(name);
		m.setPassword(pass);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		int result = mdao.insert(m);
		
		if(result == 1) {
			out.println("<script>");
			out.println("alert('ȸ�������� �Ϸ�Ǿ����ϴ�');");
			out.println("location.href = 'loginForm.net';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('���̵� �ߺ��Դϴ�.');");
			out.println("location.href = 'loginForm.net';");
			out.println("</script>");
		}
		return null;
	}

}
