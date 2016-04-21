package com.puco.board;

import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.member.dao.MemberDAO;

@Controller("mc")
public class MemberController {
	@RequestMapping("signin.do")
	public String memberSignin(HttpServletRequest req) {
		String id=req.getParameter("id");
		System.out.println(id);
		String pwd=req.getParameter("pwd");
		System.out.println(pwd);
		// DB����
		String res = MemberDAO.memberLogin(id, pwd);
		String email="";
		if(!(res.equals("NOID")||res.equals("NOPWD"))) {
			// �α��� ����� MemberDAO���� email�� �޾ƿ��� ������ ���� �߶��� �ʾҴ�.
			StringTokenizer st = new StringTokenizer(res, "|");
			email=st.nextToken();
			HttpSession session=req.getSession();
			session.setAttribute("id", id);
			session.setAttribute("pwd", pwd);
			session.setAttribute("email", email);
		}
		req.setAttribute("res", res);
		System.out.println("MemberController -> login.jsp");
		return "member/login.jsp";
	}
	
	@RequestMapping("signin_ok.do")
	public String signin_ok(HttpServletRequest req){
		
		
		return "common/main.jsp";
		
	}
}
