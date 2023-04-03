package org.team404.gameOjirap.user.controller;

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
import org.team404.gameOjirap.user.model.service.InoutService;
import org.team404.gameOjirap.user.model.service.UpdateService;
import org.team404.gameOjirap.user.model.vo.User;

@Controller
public class MyPageController {

	private final Logger logger = LoggerFactory.getLogger(InoutController.class);
	
	@Autowired 									
	private InoutService InoutService;	
	@Autowired 									
	private UpdateService UpdateService;	
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	//마이페이지 클릭시 '내 정보 보기' 요청 처리용 메소드 // 리턴타입은 String, ModelAndView를 사용할 수 있음
	@RequestMapping(value="userDatailPage.do", method={RequestMethod.GET, RequestMethod.POST })		//get방식은 기본이므로, 구문 생략할수있음
	public ModelAndView userDatailMethod(@RequestParam("user_id") String user_id,			//[  @RequestParam("useri_d") ]  어노테이션을 통해 값을 꺼내고, 객체 String userid에 저장한다
																		ModelAndView mv) {			//()소괄호안에 바로 ModelAndView객체생성(리턴용 객체)한다
		//서비스로 아이디 전달하고, 해당 회원정보 받기
		User myuser = InoutService.selectUser(user_id);
		
		if(myuser != null) {
			mv.addObject("user", myuser);				//꺼내서 저장함 (get / set)
			//Model 또는 ModelAndView에 저장하는 것은 [  request.setAttribute("user", user); ] 과 같음
			mv.setViewName("user/userDatailPage");		//페이지 이동
		}else{
			mv.addObject("message", user_id + " : 회원정보 조회에 실패했습니다.");
			mv.setViewName("common/error");
		}//if
		return mv;
	}//method close
	
	
	
	
	
	
	
}//class close









