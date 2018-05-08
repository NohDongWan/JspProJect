/*
 	���� �׼� �������� ������ �������ְ�		: �����̷�Ʈ�� ���� ������� ���� �����ؾ��ϱ⶧����... 
 	DAO Ŭ���� �����༭ �Լ� ���ְ�	
 	alert ���ְ� ������ ���ش� 
 */

package ch12;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch12.db.Member;
import ch12.db.MemberDAO;

public class ListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ActionForward forward = new ActionForward();	//������ ���� �������ֱ����� ���ش�.
			MemberDAO mdao = new MemberDAO();				//����������� ���ش�
			List<Member> list = mdao.getList();				//List�����δ�Ƽ� ���������� ���ش�. �̺κ� ���Ϲ����
			
			forward.setPath("/ch12_db/_8.member/ex1/member_list.jsp");
			forward.setRedirect(false);
			request.setAttribute("totallist", list);
			return forward;
	}

}
