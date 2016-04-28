package com.puco.board;

import java.util.Enumeration;
import java.util.Locale;
import java.util.StringTokenizer;
import java.io.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ocpsoft.prettytime.PrettyTime;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.puco.board.dao.BoardDTO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.member.dao.MemberDAO;
import com.puco.member.dao.MemberDTO;

@Controller("mc")
public class MemberController {
	@RequestMapping("signin.do")
	public String memberSignin(HttpServletRequest req) {
		String id=req.getParameter("id");
		System.out.println(id);
		String pwd=req.getParameter("pwd");
		System.out.println(pwd);
		// DB연동
		String res = MemberDAO.memberLogin(id, pwd);
		String email="";
		String mno="";
		if(!(res.equals("NOID")||res.equals("NOPWD"))) {
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
		System.out.println("MemberController -> signin.jsp");
		return "member/signin.jsp";
	}
	

	@RequestMapping("join.do")
	   public String memberJoin(HttpServletRequest req){
		   
		   req.setAttribute("jsp", "member/join.jsp");
		   return "common/main.jsp";
	   }
	
	@RequestMapping("user.do")
	public String userInfo(HttpServletRequest req){
		String no =req.getParameter("mno");
		MemberDTO vo = MemberDAO.userdata(Integer.parseInt(no));
		PrettyTime p = new PrettyTime(new Locale("KO"));
		req.setAttribute("login",p.format(vo.getLogindate()));
		req.setAttribute("jsp", "userMain.jsp");
		req.setAttribute("mno", no);
		req.setAttribute("vo", vo);
		
		return "common/container.jsp";
	}
	
	@RequestMapping("user_update.do")
	public String user_update(HttpServletRequest req){
		req.setAttribute("jsp", "user_edit.jsp");
		return "common/container.jsp";
	}
	
	@RequestMapping("user_update_ok.do")
	public String user_update_ok(HttpServletRequest req) throws IOException{
	    String path="c://download";
	    String enctype="EUC-KR";
	    int size=1024*1024*100;
	    MultipartRequest mr=
	    		new MultipartRequest(req,path,size,enctype,
	    				new DefaultFileRenamePolicy());
	    String mno=mr.getParameter("mno");
	      
	    String filename=mr.getOriginalFileName("upload");
	    MemberDTO info=MemberDAO.userdata(Integer.parseInt(mno));
	    MemberDTO d=new MemberDTO();
	    if(filename==null)
	    {
	    	d.setMimageURL(info.getMimageURL());
	    	d.setFilesize(info.getFilesize());
	    }
	    else
	    {
	    	File f=new File("c:\\download\\"+filename);
	    	d.setMimageURL(filename);
	    	d.setFilesize((int)f.length());
	    }

	    // DB연동 
	    boolean bCheck=MemberDAO.userUpdate(d);
	    // 이동 
	    if(bCheck==true)
	    {
	       if(filename!=null && info.getFilesize()>0)
	       {
	    	   File f=new File("c:\\download\\"+info.getMimageURL());
	    	   f.delete();
	    	   
	/*     	   
	    	   먼저 MultipartRequest 을 이용하여 원본파일명으로 업로드를 한다.
	그후... java.io.File 클래스를 이용해 Rename을 시킨다.

	//파일업로드후...
	String fileName = "원본파일명";    //확장자포함한다.
	String newFileName = "원하는파일명.확장자";
	String saveDir = "C:/UploadFiles';

	if(!fileName.equals("")) {
	     // 원본이 업로드된 절대경로와 파일명를 구한다.
	     fullFileName = saveDir + "/" + fileNAme;
	     java.io.File f1 = new java.io.File(fullFileName);
	     if(f1.exists()) {     // 업로드된 파일명이 존재하면 Rename한다.
	          java.io.File newFile = java.io.File(saveDir + "/" + newFileName);
	          f1.renameTo(newFile);   // rename...
	     }
	}
	    	   */ 
	       }
	    }
		return "common/user_update_ok.jsp";
	}
	    
	

	@RequestMapping("signout.do")
	public String signout(HttpServletRequest req){
		HttpSession session=req.getSession();
		session.invalidate();
		return "member/signout.jsp";
	}

}
