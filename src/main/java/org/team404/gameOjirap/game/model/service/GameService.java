package org.team404.gameOjirap.game.model.service;

import java.util.ArrayList;

import org.team404.gameOjirap.common.Pagingnn;
import org.team404.gameOjirap.game.model.vo.Game;
import org.team404.gameOjirap.game.model.vo.GameSearchs;

public interface GameService {

	
	
	int insertGameInfo(Game game);

	int deleteGameInfo(String appid);
	int selectGameCount(String appid);

	
	Game selectGame(String appid);				//게임 리스트 갖고 오기
	
	ArrayList<Game> selectGameTop6();			//접속자 많은 게임 

	ArrayList<Game> selectGameNew6();			//신작 게임

	ArrayList<Game> selectGameDiscTop();		//할인율 높은 순위
	


	public String selectAchievement(String appid);

	//새게임 리스트 에서 페이지 처리
	int selectListNewCount();
	ArrayList<Game> selectNewList(Pagingnn paging);

	/*
	 * //게임 할인율로 보이기 ArrayList<Game> selectSearchPrice(int finalprice);
	 * ArrayList<Game> selectSearchGenre(Searchs searchs);
	 */

	ArrayList<Game> selectgamegSearch(GameSearchs searchs);

	ArrayList<Game> selectgamepSearch(String Keyword);//초기값이 같은 값으로 검색

//	ArrayList<Game> selectgameAllSearch(GameSearchs searchs, Pagingnn paging);

	ArrayList<Game> selectgameAllSearch(GameSearchs searchs);
	
//	ArrayList<Game> selectgamepSearch(GameSearchs searchs);
	
	
	
	
	



}
