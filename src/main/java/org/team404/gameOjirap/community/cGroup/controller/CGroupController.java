package org.team404.gameOjirap.community.cGroup.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.dao.DuplicateKeyException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.team404.gameOjirap.common.FileNameChange;
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cGroup.model.service.CGroupService;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cGroup.model.vo.CMember;
import org.team404.gameOjirap.community.cGroup.model.vo.CReport;
import org.team404.gameOjirap.community.cGroup.model.vo.CommunityReq;
import org.team404.gameOjirap.user.model.service.UserService;
import org.team404.gameOjirap.user.model.vo.User;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

@Controller
public class CGroupController {

    private static final Logger logger = LoggerFactory.getLogger(CGroupController.class);

    @Autowired
    private CGroupService cGroupService;

    @Autowired
    private UserService userService;
   /* @RequestMapping("commuMainList.do")
public String commuMainList() throws UnsupportedEncodingException {


        ArrayList<CGroup> list = cGroupService.selectMain10();
        logger.info("commuMainList.do : " + list.size()); // 10 출력 확인

        // 전송용 json 객체 준비
        JSONObject sendJson = new JSONObject();
        // 리스트 저장할 json 배열 객체 준비
        JSONArray jarr = new JSONArray();

        // list 를 jarr 에 옮기기 (복사)
        for (CGroup cGroup : list) {
            // notice 의 각 필드값 저장할 json 객체 생성함
            JSONObject job = new JSONObject();

            job.put("communityid", cGroup.getCommunityid());
            // 한글에 대해서는 인코딩해서 json에 담도록 함
            // 한글깨짐 방지
            job.put("communityname", URLEncoder.encode(cGroup.getCommunityname(), "utf-8"));
            // 날짜는 반드시 toString() 으로 문자열로 바꿔서
            // json 에 담아야 함
            job.put("user_id", cGroup.getUser_id());

            jarr.add(job); // job 를 jarr 에 추가함
        }

        // 전송용 객체에 jarr 을 담음
        sendJson.put("list", jarr);

        // json을 json string 타입으로 바꿔서 전송되게 함
        return sendJson.toJSONString(); // 뷰리졸버로 리턴함
        // servlet-context.xml 에 json string 내보내는
        // JsonView 라는 뷰리졸버 추가 등록해야 함

    }*/

    //커뮤니티 메인 화면으로 이동하는 method
    @RequestMapping(value = "commuMain.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView moveCommuMain(@RequestParam(name = "page", required = false) String page,
                                      @RequestParam(name = "message", required = false) String message,ModelAndView mv) {

        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }


// 한 페이지에 게시글 10개씩 출력되게 하는 경우 :
        // 페이징 계산 처리 - 별도의 클래스로 작성해서 이용해도 됨
        int limit = 10; // 한 페이지에 출력할 목록 갯수
        // 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
        int listCount = cGroupService.selectListCount();

        String url = "commuMain.do";
        Paging paging = new Paging(listCount, currentPage, limit, url);
        paging.calculator();
        System.out.println(paging);
        ArrayList<CGroup> list = cGroupService.selectList(paging);

