package org.team404.gameOjirap.community.community.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.team404.gameOjirap.community.community.model.service.CommunityService;

@Controller
public class CommunityController {
    private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

    @Autowired
    private CommunityService communityService;


}
