package com.puco.board;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import java.io.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ocpsoft.prettytime.PrettyTime;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.puco.board.dao.BoardDTO;
import com.puco.board.dao.QBoardDAO;
import com.puco.board.dao.QnaBoardVO;
import com.puco.category.dao.DcategoryDAO;
import com.puco.category.dao.DcategoryDTO;
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
		// DB����
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
	

	
@RequestMapping("userMain.do")
	
	public String userMain(HttpServletRequest req){
		Map map=new HashMap();
		map.put("start", 1);
		map.put("end", 5);
		List<QnaBoardVO> list = QBoardDAO.MainAllData(map);
		req.setAttribute("qlist", list);
		// Dcategory �޴�
		List<DcategoryDTO> dlist=DcategoryDAO.DcategoryAllData();
		req.setAttribute("dlist", dlist);
		String no =req.getParameter("mno");
		MemberDTO vo = MemberDAO.userdata(Integer.parseInt(no));
		PrettyTime p = new PrettyTime(new Locale("KO"));
		req.setAttribute("login",p.format(vo.getLogindate()));
		req.setAttribute("jsp", "userMain.jsp");
		req.setAttribute("mno", no);
		req.setAttribute("vo", vo);
		req.setAttribute("jsp", "userMain.jsp");
		
		return "common/main.jsp";
	}
	
	@RequestMapping("user_update.do")
	public String user_update(HttpServletRequest req){
		
		req.setAttribute("jsp", "user_edit.jsp");
		return "common/main.jsp";
	}
	
	@RequestMapping("user_update_ok.do")
	public String user_update_ok(HttpServletRequest req) throws IOException{
		
		String path="c://SpringDev//springStudy//.metadata//.plugins//org.eclipse.wst.server.core//tmp1//wtpwebapps//PublicCoding//resources//userprofiles";
	    String enctype="EUC-KR";
	    int size=1024*1024*100;
	    MultipartRequest mr=
	    		new MultipartRequest(req,path,size,enctype,
	    				new DefaultFileRenamePolicy());
	    String mno=mr.getParameter("mno");
	    System.out.println(mno);
	    String filename=mr.getOriginalFileName("upload");
	    System.out.println(">>>>>>>>filename"+filename);
	    MemberDTO info=MemberDAO.userdata(Integer.parseInt(mno));
	    System.out.println(">>>>>>>>filename1");
	    MemberDTO d=new MemberDTO();
	    d.setMno(Integer.parseInt(mno));
	    if(filename==null)
	    {
	    	File f=new File("C:\\SpringDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\PublicCoding\\resources\\userprofiles\\"+info.getMimageURL());
	    	   f.delete();
	    	d.setMimageURL("defaultprofile.jpg");
	    	d.setFilesize(0);
	    }
	    else
	    {
	    	File f=new File("C:\\SpringDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\PublicCoding\\resources\\userprofiles\\"+filename);
	    	d.setMimageURL(filename);
	    	d.setFilesize((int)f.length());
	    	
	    }

	    // DB���� 
	    System.out.println(">>>>>>>>filename2");
	    System.out.println(d.getMno());
	    System.out.println(d.getFilesize());
	    System.out.println(d.getMimageURL());
	    MemberDAO.userUpdate(d);
	    // �̵� 
	    System.out.println(">>>>>>>>filename3");
	       if(filename!=null && info.getFilesize()>0)
	       {
	    	   File f=new File("C:\\SpringDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\PublicCoding\\resources\\userprofiles\\"+info.getMimageURL());
	    	   f.delete();
	    	   
	/*     	   
	    	   ���� MultipartRequest �� �̿��Ͽ� �������ϸ����� ���ε带 �Ѵ�.
	����... java.io.File Ŭ������ �̿��� Rename�� ��Ų��.

	//���Ͼ��ε���...
	String fileName = "�������ϸ�";    //Ȯ���������Ѵ�.
	String newFileName = "���ϴ����ϸ�.Ȯ����";
	String saveDir = "C:/UploadFiles';

	if(!fileName.equals("")) {
	     // ������ ���ε�� �����ο� ���ϸ� ���Ѵ�.
	     fullFileName = saveDir + "/" + fileNAme;
	     java.io.File f1 = new java.io.File(fullFileName);
	     if(f1.exists()) {     // ���ε�� ���ϸ��� �����ϸ� Rename�Ѵ�.
	          java.io.File newFile = java.io.File(saveDir + "/" + newFileName);
	          f1.renameTo(newFile);   // rename...
	     }
	}
	    	   */ 
	      
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
