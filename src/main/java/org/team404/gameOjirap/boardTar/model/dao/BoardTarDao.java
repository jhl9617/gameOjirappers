package org.team404.gameOjirap.boardTar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.boardTar.model.vo.BoardTar;
import org.team404.gameOjirap.common.BoardLike;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.common.Searchs;
import org.team404.gameOjirap.common.board.Comment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    public int selectTarLike(BoardLike likeCount) {
        return session.selectOne("boardTarMapper.selectTarLike", likeCount);
    }

    public int updateTarLike(int boardNo) {
        return session.update("boardTarMapper.updateTarLike", boardNo);
    }

    public int deleteBoard(int boardNo) {
        return session.delete("boardTarMapper.deleteBoard", boardNo);
    }

    public int updateBoard(BoardTar boardTar) {
        return session.update("boardTarMapper.updateBoard", boardTar);
    }

    // 좋아요
    public int insertTarLike(BoardLike blike) {
        return session.insert("boardTarMapper.insertTarLike", blike);
    }

    public int deleteTarLike(BoardLike blike) {
        return session.delete("boardTarMapper.deleteTarLike", blike);
    }

    public int updateTarLikedis(int boardNo) {
        return session.update("boardTarMapper.updateTarLikedis", boardNo);
    }
    public int insertTarReply(Comment comment) {
        return session.insert("boardTarMapper.insertTarReply", comment);
    }

    //댓글 리스트
    public ArrayList<Comment> selectComments(int boardNo) {
        List<Comment> list = session.selectList("boardTarMapper.selectTarReply", boardNo);
        return (ArrayList<Comment>) list;
    }

    public int updateTarReply(Comment comment) {
        return session.update("boardTarMapper.updateTarReply", comment);

    }

    public int selectSearchListCount(Searchs searchs) {
        return session.selectOne("boardTarMapper.selectSearchListCount", searchs);
    }

    public ArrayList<BoardTar> selectSearchList(Map map) {
        List<BoardTar> list = session.selectList("boardTarMapper.selectSearchList", map);
        return (ArrayList<BoardTar>) list;
    }

    public int deleteTarReply(int comNo) {
        return session.delete("boardTarMapper.deleteTarReply", comNo);
    }
}
