package org.team404.gameOjirap.game.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.team404.gameOjirap.game.model.service.GameService;


@Controller("gameController")
public class GameController {
	private static final Logger logger = LoggerFactory.getLogger(GameController.class);

	@Autowired
	private GameService gameService;


	// 이동 처리용 메소드
	@RequestMapping("moveGameDetail.do")
	public String moveGameInfoView() {
		return "game/gameDetailView";


	}
}
