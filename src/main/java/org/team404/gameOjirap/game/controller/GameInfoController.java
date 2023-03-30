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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.team404.gameOjirap.game.model.service.GameService;
import org.team404.gameOjirap.game.model.vo.Game;

@Controller("gameInfoControoler")
public class GameInfoController {
	private static final Logger logger = LoggerFactory.getLogger(GameInfoController.class);

	@Autowired
	private GameService gameService;

	@RequestMapping(value = "updateGameInfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void updateGameInfo() throws org.json.simple.parser.ParseException, InterruptedException {
		// 초기 게임가격 표시 모양 포맷용
		DecimalFormat df = new DecimalFormat("₩#,###");
		// 스팀스파이 api 에 요청하는 url
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
		int requstTime = 3000;	// 요청횟수제한 피하기 위한 설정 시간
		Set<String> keys = spjob.keySet();
		for (String key : keys) {
			// 이미 db에 게임정보가 있다면 넘어가기 
			if(gameService.selectGameCount(key) > 0) {
				continue;
			}
			// 스팀에 정보 요청하는 url
			String steamURL = "https://store.steampowered.com/api/appdetails?appids=" + key	
					+ "&l=korean&cc=kr&key=8EE98215F05201AEA92117741BBE3BAF";
			// 스팀 스파이에 상세정보 요청하는 url
			String spyURL = "https://steamspy.com/api.php?request=appdetails&appid=" + key;
			Game g = new Game();
			rest2 = new RestTemplate();
			job = rest2.getForObject(steamURL, JSONObject.class);	// 스팀api 에서 정보 받아옴
			Thread.sleep(requstTime);	// 위에서 설정한 시간 간격으로 요청
			
			// 받아온 객체가 없으면 넘어가기
			if (job == null) {
				continue;
			} else {
				// 받아온 정보 추출하기 쉽게 map 객체로 변환
				gamedata = new JSONObject();
				gamedata.putAll((Map) parser.parse(job.toJSONString()));
				spydata = restTemplate.getForObject(spyURL, JSONObject.class);
				Map<String, Object> datamap = null;
					
				String mapdata1 = "";
				try {
					datamap = new ObjectMapper().readValue(gamedata.get(key).toString(), Map.class);
				} catch (Exception e) {
					e.printStackTrace();
				}
				// 앱 아이디
				String appid = "";
				try {
					appid = ((HashMap) datamap.get("data")).get("steam_appid").toString();
				} catch (Exception e) {
					continue;
				}
				// 게임이름
				String name = ((HashMap) datamap.get("data")).get("name").toString();
				// 개발사
				String developer = "";
				try {
					String d = ((HashMap) datamap.get("data")).get("developers").toString();
					developer = d.substring(1, d.lastIndexOf("]"));
				} catch (Exception e) {
					developer = null;
				}
				// 배급사
				String publisher = "";
				try {
					String p = ((HashMap) datamap.get("data")).get("publishers").toString();
					publisher = p.substring(1, p.lastIndexOf("]"));
				} catch (Exception e) {
					publisher = null;
				}
				// 초기가
				String initialPrice = "";
				try {
					double dd = Double.parseDouble(((HashMap) ((HashMap) datamap.get("data")).get("price_overview"))
							.get("initial").toString());
					initialPrice = df.format(dd / 100);
				} catch (Exception e) {
					initialPrice = "0";
				}
				// 최종가
				String finalPrice = "";
				try {
					finalPrice = ((HashMap) ((HashMap) datamap.get("data")).get("price_overview"))
							.get("final_formatted").toString();
				} catch (Exception e) {
					finalPrice = "0";
				}
				// 할인율(퍼센트)
				int discountrate = 0;
				try {
					System.out.println(((HashMap)((HashMap) datamap.get("data")).get("price_overview"))
							.get("discount_percent").toString());
					discountrate = Integer.parseInt(((HashMap)((HashMap) datamap.get("data")).get("price_overview"))
							.get("discount_percent").toString());
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
					meta = Integer.parseInt(
							((HashMap) ((HashMap) datamap.get("data")).get("metacritic")).get("score").toString());
				} catch (Exception e) {
					meta = 0;
				}

				// 카테고리
				String category = "";
				try {
					String cate = ((HashMap)datamap.get("data")).get("categories").toString();
					String[] splitcate = cate.substring(1, cate.lastIndexOf("]")).split("},");
					 for(int ca = 0 ; ca < splitcate.length ; ca++){
						 category += splitcate[ca].substring(splitcate[ca].indexOf("=")+1, splitcate[ca].lastIndexOf(",")) + "/";
				        }
				} catch (Exception e) {
					category = null;
				}

				// 장르
				String genre = "";
				try {
					String cate = ((HashMap)datamap.get("data")).get("genres").toString();
					String[] splitgenre = cate.substring(1, cate.lastIndexOf("]")).split("},");
					 for(int ga = 0 ; ga < splitgenre.length ; ga++){
						 genre += splitgenre[ga].substring(splitgenre[ga].indexOf("=")+1, splitgenre[ga].lastIndexOf(",")) + "/";
				        }
				} catch (Exception e) {
					genre = null;
				}

				// 대표이미지 url
				String headerImg = "";	
				try {
					headerImg = ((HashMap)datamap.get("data")).get("header_image").toString();
				} catch (Exception e) {
					headerImg = null;
				}

				// 동영상 url
				String movie = "";
				try {
					String moviet = ((HashMap)datamap.get("data")).get("movies").toString();
					String[] splitgenre = moviet.substring(1, moviet.lastIndexOf("]")).split("},");
					movie = "http"+splitgenre[0].substring(splitgenre[0].lastIndexOf(":"));
				} catch (Exception e) {
					movie = null;
				}

				// 출시일
				String releasedate = "";
				try {
					releasedate = ((HashMap) ((HashMap) datamap.get("data")).get("release_date")).get("date")
							.toString();
				} catch (Exception e) {
					releasedate = null;
				}

				// 도전과제
				String achievement = "";
				try {
					achievement = ((HashMap)((HashMap) datamap.get("data")).get("achievements")).get("highlighted")
							.toString();

				} catch (Exception e) {
					achievement = null;
				}

				// 좋아요
				int positive = 0;
				try {
					positive = Integer.parseInt(spydata.get("positive").toString());
				} catch (Exception e) {
					positive = 0;
				}

				// 전날최대동접자
				int ccu = 0;
				try {
					ccu = Integer.parseInt(spydata.get("ccu").toString());
				} catch (Exception e) {
					ccu = 0;
				}
				
				// 짧은 설명
				//System.out.println("short_description : "+((HashMap)datamap.get("data")).get("short_description").toString());
				String short_description = "";
				try {
					short_description = ((HashMap)datamap.get("data")).get("short_description").toString();
				} catch(Exception e){
					short_description = null;
				}
				// 지원 언어
				//System.out.println("supported_languages : "+((HashMap)datamap.get("data")).get("supported_languages").toString());
				String supported_languages = "";
				try {
					supported_languages = ((HashMap)datamap.get("data")).get("supported_languages").toString();
				} catch(Exception e){
					supported_languages = null;
				}
				// 사양 정보 
				//System.out.println("최소사양 : " + ((HashMap)((HashMap)datamap.get("data")).get("pc_requirements")).get("minimum").toString());
				//System.out.println("권장사양 : " + ((HashMap)((HashMap)datamap.get("data")).get("pc_requirements")).get("recommended").toString());
				
				// 최소사양
				String pcminimum = "";
				try {
					pcminimum = ((HashMap)((HashMap)datamap.get("data")).get("pc_requirements")).get("minimum").toString();
				} catch(Exception e){
					pcminimum = null;
				}
				
				// 권장사양
				String pcrecommended = "";
				try {
					pcrecommended = ((HashMap)((HashMap)datamap.get("data")).get("pc_requirements")).get("recommended").toString();
				} catch(Exception e){
					pcrecommended = null;
				}
				
				// 게임 객체에 값 담기
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
				g.setheaderImgs(headerImg);
				g.setMovies(movie);
				g.setreleasedate(releasedate);
				g.setDescription(description);
				g.setAchievement(achievement);
				g.setPositive(positive);
				g.setCcu(ccu);
				g.setShort_description(short_description);
				g.setSupported_languages(supported_languages);
				g.setPcminimum(pcminimum);
				g.setPcrecommended(pcrecommended);
				
				if (gameService.insertGameInfo(g) > 0) {
					System.out.println(num + 1);
					num++;
				}
			}
		}
	}
}
