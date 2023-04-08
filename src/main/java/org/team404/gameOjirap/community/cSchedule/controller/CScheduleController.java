package org.team404.gameOjirap.community.cSchedule.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.team404.gameOjirap.community.cGroup.model.service.CGroupService;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cGroup.model.vo.CMember;
import org.team404.gameOjirap.community.cSchedule.model.service.CScheduleService;
import org.team404.gameOjirap.community.cSchedule.model.vo.CSchedule;
import org.team404.gameOjirap.community.cSchedule.model.vo.CVote;
import org.team404.gameOjirap.community.cSchedule.model.vo.ScheduleVote;

@Controller("cschedule")
public class CScheduleController {

    @Autowired
    private CScheduleService cScheduleService;

	@Autowired
	private CGroupService cGroupService;
    // 뷰 페이지 이동 --------------------------------------

    @RequestMapping("csview.do")
    public ModelAndView scheduleView(
            ModelAndView mv,
            @RequestParam("communityid") int communityid
    ){

		ArrayList<CMember> cMembers = cGroupService.selectMembers(communityid);
		mv.addObject("cGroup", cGroupService.selectSingleCGroup(communityid));
    	mv.addObject("cMembers",cMembers);
		mv.addObject("communityid", communityid);
    	mv.setViewName("community/scheduleView");
        return mv;
    }

    @RequestMapping("schvote.do")
    public ModelAndView schVoteView(
            ModelAndView mv,
            @RequestParam("schid") int schid
    ){

    	mv.addObject("schid", schid);
    	mv.setViewName("community/schVoteView");
        return mv;
    }
    // 기능 -----------------------------------------------
    @RequestMapping(value="insertsch.do", method={RequestMethod.GET, RequestMethod.POST})
    public String addSchedule(CSchedule cschedule, @RequestParam("communityid") int communityid,
    		Model model){
    	cschedule.setCommunityId(communityid);
    	System.out.println(cschedule.toString());
    	if(cScheduleService.insertSchdule(cschedule) > 0) {
    		model.addAttribute("communityid", communityid);
    		return "redirect:csview.do?communityid="+communityid;
    	} else {
    		model.addAttribute("message", "일정 등록 실패");
    		return "common/error";
    	}
    }

    @RequestMapping(value="schlist.do", method=RequestMethod.POST)
    @ResponseBody
    public String selectScheduleList(Model model, @RequestParam("communityid") int communityid,
									 @RequestParam("login_id") String login_id) {
    	ArrayList<ScheduleVote> list = cScheduleService.selectScheduleList(communityid);

		JSONObject sendjson = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(ScheduleVote sch: list) {
			JSONObject job = new JSONObject();
			try {
				job.put("schId", sch.getSchId());
				job.put("user_id", sch.getUser_id());
				job.put("schName", URLEncoder.encode(sch.getSchName(), "UTF-8") );
				job.put("schDes", URLEncoder.encode(sch.getSchDes(), "UTF-8"));
				job.put("schStart", sch.getSchStart().toString());
				job.put("schEnd", sch.getSchEnd().toString());
				CVote cvote = new CVote();
				cvote.setSchId(sch.getSchId());
				cvote.setUser_id(login_id);
				if(cScheduleService.selectVote(cvote) != null) {
					CVote voteinfo = cScheduleService.selectVote(cvote);
					job.put("votePart", voteinfo.getVotePart());
				} else {
					job.put("votePart", "N");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			jarr.add(job);
		}
		sendjson.put("list", jarr);
		model.addAttribute("communityid", communityid);
		System.out.println(sendjson.toJSONString());
    	return sendjson.toJSONString();
    }

	@RequestMapping(value="schcal.do", method = RequestMethod.POST)
	@ResponseBody
	public String scheduleCalendar(Model model, @RequestParam("communityid") int communityid){
		ArrayList<CSchedule> list = cScheduleService.selectCalendarList(communityid);
		JSONObject sendjson = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(CSchedule cs : list){
			JSONObject job = new JSONObject();
			try {
				job.put("title", URLEncoder.encode(cs.getSchName(), "utf-8"));
				job.put("start", cs.getSchStart().toString());
				job.put("end", cs.getSchEnd().toString());
			} catch (UnsupportedEncodingException e) {
				throw new RuntimeException(e);
			}
			jarr.add(job);
		}
		sendjson.put("list",jarr);
		System.out.println(sendjson.toJSONString());
		return sendjson.toJSONString();
	}

	// 일정 참가
	@RequestMapping("voting1.do")
	public String joinVote(@RequestParam("schid") int schid, @RequestParam("user_id") String user_id,
						   @RequestParam("communityid") int communityid, Model model){
		CVote cvote = new CVote();
		cvote.setSchId(schid);
		cvote.setUser_id(user_id);
		cvote.setVotePart("Y");

		String redirectUrl = "redirect:csview.do?communityid=" + communityid;

		try {
			int result = cScheduleService.insertOrUpdateVote(cvote);

			if (result == 0) {
				model.addAttribute("message", "일정 참가 요청 실패");
				return "common/error";
			}

			return redirectUrl;
		} catch (Exception e) {
			model.addAttribute("message", "일정 참가 요청 실패");
			return "common/error";
		}
	}

    // 일정 불참
	@RequestMapping("voting2.do")
	public String abstainVote(@RequestParam("schid") int schid, @RequestParam("user_id") String user_id,
									  @RequestParam("communityid") int communityid, Model model){
		CVote cvote = new CVote();
		cvote.setSchId(schid);
		cvote.setUser_id(user_id);
		cvote.setVotePart("N");

		String redirectUrl = "redirect:csview.do?communityid=" + communityid;

		try {
			int result = cScheduleService.insertOrUpdateVote(cvote);

			if (result == 0) {
				model.addAttribute("message", "일정 참가 요청 실패");
				return "common/error";
			}

			return redirectUrl;
		} catch (Exception e) {
			model.addAttribute("message", "일정 참가 요청 실패");
			return "common/error";
		}
	}
}
