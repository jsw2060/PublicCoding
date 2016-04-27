package com.puco.board;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.ocpsoft.prettytime.PrettyTime;

import com.puco.board.dao.BoardDAO;
import com.puco.board.dao.BoardDTO;
import com.puco.board.dao.QBoardDAO;
import com.puco.board.dao.QnaBoardVO;
import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
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
		
		List<QnaBoardVO> list = QBoardDAO.MainAllData(map);
		req.setAttribute("qlist", list);
		
		// Dcategory �޴�
		List<DcategoryDTO> dlist=DcategoryDAO.DcategoryAllData();
		req.setAttribute("dlist", dlist);
		// Dcategory �޴� ��
		System.out.println("dlist "+dlist);
		
		return "common/main.jsp";// jsp�����̸�
	}
	
	// ��з� ���ý�, �Һз� ��� ��ɺ�
	@RequestMapping("scategory.do")
	public String ScategoryAllData(HttpServletRequest req){
		System.out.println("MainController Scategory Work");
		String dno=req.getParameter("dno");
		System.out.println("getParameter from main.do " + dno);
		int no = Integer.parseInt(dno);
		
		if(dno==null)
			dno="1";
		
		List<ScategoryDTO> slist=ScategoryDAO.ScategoryAllData(no);
		System.out.println("MainController ScategoryDTO Work");
		req.setAttribute("slist", slist);
		System.out.println("MainController scategory req.set Work");
		System.out.println("MainController slist " + slist);
		
		req.setAttribute("jsp", "lectureMain.jsp");
		return "common/container.jsp";
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
		return "common/container.jsp";
	}

}
