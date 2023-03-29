package org.team404.gameOjirap.community.cboard.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.team404.gameOjirap.community.cboard.model.service.CBoardService;


@Controller
public class CBoardController {
    private static final Logger logger = LoggerFactory.getLogger(CBoardController.class);

    @Autowired
    private CBoardService cBoardService;




}
