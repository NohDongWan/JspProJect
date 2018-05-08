package ch12;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch12.db.Member;
import ch12.db.MemberDAO;

public class Member_infoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		MemberDAO mdao = new MemberDAO();
		Member m = mdao.member_info(id);
		
		forward.setPath("/ch12_db/_8.member/ex1/member_info.jsp");
		forward.setRedirect(false);
		request.setAttribute("memberinfo", m);
		return forward;
		
		
	}

}
