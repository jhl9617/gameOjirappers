package org.team404.gameOjirap.game.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.common.Pagingnn;
import org.team404.gameOjirap.common.Searchs;
import org.team404.gameOjirap.game.model.vo.Game;

@Repository("gameDao")
public class GameDao {

	@Autowired
	private SqlSession session;

	public int insertGameInfo(Game game) {
		return session.insert("gameMapper.insertGameInfo", game);
	}

	public int deleteGameInfo(String appid) {
		return session.insert("gameMapper.deleteGameInfo", appid);
	}

	public int selectGameCount(String appid) {
		return session.selectOne("gameMapper.selectGameCount", appid);
	}

	public ArrayList<Game> selectGameTop6() {
		List<Game> list = session.selectList("gameMapper.selectGameTop6");
		return (ArrayList<Game>) list;
	}

	public ArrayList<Game> selectGameNew6() {
		List<Game> list = session.selectList("gameMapper.selectGameNew6");
		return (ArrayList<Game>) list;
	}

	public ArrayList<Game> selectGameDiscTop() {
		List<Game> list = session.selectList("gameMapper.selectGameDiscTop");
		return (ArrayList<Game>) list;
	}

	public String selectAchievement(String appid) {
		return session.selectOne("gameMapper.selectAchievement", appid);
	}

	public Game selectGame(String appid) {
		return session.selectOne("gameMapper.selectGame", appid);
	}

	public int selectListNewCount() {
		return session.selectOne("gameMapper.selectListCount");
	}

	//신작 게임 페이징 처리
	public ArrayList<Game> selectNewList(Pagingnn paging) {
		List<Game> list = session.selectList("gameMapper.selectList", paging);
		return (ArrayList<Game>)list;
	}
	
	
	/*
	 * public ArrayList<Game> selectSearchPrice(int finalprice) { List<Game> list =
	 * session.selectList("gameMapper.selectSearchPrice", finalprice); return
	 * (ArrayList<Game>)list; }
	 * 
	 * public ArrayList<Game> selectSearchGenre(Searchs searchs) { List<Game> list =
	 * session.selectList("gameMapper.selectSearchGenre", searchs); return
	 * (ArrayList<Game>)list; }
	 */

	public ArrayList<Game> selectgamegSearch(Searchs searchs) {
		List<Game> list = session.selectList("gameMapper.selectSearchGenre", searchs);
		return (ArrayList<Game>)list;
	}

	public ArrayList<Game> selectgamepSearch(int finalprice) {
		List<Game> list = session.selectList("gameMapper.selectSearchPrice", finalprice);
		return (ArrayList<Game>)list;
	}

}
