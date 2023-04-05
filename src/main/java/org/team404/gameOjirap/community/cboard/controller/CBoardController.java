package org.team404.gameOjirap.community.cboard.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cboard.model.service.CBoardService;
import org.team404.gameOjirap.community.cboard.model.vo.CBoard;
import org.team404.gameOjirap.community.cboard.model.vo.CComment;

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

    // 게시글 작성 페이지로 이동
    @RequestMapping("writeCommuPost.do")
    public ModelAndView writeCommuPost(ModelAndView mv, @RequestParam("communityid") int communityid, HttpSession session) {
        mv.addObject("communityid", communityid);
        mv.setViewName("community/writePost");
        return mv;
    }

// 게시글 작성
    @RequestMapping("insertCommuPost.do")
    public ModelAndView insertCommuPost(ModelAndView mv, CBoard cBoard, HttpSession session) {
        int result = cBoardService.insertCommuPost(cBoard);
        if (result > 0) {
            mv.setViewName("redirect:commuBoardList.do?communityid=" + cBoard.getCommunityid());
        } else {
            mv.addObject("message", "게시글 작성 실패");
            mv.setViewName("common/error");
        }
        return mv;
    }

    // 게시글 수정 페이지로 이동
    @RequestMapping("updateViewPost.do")
    public ModelAndView updateViewPost(ModelAndView mv, CBoard cBoard, HttpSession session) {
        mv.addObject("cBoard", cBoardService.selectCommuPost(cBoard.getcBoardNo()));
        mv.setViewName("community/updateViewPost");
        return mv;
    }


    //게시글 수정
    @RequestMapping("updateCommuPost.do")
    public ModelAndView updateCommuPost(ModelAndView mv, CBoard cBoard, HttpSession session) {
        int result = cBoardService.updateCommuPost(cBoard);
        if (result > 0) {
            mv.setViewName("redirect:commuBoardList.do?communityid=" + cBoard.getCommunityid());
        } else {
            mv.addObject("message", "게시글 수정 실패");
            mv.setViewName("common/error");
        }
        return mv;
    }



    // 게시글 상세보기
    @RequestMapping("viewCommuPost.do")
    public ModelAndView moveCommuPost(ModelAndView mv, @RequestParam("cBoardNo") int cBoardNo, @RequestParam("communityid") int communityid, HttpSession session){

        ArrayList<CComment> list = cBoardService.selectCommuCList(cBoardNo);

        mv.addObject("commentList", list);
        mv.addObject("cBoard", cBoardService.selectCommuPost(cBoardNo));
        mv.addObject("communityid", communityid);
        mv.setViewName("community/viewPost");
        return mv;
    }

    // 커뮤 게시판 댓글 insert
    @RequestMapping("commuReplyWrite.do")
    public ModelAndView commuReplyWrite(ModelAndView mv, CComment cComment, HttpSession session) {


        if (cBoardService.insertCommuReply(cComment) > 0) {
            mv.setViewName("redirect:viewCommuPost.do?cBoardNo=" + cComment.getCboardno() + "&communityid=" + cComment.getCommunityid());

        } else {
            mv.addObject("message", "댓글 작성 실패");
            mv.setViewName("common/error");
        }
        return mv;
    }

}

