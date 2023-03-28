package org.team404.gameOjirap.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InOutController {
	private static final Logger logger = LoggerFactory.getLogger(InOutController.class);
	
	
			
		
	
	//로그아웃 처리용 메소드
	@RequestMapping(value="ulogout.do", method=RequestMethod.GET)	
	public String logoutMethod(HttpServletRequest request,Model model) {	
		HttpSession session = request.getSession(false);
		logger.info("ulogout.do : \n" + session);	
		if(session != null) {	
			session.invalidate();		
			return "common/main";
		}else{		
			model.addAttribute("message", "로그인 세션이 존재하지 않습니다.");	
			return "common/error";
		}//if
	}//method close
	
	
	
	
	
	
}//class close









