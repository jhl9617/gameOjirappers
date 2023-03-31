package org.team404.gameOjirap.game.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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


	public ArrayList<Game> selectgameTop5() {
		List<Game> list = session.selectList("gameMapper.selectgameTop5");
		return (ArrayList<Game>)list;
	}



}

