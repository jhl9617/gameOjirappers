package org.team404.gameOjirap.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.team404.gameOjirap.user.model.service.UserService;
import org.team404.gameOjirap.user.model.vo.User;

@Controller
public class MoveController {
	
	private final Logger logger = LoggerFactory.getLogger(MoveController.class);
	@Autowired 									
	private UserService UserService;	
	
	//로그인 페이지 이동 처리용 --------------------------------------------------------------------------------
	@RequestMapping(value="loginPage.do", method= {RequestMethod.GET, RequestMethod.POST} ) 
	public String moveLoginPage() {
		return "user/loginPage";
	}//method close
	

	
	
	//회원가입 페이지 이동 처리용 --------------------------------------------------------------------------------	
	@RequestMapping(value="enrollPage.do", method= {RequestMethod.GET, RequestMethod.POST} )
	public String moveEnrollPage() {
		return "user/enrollPage";		
	}//method close
	
	
	
	
	//마이페이지 내보내기용
	@RequestMapping(value="moveup.do", method= {RequestMethod.GET, RequestMethod.POST } )
	public String moveMyPage(@RequestParam("user_id") String user_id,	Model model) {	
		User user = UserService.selectUser(user_id);
		
		if(user != null) {
			model.addAttribute("user", user);
			return "user/userDatailPage";
		}else {
			model.addAttribute("message", user_id + " : 회원조회 실패!");
			return "common/error";
		}//if
	}//method close
	
	
	
	
	//회원정보수정페이지 이동 처리용 --------------------------------------------------------------------------------	
	@RequestMapping(value="moveUpdatePage.do", method= {RequestMethod.GET, RequestMethod.POST })
	public String moveUpdatePage(@RequestParam("user_id") String user_id, Model model) {
		User user = UserService.selectUser(user_id);
		
		if(user != null) {
			model.addAttribute("user", user);
			return "user/updatePage";
		}else {
			model.addAttribute("message", user_id + " : 회원조회 실패!");
			return "common/error";
		}//if
	}//method close
	
	
	
	
	//탈퇴 페이지 이동 처리용 --------------------------------------------------------------------------------	
	@RequestMapping(value="delPage.do", method= {RequestMethod.GET, RequestMethod.POST })
	public String moveDelPage(@RequestParam("user_id") String user_id, Model model) {
		User user = UserService.selectUser(user_id);
		
		if(user != null) {
			model.addAttribute("user", user);
			return "user/delPage";
		}else {
			model.addAttribute("message", user_id + " : 탈퇴페이지 이동 실패!");
			return "common/error";

		} // if
	}// method close

	@RequestMapping(value="uadmin.do", method= {RequestMethod.GET, RequestMethod.POST} )
	public ModelAndView moveUserAdmin(ModelAndView mv, @RequestParam(name = "page", required = false) String page)  {
      ArrayList<User> list = UserService.selectUserList();
      int listCount = list.size();
      
      if(list != null && list.size() > 0){
         mv.addObject("list", list);
         mv.addObject("listCount", listCount);
         
         mv.setViewName("user/userAdmin");
      }else {
         mv.addObject("message" + "페이지 목록 조회 실패!");
         mv.setViewName("common/error");
      }
      
      return mv;
}

	
	//회원활동관리 페이지 이동 처리용 ---------------------------------------------------------------------------------------	
	@RequestMapping(value="uban.do", method= {RequestMethod.GET, RequestMethod.POST} )
	public ModelAndView moveUserBan(ModelAndView mv, @RequestParam("user_id") String user_id)  {
		User user = UserService.selectUser(user_id);
		
		 if(user != null){
			mv.addObject("user", user);
			mv.setViewName("user/userBan");
		 }else {
	         mv.addObject("message" + "페이지 목록 조회 실패!");
	         mv.setViewName("common/error");
	      }

		 return mv;
	}// method close

