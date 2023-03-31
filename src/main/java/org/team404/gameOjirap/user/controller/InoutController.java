package org.team404.gameOjirap.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.team404.gameOjirap.user.model.service.InoutService;
import org.team404.gameOjirap.user.model.vo.User;

@Controller
public class InoutController {
	private final Logger logger = LoggerFactory.getLogger(InoutController.class);
	
	@Autowired 									
	private InoutService InoutService;	
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
			
	//로그아웃 처리용 메소드
	@RequestMapping(value="logout.do", method= {RequestMethod.GET, RequestMethod.POST })	
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
	@RequestMapping(value="login.do", method= {RequestMethod.GET, RequestMethod.POST } )
	public String loginMethod(User user, HttpSession session, SessionStatus status,Model model) {
		
		logger.info("login.do : \n" + user.toString());
		User loginUser = InoutService.selectUser(user.getUser_id());
		
		if(loginUser != null) {		//로그인한 회원이 있다면
			this.bcryptPasswordEncoder.matches(user.getUser_pwd(), loginUser.getUser_pwd());		//원래 pwd와 로그인한 유저pwd가 같다면
																																					//true면? 일치하는것이고, false면? 일치하지 않는것임
			session.setAttribute("loginUser", loginUser);  //세션에 저장한다
			status.setComplete();  		//로그인 요청 성공 => 200을 전송함
			return "common/main";
		}else{
			model.addAttribute("message", "로그인 실패 : 아이디나 암호를 확인해주세요<br>" + "또는, 로그인 제한된 회원인지 관리자에게 문의하세요.");	
			//메세지를 담아서 내보낸다
			return "common/error";
		}//if
	}//method close
	
	
	
//	//관리자기능 : 회원 로그인 제한&가능 처리용 메소드
//	@RequestMapping(value="loginok.do", method= {RequestMethod.GET, RequestMethod.POST }) 
//	public String changeLoginOKMethod(User user, MyPage user_status, Model model) {			//commend객체를 이용해서 바로 받는다 (member)
//		logger.info("loginok.do작동완료 : " + user.getUser_id() + ", " + user_status.getUser_status());		//값 잘 받아왔는지 확인용
//		
//		if (InoutService.updateLoginok(user) > 0) {		//updateLoginok 값 수정에 성공 했다면
//			return "redirect:mlist.do";				// mlist.do가 실행됨 (수정된값으로 실시간으로 다시 조회해옴)
//		}else {
//			model.addAttribute("message", "로그인 제한/허용 처리 오류 발생!");
//			return "common/error";
//		}//if
//	}//method close
	
	
	
	
	
	
}//class close









