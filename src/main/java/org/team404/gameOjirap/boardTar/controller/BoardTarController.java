package org.team404.gameOjirap.boardTar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.team404.gameOjirap.boardTar.model.service.BoardTarService;
import org.team404.gameOjirap.boardTar.model.vo.BoardTar;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.game.model.service.GameService;

import java.util.ArrayList;

@Controller("boardTarController")
public class BoardTarController {
    @Autowired
    private BoardTarService boardTarService;

    @Autowired
    private GameService gameService;

    // 이동용
    @RequestMapping("movegameboard.do")
    public String moveGameBoard(Model model,
                                @RequestParam(value = "page", required = false) String page, @RequestParam("appid") String appid) {
        // 현재 페이지 값 저장
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }

        // limit 계산
        int limit = 10;

        // 시작페이지 저장
        String url = "movegameboard.do";

        // 페이지 계산해서 리스트 불러오기
        Paging paging = new Paging(boardTarService.selectListCount(appid), currentPage, limit, url, appid);
        paging.calculator();

        ArrayList<BoardTar> list = boardTarService.selectList(paging);
        String name = gameService.selectGame(appid).getName();
        if (list != null && list.size() > 0) {
            model.addAttribute("list", list);
        }
        model.addAttribute("paging", paging);
        model.addAttribute("appid", appid);
        model.addAttribute("name", name);
        model.addAttribute("message", name + "게시판에 오신것을 환영합니다.");
        return "boardTar/gameBoard";

    }

    @RequestMapping("movetarboarddetail.do")
    public String moveTarBoardDetail(Model model) {

        return "boardTar/tarBoardDetail";
    }

    // 게시글 등록
    @RequestMapping(value = "inserttarboard.do", method = RequestMethod.POST)
    public ModelAndView insertBoard() {
        return new ModelAndView();
    }
}
