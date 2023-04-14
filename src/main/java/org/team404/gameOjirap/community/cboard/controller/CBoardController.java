package org.team404.gameOjirap.community.cboard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team404.gameOjirap.common.FileNameChange;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cboard.model.service.CBoardService;
import org.team404.gameOjirap.community.cboard.model.vo.CBoard;
import org.team404.gameOjirap.community.cboard.model.vo.CComment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
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

        String url = "commuBoardList.do";
        Paging paging = new Paging(listCount, currentPage, limit, url);
        paging.calculator();

        ArrayList<CBoard> list = cBoardService.selectCommuBList(paging, communityid);

        if (list != null && list.size() > 0) {
            mv.addObject("communityid", communityid);
            mv.addObject("list", list);
            mv.addObject("paging", paging);
            mv.setViewName("community/commuBoardList");
        } else {
            mv.addObject("message","게시물이 없습니다. 하나 작성 해주세요.");
            mv.addObject("communityid", communityid);
            mv.setViewName("community/writeCommuPost");
        }
        return mv;
    }

    // 게시글 작성 페이지로 이동
    @RequestMapping("writeCommuPost.do")
    public ModelAndView writeCommuPost(ModelAndView mv, @RequestParam("communityid") int communityid, HttpSession session) {
        mv.addObject("communityid", communityid);
        mv.setViewName("community/writeCommuPost");
        return mv;
    }

