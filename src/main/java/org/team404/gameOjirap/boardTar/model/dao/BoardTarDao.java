package org.team404.gameOjirap.boardTar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.boardTar.model.vo.BoardTar;
import org.team404.gameOjirap.common.BoardLikeCount;
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

    public int insertTarBoard(BoardTar boardTar) {
        return session.insert("boardTarMapper.insertTarBoard", boardTar);
    }

    public int updateReadCount(int boardNo) {
        return session.update("boardTarMapper.updateReadCount", boardNo);
    }

    public BoardTar selectBoard(int board_no) {
        return session.selectOne("boardTarMapper.selectBoard", board_no);
    }

    public int selectTarLike(BoardLikeCount likeCount) {
        return session.selectOne("boardTarMapper.selectTarLike", likeCount);
    }

    public int updateTarLike(int boardNo) {
        return session.update("boardTarMapper.updateTarLike", boardNo);
    }

}
