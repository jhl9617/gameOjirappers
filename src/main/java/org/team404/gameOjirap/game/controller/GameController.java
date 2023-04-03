package org.team404.gameOjirap.game.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.team404.gameOjirap.game.model.service.GameService;
import org.team404.gameOjirap.game.model.vo.Game;

@Controller("gameController")
public class GameController {
	private static final Logger logger = LoggerFactory.getLogger(GameController.class);

	@Autowired
	private GameService gameService;

	// 게임정보 상세 보기
	@RequestMapping("moveGameDetail.do")
	public ModelAndView moveGameInfoView(ModelAndView mv, @RequestParam("appid") String appid,
			@RequestParam(name = "page", required = false) String page) throws UnsupportedEncodingException{
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}


		// 해당 게시글 조회
		Game game = gameService.selectGame(appid);

//		System.out.println(game.toString());
		if (game != null) {
			mv.addObject("game", game);
			mv.addObject("currentPage", currentPage);

			mv.setViewName("game/gameDetailView");
		} else {
			mv.addObject("message", appid + "번 게임 정보 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;


	}
	
	// 게임 도전과제 보기 사이트
	@RequestMapping("goChallenge.do")
	public String moveGameAchievement(
		Model model, @RequestParam("appid") String appid
			) throws JsonParseException, JsonMappingException, IOException{
		String ach = gameService.selectAchievement(appid);
		if(ach != null) {
			ach = ach.substring(1, ach.lastIndexOf("]")-1);
			String[] list = ach.split("},");
			JSONObject job = null;
			JSONObject send = new JSONObject();
			String path = "";
			String name = "";
			JSONArray jarray = new JSONArray();
			for(String s : list) {
				String[] ss = s.substring(1).split(", ");
				path = ss[0].split("=")[1];
				name = ss[1].split("=")[1];
				job = new JSONObject();
				job.put("path", path);
				job.put("name", name);
				jarray.add(job);
			}		
			model.addAttribute("archs", jarray);
			
		return "game/achievementView";
		} else {
			model.addAttribute("message", "도전과제가 없는 게임입니다");
			return "common/error";
		}
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


	//게임 top6
	@RequestMapping(value = "gametop6.do", method = RequestMethod.POST)

	@ResponseBody
	public String gameTop6Method() throws UnsupportedEncodingException {
		// 인기 순인 게임 6개 조회해 옴
		ArrayList<Game> list = gameService.selectGameTop6();
		logger.info("gametop6.do : " + list.size()); // 5개 출력 확인

		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		// 리스트 저장할 json 배열 객체 준비
		JSONArray jarr = new JSONArray();

		// list 를 jarr 에 옮기기 (복사)
		for (Game game : list) {
			// notice 의 각 필드값 저장할 json 객체 생성
			JSONObject job = new JSONObject();
			job.put("appid", game.getAppid());
			job.put("name", game.getName());
			job.put("headerimg",URLEncoder.encode(game.getHeaderimg(), "UTF-8"));
			
			// 한글에 대해서는 인코딩해서 json에 담도록 함 : 한글깨짐 방지
			job.put("short_description", URLEncoder.encode(game.getShort_description(), "UTF-8"));			
			// 날짜는 반드시 toString() 으로 문자열로 바꿔서 json에 담아야 함


			job.put("releasedate", game.getreleasedate().toString());
			job.put("ccu", game.getCcu());
			job.put("meta", game.getMeta());
			

			jarr.add(job); // job 를 jarr 에 추가함
		}

		// 전송용 객체에 jarr을 담음
		sendJson.put("list", jarr);

		// json을 json string 타입으로 바꿔서 전송되게 함
		return sendJson.toJSONString(); // 뷰리졸버로 리턴함
		// servlet-context.xml 에 json string 내보내는 JsonView 라는 뷰리졸버 추가 등록해야 함

	}
	//게임 new6
	@RequestMapping(value = "gamenew6.do", method = RequestMethod.POST)
	@ResponseBody
	public String gameNew6Method() throws UnsupportedEncodingException {
		// 인기 순인 게임 6개 조회해 옴
		ArrayList<Game> list = gameService.selectGameNew6();
		logger.info("gamenew6.do : " + list.size()); // 5개 출력 확인
		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		// 리스트 저장할 json 배열 객체 준비
		JSONArray jarr = new JSONArray();

		// list 를 jarr 에 옮기기 (복사)
		for (Game game : list) {
			// notice 의 각 필드값 저장할 json 객체 생성
			JSONObject job = new JSONObject();
			job.put("appid", game.getAppid());
			job.put("name", game.getName());
			job.put("headerimg",URLEncoder.encode(game.getHeaderimg(), "UTF-8"));
			
			// 한글에 대해서는 인코딩해서 json에 담도록 함 : 한글깨짐 방지
			job.put("short_description", URLEncoder.encode(game.getShort_description(), "UTF-8"));			
			// 날짜는 반드시 toString() 으로 문자열로 바꿔서 json에 담아야 함

			job.put("releasedate", game.getreleasedate().toString());


			jarr.add(job); // job 를 jarr 에 추가함
		}

		// 전송용 객체에 jarr을 담음
		sendJson.put("list", jarr);

		// json을 json string 타입으로 바꿔서 전송되게 함
		return sendJson.toJSONString(); // 뷰리졸버로 리턴함
		// servlet-context.xml 에 json string 내보내는 JsonView 라는 뷰리졸버 추가 등록해야 함

	}
	
	//게임 할인10개출력
		@RequestMapping(value = "gameDiscTop.do", method = RequestMethod.POST)
		@ResponseBody
		public String gameDiscTopMethod() throws UnsupportedEncodingException {
			// 게임 할인10개출력
			ArrayList<Game> list = gameService.selectGameDiscTop();
			logger.info("gameDiscTop.do : " + list.size());

			// 전송용 json 객체 준비
			JSONObject sendJson = new JSONObject();
			// 리스트 저장할 json 배열 객체 준비
			JSONArray jarr = new JSONArray();

			// list 를 jarr 에 옮기기 (복사)
			for (Game game : list) {
				
//				select * 
//				from ( select rownum rnum, name, initialprice, finalprice ,ccu ,discountrate
//						from ( select * from game where discountrate is not null order by discountrate desc  ))
//				where rnum >= 1 and rnum <=10

				// notice 의 각 필드값 저장할 json 객체 생성
				JSONObject job = new JSONObject();
				job.put("appid", game.getAppid());
				job.put("name", game.getName());
				job.put("initialprice", URLEncoder.encode(game.getInitialprice(), "UTF-8"));
				job.put("finalprice", URLEncoder.encode(game.getFinalprice(), "UTF-8"));
				job.put("ccu", game.getCcu());
				job.put("discountrate", game.getDiscountrate());
				
//				job.put("headerimg",URLEncoder.encode(game.getHeaderimgs(), "UTF-8"));
				
				// 한글에 대해서는 인코딩해서 json에 담도록 함 : 한글깨짐 방지
//				job.put("short_description", URLEncoder.encode(game.getShort_description(), "UTF-8"));			
				// 날짜는 반드시 toString() 으로 문자열로 바꿔서 json에 담아야 함

//				job.put("releasedate", game.getreleasedate().toString());

				jarr.add(job); // job 를 jarr 에 추가함
			}

			// 전송용 객체에 jarr을 담음
			sendJson.put("list", jarr);

			// json을 json string 타입으로 바꿔서 전송되게 함
			return sendJson.toJSONString(); // 뷰리졸버로 리턴함
			// servlet-context.xml 에 json string 내보내는 JsonView 라는 뷰리졸버 추가 등록해야 함

		}
		


	
}
