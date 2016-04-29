package com.puco.lectures;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.puco.category.dao.DcategoryDAO;
import com.puco.category.dao.DcategoryDTO;
import com.puco.category.dao.ScategoryDAO;
import com.puco.category.dao.ScategoryDTO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.lectures.dao.*;

@Controller("vc")
public class LectureController {
	/*@RequestMapping("videolist.do")
	public String videoListData(HttpServletRequest req){
		//req.setAttribute("msg", "�Խ���");
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
			sno="1";
		
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
		System.out.println("LectureController CourseGroupDTO Work");
		req.setAttribute("glist", glist);
		System.out.println("LectureController CourseGroup req.set Work");
		System.out.println("LectureController glist " + glist);
		req.setAttribute("jsp", "../lectures/lectureMain.jsp");
		return "common/main.jsp";
	}
	// ���Ǳ׷� ��� ������ ��
	
	@RequestMapping("play.do")
	public String videoPlayData(HttpServletRequest req) throws Exception{
		//req.setAttribute("msg", "�Խ���");
		req.setCharacterEncoding("EUC-KR");
		String lecture=req.getParameter("lecture").substring(9);
		String list=req.getParameter("list");
		String url=lecture+"?list="+list; //awTiYk5aCEo?list=PLENYGEQnz1xrMzGAfcCJFBzkBNzY2ufb1
		req.setAttribute("url", url);
		req.setAttribute("jsp", "play.jsp");
		return "lectures/videolist.jsp";
	}
}
