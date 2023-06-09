package org.team404.gameOjirap.user.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.team404.gameOjirap.boardGen.model.vo.BoardGen;
import org.team404.gameOjirap.common.board.Comment;
import org.team404.gameOjirap.community.cGroup.model.service.CGroupService;
import org.team404.gameOjirap.community.cGroup.model.vo.CGroup;
import org.team404.gameOjirap.community.cboard.model.vo.CComment;
import org.team404.gameOjirap.user.model.service.UserService;
import org.team404.gameOjirap.user.model.vo.User;

@Controller
public class UpdateController {

	//이 컨트롤러 클래스 안의 메소드들이 구동되었는지 확인하는 로그를 출력하기 위한 로그 객체를 생성
	private static final Logger logger = LoggerFactory.getLogger(UpdateController.class);
	@Autowired 											
	private UserService UserService;
	@Autowired 										
	private CGroupService CGroupService;	
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	


	//회원정보수정 요청 처리용 메소드
	@RequestMapping(value="UpdateUser.do", method = RequestMethod.POST)
	public String updateUser(User user,Model model,
											@RequestParam(value="origin_user_pwd", required=false) String origin_user_pwd) {			//Commend 객체 사용함
		logger.info("moveUpdatePage.do데이터넘어감 : " + user); 				//데이터 입력값이 잘 넘어갔는지 log로 확인하는 용도
		
		//새로운 암호가 전송왔다면, 패스워드 암호화 처리함
		String user_pwd = user.getUser_pwd().trim();	//쓸모없는 공백이 딸려오는것을 방지하기위해 trim()메소드 사용
		if(user_pwd != null && user_pwd.length() > 0) {
				//db테이블에 기록된 기존의 암호와 비교했을때 다른 값이라면? (원래 암호랑 새롭게 입력한 암호랑 비교작업이 필요함
			if (! this.bcryptPasswordEncoder.matches(user_pwd,origin_user_pwd)) {		//새로운비번과 원래비번이 일치하지않는다면?
				
				//user에 새로운 패스워드를 암호화해서 기록함
				user.setUser_pwd(this.bcryptPasswordEncoder.encode(user_pwd)); //새로운패스워드를 설정해서 바꾼다 =>인코딩처리 후 바꿔줌
			}else{
				//새로운 패스워드값이 없다면, user에 원래 패스워드를 보내준다
				user.setUser_pwd(origin_user_pwd);
			}//if
		}//if
		if(UserService.updateUser(user) > 0) {		//수정이 성공했다면?		=> Controller의 다른 Method를 직접 호출할 수 있음.
//			return "redirect:myinfo.do?userid=" + user.getUser_id();		
			model.addAttribute("user", user);
			return "user/userDatailPage";		
		}else {															//수정이 실패했다면?
			model.addAttribute("message", user.getUser_id() + " : 회원 정보 수정 실패! 입력사항을 다시 확인해주세요!");
			return "common/error";
		}
	}//method close
	
	
	
	
	
	//내가 가입한 밴드 출력 처리용 --------------------------------------------------------------------------------
	@RequestMapping(value="mybandtop5.do", method= {RequestMethod.GET, RequestMethod.POST} ) 
	@ResponseBody
	public String mybandtop5Method(HttpServletRequest request, HttpSession session, Model model, 
														@RequestParam("user_id") String user_id) throws UnsupportedEncodingException  {

			//최근 가입한 밴드  5개 조회해 옴
		    ArrayList<CGroup> list = UserService.mybandtop5(user_id);
			logger.info("mybandtop5.do run ok : " + list.size());  // 출력 확인
			
			//전송용 json 객체 준비
			JSONObject sendJson = new JSONObject();
			//리스트 저장할 json 배열 객체 준비
			JSONArray jarr = new JSONArray();
			
			//list 를 jarr 에 옮기기 (복사)
			for(CGroup cgroup : list) {
				//notice 의 각 필드값 저장할 json 객체 생성함
				JSONObject job = new JSONObject();
				
				job.put("Communitydate", cgroup.getCommunitydate().toString());
				job.put("Communityid", cgroup.getCommunityid());		//int
				job.put("Communityname", URLEncoder.encode(cgroup.getCommunityname(), "utf-8"));
				
				jarr.add(job);  //job 를 jarr 에 추가함
			}//for
			
			//전송용 객체에 jarr 을 담음
			sendJson.put("list", jarr);
			
			//json을 json string 타입으로 바꿔서 전송되게 함
			return sendJson.toJSONString();  //뷰리졸버로 리턴함
			//servlet-context.xml 에 json string 내보내는 
			//JsonView 라는 뷰리졸버 추가 등록해야 함
	}//method close
	
	
	
	
	//자유게시판 내 글 TOP5 출력 처리용 --------------------------------------------------------------------------------
	@RequestMapping(value="boardgentop5.do", method= {RequestMethod.GET, RequestMethod.POST} ) 
	@ResponseBody
	public String boardgentop5Method(HttpServletRequest request, HttpSession session, Model model, 
														@RequestParam("user_id") String user_id) throws UnsupportedEncodingException  {
		//최근 작성 글  5개 조회해 옴
		ArrayList<BoardGen> list = UserService.boardgentop5(user_id);
		logger.info("boardgentop5.do run ok : " + list.size());  // 출력 확인
		
		//전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		//리스트 저장할 json 배열 객체 준비
		JSONArray jarr = new JSONArray();
		
		//list 를 jarr 에 옮기기 (복사)
		for(BoardGen boardgen : list) {
			//notice 의 각 필드값 저장할 json 객체 생성함
			JSONObject job = new JSONObject();
			
			job.put("board_date", boardgen.getBoard_date().toString());
			job.put("board_no", boardgen.getBoard_no());	
			job.put("board_title", URLEncoder.encode(boardgen.getBoard_title(), "utf-8"));
			job.put("board_count", boardgen.getBoard_count());	
			job.put("board_like", boardgen.getBoard_like());	
			
			jarr.add(job);  //job 를 jarr 에 추가함
		}//for
		sendJson.put("list", jarr);
		return sendJson.toJSONString();  //뷰리졸버로 리턴함
	}//method close
	
	
	
	
	//내가쓴 댓글 TOP5 출력 처리용 --------------------------------------------------------------------------------
	@RequestMapping(value="comment_borderTop5.do", method= {RequestMethod.GET, RequestMethod.POST} ) 
	@ResponseBody
	public String comment_borderTop5Method(HttpServletRequest request, HttpSession session, Model model, 
			@RequestParam("user_id") String user_id) throws UnsupportedEncodingException  {
		//최근 작성 글  5개 조회해 옴
		ArrayList<Comment> list = UserService.comment_borderTop5(user_id);
		logger.info("comment_borderTop5.do run ok : " + list.size());  // 출력 확인
		
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Comment comment : list) {
			JSONObject job = new JSONObject();
			
			job.put("com_date", comment.getCom_date().toString());
			job.put("com_contents", URLEncoder.encode(comment.getCom_contents(), "utf-8"));
			
			jarr.add(job);  //job 를 jarr 에 추가함
		}//for
		sendJson.put("list", jarr);
		return sendJson.toJSONString();  //뷰리졸버로 리턴함
	}//method close
	
	
	

	
	
	
	
	
	
	
	
	
	
}//class close









