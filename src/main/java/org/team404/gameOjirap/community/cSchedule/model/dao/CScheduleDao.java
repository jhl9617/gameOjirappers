package org.team404.gameOjirap.community.cSchedule.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("cScheduleDao")
public class CScheduleDao {

    @Autowired
    private SqlSessionTemplate session;
}
