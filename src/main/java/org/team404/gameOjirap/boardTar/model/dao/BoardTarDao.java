package org.team404.gameOjirap.boardTar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.boardTar.model.vo.BoardTar;
import org.team404.gameOjirap.common.Paging;

import java.util.ArrayList;
import java.util.List;

@Repository("boardTarDao")
public class BoardTarDao {

    @Autowired
    private SqlSessionTemplate session;

    public int selectListCount(String appid) {
        return session.selectOne("boardTarMapper.selectListCount", appid);
    }

    public ArrayList<BoardTar> selectList(Paging paging) {
        List<BoardTar> list = session.selectList("boardTarMapper.selectList", paging);
        return (ArrayList<BoardTar>) list;
    }
}
