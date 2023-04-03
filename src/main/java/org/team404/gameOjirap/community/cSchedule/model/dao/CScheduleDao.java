package org.team404.gameOjirap.community.cSchedule.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.community.cSchedule.model.vo.CSchedule;
import org.team404.gameOjirap.community.cSchedule.model.vo.ScheduleVote;

@Repository("cScheduleDao")
public class CScheduleDao {

    @Autowired
    private SqlSessionTemplate session;

	public ArrayList<ScheduleVote> selectScheduleList(int communityid) {
		List<ScheduleVote> list = session.selectList("cScheduleMapper.selectScheduleList",communityid);
		return (ArrayList<ScheduleVote>)list;
	}

	public int insertSchdule(CSchedule cschedule) {
		return session.insert("cScheduleMapper.insertSchdule", cschedule);
	}

}
