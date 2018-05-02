package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class send
 */
@WebServlet("/ch3/_5.Test/send")
public class send extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public send() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void service(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException{
	System.out.println("저는 service() 입니다.~");
	doGet(request, response);
}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String jumin1 = request.getParameter("jumin1");
		String jumin2 = request.getParameter("jumin2");
		String email = request.getParameter("email");
		String domain = request.getParameter("domain");
		
		
		String sel = request.getParameter("sel");
		String gender = request.getParameter("gender");
		String[] hobby = request.getParameterValues("hobby");
		String post1 = request.getParameter("post1");
		String post2 = request.getParameter("post2");
		
		
		String address = request.getParameter("address");
		String intro = request.getParameter("intro");
		
		
		
		PrintWriter out = response.getWriter();
		
		out.println("아디"+id+"<br>");
		out.println("비번"+pass+"<br>");
		out.println("앞자리 : "+jumin1 +" 뒷자리 : " + jumin2+"<br>");
		
		/*
		 도메인을 선택한 경우 유효성 검사에서
		 $("#domain").attr("disabled","disabled"); 로 비활성화를 시켰다
		 	비활성화된 경우 서버로 값 전송이 이루어지지 않는다.
		 -주소창을 확인해보면 도메인을 선택한 경우 domain 은 전송되지 않고
		 	sel 만 전송된다.
		 - 직접 입력한 경우에는 domain 은 값이 저장되어 전송되고
		 	sel 은 값이 없는 상태로 전송된다. 
		  */
		
		if(sel.equals(""))
			out.println("e-mail = " + email + "@" + domain + "<br>");
		else
			out.println("e-mail = " + email + "@" + sel + "<br>");
		out.println("성별 : " + gender+"<br>");
		for(int i = 0 ; i < hobby.length; i++) {
		out.println("취미 : "+ hobby[i]+"<br>"); 
		}
		out.println("우편번호 앞 : " + post1 + " 뒤 : "+ post2+"<br>");
		out.println("주소 : " + address+"<br>");
		out.println("자기소개 :" + intro+"<br>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
