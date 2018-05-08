package ch12;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch12.db.Member;
import ch12.db.MemberDAO;

public class Member_deleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ActionForward forward = new ActionForward();
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			if(id.equals("admin")) {
				out.print("<script>");
				out.print("alert('�����ڴ� �����Ͻ� �� �����ϴ�.');");
				out.println("history.back();");
				out.print("</script>");
				out.close();
				return null;
			}else {
			MemberDAO mdao = new MemberDAO();		//�����ͺ��̽� �����ϴϱ� ����
			mdao.delete(id);
			forward.setPath("member_list.net");
			forward.setRedirect(false);
			}
			return forward;
				
	}
			
		

}
