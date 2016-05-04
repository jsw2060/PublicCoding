package com.puco.lectures;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.puco.category.dao.*;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.lectures.dao.*;

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
		contenturl=secondrul+"?"+contenturl;							// ���������� �ʿ��� URL�� �� xTfCkSlwF1Q?list=PL7mmuO705dG0HUei41yV3ZOTT5MVURjGs
	
		req.setAttribute("contenturl", contenturl);
		req.setAttribute("contenturl", contenturl);
		req.setAttribute("clist", clist);
		req.setAttribute("gno", gno);
		req.setAttribute("jsp", "../lectures/play.jsp");
		return "common/main.jsp";
	}
}
