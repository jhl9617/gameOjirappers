package org.team404.gameOjirap.game.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team404.gameOjirap.game.model.service.GameService;
import org.team404.gameOjirap.game.model.vo.Game;

@Controller
public class GameInfoController {
	private static final Logger logger = LoggerFactory.getLogger(GameInfoController.class);

	@Autowired
	private GameService gameService;

	@RequestMapping(value = "insertAllGameInfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView insertAllGameInfo(ModelAndView mv) throws ParseException, InterruptedException {
		// 스팀스파이 api 에 요청하는 url
		String url = "https://steamspy.com/api.php?request=all&page=1";
		RestTemplate restTemplate = new RestTemplate();
		JSONObject spjob = restTemplate.getForObject(url, JSONObject.class);
		int num = 0;
		int requstTime = 3000; // 요청횟수제한 피하기 위한 설정 시간
		Set<String> keys = spjob.keySet();
		for (String key : keys) {
			// 이미 db에 게임정보가 있다면 넘어가기
			if (gameService.selectGameCount(key) > 0) {
				continue;
			}
			Game g = RequestInfo.requestGameInfo(key);
			if (g != null) {
				if (gameService.insertGameInfo(g) > 0) {
					System.out.println("count : " + num);
					num++;
					Thread.sleep(requstTime);
				}
			}
		} // 반복문 종료
		mv.setViewName("common/main");
		return mv;
	} // updateGameInfo 메소드

// ------------------------------------------------------------------------------------------

	@RequestMapping(value = "insertGameInfo.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public ModelAndView insertGame(String appid, ModelAndView mv) throws ParseException {
		if (gameService.selectGameCount(appid) > 0) {
			mv.addObject("message", "이미 존재하는 게임정보 입니다.");
			mv.setViewName("common/error");
			return mv;
		}
		Game g = RequestInfo.requestGameInfo(appid);
		if (g != null) {
			if (gameService.insertGameInfo(g) > 0) {
				mv.addObject("message", appid + "번 게임 \'" + g.getName() + "\'의 게임정보가 입력되었습니다.");
				mv.setViewName("common/main");
				return mv;
			}
		}			
		mv.addObject("message", appid + "번 게임의 정보를 입력하는데 실패하였습니다.");
		mv.setViewName("common/error");
		return mv;

	} //insertGame

// ------------------------------------------------------------------------------------------	
	
	@RequestMapping(value = "updateGameInfo.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public ModelAndView updateGame(String appid, ModelAndView mv) throws ParseException {
		if (gameService.selectGameCount(appid) == 0) {
			mv.addObject("message", "존재하지 않는 게임정보입니다.");
			mv.setViewName("common/error");
			return mv;
		}
		if(gameService.deleteGameInfo(appid) == 0) {
			mv.addObject("message", "게임정보 삭제 실패");
			mv.setViewName("common/error");
			return mv;
		}
		Game g = RequestInfo.requestGameInfo(appid);
		if (g != null) {
			if (gameService.insertGameInfo(g) > 0) {
				mv.addObject("message", appid + "번 게임 \'" + g.getName() + "\'의 게임정보가 업데이트되었습니다.");
				mv.setViewName("common/main");
				return mv;
			}
		}			
		mv.addObject("message", appid + "번 게임의 정보를 업데이트 하는데 실패하였습니다.");
		mv.setViewName("common/error");
		return mv;

	}
	
} // GameInfoController
