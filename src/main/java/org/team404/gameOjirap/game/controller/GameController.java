package org.team404.gameOjirap.game.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.team404.gameOjirap.game.model.service.GameService;

@Controller("gameController")
public class GameController {
	private static final Logger logger = LoggerFactory.getLogger(GameController.class);

	@Autowired
	private GameService gameService;

	// 이동 처리용 메소드    ---------------------------------------
	
	// 게임 상세정보 보기 사이트
	@RequestMapping("moveGameDetail.do")
	public String moveGameInfoView(
			//Model model, @RequestParam("appid") String appid
			) {
		//model.addAttribute("appid", appid);
		return "game/gameDetailView";
	}
	
	// 게임 도전과제 보기 사이트
	@RequestMapping("goChallenge.do")
	public String moveGameAchievement(
			//Model model, @RequestParam("appid") String appid
			) {
		//model.addAttribute("appid", appid);
		return "game/achievementView";
	}
	
	// 기능용 메소드 	-----------------------------------
	
	// 게임 정보 삭제
	@RequestMapping("gdeleteData.do")
	public String deleteGameInfo(Model model, @RequestParam("appid") String appid) {
		
		if(gameService.deleteGameInfo(appid) > 0) {
			
			return "common/main";
		} else {
			model.addAttribute("message", appid + "번 게임 정보 삭제 실패!");
			return "common/error";
		}
		
	}
	
}
