package org.team404.gameOjirap.boardTar.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.boardTar.model.dao.BoardTarDao;
import org.team404.gameOjirap.boardTar.model.vo.BoardTar;
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
}
