package org.team404.gameOjirap.community.cGroup.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.team404.gameOjirap.community.cGroup.model.service.CGroupService;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

@Controller
public class CGroupController {

    private static final Logger logger = LoggerFactory.getLogger(CGroupController.class);

    @Autowired
    private CGroupService cGroupService;


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
    @RequestMapping(value = "commuMain.do", method={ RequestMethod.GET, RequestMethod.POST })
    public String moveCommuMain(HttpSession session, Model model) {


        return "community/commuMain";
    }


    //커뮤니티 메인에서 커뮤니티 생성 form으로 넘어가는 method
    @RequestMapping(value = "commuCreate.do", method={ RequestMethod.GET, RequestMethod.POST })
    public String creatCommuMethod(HttpSession session, Model model, @RequestParam(name = "communityname") String communityname) {



        //커뮤 메인에서 입력한 생성할 이름 생성 form에 기본적으로 적용 되도록
        model.addAttribute("communityname", communityname);

        return "community/commuCreate";
    }

    //커뮤니티 생성 form에서 submit을 눌렀을때
    @RequestMapping(value = "CommuCreateSubmit.do", method=RequestMethod.POST)
    public String creatCommuMethod(CGroup cGroup, Model model, HttpServletRequest request) {


        //유저 아이디 임시로 입력
        cGroup.setUser_id("admin");
        System.out.println(cGroup);
        //이미지 첨부 미구현
        if (cGroupService.insertCGroup(cGroup) > 0) {
            // 게시글 등록 성공시 목록 보기 페이지로 이동
            /*cGroupService.insertCMember();    유저 id가져와야함*/
            return "redirect:commuMain.do";
        } else {
            model.addAttribute("message", "새 커뮤니티 생성 실패");
            return "common/error";
        }
    }




}
