package org.team404.gameOjirap.community.cSchedule.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.team404.gameOjirap.community.cSchedule.model.service.CScheduleService;

import java.io.Serializable;
import java.sql.Date;

@Controller
public class CScheduleController {

    @Autowired
    private CScheduleService cScheduleService;

    // 뷰 페이지 이동 --------------------------------------

    @RequestMapping("csview.do")
    public String scheduleView(
            Model model,
            @RequestParam("communityid") int communityid
    ){
        model.addAttribute("communityid",communityid);
        return "community/scheduleView";
    }

    // 기능 -----------------------------------------------
    @RequestMapping(value="insertsch.do", method={RequestMethod.GET, RequestMethod.POST})
    public String addSchedule(){
        return "";
    }
}
