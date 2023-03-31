package org.team404.gameOjirap.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.team404.gameOjirap.user.model.service.MoveService;
import org.team404.gameOjirap.user.model.vo.User;

@Controller
public class MoveController {
	
	@Autowired 
	private MoveService moveService;
	
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
	
	
	
	
	//마이페이지 이동 처리용 ---------------------------------------------------------------------------------------	
	@RequestMapping(value="userDatailPage.do", method= {RequestMethod.POST} )
	public String moveUserDatailPage()  {
		return "user/userDatailPage";		
	}//method close
	
	
	
	
	//회원정보수정페이지 이동 처리용 --------------------------------------------------------------------------------	
	@RequestMapping(value="moveUpdatePage.do", method= RequestMethod.GET )
	public String moveUpdatePage(@RequestParam("user_id") String user_id, Model model)  {
		User user = moveService.selectUser(user_id);
		
		if(user != null) {
			model.addAttribute("user", user);
			return "user/moveUpdatePage";
		}else {
			model.addAttribute("message", user_id + " : 회원조회 실패!");
			return "common/error";
		}//if
	}//method close
	
	//회원활동관리 페이지 이동 처리용 ---------------------------------------------------------------------------------------	
	@RequestMapping(value="uban.do", method= {RequestMethod.POST} )
	public String moveUserBan()  {
		return "user/userBan";		
	}//method close
	
	
}//class close









