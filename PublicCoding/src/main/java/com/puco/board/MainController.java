package com.puco.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.ocpsoft.prettytime.PrettyTime;
import com.puco.board.dao.BoardDAO;
import com.puco.board.dao.BoardDTO;
import com.puco.board.dao.QBoardDAO;
import com.puco.board.dao.QnaBoardVO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.lectures.dao.CourseGroupDAO;
import com.puco.lectures.dao.CourseGroupDTO;
import com.puco.member.dao.MemberDAO;
import com.puco.member.dao.MemberDTO;
import com.puco.category.dao.DcategoryDAO;
import com.puco.category.dao.DcategoryDTO;
import com.puco.category.dao.ScategoryDAO;
import com.puco.category.dao.ScategoryDTO;

@Controller("mc")
public class MainController {

	@RequestMapping("main.do")
		
		public String Main(HttpServletRequest req) {
		Map map=new HashMap();
		map.put("start", 1);
		map.put("end", 5);
		System.out.println("5��");
		List<QnaBoardVO> list = QBoardDAO.MainAllData(map);
		req.setAttribute("qlist", list);
		// Dcategory �޴�

		/*List<DcategoryDTO> dlist=DcategoryDAO.DcategoryAllData();
		req.setAttribute("dlist", dlist);*/
		// Dcategory �޴� ��
		req.setAttribute("jsp", "default.jsp");
		
		return "common/main.jsp";// jsp�����̸�
		
	}
	
	// ��з� ���ý�, �Һз� ��� ��ɺ�
	@RequestMapping("scategory.do")
	public String ScategoryAllData(HttpServletRequest req){
		String dno=req.getParameter("dno");
		String sno=req.getParameter("sno");
		if(dno==null)
			dno="1";
		int no = Integer.parseInt(dno);
		if(sno==null)
			sno="1";
		int no1 = Integer.parseInt(sno);
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
		
		//////////////////////////////////////////////////////
		List<CourseGroupDTO> dto;
		if(no1==1){
			dto = CourseGroupDAO.CourseGroupAllData(no1);
		}else{
			dto = CourseGroupDAO.CourseGroupAllData(no1);
		}
		req.setAttribute("glist", dto);
		req.setAttribute("jsp", "../lectures/lectureMain.jsp");
		return "common/main.jsp";
	}
	// ��з� ���ý�, �Һз� ��� ��ɺ� ��
	
	@RequestMapping("boardmain.do")
	public String boardListData(HttpServletRequest req){
		String page=req.getParameter("page");
		PrettyTime p = new PrettyTime(new Locale("KO"));
		Map reltmap = new HashMap();
		
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=10;
		int start=(curpage*rowSize) - (rowSize-1);
		int end = curpage*rowSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<QnaBoardVO> list = QBoardDAO.boardAllData(map);
		for(QnaBoardVO v:list){
			reltmap.put(v.getBno(), p.format(v.getBdate()));
		}
		int totalpage=QBoardDAO.BoardTotalPage();
		req.setAttribute("curpage",curpage);
		req.setAttribute("list", list);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("rtime", reltmap);
		req.setAttribute("jsp", "../board/BoardMain.jsp");
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
		
		
		
		
		req.setAttribute("jsp", "userMain.jsp");
		
		return "common/main.jsp";
	}
	
	
	

}
