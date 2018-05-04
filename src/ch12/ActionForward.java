package ch12;
// ActionForward Ŭ������ Action �������̽����� ����� �����ϰ� ��� ����
// ������ ������ �Ҷ� ���Ǵ� Ŭ���� �Դϴ�.
// �� Ŭ������ Redirect ���� ���� �������� �������� ��ġ�� ������ �ֽ��ϴ�.
// �� ������ FrontController ���� ActionForward Ŭ���� Ÿ������ ��ȯ����
// �������� �� ���� Ȯ���Ͽ� �ش��ϴ� ��û �������� ������ ó���� �մϴ�.

public class ActionForward {
	private boolean redirect=false;
	private String path=null;
	
	//property Redirect�� is �޼ҵ�
	public boolean isRedirect() {												//get ��� is
		//������Ƽ Ÿ���� boolean �� ��� get ��� is �� �տ� ���� �� �ֽ��ϴ�.
		return redirect;
	}
	
	//property Redirect�� set �޼ҵ�
	public void setRedirect(boolean b) {										//set �޼ҵ�
			redirect=b;
	}
	public String getPath() {													//path �� get �޼ҵ�
		return path;
	}
	
	public void setPath(String string) {										//path �� set �޼ҵ�
		path=string;
	}
}
