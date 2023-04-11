package org.team404.gameOjirap.boardTar.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.boardTar.model.dao.BoardTarDao;
import org.team404.gameOjirap.boardTar.model.vo.BoardTar;
import org.team404.gameOjirap.common.BoardLikeCount;
import org.team404.gameOjirap.common.Paging;

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
    public int selectTarLike(BoardLikeCount likeCount) {
        return boardTarDao.selectTarLike(likeCount);
    }

    @Override
    public int updateTarLike(int boardNo) {
        return boardTarDao.updateTarLike(boardNo);
    }

}
