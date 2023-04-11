package org.team404.gameOjirap.boardTar.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.boardTar.model.dao.BoardTarDao;
import org.team404.gameOjirap.boardTar.model.vo.BoardTar;
import org.team404.gameOjirap.common.BoardLike;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.common.BoardLike;

import java.util.ArrayList;

@Service("boardTarService")
    public class BoardTarServiceImpl implements BoardTarService {

    @Autowired
    private BoardTarDao boardTarDao;

    @Override
    public int selectListCount(String appid) {
        return boardTarDao.selectListCount(appid);
    }

    @Override
    public ArrayList<BoardTar> selectList(Paging paging) {
        return boardTarDao.selectList(paging);
    }

    @Override
    public int insertTarBoard(BoardTar boardTar) {
        return boardTarDao.insertTarBoard(boardTar);
    }

    @Override
    public int updateReadCount(int boardNo) {
        return boardTarDao.updateReadCount(boardNo);
    }

    @Override
    public BoardTar selectBoard(int board_no) {
        return  boardTarDao.selectBoard(board_no);
    }

    @Override
    public int selectTarLike(BoardLike likeCount) {
        return boardTarDao.selectTarLike(likeCount);
    }

    @Override
    public int updateTarLike(int boardNo) {
        return boardTarDao.updateTarLike(boardNo);
    }

    @Override
    public int deleteBoard(int boardNo) {
        return boardTarDao.deleteBoard(boardNo);
    }

    @Override
    public int updateBoard(BoardTar boardTar) {
        return boardTarDao.updateBoard(boardTar);
    }

    @Override
    public int insertTarLike(BoardLike blike) {
        return boardTarDao.insertTarLike(blike);
    }

    @Override
    public int deleteTarLike(BoardLike blike) {
        return boardTarDao.deleteTarLike(blike);
    }

    @Override
    public int updateTarLikedis(int boardNo) {
        return boardTarDao.updateTarLikedis(boardNo);
    }

}
