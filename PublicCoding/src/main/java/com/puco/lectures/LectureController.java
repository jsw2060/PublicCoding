package com.puco.lectures;

import java.util.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.puco.board.dao.FreeBoardDAO;
import com.puco.board.dao.FreeBoardVO;
import com.puco.board.dao.QBoardDAO;
import com.puco.board.dao.QnaBoardVO;
import com.puco.category.dao.*;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.lectures.dao.*;
import com.puco.member.dao.MemberDAO;

@Controller("vc")
public class LectureController {
	/*@RequestMapping("videolist.do")
	public String videoListData(HttpServletRequest req){
		//req.setAttribute("msg", "�Խ���");
@Controller("vc")
public class LectureController {
	/*@RequestMapping("lectureMain.do")
	public String lectureMainData(HttpServletRequest req){
		String strmode=req.getParameter("mode");
		if(strmode==null)
			strmode="1";
		int mode=Integer.parseInt(strmode);
		VideoDAO dao = new VideoDAO();
		List<VideoDTO> dto;
		if(mode==1){
			dto = dao.VideoAllData(mode);
		}else{
			dto = dao.VideoAllData(mode);
		}
		req.setAttribute("list", dto);
		req.setAttribute("jsp", "inner_videolist.jsp");
		return "lectures/videolist.jsp";
	}*/
	
	// ���Ǳ׷� ��� ������
	@RequestMapping("courseGroup.do")
	public String videoListData(HttpServletRequest req){
		
		System.out.println(">>>>>>>>>>>>���Ǳ׷� ����Ʈ");
		String sno=req.getParameter("sno");
		int no = Integer.parseInt(sno);
		
		if(sno==null)
			no=1;
		
		// Dcategory �޴�
		List<DcategoryDTO> dlist=DcategoryDAO.DcategoryAllData();
		req.setAttribute("dlist", dlist);
		// Dcategory �޴� ��
		
		// Scategory �޴�
		List<List<ScategoryDTO>> slist=new ArrayList<List<ScategoryDTO>>();
		for(int i=0;i<dlist.size();i++){
			slist.add(ScategoryDAO.ScategoryAllData(dlist.get(i).getDno()));
		}
		req.setAttribute("slist", slist);
		// Scategory �޴� ��
		
		
		List<CourseGroupDTO> glist=CourseGroupDAO.CourseGroupAllData(no);
		System.out.println("LectureController CourseGroupDAO Work");
		req.setAttribute("glist", glist);
		
		Map avgMap = new HashMap();
		Map iavgMap = new HashMap();
		////////////////////////////////////////////////
		for(CourseGroupDTO vo:glist){
			int gno = vo.getGno();
			System.out.println("���� "+gno);
			double avg=CourseReplyDAO.replyPointAvg(gno);
			String avrg = String.valueOf(avg);
			if(avrg.length()>4);
			avrg=avrg.substring(0, avrg.indexOf('.')+2);
			System.out.println("CourseGroup Controller : "+avrg);
			avgMap.put(gno, avrg);
			System.out.println( "��� �ݿø�>>>>"+avg+"=>"+Math.floor(avg));
			iavgMap.put(gno, (int)avg );		
		}
		
		////////////////////////////////////////////////
		System.out.println(avgMap.size());
		req.setAttribute("avgMap", avgMap);
		req.setAttribute("iavgMap", iavgMap);
		
		req.setAttribute("jsp", "../lectures/lectureMain.jsp");		
		return "common/main.jsp";
	}
	// ���Ǳ׷� ��� ������ ��
	
