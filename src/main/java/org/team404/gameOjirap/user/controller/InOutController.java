package org.team404.gameOjirap.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.team404.gameOjirap.user.model.service.InOutService;

@Controller
public class InOutController {
	private static final Logger logger = LoggerFactory.getLogger(InOutController.class);
	
	@Autowired 									
	private InOutService inoutService;	
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
			
	//로그아웃 처리용 메소드
	@RequestMapping(value="logout.do", method=RequestMethod.GET)	
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
	
	
	// 로그인 요청처리용
	@RequestMapping(value="login.do", method= RequestMethod.POST )
	public String loginMethod(User user, HttpSession session, SessionStatus status,Model model) {
		logger.info("login.do : \n" + user.toString());
//		User loginUser = inoutService.selectUser(user_id);
		
		
		return "common/error";
		
		
	}//method close
	
	
	
	
	
	
	
	
	
	
//	int userDeleteMethod(String user_id);  						// 회원탈퇴 요청처리용
//	int userInsertMethod(User user);    								// 회원가입 요청처리용
//	int levelMethod(User user);     										// 현재등급 출력용
//	int checkanswer(User user);      									// 본인확인용
//	int selectDupCheckId(String user_id); 							// 아이디 중복확인용
//	int selectDupCheckNick(String user_nickname);			// 닉네임 중복확인용
//	int checkanswer(String confirm_answer);						//본인확인 질문 확인용
//	int updateLoginok (User user);										//로그인가능 확인용
	
	
	
	
	
	
	
}//class close









