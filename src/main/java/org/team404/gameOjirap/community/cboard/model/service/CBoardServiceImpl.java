package org.team404.gameOjirap.community.cboard.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.board.model.dao.BoardDao;

@Service("cBoardService")
public class CBoardServiceImpl implements CBoardService{

    @Autowired
    private BoardDao boardDao;

}
