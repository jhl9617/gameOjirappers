package org.team404.gameOjirap.community.cGroup.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.team404.gameOjirap.community.cGroup.model.service.CGroupService;

@Controller
public class CGroupController {

    private static final Logger logger = LoggerFactory.getLogger(CGroupController.class);

    @Autowired
    private CGroupService cGroupService;

    @RequestMapping("commuMain.do")
    public String moveCommuMain() {
        return "community/commuMain";
    }
}
