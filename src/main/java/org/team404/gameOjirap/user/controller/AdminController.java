package org.team404.gameOjirap.user.controller;

import java.util.ArrayList;
import java.util.GregorianCalendar;

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
import org.team404.gameOjirap.common.Paging;
import org.team404.gameOjirap.community.cGroup.model.service.CGroupService;
import org.team404.gameOjirap.community.cGroup.model.vo.CReport;
import org.team404.gameOjirap.user.model.service.UserService;
import org.team404.gameOjirap.user.model.vo.User;

@Controller
public class AdminController {

	private final Logger logger = LoggerFactory.getLogger(InoutController.class);
	
	@Autowired 									
	private UserService UserService;	
	@Autowired
	public CGroupService CGroupService;
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//회원탈퇴 (삭제)요청 처리용  메소드
		//삭제일때는 따로 정보를 보낼필요가 없음 (자동 로그아웃 처리) => String을 리턴한다.
		@RequestMapping("adminDel.do")
		public String userDeleteMethod(@RequestParam(value="user_id", required=false) String user_id, 
														Model model) {
			logger.info("삭제할 회원아이디 : " + user_id);
			
			if(UserService.userDeleteMethod(user_id) > 0 ) {			//회원 탈퇴 성공했을때 (자동 로그아웃 처리해야함) 
				return "redirect:logout.do"; //Controller메소드에서 다른 Controller메소드 호출할 수 있음 (앞에  [    redirect:  ] 를 붙여준다
			}else {		//회원 탈퇴 실패했을때
				model.addAttribute("message", user_id + " : 회원 삭제 실패! 요청사항을 다시 확인해주세요!");			//이 메세지를 message에 담아서 리턴함
				return "common/error";
			}//if
		}//method close
		
		//회원관리 페이지 이동 처리용 ------
		@RequestMapping(value="uadmin.do", method= {RequestMethod.GET, RequestMethod.POST} )
		public ModelAndView moveUserAdmin(ModelAndView mv, @RequestParam(name = "page", required = false) String page)  {
			
			
			int currentPage = 1;

			if (page != null) {
				System.out.println("page : " + page);
				currentPage = Integer.parseInt(page);
			}

			// 한 페이지에 게시글 10개씩 출력되게 하는 경우 :
			// 페이징 계산 처리 - 별도의 클래스로 작성해서 이용해도 됨
			int limit = 15; // 한페이지에 출력할 목록 갯수
			// 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
			int listCount = UserService.selectListCount();
			// 페이지 수 계산
			// 주의 : 목록이 11개이면 페이지 수는 2개가 됨
			// 나머지 목록 1개도 한 페이지가 필요함
			int maxPage = (int) ((double) listCount / limit + 0.9);
			// 현재 페이지가 포함된 페이지 그룹의 시작값과 끝값 계산
			// => 뷰 페이지 아래쪽에 표시할 페이지 숫자를 10개 한다면
			// 현재 페이지가 95라면 91과 100 을 계산해 냄
			int startPage = ((currentPage - 1) / 10) * 10 + 1;
			int endPage = startPage + 10 - 1;

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			String url = "uadmin.do";
			Paging paging = new Paging(listCount, currentPage, limit, url);
			
			paging.calculator();

			// 페이징 계산 끝 : new Paging(limit,
			// currentPage)-------------------------------------------
	      
		  ArrayList<User> list = UserService.selectUserList(paging);
	      
	      if(list != null && list.size() > 0){
	         mv.addObject("list", list);
	         mv.addObject("paging", paging);
	         
	         mv.setViewName("user/userAdmin");
	      }else {
	         mv.addObject("message", "페이지 목록 조회 실패!");
	         mv.setViewName("common/error");
	      }
	      
	      return mv;
	}
		
		// 아이디로 검색 처리용
		@RequestMapping(value="aSearchUID.do", method=RequestMethod.POST)
		public String adminSearchUIDMethod(
				@RequestParam("keyword") String keyword, Model model) {
			ArrayList<User> list = UserService.selectSearchUID(keyword);
			
			int listCount = UserService.selectListCount();
			
			if(list != null && list.size() > 0) {
				model.addAttribute("list", list);
				model.addAttribute("listCount", listCount);
				return "user/userAdmin";
			} else {
				model.addAttribute("message",keyword + "로 검색된 회원 정보가 없습니다.");
				return "common/error";
			}
		}
		
