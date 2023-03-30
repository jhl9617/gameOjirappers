package org.team404.gameOjirap.board.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.team404.gameOjirap.board.model.service.BoardService;
import org.team404.gameOjirap.board.model.vo.BoardGen;
import org.team404.gameOjirap.common.Paging;

@Controller
public class BoardController {
	private static final Logger logger = 
			LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	
	/*
	 * 게시 원글 쓰기 페이지로 이동 처리용
	 */
	@RequestMapping("writeform.do")
	public String moveBoardWriteForm() {
		return "boardGen/boardWriteForm";
	}
	
	/*
	 *게시글 페이지 단위로 목록보기 요청 처리용 
	 */
	@RequestMapping("blist.do")
	public ModelAndView boardListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		int limit = 10; 
		int listCount = boardService.selectListCount();
		Paging paging = new Paging(listCount, currentPage, limit);
		paging.calculator();

		ArrayList<BoardGen> list = boardService.selectList(paging);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);

			mv.setViewName("boardGen/boardListView");
		} else {
			mv.addObject("message", currentPage + " 페이지 목록 조회 실패!");
			mv.setViewName("common/error");
		}

		return mv;
	}
	
	
	
	/*
	 * 게시글 등록 요청 처리용(첨부파일 기능 사용)
	 */
//	@RequestMapping(value = "binsert.do", method = RequestMethod.POST)
//	public String boardInsertMethod(BoardGen board, Model model, HttpServlet request,
//								@RequestParam(name="upfile", required=false) MultipartFile mfile) {
//		
//		String savePath = request.getSession().getServletContext().getRealPath("resources/board_upfiles");
//	}
}
