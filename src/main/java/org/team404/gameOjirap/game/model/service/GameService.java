package org.team404.gameOjirap.game.model.service;

import java.util.ArrayList;

import org.team404.gameOjirap.game.model.vo.Game;

public interface GameService {
    int insertGameInfo(Game game);

	int deleteGameInfo(String appid);
	int selectGameCount(String appid);
	String selectAchievement(String appid);
	ArrayList<Game> selectgameTop5();
}
