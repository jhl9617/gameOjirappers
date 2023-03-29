package org.team404.gameOjirap.community.cboard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("cBoardDao")
public class CBoardDao {

    @Autowired
    private SqlSessionTemplate session;


}
