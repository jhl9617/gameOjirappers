package org.team404.gameOjirap.community.cboard.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cboard.model.dao.CBoardDao;
import org.team404.gameOjirap.community.cboard.model.vo.CBoard;
import org.team404.gameOjirap.community.cboard.model.vo.CComment;

import java.util.ArrayList;

@Service("cBoardService")
public class CBoardServiceImpl implements CBoardService{

    @Autowired
    private CBoardDao cBoardDao;


    @Override
    public ArrayList<CBoard> selectCommuBList(Paging paging, int communityid) {
        return cBoardDao.selectCommuBList(paging, communityid);
    }

    @Override
    public int selectBListCount(int communityid) {
        return cBoardDao.selectBListCount(communityid);
    }

    @Override
    public CBoard selectCommuPost(int cBoardNo) {
        return cBoardDao.selectCommuPost(cBoardNo);
    }

    @Override
    public int insertCommuPost(CBoard cBoard) {
        return cBoardDao.insertCommuPost(cBoard);
    }

    @Override
    public int updateCommuPost(CBoard cBoard) {
        return cBoardDao.updateCommuPost(cBoard);
    }

    @Override
    public ArrayList<CComment> selectCommuCList(int cBoardNo) {
        return cBoardDao.selectCommuCList(cBoardNo);
    }

    @Override
    public int insertCommuReply(CComment cComment) {
        return cBoardDao.insertCommuReply(cComment);
    }

    @Override
    public int updateCommuComment(CComment cComment) {
        return cBoardDao.updateCommuComment(cComment);
    }

    @Override
    public int deleteCommuComment(CComment cComment) {
        return cBoardDao.deleteCommuComment(cComment);
    }

    @Override
    public int deleteCommuPost(int cBoardNo) {
        return cBoardDao.deleteCommuPost(cBoardNo);
    }
}