		// 닉네임으로 검색 처리용
		@RequestMapping(value="aSearchUN.do", method=RequestMethod.POST)
		public String adminSearchUNMethod(
				@RequestParam("keyword") String keyword, Model model) {
			ArrayList<User> list = UserService.selectSearchUN(keyword);
			
			int listCount = UserService.selectListCount();
			
			if(list != null && list.size() > 0) {
				model.addAttribute("list", list);
				model.addAttribute("listCount", listCount);
				return "user/userAdmin";
			} else {
				model.addAttribute("message",keyword + "로 검색된 회원 정보가 없습니다.");
				return "common/error";
			}
		}
		
		
		// 회원관리 (상세)페이지 이동 처리용 ---------------------------------------------------------------------------------------	
		@RequestMapping(value="uban.do", method= {RequestMethod.GET, RequestMethod.POST} )
		public ModelAndView moveUserBan(ModelAndView mv, @RequestParam("user_id") String user_id)  {
			User user = UserService.selectUser(user_id);
			
			 if(user != null){
				mv.addObject("user", user);
				mv.setViewName("user/userBan");
			 }else {
		         mv.addObject("message", "페이지 목록 조회 실패!");
		         mv.setViewName("common/error");
		      }
			 
			 return mv;
		}// method close
		
		// 회원 정지 처리용---------------------------------------------------------------------------
		@RequestMapping(value="adminUBan.do", method = {RequestMethod.GET, RequestMethod.POST} )
		public ModelAndView userBan(ModelAndView mv, @RequestParam("user_id") String user_id, @RequestParam String selecttinput) {
			User user = UserService.selectUser(user_id);
			GregorianCalendar cal = new GregorianCalendar();
			java.util.Date UDate;
			
			if(user.getBan_release_date() != null) {
				UDate = new java.util.Date(user.getBan_release_date().getTime());
				cal.setTime(UDate);
			}
			
			switch(selecttinput) {
			case "1day" : cal.add(GregorianCalendar.DATE, 1); break;
			case "1week" : cal.add(GregorianCalendar.WEEK_OF_MONTH, 1); break;
			case "1month" : cal.add(GregorianCalendar.MONTH, 1); break;
			case "1year" : cal.add(GregorianCalendar.YEAR, 1);  break;
			}
			
			UDate = cal.getTime();
			java.sql.Date ban_release_date = new java.sql.Date(UDate.getTime());
			
			if(user != null) {
				user.setUser_status("pause");
				user.setBan_release_date(ban_release_date);
				
				UserService.updateBan(user);
				
				mv.addObject("user", user);
				mv.setViewName("user/userBan");
				mv.addObject("message", "회원 활동정지 처리 완료.");
			}else {
		         mv.addObject("message", "회원 활동정지 처리 실패.");
		         mv.setViewName("common/error");
		    }
			
			return mv;
			
		}
		
		// 회원 포인트 차감용---------------------------------------------------------------
		@RequestMapping(value="adminUDecPoint.do", method = {RequestMethod.GET, RequestMethod.POST} )
		public ModelAndView userDecPoint(ModelAndView mv, @RequestParam("user_id") String user_id, @RequestParam String selectpinput) {
			User user = UserService.selectUser(user_id);
			
			int updateP = user.getUser_point() - Integer.parseInt(selectpinput);
			String updateUL;
			System.out.println("selectpinput : " + selectpinput);
			System.out.println("selectpinput : " + Integer.parseInt(selectpinput));
			if(user != null) {
				if(updateP > 0 ) {
					switch((int)(updateP / 500)) {
					case 0 : updateUL = "새싹"; break;
					case 1 : updateUL = "싹"; break;
					case 2 : updateUL = "줄기"; break;
					case 3 : updateUL = "나무"; break;
					case 4 : updateUL = "잎"; break;
					default : updateUL = "열매"; break;
					}
					
				}else {
					updateP = 0;
					updateUL = "새싹";
				}
				
				user.setUser_point(updateP);
				user.setUser_level(updateUL);
				
				UserService.updateDecPoint(user);
				
				mv.addObject("user", user);
				mv.setViewName("user/userBan");
				mv.addObject("message", "회원 포인트차감 처리 완료.");
			}else {
		         mv.addObject("message", "회원 포인트차감 처리 실패");
		         mv.setViewName("common/error");
		    }
			
			return mv;
		}
		
		// 회원 활동정지 해제용(관리자) --------------------------------------------------------
		@RequestMapping(value="adminUBanR.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView adminUBanR(ModelAndView mv, @RequestParam("user_id") String user_id) {
			
			User user = UserService.selectUser(user_id);
			
			if(user != null) {
				user.setUser_status("run");
				user.setBan_release_date(null);
				
				UserService.updateBanRelease(user);
				
				mv.addObject("user", user);
				mv.setViewName("user/userBan");
				mv.addObject("message", "회원 정지 해제처리 성공.");
			}else {
		         mv.addObject("message", "회원 정지 해제처리 실패.");
		         mv.setViewName("common/error");
		    }
			return mv;
		}
		
		// 커뮤니티 신고글 불러오기 처리용(관리자)
		@RequestMapping(value="showCReportAdmin.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView showCReportAdmin(ModelAndView mv) {
			ArrayList<CReport> list = CGroupService.selectCReportList();
			
			if(list != null) {
				mv.addObject("count", list.size());
				mv.addObject("list", list);
				mv.setViewName("user/cReportListView");
			}else {
		         mv.addObject("message", "커뮤니티 신고글 불러오기 실패.");
		         mv.setViewName("common/error");
		    }
			return mv;
		}
		
}
