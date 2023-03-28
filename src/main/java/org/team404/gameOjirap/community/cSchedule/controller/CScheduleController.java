package org.team404.gameOjirap.community.cSchedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.team404.gameOjirap.community.cSchedule.model.service.CScheduleService;

import java.io.Serializable;
import java.sql.Date;

@Controller
public class CScheduleController {

    @Autowired
    private CScheduleService cScheduleService;

}
