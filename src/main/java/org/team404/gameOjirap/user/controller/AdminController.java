package org.team404.gameOjirap.user.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.team404.gameOjirap.user.model.service.UserService;
import org.team404.gameOjirap.user.model.vo.User;

@Controller
public class AdminController {

	private final Logger logger = LoggerFactory.getLogger(InoutController.class);
	
	@Autowired 									
	private UserService UserService;	
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//회원탈퇴 (삭제)요청 처리용  메소드
		//삭제일때는 따로 정보를 보낼필요가 없음 (자동 로그아웃 처리) => String을 리턴한다.
		@RequestMapping("adminDel.do")
		public String userDeleteMethod(@RequestParam(value="user_id", required=false) String user_id, 
														Model model) {
			logger.info("삭제할 회원아이디 : " + user_id);
			
			if(UserService.userDeleteMethod(user_id) > 0 ) {			//회원 탈퇴 성공했을때 (자동 로그아웃 처리해야함) 
				return "redirect:logout.do"; //Controller메소드에서 다른 Controller메소드 호출할 수 있음 (앞에  [    redirect:  ] 를 붙여준다
			}else {		//회원 탈퇴 실패했을때
				model.addAttribute("message", user_id + " : 회원 삭제 실패! 요청사항을 다시 확인해주세요!");			//이 메세지를 message에 담아서 리턴함
				return "common/error";
			}//if
		}//method close
		
		//회원관리 페이지 이동 처리용 ------
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
		
		
		// 회원관리 (상세)페이지 이동 처리용 ---------------------------------------------------------------------------------------	
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
		
		// 회원 정지 처리용---------------------------------------------------------------------------
		@RequestMapping(value="adminUBan.do", method = {RequestMethod.GET, RequestMethod.POST} )
		public ModelAndView userBan(ModelAndView mv, @RequestParam("user_id") String user_id, @RequestParam String selecttinput) {
			User user = UserService.selectUser(user_id);
			GregorianCalendar cal = new GregorianCalendar();
			
			switch(selecttinput) {
			case "1day" : cal.add(GregorianCalendar.DATE, 1); break;
			case "1week" : cal.add(GregorianCalendar.WEEK_OF_MONTH, 1); break;
			case "1month" : cal.add(GregorianCalendar.MONTH, 1); break;
			case "1year" : cal.add(GregorianCalendar.YEAR, 1);  break;
			}
			
			java.util.Date UDate = cal.getTime();
			java.sql.Date ban_release_date = new java.sql.Date(UDate.getTime());
			
			if(user != null) {
				user.setUser_status("pause");
				user.setBan_release_date(ban_release_date);
				
				UserService.updateBan(user);
				
				mv.addObject("user", user);
				mv.setViewName("user/userBan");
			}else {
		         mv.addObject("message" + "페이지 목록 조회 실패!");
		         mv.setViewName("common/error");
		    }
			
			return mv;
			
		}
}