        if (list != null && list.size() > 0) {
            mv.addObject("list", list);
            mv.addObject("paging", paging);
            mv.addObject("message", message);
            mv.addObject("listCount", listCount);
            mv.setViewName("community/commuMain");
        } else {
            mv.addObject("message", currentPage + " 커뮤니티 조회 실패");
            mv.setViewName("common/error");
        }
        return mv;
    }

    //커뮤니티 메인에서 커뮤니티 생성 form으로 넘어가는 method
    @RequestMapping(value = "commuCreate.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String creatCommuMethod(HttpSession session, Model model, @RequestParam(name = "communityname") String communityname) {

        //커뮤 메인에서 입력한 생성할 이름 생성 form에 기본적으로 적용 되도록
        model.addAttribute("communityname", communityname);
        return "community/commuCreate";
    }

    //커뮤니티 생성 form에서 submit을 눌렀을때
    @RequestMapping(value = "CommuCreateSubmit.do", method = RequestMethod.POST)
    public String creatCommuMethod(CGroup cGroup, Model model, HttpServletRequest request,
                                   @RequestParam(name="mfile", required = false) MultipartFile mfile) {
        if(!mfile.isEmpty()){
            String savePath = request.getSession().getServletContext().getRealPath("resources/commuimg");
            String filename = mfile.getOriginalFilename();

            if(filename != null){
                String rename = FileNameChange.change(filename, "yyyyMMddHHmmss");

                File renameFile = new File(savePath + "\\" + rename);
                try {
                    mfile.transferTo(renameFile);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                cGroup.setCommunityimgori(filename);
                cGroup.setCommunityimgrename(rename);
            }
        }
        //이미지 첨부 미구현
        if (cGroupService.selectCGroup(cGroup.getCommunityname()) < 1 && cGroupService.insertCGroup(cGroup) > 0) {

            //커뮤 생성자 멤버 추가
            CMember cMember = new CMember(cGroup.getUser_id(), cGroup.getCommunityid(), "Y");
            System.out.println(cGroup);
            System.out.println(cMember);

            int check = cGroupService.insertCMember(cMember, cGroup);
            // 게시글 등록 성공시 목록 보기 페이지로 이동
            if (check == -1) {
                model.addAttribute("message", "이름이 중복되는 커뮤니티가 이미 존재합니다.");
                return "common/error";
            } else {
                return "redirect:commuMain.do";
            }
        } else {
            model.addAttribute("message", "새 커뮤니티 생성 실패");
            return "common/error";
        }
    }

    //커뮤니티 detailView
    @RequestMapping("viewgroup.do")
    public ModelAndView commuDetailMethod(ModelAndView mv, @RequestParam("communityid") int communityid
            , @RequestParam(name = "page", required = false) String page,
            @RequestParam(name="message", required = false) String message, HttpSession session) {
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }
        CGroup cGroup = cGroupService.selectSingleCGroup(communityid);

        if (cGroup != null) {

            mv.addObject("communityid", communityid);
            mv.addObject("group", cGroupService.selectSingleCGroup(communityid));
            mv.addObject("currentPage", currentPage);
            mv.addObject("message", message);

            mv.setViewName("community/viewGroup");
        } else {
            mv.addObject("message", communityid + "번 커뮤니티 조회 실패!");
            mv.setViewName("common/error");
        }
        return mv;
    }

    // 요청 페이지로 이동
    @RequestMapping("movejoinpage.do")
    public String moveRequestPage(@RequestParam("communityid") int communityid, Model model) {
        CGroup cGroup = cGroupService.selectSingleCGroup(communityid);
        if (cGroup != null) {
            model.addAttribute("communityname", cGroup.getCommunityname());
            model.addAttribute("communityid", communityid);
            return "community/joinRequest";
        } else {
            model.addAttribute("message", "신청 양식을 불러오지 못했습니다.");
            return "common/error";
        }
    }

    // 멤버 목록 페이지 이동
    @RequestMapping("memberinfo.do")
    public String memberView(@RequestParam("communityid") int communityid,
                             @RequestParam(name="page", required = false) String page, Model model) {
        int currentPage = 1;
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }
        int limit = 10;
        int listCount = cGroupService.selectMemberListCount(communityid);
        String url = "memberinfo.do";
        Paging paging = new Paging(listCount, currentPage, limit, url, communityid);

        ArrayList<CMember> list = cGroupService.selectMembers(communityid);
        model.addAttribute("paging", paging);
        model.addAttribute("list", list);
        model.addAttribute("communityid", communityid);
        return "community/memberView";
    }

    // 커뮤니티 신고 페이지 이동
    @RequestMapping("moveReport.do")
    public String reportPageView(@RequestParam("communityid") int communityid, HttpServletRequest request, Model model) {
        // 세션에 있는 로그인한 유저 정보 조회
        String user_id = ((User) request.getSession().getAttribute("loginUser")).getUser_id();
        String communityname = cGroupService.selectSingleCGroup(communityid).getCommunityname();
        model.addAttribute("user_id", user_id);
        model.addAttribute("communityid", communityid);
        model.addAttribute("communityname", communityname);
        return "community/report";
    }

    // 요청 정보 저장
    @RequestMapping(value = "req.do", method = RequestMethod.POST)
    public String insertRequest(CommunityReq req, Model model) {

        try {
            ArrayList<CommunityReq> list = cGroupService.selectRequests(req.getCommunityid());
            if (cGroupService.insertRequest(req) > 0) {
                return "redirect:viewgroup.do?communityid=" + req.getCommunityid();
            } else {
                return "common/error";
            }
        } catch (Exception e){
            model.addAttribute("message", "이미 요청한 커뮤니티입니다.");
            return "redirect:viewgroup.do?communityid=" + req.getCommunityid();
        }
    }

    // managePage로 communityid 값 가지고 이동
    @RequestMapping("managePage.do")
    public String goManagePage(@RequestParam("communityid") int communityid, Model model) {
        model.addAttribute("communityid", communityid);
        ArrayList<CommunityReq> requests = cGroupService.selectRequests(communityid);
        model.addAttribute("group", cGroupService.selectSingleCGroup(communityid));
        model.addAttribute("requests", requests);

        return "community/managePage";
    }

    // acceptreq.do
    @RequestMapping("acceptreq.do")
    public String acceptRequest(@RequestParam("reqno") int reqno, Model model) {
        CommunityReq req = cGroupService.selectRequest(reqno);
        CGroup cGroup = cGroupService.selectSingleCGroup(req.getCommunityid());
        CMember cMember = new CMember(req.getUser_id(), req.getCommunityid(), "N");
        if (cGroupService.insertCMember(cMember, cGroup) > 0 && cGroupService.deleteRequest(reqno) > 0) {

            return "redirect:managePage.do?communityid=" + req.getCommunityid();
        } else {
            model.addAttribute("message", "요청을 수락하지 못했습니다.");
            return "common/error";
        }
    } //  acceptRequest

    // declinereq.do
    @RequestMapping("declinereq.do")
    public String declineRequest(@RequestParam("reqno") int reqno, Model model) {
        CommunityReq req = cGroupService.selectRequest(reqno);
        if (cGroupService.deleteRequest(reqno) > 0) {
            return "redirect:managePage.do?communityid=" + req.getCommunityid();
        } else {
            model.addAttribute("message", "요청을 거절하지 못했습니다.");
            return "common/error";
        }
    } // declineRequest

    // managemember.do
    @RequestMapping(value = "managemember.do", method = RequestMethod.POST)
    @ResponseBody
    public String manageMember(@RequestParam("communityid") int communityid) {
        ArrayList<CMember> members = cGroupService.selectMembers(communityid);
        JSONObject json = new JSONObject();
        JSONArray jarr = new JSONArray();
        for (CMember member : members) {
            User user = userService.selectUser(member.getUser_id());
            JSONObject job = new JSONObject();
            job.put("admin_id", user.getAdmin_id());
            job.put("user_id", user.getUser_id());
            job.put("user_nickname", user.getUser_nickname());
            jarr.add(job);
        }
        json.put("list", jarr);
        return json.toJSONString();
    } // manageMember

    // 멤버 탈퇴
    @RequestMapping("deletemember.do")
    public String deleteMember(CMember cmember, Model model) {
        int communityid = cmember.getCommunityid();
        if (cGroupService.deleteMember(cmember) > 0) {
            return "redirect:managePage.do?communityid=" + communityid;
        } else {
            model.addAttribute("message", "멤버를 삭제하지 못했습니다.");
            return "common/error";
        }
    } // deleteMember

    // 커뮤니티 수정
    @RequestMapping(value = "updatecommu.do", method = RequestMethod.POST)
    public String updateCGroup(CGroup cGroup, Model model,
                               @RequestParam(name = "delFlag", required = false) String delFlag,
                               @RequestParam("orifile") MultipartFile mfile,
                               HttpServletRequest request) throws ServletException, IOException {
        if (!mfile.getContentType().startsWith("image/")) {
            model.addAttribute("message", "이미지 파일만 업로드 가능합니다.");
            return "common/error";
        }
        if (cGroup.getCommunityname().equals("")) {
            cGroup.setCommunityname(cGroupService.selectSingleCGroup(cGroup.getCommunityid()).getCommunityname());
        }
        if (cGroup.getCommunitydesc().equals("")) {
            cGroup.setCommunitydesc(cGroupService.selectSingleCGroup(cGroup.getCommunityid()).getCommunitydesc());
        }
        System.out.println(cGroupService.selectSingleCGroup(cGroup.getCommunityid()).getCommunityname() + "++++++" + cGroup.getCommunitydesc());
        String savePath = request.getSession().getServletContext().getRealPath("resources/commuimg");
        if (cGroup.getCommunityimgori() != null && delFlag != null && delFlag.equals("yes")) {
            new File(savePath + "\\" + cGroup.getCommunityimgrename()).delete();
            cGroup.setCommunityimgori(null);
            cGroup.setCommunityimgrename(null);
        }

        if (!mfile.isEmpty()) {
            if (cGroup.getCommunityimgori() != null) {
                new File(savePath + "\\" + cGroup.getCommunityimgrename()).delete();
                cGroup.setCommunityimgori(null);
                cGroup.setCommunityimgrename(null);
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
                cGroup.setCommunityimgori(fileName);
                cGroup.setCommunityimgrename(rename);
            } // if fileName
        } // if !mfile.isEmpty()

        if (cGroupService.updateCGroup(cGroup) > 0) {
            return "redirect:managePage.do?communityid=" + cGroup.getCommunityid();
        } else {
            model.addAttribute("message", "커뮤니티 수정에 실패했습니다.");
            return "common/error";
        }
    } // updateCGroup

    // 커뮤니티 삭제
    @RequestMapping("deletecommu.do")

    public String deleteCGroup(@RequestParam("communityid") int communityid, Model model) {
        if (cGroupService.deleteCGroup(communityid) > 0) {

            return "redirect:commuMain.do";
        } else {
            model.addAttribute("message", "커뮤니티 삭제에 실패했습니다.");
            return "common/error";
        }
    } // deleteCGroup


    // 커뮤니티 신고
    @RequestMapping(value="reportcommu.do", method=RequestMethod.POST)
    public String reportCGroup(CReport cReport, Model model) {
        logger.info("reportCGroup : " + cReport);
        try{
            if (cGroupService.insertReport(cReport) > 0) {
                model.addAttribute("message", "커뮤니티 신고에 성공했습니다.");
                return "redirect:commuMain.do";
            } else {
                model.addAttribute("message", "커뮤니티 신고에 실패했습니다.");
                return "redirect:commuMain.do";
            }
        } catch (DuplicateKeyException e) {
            model.addAttribute("message", "이미 신고하신 커뮤니티입니다.");
            return "redirect:commuMain.do";
        }
    }// reportCGroup

    // 커뮤니티 검색
    @RequestMapping("commuSearch.do")
    public ModelAndView searchCGroup(@RequestParam("keyword") String keyword, @RequestParam(name = "page", required = false) String page, ModelAndView mv){


        int currentPage = 1;

        int limit = 10; // 한 페이지에 출력할 목록 갯수
        // 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
        int listCount = cGroupService.searchCGroupCount(keyword);
        String url = "commuSearch.do";
        Paging paging = new Paging(listCount, currentPage, limit, url);
        paging.calculator();
        ArrayList<CGroup> list = cGroupService.searchCGroup(keyword, paging);
        if (list != null && list.size() > 0) {

            mv.addObject("list", list);
            mv.addObject("paging", paging);
            mv.addObject("listCount", listCount);

            mv.setViewName("community/commuMain");
        } else {
            mv.addObject("message", currentPage + " 커뮤니티 조회 실패");
            mv.setViewName("common/error");
        }
        return mv;
    } // searchCGroup
} // end of class
