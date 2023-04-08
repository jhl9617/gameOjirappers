package org.team404.gameOjirap.community.cSchedule.model.service;

import java.util.ArrayList;

import org.team404.gameOjirap.community.cSchedule.model.vo.CSchedule;
import org.team404.gameOjirap.community.cSchedule.model.vo.CVote;
import org.team404.gameOjirap.community.cSchedule.model.vo.ScheduleVote;

public interface CScheduleService {

	ArrayList<ScheduleVote> selectScheduleList(int communityid);

	int insertSchdule(CSchedule cschedule);

    ArrayList<CSchedule> selectCalendarList(int communityid);

    int insertOrUpdateVote(CVote cvote);

    CVote selectVote(CVote cvote);


}
