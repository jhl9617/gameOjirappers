package org.team404.gameOjirap.game.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;

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

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

@Controller("gameController")
public class GameController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private GameService gameService;
	
	@RequestMapping(value = "insertgame.do", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public void getTopGames() throws ParseException {
        String url = "https://steamspy.com/api.php?request=all&page=1";
        RestTemplate restTemplate = new RestTemplate();
        JsonNode responses = restTemplate.getForObject(url, JsonNode.class);
        ObjectMapper mapper = new ObjectMapper();
        HashMap<String, Object> map = mapper.convertValue(responses, HashMap.class);
        JSONObject job = null;
        //JSONObject spy = restTemplate.getForObject(url,);
        JSONArray jar = new JSONArray();
        RestTemplate rest2 = null;
        int num = 0;
        for (String key : map.keySet()) {
            String steamURL = "https://store.steampowered.com/api/appdetails?appids=" + key + "&l=korean&cc=kr&key=8EE98215F05201AEA92117741BBE3BAF";
            String spyURL = "https://steamspy.com/api.php?request=appdetails&appid="+ key;
            Game g = new Game();
            rest2 = new RestTemplate();
            job = rest2.getForObject(steamURL, JSONObject.class);

            if (job == null) {
                continue;
            } else {
                JSONObject gamedata = job.getJSONObject(key);
                JSONObject spydata = restTemplate.getForObject(spyURL, JSONObject.class);
                // 앱 아이디
                String appid = gamedata.getJSONObject("data").getString("steam_appid");
                // 게임이름
                String name = gamedata.getJSONObject("data").getString("name");
                // 개발사
                String developer = "";
                try{
                    developer = gamedata.getJSONObject("data").getString("developers").split("\"")[1];
                }catch (JSONException e){
                    developer = null;
                }
                // 배급사
                String publisher = "";
                try {
                    publisher = gamedata.getJSONObject("data").getString("publishers").split("\"")[1];
                }catch (JSONException e){
                    publisher = null;
                }
                // 초기가
                String initialPrice = "";
                try {
                    initialPrice = gamedata.getJSONObject("data").getJSONObject("price_overview").getString("initial_formatted");
                } catch (JSONException e) {
                    initialPrice = null;
                }
                // 최종가
                String finalPrice = "";
                try {
                    finalPrice = gamedata.getJSONObject("data").getJSONObject("price_overview").getString("final_formatted");
                } catch (JSONException e) {
                    finalPrice = null;
                }
                // 할인율(퍼센트)
                int discountrate = 0;
                try {
                    discountrate = gamedata.getJSONObject("data").getJSONObject("price_overview").getInt("discount_percent");
                } catch (JSONException e) {
                    discountrate = 0;
                }
                // 게임 설명(http)
                String description = "";
                try {
                    description = gamedata.getJSONObject("data").getString("about_the_game");
                } catch (JSONException e) {
                    description = null;
                }
                //플랫폼
                String platform = "";
                try {
                    platform = gamedata.getJSONObject("data").getString("platforms");
                } catch (JSONException e) {
                    platform = null;
                }
                // 메타크리틱점수
                int meta = 0;
                try {
                    meta = gamedata.getJSONObject("data").getJSONObject("metacritic").getInt("score");
                } catch (JSONException e) {
                    meta = 0;
                }
                // 카테고리
                JSONArray cate = null;
                String category = "";
                String cdes = "";
                try {
                    cate = gamedata.getJSONObject("data").getJSONArray("categories");
                    for (int i = 0; i < cate.length(); i++) {
                        cdes = cate.getJSONObject(i).getString("description");
                        category += cdes + ", ";
                    }
                    category = category.substring(0, category.length() - 2);
                } catch (JSONException e) {
                    category = null;
                }

                // 장르
                JSONArray genarr = null;
                String genre = "";
                String gend = "";
                try {
                    genarr = gamedata.getJSONObject("data").getJSONArray("genres");
                    for (int i = 0; i < genarr.length(); i++) {
                        gend = genarr.getJSONObject(i).getString("description");
                        genre += gend + ", ";
                    }
                    genre = genre.substring(0, genre.length() - 2);
                } catch (JSONException e) {
                    genre = null;
                }

                // 스크린샷 url
                ArrayList<String> screenshots = new ArrayList<String>();
                String screenshot = "";
                JSONArray imgs = null;
                try {
                    imgs = gamedata.getJSONObject("data").getJSONArray("screenshots");
                    for (int i = 0; i < imgs.length(); i++) {
                        screenshots.add(imgs.getJSONObject(i).getString("path_full"));
                    }
                    screenshot = screenshots.toString();
                } catch (JSONException e){
                    screenshot = null;
                }

                // 동영상 url
                ArrayList<String> movies = new ArrayList<String>();
                String movie = "";
                JSONArray moviesArray = null;
                try {
                    moviesArray = gamedata.getJSONObject("data").getJSONArray("movies");
                    for (int i = 0; i < moviesArray.length(); i++) {
                        movies.add(moviesArray.getJSONObject(i).getJSONObject("webm").getString("480"));
                    }
                    movie = movies.toString();
                } catch (JSONException e){
                    movie = null;
                }

                // 출시일
                String releasedate = "";
                try{
                   releasedate = gamedata.getJSONObject("data").getJSONObject("release_date").getString("date");
                }catch (JSONException e){
                    releasedate = null;
                }

                // 도전과제
                String achievement = "";
                try{
                    achievement = gamedata.getJSONObject("data").getJSONObject("achievements").getString("highlighted");
                } catch (JSONException e){
                    achievement = null;
                }
                // 좋아요
                int positive = 0;
                try{
                    positive = spydata.getInt("positive");
                }catch (JSONException e){
                    positive = 0;
                }

                // 전날최대동접자
                int ccu = 0;
                try{
                    ccu = spydata.getInt("ccu");
                }catch (JSONException e){
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
                if(gameService.insertGameInfo(g) > 0){
                    System.out.println(num+1);
                    num++;
                }

//                System.out.println("appid : " + appid + " , name : " + name + " , developer : " + developer + " , publisher : " + publisher + ", initialPrice : " + initialPrice + " , finalPrice : " + finalPrice +
//                        " , discountRate : " + discountRate + " , platform : " + platform + " , metacritic : " + meta + " , category : " + category + " , genre : " + genre + " , releaseDate : " + releaseDate
//                        + " , achievement : " + achievement);
//                System.out.println("map : " + map);
//                System.out.println("positive : " + positive);System.out.println("ccu : " + ccu);
            }

        }
    }
}
