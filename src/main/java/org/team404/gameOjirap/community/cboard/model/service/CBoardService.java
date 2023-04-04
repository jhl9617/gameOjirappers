package org.team404.gameOjirap.community.cboard.model.service;


import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cboard.model.vo.CBoard;
import org.team404.gameOjirap.community.cboard.model.vo.CComment;

import java.util.ArrayList;

public interface CBoardService {


    ArrayList<CBoard> selectCommuBList(Paging paging, int communityid);

    int selectBListCount(int communityid);

    CBoard selectCommuPost(int cBoardNo);

    int insertCommuPost(CBoard cBoard);

    int updateCommuPost(CBoard cBoard);

    ArrayList<CComment> selectCommuCList(int cBoardNo);

    int insertCommuReply(CComment cComment);
}
