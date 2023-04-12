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

import org.team404.gameOjirap.common.BoardLike;

import org.team404.gameOjirap.common.Searchs;
import org.team404.gameOjirap.common.board.Comment;
import org.team404.gameOjirap.common.FileNameChange;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.game.model.service.GameService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
        model.addAttribute("page", currentPage);
        return "boardTar/gameBoard";
    }

    // 게시글 상세보기
    @RequestMapping("movetarboarddetail.do")
    public String moveTarBoardDetail(Model model, @RequestParam(name="checked", required = false) String checked,
                                     @RequestParam(name="user_id", required = false) String user_id,
                                     @RequestParam(name = "page", required = false) String page, @RequestParam("name") String name,
                                     @RequestParam("appid") String appid, @RequestParam("board_no") int board_no,
                                     HttpServletRequest request) {
        System.out.println("movetarboarddetail.do userid : " + user_id);
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }
        BoardLike blike = new BoardLike(user_id, board_no);
        // 조회수 1 증가 처리
        boardTarService.updateReadCount(board_no);
        checked = "n";
        // 좋아요 체크
        if (boardTarService.selectTarLike(blike) > 0) {
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

    // 게시글 업데이트 뷰 이동
    @RequestMapping("btupdate.do")
    public String boardTarUpdateView(@RequestParam("board_no") int board_no,
                                     @RequestParam("name") String name,
                                     @RequestParam("appid") String appid,
                                     @RequestParam(name="page", required = false) String page,
                                     Model model){
        int currentPage = 1;
        if(page != null){
            currentPage = Integer.parseInt(page);
        }
        BoardTar boardTar = boardTarService.selectBoard(board_no);
        model.addAttribute("page", currentPage);
        model.addAttribute("appid", appid);
        model.addAttribute("board_no", board_no);
        model.addAttribute("name", name);
        if(boardTar != null){
            model.addAttribute("boardTar", boardTar);
            return "boardTar/gameBoardUpdateForm";
        }else{
            model.addAttribute("message", "게시글 수정 페이지 이동 실패");
            return "redirect:movetarboarddetail.do";
        }
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
            //포인트 증가
            boardTarService.updatePoint(boardTar.getUser_id(), 50);

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
        BoardLike blike = new BoardLike(user_id, board_no);
        String checked = "n";

        if (boardTarService.selectTarLike(blike) > 0) {
            checked = "y";
        }else{
        if(boardTarService.insertTarLike(blike)>0){
            boardTarService.updateTarLike(board_no);
        }
        }
        model.addAttribute("checked", checked);
        model.addAttribute("name", gameService.selectGame(appid).getName());
        model.addAttribute("board_no", board_no);
        model.addAttribute("page", currentPage);
        model.addAttribute("appid", appid);
        model.addAttribute("user_id", user_id);
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
                                       @RequestParam("user_id") String user_id, @RequestParam("reply_contents") String board_contents, @RequestParam("name") String name){
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }

        Comment comment = new Comment(board_contents, board_no, user_id);
        if (boardTarService.insertTarReply(comment) > 0) {
            boardTarService.updatePoint(user_id, 20);
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

    //boardTar 댓글 update
    @RequestMapping("updateGameComment.do")
    public void updateGameComment(HttpServletResponse response, Comment comment){
        int result = boardTarService.updateTarReply(comment);
    }

    //boardTar 댓글 delete
    @RequestMapping("deleteGameComment.do")
    public void deleteGameComment(HttpServletResponse response, @RequestParam("com_no") int com_no){
        int result = boardTarService.deleteTarReply(com_no);
    }

    // 게시물 좋아요 감소
    @RequestMapping("tarlike2.do")
    public String tarLike2(Model model, @RequestParam("board_no") int board_no,
                          @RequestParam("appid") String appid, @RequestParam(name="page", required = false) String page,
                          @RequestParam("user_id") String user_id) {
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }
        BoardLike blike = new BoardLike(user_id, board_no);
        String checked = "n";

        if(boardTarService.deleteTarLike(blike)>0){
            boardTarService.updateTarLikedis(board_no);
        }

        model.addAttribute("checked", checked);
        model.addAttribute("name", gameService.selectGame(appid).getName());
        model.addAttribute("board_no", board_no);
        model.addAttribute("page", currentPage);
        model.addAttribute("appid", appid);
        model.addAttribute("user_id", user_id);
        return "redirect:movetarboarddetail.do";

    }

    // 첨부파일 다운로드
    @RequestMapping("btfdown.do")
    public ModelAndView fileDown(ModelAndView mv, HttpServletRequest request,
                                 @RequestParam("ofile") String originalFileName, @RequestParam("rfile") String renameFileName){
        // 저장폴더 path 지정
        String savePath = request.getSession().getServletContext().getRealPath("resources/Tar_files");

        // 읽은 파일 이름에 대한 객체 생성
        File renameFile = new File(savePath + "//" + renameFileName);
        // 다운시 다시 원래이름으로 변경
        File originFile = new File(originalFileName);

        // 다운로드 뷰로 전달할 정보 저장
        mv.setViewName("filedown");
        mv.addObject("renameFile", renameFile);
        mv.addObject("originFile", originFile);
        return mv;
    }

    // 게시글 삭제
    @RequestMapping("btdelete.do")
    public String boardTarDelete(@RequestParam("board_no") int board_no,
                                 @RequestParam("appid") String appid,
                                 @RequestParam(name="page", required = false) String page,
                                 Model model){
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }

        if(boardTarService.deleteBoard(board_no) > 0){
            model.addAttribute("message", "게시글 삭제 성공");
        }else{
            model.addAttribute("message", "게시글 삭제 실패");
        }
        model.addAttribute("appid", appid);
        model.addAttribute("page", currentPage);
        return "redirect:movegameboard.do";
    }

    // 게시글 수정
    @RequestMapping(value = "boardTarUpdate.do", method = RequestMethod.POST)
    public String boardTarUpdate(BoardTar boardTar, Model model,
                                 @RequestParam(name = "page", required = false) String page, @RequestParam(name = "upfile", required = false) MultipartFile mfile,
                                 @RequestParam(name="delflag", required = false) String delflag,
                                 HttpServletRequest request) {
        String savePath = request.getSession().getServletContext().getRealPath("resources/Tar_files");
        if(boardTar.getBoard_content().equals("")){
            boardTar.setBoard_content(boardTarService.selectBoard(boardTar.getBoard_no()).getBoard_content());
        }
        int currentPage = 1;

        if (page != null) {
            currentPage = Integer.parseInt(page);
        }
        String name = gameService.selectGame(boardTar.getAppid()).getName();
        String refile = boardTar.getBoard_refile();
        if(boardTar.getBoard_orifile() != null && delflag != null && delflag.equals("yes")){
            new File(savePath + "\\" + refile).delete();
            boardTar.setBoard_orifile(null);
            boardTar.setBoard_refile(null);
        }
        if (!mfile.isEmpty()) {
            if(refile != null){
                new File(savePath + "\\" + refile).delete();
                boardTar.setBoard_orifile(null);
                boardTar.setBoard_refile(null);
            }

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

        if (boardTarService.updateBoard(boardTar) > 0) {
            model.addAttribute("message", "게시글 수정 성공");
        } else {
            model.addAttribute("message", "게시글 수정 실패");
        }
        model.addAttribute("board_no", boardTar.getBoard_no());
        model.addAttribute("name", name);
        model.addAttribute("page", currentPage);
        model.addAttribute("appid", boardTar.getAppid());
        return "redirect:movetarboarddetail.do";
    }

    // 검색
    @RequestMapping(value="gameboardsearch.do", method=RequestMethod.POST)
    public String gameBoardSearch(@RequestParam("appid") String appid, @RequestParam("page") String page,
                                  @RequestParam("action") String action, @RequestParam("keyword") String keyword,
                                  Model model){
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }
        switch (action){
            case "title":
                action = "board_title";
                break;
            case "content":
                action = "board_content";
                break;
            case "id":
                action = "user_id";
                break;
        }
        Searchs searchs = new Searchs(keyword, action, appid);
        int limit = 10;
        int listCount = boardTarService.selectSearchListCount(searchs);
        String url = "gameboardsearch.do";
        Paging paging = new Paging(listCount, currentPage, limit, url, appid);
        paging.calculator();
        Map map = new HashMap();
        map.put("appid", appid);
        map.put("action", action);
        map.put("keyword", keyword);
        map.put("startRow", paging.getStartRow());
        map.put("endRow", paging.getEndRow());
        ArrayList<BoardTar> list = boardTarService.selectSearchList(map);
        if(list != null){
            model.addAttribute("list", list);
            model.addAttribute("paging", paging);
            model.addAttribute("appid", appid);
            model.addAttribute("action", action);
            model.addAttribute("keyword", keyword);
            model.addAttribute("page", currentPage);
            return "boardTar/gameBoard";
        }else {
            model.addAttribute("message", "게시글 검색 실패");
            model.addAttribute("appid", appid);
            model.addAttribute("page", 1);
            return "redirect:movegameboard.do";
        }
    }
}
