package com.puco.board;

import javax.servlet.http.HttpServletRequest;

import com.puco.controller.Controller;
import com.puco.controller.RequestMapping;
import com.puco.board.dao.*;
import java.util.*;
@Controller("bc")
public class BoardController {

	@RequestMapping("boardmain.do")
	public String boardListData(HttpServletRequest req){
		req.setAttribute("msg", "�Խ���");
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> dto = dao.boardListData(0);
		req.setAttribute("list", dto);
		return "board/BoardMain.jsp";//jsp�����̸�
	}
	@RequestMapping("content.do")
	public String boardContentData(HttpServletRequest req){
		String no=req.getParameter("no");
		int ino = Integer.parseInt(no);
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.boardContentData(ino);
		req.setAttribute("d", dto);
		
		return "board/content.jsp";//jsp�����̸�
	}
	
}
