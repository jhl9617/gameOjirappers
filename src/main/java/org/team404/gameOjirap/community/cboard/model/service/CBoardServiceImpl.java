package org.team404.gameOjirap.community.cboard.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cboard.model.dao.CBoardDao;
import org.team404.gameOjirap.community.cboard.model.vo.CBoard;

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
}
