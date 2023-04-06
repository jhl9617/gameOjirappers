package org.team404.gameOjirap.game.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.common.Pagingnn;
import org.team404.gameOjirap.common.Searchs;
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
	public ArrayList<Game> selectGameTop6() {
		return gameDao.selectGameTop6();
	}

	@Override
	public ArrayList<Game> selectGameNew6() {
		return gameDao.selectGameNew6();
	}

	@Override
	public ArrayList<Game> selectGameDiscTop() {
		return gameDao.selectGameDiscTop();
	}

	@Override
	public String selectAchievement(String appid) {
		return gameDao.selectAchievement(appid);
	}

	@Override
	public Game selectGame(String appid) {
		return gameDao.selectGame(appid);
	}

	@Override
	public int selectListNewCount() {
		return gameDao.selectListNewCount();
	}

	@Override
	public ArrayList<Game> selectNewList(Pagingnn paging) {
		return gameDao.selectNewList(paging);
	}

	/*
	 * @Override public ArrayList<Game> selectSearchPrice(int finalprice) { return
	 * gameDao.selectSearchPrice(finalprice); }
	 * 
	 * @Override public ArrayList<Game> selectSearchGenre(Searchs searchs) { return
	 * gameDao.selectSearchGenre(searchs); }
	 */

	@Override
	public ArrayList<Game> selectgamegSearch(Searchs searchs) {
		return gameDao.selectgamegSearch(searchs);
	}

	@Override
	public ArrayList<Game> selectgamepSearch(int finalprice) {
		return gameDao.selectgamepSearch(finalprice);
	}





}
