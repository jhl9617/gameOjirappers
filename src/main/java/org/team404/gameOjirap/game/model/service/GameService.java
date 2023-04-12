package org.team404.gameOjirap.game.model.service;

import java.util.ArrayList;

import org.team404.gameOjirap.boardTar.model.vo.BoardTar;
import org.team404.gameOjirap.common.Pagingnn;
import org.team404.gameOjirap.game.model.vo.Game;
import org.team404.gameOjirap.game.model.vo.GameSearchs;

public interface GameService {

	
	//게임정보 
	int insertGameInfo(Game game);

	int deleteGameInfo(String appid);
	int selectGameCount(String appid);

	
	//게임 리스트 갖고오기
	Game selectGame(String appid);				//게임 리스트 갖고 오기
	
	ArrayList<Game> selectGameTop6();			//접속자 많은 게임 

	ArrayList<Game> selectGameNew6();			//신작 게임

	ArrayList<Game> selectGameDiscTop();		//할인율 높은 순위
	

	//도전과제
	public String selectAchievement(String appid);

	//새게임 리스트 에서 페이지 처리
	int selectListNewCount();
	ArrayList<Game> selectNewList(Pagingnn paging);

	//검색기
	ArrayList<Game> selectgamegSearch(GameSearchs searchs); //게임 장르별로 검색
	
	ArrayList<Game> selectgamepSearch(GameSearchs searchs); //게임 가격별로 검색
//	ArrayList<Game> selectgameAllSearch(GameSearchs searchs, Pagingnn paging);

	ArrayList<Game> selectgameAllSearch(GameSearchs searchs);

	Game selectYoutube(String appid); //youTube 영상 갖어오기

    ArrayList<BoardTar> selectTarBoardList(int appid);

//	String selectYoutube(String appid);  //youTube 로 영상 갖고오기

	
	
//	ArrayList<Game> selectgamepSearch(GameSearchs searchs);
	
	
	
	
	



}
