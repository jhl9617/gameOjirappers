package org.team404.gameOjirap.board.controller;

import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.team404.gameOjirap.board.model.service.BoardService;
import org.team404.gameOjirap.board.model.vo.BoardGen;

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
	 * 게시글 등록 요청 처리용(첨부파일 기능 사용)
	 */
//	@RequestMapping(value = "binsert.do", method = RequestMethod.POST)
//	public String boardInsertMethod(BoardGen board, Model model, HttpServlet request,
//								@RequestParam(name="upfile", required=false) MultipartFile mfile) {
//		
//		String savePath = request.getSession().getServletContext().getRealPath("resources/board_upfiles");
//	}
}
