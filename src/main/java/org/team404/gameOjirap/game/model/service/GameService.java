package org.team404.gameOjirap.game.model.service;

import java.util.ArrayList;

import org.team404.gameOjirap.game.model.vo.Game;

public interface GameService {
    int insertGameInfo(Game game);

	int deleteGameInfo(String appid);
	int selectGameCount(String appid);

	
	Game selectGame(String appid);				//게임 리스트 갖고 오기
	
	ArrayList<Game> selectGameTop6();			//접속자 많은 게임 

	ArrayList<Game> selectGameNew6();			//신작 게임

	ArrayList<Game> selectGameDiscTop();		//할인율 높은 순위
	


	public String selectAchievement(String appid);



}
