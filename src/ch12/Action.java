package ch12;

import javax.servlet.http.*;

//Ư�� ����Ͻ� ��û���� �����ϰ� ��� ���� ActionForward Ÿ������ ��ȯ�ϴ�
//�޼��尡 ���ǵǾ� �ֽ��ϴ�.
//Action : �������̽� ��
//ActionForward : ��ȯ��

public interface Action{
		public ActionForward execute(HttpServletRequest requset
													,HttpServletResponse response)
		throws Exception;
	}
