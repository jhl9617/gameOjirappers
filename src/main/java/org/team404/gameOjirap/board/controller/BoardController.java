package org.team404.gameOjirap.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.team404.gameOjirap.board.model.service.BoardService;

@Controller
public class BoardController {
	private static final Logger logger = 
			LoggerFactory.getLogger(BoardController.class);
	
	private BoardService boardService;
	
	
}
