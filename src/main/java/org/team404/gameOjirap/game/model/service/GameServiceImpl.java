package org.team404.gameOjirap.game.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.game.model.dao.GameDao;
import org.team404.gameOjirap.game.model.vo.Game;

@Service("gameService")
public class GameServiceImpl implements GameService{
    @Autowired
    private GameDao gameDao;
    
    @Override
    public int insertGameInfo(Game game) {
        return gameDao.insertGameInfo(game);
    }
    
	@Override
	public int deleteGameInfo(String appid) {
		return gameDao.deleteGameInfo(appid);
	}

	@Override
	public int selectGameCount(String appid) {
		return gameDao.selectGameCount(appid);
	}

	@Override
	public ArrayList<Game> selectgameTop5() {
		return gameDao.selectgameTop5();
	}

	@Override
	public String selectAchievement(String appid) {
		return gameDao.selectAchievement(appid);
	}

}
