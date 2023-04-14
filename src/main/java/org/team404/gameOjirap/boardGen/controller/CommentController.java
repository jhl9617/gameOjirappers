package org.team404.gameOjirap.boardGen.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.team404.gameOjirap.boardGen.model.service.BoardGenService;
import org.team404.gameOjirap.boardGen.model.service.CommentService;
import org.team404.gameOjirap.common.board.Comment;

@Controller
public class CommentController {
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private BoardGenService boardService;
	
	/*
	 * 댓글 작성 처리용
	 */
	@RequestMapping(value="commentwriteform.do", method ={ RequestMethod.GET, RequestMethod.POST })
	public ModelAndView commentWriteMethod(Comment comment, Model model, 
			@RequestParam(name="incoment") String com,
			ModelAndView mv) {
		if(commentService.insertComment(comment) > 0) {
			
//			mv.addObject("user_id", user_id);
//			mv.addObject("board_no", com_no);
			
			mv.addObject("com", com);
			mv.setViewName("boardGen/boardDetailView");
		
		}else {
			model.addAttribute("message", "댓글 등록 실패!");
			mv.setViewName("common/error");
		}
		return mv;
	}
}
