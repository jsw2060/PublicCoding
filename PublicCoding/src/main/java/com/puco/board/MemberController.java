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
		String mno="";
		if(!(res.equals("NOID")||res.equals("NOPWD"))) {
			// �α��� ����� MemberDAO���� email�� �޾ƿ��� ������ ���� �߶��� �ʾҴ�.
			StringTokenizer st = new StringTokenizer(res, "|");
			email=st.nextToken();
			mno=st.nextToken();
			HttpSession session=req.getSession();
			session.setAttribute("id", id);
			session.setAttribute("pwd", pwd);
			session.setAttribute("email", email);
			session.setAttribute("mno", mno);
			
		}
		req.setAttribute("res", res);
		System.out.println("MemberController -> login.jsp");
		return "member/login.jsp";
	}
	   
	@RequestMapping("signin_ok.do")
	public String signin_ok(HttpServletRequest req){		
		
		return "common/main.jsp";
		
	}
	
	@RequestMapping("join.do")
	   public String memberJoin(HttpServletRequest req){
		   
		   req.setAttribute("jsp", "member/join.jsp");
		   return "common/main.jsp";
	   }
}
