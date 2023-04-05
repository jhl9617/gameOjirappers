package org.team404.gameOjirap.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.team404.gameOjirap.user.model.service.UserService;
import org.team404.gameOjirap.user.model.vo.User;

@Controller
public class UpdateController {

	//이 컨트롤러 클래스 안의 메소드들이 구동되었는지 확인하는 로그를 출력하기 위한 로그 객체를 생성
	private static final Logger logger = LoggerFactory.getLogger(UpdateController.class);
	@Autowired 											//자동 의존성 주입(DI 처리) : 자동 객체생성 됨 => memberService 클래스 Service어노테이션에 명시한 [ memberService ]를 가져와서 선언해준다. 
	private UserService UserService;	//Service랑 연결시켜줬음
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	


	//회원정보수정 요청 처리용 메소드
	@RequestMapping("moveUpdatePage.do")
	public String updateUser(String user_id,Model model,
											@RequestParam(value="origin_user_pwd", required=false) String origin_user_pwd) {			//Commend 객체 사용함
		logger.info("moveUpdatePage.do : " + user_id); 				//데이터 입력값이 잘 넘어갔는지 log로 확인하는 용도
		User user = UserService.selectUser(user_id);
		user.getUser_pwd();
		
		//새로운 암호가 전송왔다면, 패스워드 암호화 처리함
		String user_pwd = user.getUser_pwd().trim();	//쓸모없는 공백이 딸려오는것을 방지하기위해 trim()메소드 사용
		if(user_pwd != null && user_pwd.length() > 0) {
				//db테이블에 기록된 기존의 암호와 비교했을때 다른 값이라면? (원래 암호랑 새롭게 입력한 암호랑 비교작업이 필요함
			if (! this.bcryptPasswordEncoder.matches(user_pwd,origin_user_pwd)) {		//새로운비번과 원래비번이 일치하지않는다면?
				
				//member에 새로운 패스워드를 암호화해서 기록함
				user.setUser_pwd(this.bcryptPasswordEncoder.encode(user_pwd)); //새로운패스워드를 설정해서 바꾼다 =>인코딩처리 후 바꿔줌
			}else{
				//새로운 패스워드값이 없다면, user에 원래 패스워드를 보내준다
				user.setUser_pwd(origin_user_pwd);
			}//if
		}//if
		if(UserService.updateUser(user) > 0) {		//수정이 성공했다면?		=> Controller의 다른 Method를 직접 호출할 수 있음.
//			return "redirect:myinfo.do?userid=" + user.getUser_id();		
			model.addAttribute("user", user);
			return "user/updatePage";		
		}else {															//수정이 실패했다면?
			model.addAttribute("message", user_id + " : 회원 정보 수정 실패! 요청사항을 다시 확인해주세요!");
			return "common/error";
		}
	}//method close
	
	
}//class close









