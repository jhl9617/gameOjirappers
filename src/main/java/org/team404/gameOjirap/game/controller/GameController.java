package org.team404.gameOjirap.game.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.team404.gameOjirap.HomeController;
import org.team404.gameOjirap.game.model.service.GameService;
import org.team404.gameOjirap.game.model.vo.Game;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.*;
import org.json.simple.parser.JSONParser;

@Controller("gameController")
public class GameController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private GameService gameService;

	@RequestMapping(value = "insertgamefirst.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void getTopGames() throws ParseException, org.json.simple.parser.ParseException {
		String url = "https://steamspy.com/api.php?request=all&page=1";
		RestTemplate restTemplate = new RestTemplate();
		JSONObject spjob = restTemplate.getForObject(url, JSONObject.class);
		JSONObject job = null;
		JSONArray jar = new JSONArray();
		RestTemplate rest2 = null;
		JSONParser parser = new JSONParser();
		JSONObject gamedata = null;
		JSONObject spydata = null;
		int num = 0;
		Set<String> keys = spjob.keySet();
		for (String key : keys) {
			String steamURL = "https://store.steampowered.com/api/appdetails?appids=" + key
					+ "&l=korean&cc=kr&key=8EE98215F05201AEA92117741BBE3BAF";
			String spyURL = "https://steamspy.com/api.php?request=appdetails&appid=" + key;
			Game g = new Game();
			rest2 = new RestTemplate();
			job = rest2.getForObject(steamURL, JSONObject.class);					
			if (job == null) {
				continue;
			} else {
				gamedata = new JSONObject();
				gamedata.putAll((Map)parser.parse(job.toJSONString()));
				spydata = restTemplate.getForObject(spyURL, JSONObject.class);
				Map<String, Object> datamap = null;
				
				String mapdata1 = "";
				try {
					datamap = new ObjectMapper().readValue(gamedata.get(key).toString(), Map.class);	
				}catch(Exception e){
					e.printStackTrace();
				}
				// 앱 아이디
				String appid = "";
                try {
                     appid = ((HashMap) datamap.get("data")).get("steam_appid").toString();
                } catch (Exception e){
                    continue;
                }
				// 게임이름
				String name = ((HashMap) datamap.get("data")).get("name").toString();
				// 개발사
				String developer = "";
				try {
					developer = ((HashMap) datamap.get("data")).get("developers").toString().split("\"")[1];
				} catch (Exception e) {
					developer = null;
				}
				// 배급사
				String publisher = "";
				try {
					publisher = ((HashMap) datamap.get("data")).get("publishers").toString().split("\"")[1];
				} catch (Exception e) {
					publisher = null;
				}
				// 초기가
				String initialPrice = "";
				try {
					initialPrice = ((HashMap)((HashMap) datamap.get("data")).get("price_overview"))
									.get("initial_formatted").toString();
				} catch (Exception e) {
					initialPrice = null;
				}
				// 최종가
				String finalPrice = "";
				try {
					finalPrice = ((HashMap) ((HashMap) datamap.get("data")).get("price_overview"))
							.get("final_formatted").toString();
				} catch (Exception e) {
					finalPrice = null;
				}
				// 할인율(퍼센트)
				int discountrate = 0;
				try {
					HashMap data = (HashMap) datamap.get("data");
					HashMap priceOverviewMap = (HashMap)data.get("price_overview");
					discountrate = ((Long)priceOverviewMap.get("discount_percent")).intValue();
				} catch (Exception e) {
					discountrate = 0;
				}
				// 게임 설명(http)
				String description = "";
				try {
					description = ((HashMap) datamap.get("data")).get("about_the_game").toString();
				} catch (Exception e) {
					description = null;
				}
				// 플랫폼
				String platform = "";
				try {
					platform = ((HashMap) datamap.get("data")).get("platforms").toString();
				} catch (Exception e) {
					platform = null;
				}
				// 메타크리틱점수
				int meta = 0;
				try {
					HashMap data = (HashMap) datamap.get("data");
					HashMap metaMap = (HashMap) data.get("metacritic");
					meta = ((Long) metaMap.get("score")).intValue();

				} catch (Exception e) {
					meta = 0;
				}
				
				// 카테고리
				ArrayList<String> categories = new ArrayList<String>();				
				String category = "";
				try {
				categories = (ArrayList<String>)((HashMap)((HashMap)datamap.get("data"))
							.get("categories")).get("description");
				category = categories.get(0).toString();
				} catch (Exception e) {
					category = null;
				}

				// 장르
				ArrayList<String> genres = new ArrayList<String>();
				String genre = "";
				try {
					genres = (ArrayList<String>)((HashMap)((HashMap)datamap.get("data"))
							.get("genres")).get("description");
					genre = genres.get(0).toString();
				} catch (Exception e) {
					genre = null;
				}

				// 스크린샷 url
				ArrayList<String> screenshots = new ArrayList<String>();
				String screenshot = "";
				try {
					screenshots = (ArrayList<String>)((HashMap)((HashMap)datamap.get("data"))
									.get("screenshots")).get("path_full");
					screenshot = screenshots.get(0).toString();
				} catch (Exception e) {
					screenshot = null;
				}

				// 동영상 url
				ArrayList<String> movies = new ArrayList<String>();
				String movie = "";
				try {
					movies = (ArrayList<String>)((HashMap) ((HashMap)((HashMap)datamap.get("data"))
							.get("movies")).get("mp4")).get("max");
				} catch (Exception e) {
					movie = null;
				}

				// 출시일
				String releasedate = "";
				try {
					releasedate = ((HashMap)((HashMap)datamap.get("data")).get("release_date")).get("date").toString();
				} catch (Exception e) {
					releasedate = null;
				}

				// 도전과제
				String achievement = "";
				try {
					achievement = ((HashMap)((HashMap)datamap.get("data")).get("achievements")).get("highlighted").toString();
					
				} catch (Exception e) {
					achievement = null;
				}

				// 좋아요
				int positive = 0;
				try {
					positive = ((Long)spydata.get("positive")).intValue();
				} catch (Exception e) {
					positive = 0;
				}

				// 전날최대동접자
				int ccu = 0;
				try {
					ccu = ((Long) spydata.get("ccu")).intValue();
				} catch (Exception e) {
					ccu = 0;
				}

				g.setAppid(appid);
				g.setName(name);
				g.setDeveloper(developer);
				g.setPublisher(publisher);
				g.setInitialprice(initialPrice);
				g.setFinalprice(finalPrice);
				g.setDiscountrate(discountrate);
				g.setPlatform(platform);
				g.setMeta(meta);
				g.setCategory(category);
				g.setGenre(genre);
				g.setScreenshots(screenshot);
				g.setMovies(movie);
				g.setreleasedate(releasedate);
				g.setDescription(description);
				g.setAchievement(achievement);
				g.setPositive(positive);
				g.setCcu(ccu);
				if (gameService.insertGameInfo(g) > 0) {
					System.out.println(num + 1);
					num++;
				}
				
				
				
			}
	
		}
	}
}