// 게시글 작성
    @RequestMapping("insertCommuPost.do")
    public ModelAndView insertCommuPost(ModelAndView mv, CBoard cBoard, HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes, @RequestParam(name = "upfile", required = false) MultipartFile mfile) {

        if (!mfile.isEmpty() && !mfile.getContentType().startsWith("image/")) {
            redirectAttributes.addFlashAttribute("message", "이미지 파일만 업로드 가능합니다.");
            redirectAttributes.addAttribute("communityid", cBoard.getCommunityid());
            mv.setViewName("redirect:commuBoardList.do");

            return mv;
        }

        //\n문자 <br>로 바꿔서 저장
        String contentWithLineBreaks = cBoard.getcBoardContent().replace("\n", "<br>");
        cBoard.setcBoardContent(contentWithLineBreaks);

        String savePath = request.getSession().getServletContext().getRealPath("resources/community_upfiles");
        System.out.println(savePath);

        // 첨부파일이 있을 경우
        if (!mfile.isEmpty()) {

            // 전송온 파일이름 추출함
            String fileName = mfile.getOriginalFilename();
            // 다른 공지글의 첨부파일과 파일명이 중복되어서
            // 덮어쓰기 되는것을 막기 위해, 파일명을 변경해서
            // 폴더에 저장하는 방식을 사용할 수 있음
            // 변경 파일명 : 년월일시분초.확장자
            if (fileName != null && fileName.length() > 0) {
                // 바꿀 파일명에 대한 문자열 만들기
                String renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");

                logger.info("첨부 파일명 확인 : " + fileName + ", " + renameFileName);
                // 폴더에 저장 처리
                try {
                    mfile.transferTo(new File(savePath + "/" + renameFileName));
                } catch (Exception e) {
                    redirectAttributes.addFlashAttribute("message", "첨부파일 저장에 실패 했습니다.");
                    mv.setViewName("redirect:commuBoardList.do?communityid=" + cBoard.getCommunityid());
                    return mv;
                }
                // board 객체에 첨부파일 정보 기록 저장
                cBoard.setcBoardOrifile(fileName);
                cBoard.setcBoardRefile(renameFileName);
            } // 이름바꾸기
        } // 새로운 첨부파일이 있을 때

        int result = cBoardService.insertCommuPost(cBoard);
        if (result > 0) {
            mv.setViewName("redirect:commuBoardList.do?communityid=" + cBoard.getCommunityid());
        } else {
            redirectAttributes.addFlashAttribute("message", "수정에 실패 했습니다.");
            mv.setViewName("redirect:commuBoardList.do?communityid=" + cBoard.getCommunityid());
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
    @RequestMapping(value="updateCommuPost.do", method=RequestMethod.POST)
    public ModelAndView updateCommuPost(ModelAndView mv, CBoard cBoard, HttpSession session, RedirectAttributes redirectAttributes, HttpServletRequest request,
                                        @RequestParam(name = "delflag", required = false) String delFlag,
                                        @RequestParam(name = "upfile", required = false) MultipartFile mfile,
                                        @RequestParam("communityid") int communityid) {
        if(!mfile.getContentType().startsWith("image/")) {
            redirectAttributes.addFlashAttribute("message", "이미지 파일만 업로드 가능합니다.");
            mv.setViewName("redirect:/commuBoardList.do"); // Set the redirect to an appropriate error page
            return mv;
        }

        // 저장 폴더 경로 설정
        String savePath = request.getSession().getServletContext().getRealPath("resources/commuimg");

        //\n문자 <br>로 바꿔서 저장
        String contentWithLineBreaks = cBoard.getcBoardContent().replace("\n", "<br>");
        cBoard.setcBoardContent(contentWithLineBreaks);

        // 첨부파일이 수정 처리된 경우 ---------------------------
        // 1. 원래 첨부파일이 있는데 '파일삭제'를 선택한 경우
        if (cBoard.getcBoardOrifile() != null
                && delFlag != null && delFlag.equals("yes")) {
            // 저장 폴더에 있는 파일을 삭제함
            new File(savePath + "/" +
                    cBoard.getcBoardRefile()).delete();
            // notice 의 파일 정보도 제거함
            cBoard.setcBoardOrifile(null);
            cBoard.setcBoardRefile(null);
        }

        // 2. 게시원글 첨부파일은 1개만 가능한 경우
        // 새로운 첨부파일이 있을때
        if (!mfile.isEmpty()) {
            // 2-1. 이전 첨부파일이 있을 때
            if (cBoard.getcBoardOrifile() != null) {
                // 저장 폴더에 있는 이전 파일을 삭제함
                new File(savePath + "/" +
                        cBoard.getcBoardRefile()).delete();
                // board 의 이전 파일 정보도 제거함
                cBoard.setcBoardOrifile(null);
                cBoard.setcBoardRefile(null);
            }

            // 2-2. 이전 첨부파일이 없을 때
            // 전송온 파일이름 추출함
            String fileName = mfile.getOriginalFilename();

            // 다른 게시글의 첨부파일과 파일명이 중복되어서
            // 덮어쓰기 되는것을 막기 위해, 파일명을 변경해서
            // 폴더에 저장하는 방식을 사용할 수 있음
            // 변경 파일명 : 년월일시분초.확장자
            if (fileName != null && fileName.length() > 0) {
                String renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");

                // handle saving to folder
                try {
                    mfile.transferTo(new File(savePath + "/" + renameFileName));
                } catch (Exception e) {
                    e.printStackTrace();
                    redirectAttributes.addFlashAttribute("message", "Failed to save attachment!");
                    mv.setViewName("common/error"); // Set the redirect to an appropriate error page
                    return mv;
                }

                // Save attachment information record to board object
                cBoard.setcBoardOrifile(fileName);
                cBoard.setcBoardRefile(renameFileName);
            }
        }       // 새로운 첨부파일이 있을 때


        int result = cBoardService.updateCommuPost(cBoard); // Assuming you have a method to update the post in your service
        mv.addObject("communityid", communityid);
        if (result > 0) {
            redirectAttributes.addFlashAttribute("message", "수정 완료!");
            mv.setViewName("redirect:/commuBoardList.do"); // Set the redirect to the appropriate page
        } else {
            redirectAttributes.addFlashAttribute("message", "수정에 실패 하였습니다.");
            mv.setViewName("redirect:/commuBoardList.do"); // Set the redirect to an appropriate error page
        }

        return mv;
    }

    // 게시글 삭제
    @RequestMapping("deleteCommuPost.do")
    public ModelAndView deleteCommuPost(ModelAndView mv, CBoard cBoard, HttpSession session, RedirectAttributes redirectAttributes) {
        int result = cBoardService.deleteCommuPost(cBoard.getcBoardNo());
        if (result > 0) {
            mv.setViewName("redirect:commuBoardList.do?communityid=" + cBoard.getCommunityid());
            redirectAttributes.addFlashAttribute("message", "게시글이 삭제 되었습니다.");
        } else {
            mv.setViewName("redirect:commuBoardList.do?communityid=" + cBoard.getCommunityid());
            redirectAttributes.addFlashAttribute("message", "게시글이 삭제에 실패 했습니다.");
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
    public ModelAndView commuReplyWrite(ModelAndView mv, CComment cComment, RedirectAttributes redirectAttributes, HttpSession session) {

        if (cBoardService.insertCommuReply(cComment) > 0) {

            redirectAttributes.addAttribute("scrollToComment", "true");
            mv.setViewName("redirect:viewCommuPost.do?cBoardNo=" + cComment.getCboardno() + "&communityid=" + cComment.getCommunityid());

        } else {
            redirectAttributes.addAttribute("message", "댓글 작성에 실패했습니다.");
            mv.setViewName("redirect:viewCommuPost.do?cBoardNo=" + cComment.getCboardno() + "&communityid=" + cComment.getCommunityid());
        }
        return mv;
    }

    //커뮤 게시판 댓글 update ajax 사용
    @RequestMapping("updateCommuComment.do")
    public void updateCommuComment(HttpServletResponse response, CComment cComment) {
        int result = cBoardService.updateCommuComment(cComment);
    }

    //커뮤 게시판 댓글 delete ajax 사용
    @RequestMapping(value = "deleteCommuComment.do", method = RequestMethod.POST)
    public void deleteCommuComment(HttpServletResponse response, CComment cComment) {
        int result = cBoardService.deleteCommuComment(cComment);
    }

    //커뮤니티 게시판 search
    @RequestMapping("commuBoardSearch.do")
    public ModelAndView commuBoardSearch(@RequestParam("communityid") int communityid, @RequestParam("keyword") String keyword, @RequestParam(name = "page", required = false) String page, ModelAndView mv){


        int currentPage = 1;

        int limit = 10; // 한 페이지에 출력할 목록 갯수

        String url = "commuBoardSearch.do";
        // 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
        int listCount = cBoardService.commuBoardSearchCount(keyword, communityid);
        Paging paging = new Paging(listCount, currentPage, limit, url);
        paging.calculator();
        ArrayList<CBoard> list = cBoardService.commuBoardSearch(communityid, keyword, paging);
        if (list != null && list.size() > 0) {

            mv.addObject("list", list);
            mv.addObject("paging", paging);
            mv.addObject("communityid", communityid);
            mv.setViewName("community/commuBoardList");
        } else {
            mv.addObject("message", currentPage + " 커뮤니티 조회 실패");
            mv.setViewName("common/error");
        }
        return mv;
    } // searchCGroup

}

