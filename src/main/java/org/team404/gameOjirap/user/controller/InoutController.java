package org.team404.gameOjirap.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
			
	
	//회원탈퇴 (삭제)요청 처리용  메소드
	//삭제일때는 따로 정보를 보낼필요가 없음 (자동 로그아웃 처리) => String을 리턴한다.
	@RequestMapping("mdel.do")
	public String memberDeleteMethod(@RequestParam("user_id") String user_id, 
															Model model) {
		logger.info("mdel.do 확인용 : \n" + user_id);
		
		if(InoutService.userDeleteMethod(user_id) > 0) {			//회원 탈퇴 성공했을때 (자동 로그아웃 처리해야함) 
			return "redirect:logout.do"; //Controller메소드에서 다른 Controller메소드 호출할 수 있음 (앞에  [    redirect:  ] 를 붙여준다
		}else {		//회원 탈퇴 실패했을때
			model.addAttribute("message", user_id + " : 회원 삭제 실패! 요청사항을 다시 확인해주세요!");			//이 메세지를 message에 담아서 리턴함
			return "common/error";
		}//if
	}//method close
		
	
	
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
	public String selectUser(User user, HttpSession session, SessionStatus status,Model model) {
		
		logger.info("login.do : \n" + user.toString());
		
		//전달온 회원 아이디로 먼저 정보조회함
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
	
	

	
	//아이디 중복확인 요청 처리용 메소드 (ajax 통신)
	@RequestMapping(value="useridchk.do", method={RequestMethod.GET, RequestMethod.POST })		//url패턴은 value로 명시하며 // post방식으로 전송왔을땐 method 속성을 추가해서, post방식임을 명시한다. 
	public void selectDupCheckId(@RequestParam(value="user_id", required=false) String user_id, HttpServletResponse response) throws IOException {		
		int idCount = InoutService.selectDupCheckId(user_id);
		String returnStr = null;		//받아줄 string 객체인 returnStr을 만들어서 담아주고, 해당 값을 리턴할꺼임
		if(idCount == 0) {
			returnStr = "ok";
		}else{
			returnStr = "duble";
		}//if
		
		response.setContentType("text/html; charset=UTF-8"); 		//인코딩처리 
		PrintWriter out = response.getWriter();
		out.append(returnStr);
		out.flush();
		out.close();
	}//method close
	


	
	//닉네임 중복확인 요청 처리용 메소드 (ajax 통신)
	@RequestMapping(value="nickchk.do", method={RequestMethod.GET, RequestMethod.POST })		//url패턴은 value로 명시하며 // post방식으로 전송왔을땐 method 속성을 추가해서, post방식임을 명시한다. 
	public void selectDupCheckNick(@RequestParam(value="user_nickname", required=false) String user_nickname, HttpServletResponse response) throws IOException {		
		int nickCount = InoutService.selectDupCheckNick(user_nickname);
		
		String returnStr = null;		//받아줄 string 객체인 returnStr을 만들어서 담아주고, 해당 값을 리턴할꺼임
		if(nickCount == 0) {
			returnStr = "ok";
		}else{
			returnStr = "duble";
		}//if
		
		response.setContentType("text/html; charset=UTF-8"); 		//인코딩처리 
		PrintWriter out = response.getWriter();
		out.append(returnStr);
		out.flush();
		out.close();
	}//method close
	
	
	
	
	

	//회원가입 요청을 처리하는 용도의 메소드
	@RequestMapping(value="enroll.do", method={RequestMethod.GET, RequestMethod.POST })
	public String userInsertMethod(User user, Model model) {		//메소드이름은 내맘대로 작성	//에러메세지 출력을 위해 Model 준비
		logger.info("enroll.do에 잘 담겼는지 확인용(controller) : \n" + user);		//멤버에 잘 담겼는지 확인용
		
		//패스워드 암호화 처리
		user.setUser_pwd(bcryptPasswordEncoder.encode(user.getUser_pwd()));		//encode() 메소드를 통해 인코딩해서 암호화처리한다.
		logger.info("after encode : " + user.getUser_pwd());
		logger.info("length : (바이트길이)" + user.getUser_pwd().length()); 		//패스워드 길이 확인용
		
		if( InoutService.userInsertMethod(user) > 0) {	
						//회원가입을 성공했다면?
			return "common/main"; 		//리턴할 url패턴 리턴 
		}else{			
						//회원가입을 실패했다면?
			model.addAttribute("message", "회원가입 실패! 요청사항을 다시 확인해주세요!");			//에러는 model의 addAttribute를 이용함
			return "common/error";
		}//if
	}//method close
	
	
	
	
	
}//class close









