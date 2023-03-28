package org.team404.gameOjirap.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MoveController {

	private static final Logger logger = LoggerFactory.getLogger(MoveController.class);
	
	
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
	@RequestMapping(value="moveUpdatePage.do", method= {RequestMethod.POST} )
	public String moveUpdatePage()  {
		return "user/moveUpdatePage";		
	}//method close
	
	
	
}//class close









