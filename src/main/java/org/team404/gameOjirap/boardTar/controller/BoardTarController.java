package org.team404.gameOjirap.boardTar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.team404.gameOjirap.boardTar.model.service.BoardTarService;
import org.team404.gameOjirap.boardTar.model.vo.BoardTar;

import org.team404.gameOjirap.common.BoardLikeCount;

import org.team404.gameOjirap.common.board.Comment;
import org.team404.gameOjirap.common.FileNameChange;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.game.model.service.GameService;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
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
                                @RequestParam(name = "page", required = false) String page, @RequestParam("appid") String appid) {
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

    // 게시글 상세보기
    @RequestMapping("movetarboarddetail.do")
    public String moveTarBoardDetail(Model model,
                                     @RequestParam(name = "page", required = false) String page, @RequestParam("name") String name,
                                     @RequestParam("appid") String appid, @RequestParam("board_no") int board_no,
                                     HttpServletRequest request) {
        String user_id = (String) request.getSession().getAttribute("user_id");
        System.out.println("movetarboarddetail.do userid : " + user_id);
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }
        // 조회수 1 증가 처리
        boardTarService.updateReadCount(board_no);
        String checked = "n";
        BoardLikeCount likeCount = new BoardLikeCount(user_id, board_no);
        if (boardTarService.selectTarLike(likeCount) > 0) {
            checked = "y";
        }
        BoardTar boardTar = boardTarService.selectBoard(board_no);
        ArrayList<Comment> commentList = boardTarService.selectComments(board_no);
        if (boardTar != null) {
            model.addAttribute("checked", checked);
            model.addAttribute("boardTar", boardTar);
            model.addAttribute("name", name);
            model.addAttribute("appid", appid);
            model.addAttribute("page", currentPage);
            model.addAttribute("commentList", commentList);
            return "boardTar/gameBoardDetail";
        } else {
            model.addAttribute("message", "게시글 상세보기 실패");
            model.addAttribute("appid", appid);
            model.addAttribute("page", currentPage);
            return "redirect:movegameboard.do";
        }
    }

    // 게시글 등록뷰 이동
    @RequestMapping("gbwriteform.do")
    public ModelAndView moveGboardWrite(ModelAndView mv,
                                        @RequestParam("page") String page, @RequestParam("name") String name,
                                        @RequestParam("appid") String appid) {

        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }
        mv.addObject("page", currentPage);
        mv.addObject("name", name);
        mv.addObject("appid", appid);
        mv.setViewName("boardTar/gameBoardWrite");

        return mv;
    }

    //게시글 등록
    @RequestMapping(value = "inserttarboard.do", method = RequestMethod.POST)
    public String insertTarBoard(BoardTar boardTar, Model model,
                                 @RequestParam(name = "page", required = false) String page, @RequestParam(name = "upfile", required = false) MultipartFile mfile,
                                 HttpServletRequest request) {
        String savePath = request.getSession().getServletContext().getRealPath("resources/Tar_files");
        int currentPage = 1;

        if (page != null) {
            currentPage = Integer.parseInt(page);
        }
        if (!mfile.isEmpty()) {
            String fileName = mfile.getOriginalFilename();
            if (fileName != null && fileName.length() > 0) {
                String rename = FileNameChange.change(fileName, "yyyyMMddHHmmss");
                File renameFile = new File(savePath + "\\" + rename);
                try {
                    mfile.transferTo(renameFile);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                boardTar.setBoard_orifile(fileName);
                boardTar.setBoard_refile(rename);
            }
        }

        if (boardTarService.insertTarBoard(boardTar) > 0) {
            model.addAttribute("message", "게시글 등록 성공");
        } else {
            model.addAttribute("message", "게시글 등록 실패");
        }
        model.addAttribute("page", currentPage);
        model.addAttribute("appid", boardTar.getAppid());
        return "redirect:movegameboard.do";


    }

    // 게시물 좋아요 증가
    @RequestMapping("tarlike.do")
    public String tarLike(Model model, @RequestParam("board_no") int board_no,
                          @RequestParam("appid") String appid, @RequestParam(name="page", required = false) String page,
                          @RequestParam("user_id") String user_id) {
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }
        String checked = "n";
        BoardLikeCount likeCount = new BoardLikeCount(user_id, board_no);
        if (boardTarService.selectTarLike(likeCount) > 0) {
            checked = "y";
        }
        if (boardTarService.updateTarLike(board_no) > 0) {
            model.addAttribute("message", board_no+"번 게시물 좋아요 등록했습니다.");
        } else {
            model.addAttribute("message", board_no+"번 게시물 좋아요 등록에 실패했습니다.");
        }
        model.addAttribute("checked", checked);
        model.addAttribute("page", currentPage);
        model.addAttribute("appid", appid);
        return "redirect:movetarboarddetail.do";
    }
/*<form action="<c:url value="/gameReplyWrite.do"/>" method="post">
    <input type="hidden" name="board_no" value="${boardTar.board_no}">
    <input type="hidden" name="user_id" value="${boardTar.user_id}">

    <div class="form-group">
        <label for="gamecomment">댓글 내용</label>
        <textarea class="form-control" id="gamecomment" name="gamecomment" rows="3"></textarea>
*/
    //Tar 게시판 댓글 등록
    @RequestMapping("gameReplyWrite.do")
    public ModelAndView gameReplyWrite(ModelAndView mv, @RequestParam("board_no") int board_no,
                                       @RequestParam(name = "page", required = false) String page, @RequestParam("appid") String appid,
                                       @RequestParam("user_id") String user_id, @RequestParam("reply_content") String board_content, @RequestParam("name") String name){
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }

        Comment comment = new Comment(board_no, user_id, board_content);
        if (boardTarService.insertTarReply(comment) > 0) {
            mv.addObject("message", "댓글 등록 성공");
        } else {
            mv.addObject("message", "댓글 등록 실패");
        }
        mv.addObject("board_no", board_no);
        mv.addObject("name", name);
        mv.addObject("page", currentPage);
        mv.addObject("appid", appid);
        mv.setViewName("redirect:movetarboarddetail.do");
        return mv;
    }

    @RequestMapping("updateGameComment.do")
    public ModelAndView updateGameComment(ModelAndView mv, @RequestParam("board_no") int board_no, @RequestParam("user_id") String user_id,
                                          @RequestParam("com_contents") String reply_content){

        Comment comment = new Comment(board_no, user_id, reply_content);
        if (boardTarService.updateTarReply(comment) > 0) {
            mv.addObject("message", "댓글 수정 성공");
        } else {
            mv.addObject("message", "댓글 수정 실패");
        }
        mv.addObject("board_no", board_no);
        mv.setViewName("redirect:movetarboarddetail.do");
        return mv;
    }

}
