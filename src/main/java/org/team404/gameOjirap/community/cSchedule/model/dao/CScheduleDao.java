package org.team404.gameOjirap.community.cSchedule.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.community.cSchedule.model.vo.CSchedule;
import org.team404.gameOjirap.community.cSchedule.model.vo.CVote;
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

    public ArrayList<CSchedule> selectCalendarList(int communityid) {
		List<CSchedule> list = session.selectList("cScheduleMapper.selectCalendarList",communityid);
		return (ArrayList<CSchedule>)list;
    }

    public int insertOrUpdateVote(CVote cvote) {
		return session.insert("cScheduleMapper.insertOrUpdateVote", cvote);
    }

	public CVote selectVote(CVote cvote) {
		return session.selectOne("cScheduleMapper.selectVote", cvote);
	}
}
