package org.team404.gameOjirap.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.team404.gameOjirap.user.model.service.UpdateService;

@Controller
public class UpdateController {

	//이 컨트롤러 클래스 안의 메소드들이 구동되었는지 확인하는 로그를 출력하기 위한 로그 객체를 생성
	private static final Logger logger = LoggerFactory.getLogger(UpdateController.class);
	@Autowired 											//자동 의존성 주입(DI 처리) : 자동 객체생성 됨 => memberService 클래스 Service어노테이션에 명시한 [ memberService ]를 가져와서 선언해준다. 
	private UpdateService updateService;	//memberService랑 연결시켜줬음
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
}//class close









