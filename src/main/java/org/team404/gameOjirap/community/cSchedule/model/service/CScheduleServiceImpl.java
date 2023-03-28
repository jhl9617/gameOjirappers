package org.team404.gameOjirap.community.cSchedule.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team404.gameOjirap.community.cSchedule.model.dao.CScheduleDao;

@Service("cScheduleService")
public class CScheduleServiceImpl implements CScheduleService{


    @Autowired
    private CScheduleDao cScheduleDao;

}