	@RequestMapping("play.do")
	public String videoPlayData(HttpServletRequest req) throws Exception{
		
		String gnos=req.getParameter("gno");							// �׷��ȣ
		String cnos=req.getParameter("cno");    						// �������ȣ
		int gno = Integer.parseInt(gnos);
		
		List<ContentDTO> clist=ContentDAO.ContentListData(gno);			// clist�� ���������� ��ƿ�
		int initcno = clist.get(0).getCno();							// initcno�� ���� ù��° ������ ��ȣ�� �޾ƿ�
		
		if(cnos==null)
			cnos=String.valueOf(initcno);								// ���ʴ� ������ cno=0
		
		int cno = Integer.parseInt(cnos);
		
		String contenturl=clist.get(cno-initcno).getCmediaurl();		// clist���� ù��° ���� �����ϰ� �޾ƿ�(list�� �ѷ��� �͵�)
		contenturl=contenturl.substring(9,contenturl.length());			// ��ü URL�� /watch?v=�� �߶������
		String secondrul=contenturl.substring(0,contenturl.indexOf("&"));	// ���� ������ URL�κи� �߶� ������
		contenturl=contenturl.substring(contenturl.lastIndexOf("&")+1);		// &index=& ���� �߶󳻹���
		contenturl=secondrul+"?"+contenturl;	// ���������� �ʿ��� URL�� �� xTfCkSlwF1Q?list=PL7mmuO705dG0HUei41yV3ZOTT5MVURjGs
		
		String firstCname=clist.get(cno-initcno).getCname();			// ���õ� ���� ������ �޾ƿ�
		String firstSite=clist.get(cno-initcno).getCsiteurl();			// ���õ� ������ ����Ʈ URL�� ������
		String firstCtime=clist.get(cno-initcno).getCtime();
		
		req.setAttribute("firstCname", firstCname);
		req.setAttribute("contenturl", contenturl);
		req.setAttribute("firstSite", firstSite);
		req.setAttribute("firstCtime", firstCtime);
		req.setAttribute("clist", clist);
		req.setAttribute("gno", gno);
		
		CourseGroupDTO dto=CourseGroupDAO.CourseGroupOneData(gno);		// �ϴ� ���� �Ұ��� �뵵
		req.setAttribute("ginfo", dto);
		
		List<CourseGroupDTO> glist=CourseGroupDAO.SameGroupAllData(gno);// �������� ������ ���
		Collections.shuffle(glist);
		req.setAttribute("glist", glist);
		
		HttpSession hs = req.getSession();								// ���Ǹ� ���� ������ ���� �Ǵ� ����
		String no = (String) hs.getAttribute("mno");
		if(no != null){													// ���� �α��� �������� Ȯ��
			int mno = Integer.parseInt(no);
			System.out.println("mno " + mno);
			InfoattendantDTO InfoDto = new InfoattendantDTO();
			InfoDto.setGno(gno);
			InfoDto.setMno(mno);
			InfoattendantDTO confirmCourse = InfoattendantDAO.ConfirmCourseData(InfoDto);
			System.out.println("confirmCourse "+confirmCourse);
			System.out.println("gno "+gno);
			req.setAttribute("confirmCourse", confirmCourse);
		}
		
		Map map = new HashMap();										// ���� ���� �Խù� �˻�
		map.put("start", 1);
		map.put("end", 10);
		List<QnaBoardVO> list = QBoardDAO.MainAllData();
		List<FreeBoardVO> flist=FreeBoardDAO.MainFreeData();
		req.setAttribute("qlist", list);
		
		
		String rpage=req.getParameter("rpage");							// ���� �� ��� ���
		   if(rpage==null)
			   rpage="1";
		   int cpage=Integer.parseInt(rpage);
		   int rowSize=5;
		   int start=(cpage*rowSize)-(rowSize-1);
		   int end=(cpage*rowSize);
		   Map remap=new HashMap();
		   remap.put("gno", gnos);
		   System.out.println("gno in play.do " + gnos);
		   remap.put("start", start);
		   System.out.println("start in play.do " + start);
		   remap.put("end", end);
		   System.out.println("end in play.do " + end);
		   List<CourseReplyDTO> replyList=CourseReplyDAO.replyAllData(remap);
		  
		   
		   Map imagemap= new HashMap();
		
		   for(CourseReplyDTO dt:replyList){
			   String mid=dt.getGrename();
			   String mimge=MemberDAO.getUserDatabyName(mid);
			   imagemap.put(mid, mimge);
		   }
		   req.setAttribute("replyList", replyList);
		   req.setAttribute("imagemap", imagemap);
		   double avg=CourseReplyDAO.replyPointAvg(gno);	// ���� ���
		   System.out.println("replyPoint worked");
		   String avrg = String.valueOf(avg);
			if(avrg.length()>4);
			avrg=avrg.substring(0, avrg.indexOf('.')+2);
		   req.setAttribute("grepointAvg", avrg);
		   
		req.setAttribute("jsp", "../lectures/play.jsp");
		return "common/main.jsp";
	}
	
	@RequestMapping("register.do")
	public String infoattendantData(HttpServletRequest req) throws Exception{
		HttpSession hs = req.getSession();								// ���Ǹ� ���� ������ ���� �Ǵ� ����
		String no1 = (String) hs.getAttribute("mno");
		String no2 = req.getParameter("gno");
		
		InfoattendantDTO InfoDto = new InfoattendantDTO();
		int gno = Integer.parseInt(no2);
		InfoDto.setGno(gno);
		System.out.println("gno " + gno);
		
		if(no1 != null){													// ���� �α��� �������� Ȯ��
			int mno = Integer.parseInt(no1);
			InfoDto.setMno(mno);
			System.out.println("no1 " + no1);
			System.out.println("mno " + mno);

			InfoattendantDTO confirmCourse = InfoattendantDAO.ConfirmCourseData(InfoDto);
			System.out.println("confirmCourse in register.do"+confirmCourse);
			
			if(confirmCourse == null){
				InfoattendantDAO.RegisterCourseData(InfoDto);
			}
		}
		System.out.println("gno "+InfoDto.getGno());
		req.setAttribute("gno", InfoDto.getGno());
		return "lectures/registerLecture_ok.jsp";
	}
	
	@RequestMapping("reply_insert.do")
	public String reply_insert(HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("EUC-KR");
		System.out.println("reply_isert in LectureController worked");
		
		String gno=req.getParameter("gno");
		System.out.println("reply_isert - gno : "+gno);
		String grecontent=req.getParameter("reply_data");
		System.out.println("reply_isert - grecontent : "+grecontent);
		String grepoint=req.getParameter("grepoint");
		System.out.println("reply_isert - grepoint : "+grepoint);
		
		HttpSession session=req.getSession();
		String grename=(String)session.getAttribute("id");
		System.out.println("reply_isert - grename : "+grename);
		String grepwd=(String)session.getAttribute("pwd");
		System.out.println("reply_isert - grepwd : "+grepwd);
		
		CourseReplyDTO dto=new CourseReplyDTO();
		dto.setGno(Integer.parseInt(gno));
		dto.setGrecontent(grecontent);
		dto.setGrepoint(Integer.parseInt(grepoint));
		dto.setGrepwd(grepwd);
		dto.setGrename(grename);
		
		System.out.println("������ �غ� �Ϸ�");
		CourseReplyDAO.replyInsert(dto);
		System.out.println("������ ���� �Ϸ� gno "+gno);
		
		req.setAttribute("gno", gno);
		
		return "lectures/reply_ok.jsp";
	}
}
