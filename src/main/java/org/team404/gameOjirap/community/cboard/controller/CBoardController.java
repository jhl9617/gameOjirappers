package org.team404.gameOjirap.community.cboard.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cboard.model.service.CBoardService;
import org.team404.gameOjirap.community.cboard.model.vo.CBoard;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;


@Controller
public class CBoardController {
    private static final Logger logger = LoggerFactory.getLogger(CBoardController.class);

    @Autowired
    private CBoardService cBoardService;

    @RequestMapping("commuBoardList.do")
    public ModelAndView commuDetailMethod(ModelAndView mv, @RequestParam("communityid") int communityid
            , @RequestParam(name = "page", required = false) String page, HttpSession session) {
        int listCount = cBoardService.selectBListCount(communityid);
        System.out.println(listCount);
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }
        int limit = 10;
        Paging paging = new Paging(listCount, currentPage, limit);
        paging.calculator();

        ArrayList<CBoard> list = cBoardService.selectCommuBList(paging, communityid);

        if (list != null && list.size() > 0) {


            mv.addObject("communityid", communityid);
            mv.addObject("list", list);
            mv.addObject("paging", page);

            mv.setViewName("community/commuBoardList");
        } else {
            mv.addObject("message", currentPage + " 커뮤니티 게시판 조회 실패");
            mv.setViewName("common/error");
        }
        return mv;
    }

    @RequestMapping("viewCommuPost.do")
    public ModelAndView moveCommuPost(ModelAndView mv, @RequestParam("cBoardNo") int cBoardNo){

        mv.addObject("CBoard", cBoardService.selectCommuPost(cBoardNo));
        mv.setViewName("community/viewPost");
        return mv;
    }

}
