package org.team404.gameOjirap.game.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
import org.team404.gameOjirap.game.model.vo.GameSearchs;
import org.team404.gameOjirap.game.model.vo.Youtube;
import org.team404.gameOjirap.game.model.vo.Youtube;

@Controller("gameController")
public class GameController {
	private static final Logger logger = LoggerFactory.getLogger(GameController.class);

	@Autowired
	private GameService gameService;

	// 게임정보 상세 보기
	@RequestMapping("moveGameDetail.do")
	public ModelAndView moveGameInfoView(ModelAndView mv, @RequestParam("appid") String appid,
			@RequestParam(name = "page", required = false) String page) throws UnsupportedEncodingException {
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

	/*
	 * // 새로운 게임 페이지 단위로 목록보기 요청 처리용
	 * 
	 * @RequestMapping("gnlist.do") public ModelAndView
	 * boardListMethod(@RequestParam(name = "page", required = false) String page,
	 * ModelAndView mv) { int currentPage = 1; if (page != null) { currentPage =
	 * Integer.parseInt(page); }
	 * 
	 * // 한 페이지에 게시글 10개씩 출력 되게 하는 경우 : // 페이징 계산처리 - 별도의 클래스로 작성 해서 이용해도 됨 (공통모델로
	 * 만듦) int limit = 2; // 한페이지에 출력할 목록 갯수 // 전체 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴 int
	 * listCount = gameService.selectListNewCount(); // 페이지 수 계산 // 주의 : 목록이 11개이면
	 * 페이지 수는 2 페이지가 됨 // 나머지 목록 1개도 한 페이지가 필요함 int maxPage = (int) ((double)
	 * listCount / limit + 0.6); // limit 에 따라 0.9는 달라짐 // 현재 페이지가 포함된 페이지 그룹으 시작값과
	 * 끝값 계산 // => 뷰 페이지 아래쪽에 표시할 페이지 숫자를 10개 한다면 // 현재 페이지가 95라면 91과 100을 계산해 냄 int
	 * startPage = ((currentPage - 1) / 1) * 1 + 1; int endPage = startPage + 1 - 1;
	 * 
	 * if (maxPage < endPage) { endPage = maxPage; } // 쿼리문에 전달할 현재 페이지에 출력할 목록의
	 * 시작행과 끝행을 계산 int startRow = (currentPage - 1) * limit + 1; int endRow =
	 * startRow + limit - 1; Pagingnn paging = new Pagingnn(startRow, endRow,
	 * limit);
	 * 
	 * // 페이지 계산 끝 : new Paging(limit, currentPage) --------------------------
	 * 
	 * ArrayList<Game> list = gameService.selectNewList(paging); if (list != null &&
	 * list.size() > 0) { mv.addObject("list", list); mv.addObject("listCount",
	 * listCount); mv.addObject("maxPage", maxPage); mv.addObject("currentPage",
	 * currentPage); mv.addObject("startPage", startPage); mv.addObject("endPage",
	 * endPage); mv.addObject("limit", limit);
	 * 
	 * mv.setViewName("common/main"); } else { mv.addObject("message", currentPage +
	 * "페이지 목록 조회 실패!"); mv.setViewName("common/error"); } return mv;
	 * 
	 * }
	 */

	// 게임 도전과제 보기 사이트
	@RequestMapping("goChallenge.do")
	public String moveGameAchievement(Model model, @RequestParam("appid") String appid)
			throws JsonParseException, JsonMappingException, IOException {
		String ach = gameService.selectAchievement(appid);
		if (ach != null) {
			ach = ach.substring(1, ach.lastIndexOf("]") - 1);
			String[] list = ach.split("},");
			JSONObject job = null;
			JSONObject send = new JSONObject();
			String path = "";
			String name = "";
			JSONArray jarray = new JSONArray();
			for (String s : list) {
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

	// 기능용 메소드 -----------------------------------

	// 게임 정보 삭제
	@RequestMapping(value = "gdeleteData.do", method = RequestMethod.POST)
	public String deleteGameInfo(Model model, @RequestParam("appid") String appid) {

		if (gameService.deleteGameInfo(appid) > 0) {

			return "common/main";
		} else {
			model.addAttribute("message", appid + "번 게임 정보 삭제 실패!");
			return "common/error";
		}

	}

	// 게임 top6
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
			job.put("headerimg", URLEncoder.encode(game.getHeaderimg(), "UTF-8"));

			// 한글에 대해서는 인코딩해서 json에 담도록 함 : 한글깨짐 방지
			job.put("short_description", URLEncoder.encode(game.getShort_description(), "UTF-8"));
			// 날짜는 반드시 toString() 으로 문자열로 바꿔서 json에 담아야 함

			job.put("releasedate", game.getReleasedate().toString());
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

	// 게임 new6
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
			job.put("headerimg", URLEncoder.encode(game.getHeaderimg(), "UTF-8"));

			// 한글에 대해서는 인코딩해서 json에 담도록 함 : 한글깨짐 방지
			job.put("short_description", URLEncoder.encode(game.getShort_description(), "UTF-8"));
			// 날짜는 반드시 toString() 으로 문자열로 바꿔서 json에 담아야 함

			job.put("releasedate", game.getReleasedate().toString());

			jarr.add(job); // job 를 jarr 에 추가함
		}

		// 전송용 객체에 jarr을 담음
		sendJson.put("list", jarr);

		// json을 json string 타입으로 바꿔서 전송되게 함
		return sendJson.toJSONString(); // 뷰리졸버로 리턴함
		// servlet-context.xml 에 json string 내보내는 JsonView 라는 뷰리졸버 추가 등록해야 함

	}

	// 게임 할인10개출력
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
			job.put("initialprice", game.getInitialprice());
			job.put("finalprice", game.getFinalprice());
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


	// 게임 장르 할인 검색 처리용
	@RequestMapping(value = "ggsearch.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public ArrayList<Game> gamegpSearchMethod(HttpServletRequest request, @RequestParam("keyword") String keyword,
			Model model) throws Exception {

		GameSearchs searchs = new GameSearchs();
		searchs.setKeyword(keyword);

		return gameService.selectgamegSearch(searchs);

	}

	// 게임 초기 가격으로 검색
//	@RequestMapping(value = "gpsearch.do", method = { RequestMethod.POST, RequestMethod.GET })
//	@ResponseBody
//	public void gamepSearchMethod(@RequestParam("keyword") String Keyword) throws Exception {
//		ArrayList<Game> list = gameService.selectgamepSearch(Keyword);
//		logger.info("gpsearch.do : " + list.size());
//
//		// 전송용 json 객체 준비
//		JSONObject sendJson = new JSONObject();
//		// 리스트 저장할 json 배열 객체 준비
//		JSONArray jarr = new JSONArray();
//
//		// list 를 jarr 에 옮기기 (복사)
//		for (Game game : list) {
//			JSONObject job = new JSONObject();
//			job.put("appid", game.getAppid());
//			job.put("name", game.getName());
//			job.put("initialprice", game.getInitialprice());
//			job.put("finalprice", game.getFinalprice());
//			job.put("discountrate", game.getDiscountrate());
//
//			jarr.add(job);
//		}
//
//		sendJson.put("list", jarr);
//
//	}
	@RequestMapping(value = "gpsearch.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public ArrayList<Game> gamepSearchMethod(HttpServletRequest request, @RequestParam("keyword") String keyword,
			@RequestParam("type") String type, Model model) throws Exception {

		GameSearchs searchs = new GameSearchs();
		searchs.setType(type);
		searchs.setKeyword(keyword);

		return gameService.selectgamepSearch(searchs);

	}

	
	//게임 전체 검색용 페이지
		@RequestMapping(value = "gameAllsearch.do", method = { RequestMethod.POST, RequestMethod.GET })
		@ResponseBody
		public ArrayList<Game> gameAllsearchMethod(HttpServletRequest request, @RequestParam("keyword") String keyword,
				@RequestParam("type") String type, Model model) throws Exception {

			GameSearchs searchs = new GameSearchs();
			searchs.setType(type);
			searchs.setKeyword(keyword);

			return gameService.selectgameAllSearch(searchs);

		}
		
	//유튜브 영상 넣기
		@RequestMapping(value ="youTube.do",method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView moveYouTubeView(HttpServletRequest request, @RequestParam("appid") String appid, ModelAndView mv) throws Exception {
		//public String moveYouTubeView() throws Exception {
	
			Game game = gameService.selectYoutube(appid);
			if(game != null) {
				mv.addObject("game", game);
				
				mv.setViewName("youTube/youTubepage");
			}else {
				mv.addObject("message", appid + "번 게임 유튜 조회 실패");
				mv.setViewName("common/error");
			}
			
			return mv;
			//Youtube youtubeurl = new Youtube();
			//return "youTube/youTubepage";
			
			/*
			 * if (game != null) {
			mv.addObject("game", game);
			mv.addObject("currentPage", currentPage);

			mv.setViewName("game/gameDetailView");
		} else {
			mv.addObject("message", appid + "번 게임 정보 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
			 * */
		}


}
