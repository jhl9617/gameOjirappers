package org.team404.gameOjirap.common.intercepter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.team404.gameOjirap.community.cGroup.model.service.CGroupService;
import org.team404.gameOjirap.community.cGroup.model.vo.CMember;
import org.team404.gameOjirap.user.model.vo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.ArrayList;

@SuppressWarnings("deprecation")
public class MemberCheckInterceptor extends HandlerInterceptorAdapter {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private CGroupService cGroupService;
    
    
    public MemberCheckInterceptor() {
	}


	@Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        try {
            //session 안에 저장된 loginMember 라는 이름의
            //저장 객체가 존재하는지 확인하는 방법
            HttpSession session = request.getSession();

            User loginUser =
                    (User) session.getAttribute("loginUser");
            int communityid = Integer.parseInt(request.getParameter("communityid"));
            ArrayList<CMember> members = cGroupService.selectMembers(communityid);
            String memberString = members.toString();
            System.out.println("memberstring : " + memberString);

            if (memberString.contains(loginUser.getUser_id()) && loginUser.getUser_id() != null) {
                logger.info("커뮤 멤버 : " + request.getRequestURI()
                        + " 요청");
            } else {
                logger.info("비멤버 : " + request.getRequestURI()
                        + " 요청");

                //돌려보냄
                //Referer 이용 : request 객체에 기록되어 있음
                String referer = request.getHeader("Referer");
                logger.info("Referer : " + referer);

                //브라우저이름[전송방식] 확인
                String origin = request.getHeader("Origin");
                logger.info("Origin : " + origin);
                //chrome[GET], ie[GET|POST], firefox[POST] => null

                String url = request.getRequestURL().toString();
                logger.info("url : " + url);

                String uri = request.getRequestURI();
                logger.info("uri : " + uri);

                //크롬 브라우저일 때
                if (origin == null) {
                    origin = uri.replace(uri, "");
                }

                String location = referer.replace(
                        origin + request.getContextPath(), "");

                request.setAttribute("loc", location);

                response.setContentType("text/html; charset=utf-8");
                String message1 = URLEncoder.encode("커뮤니티에 가입해야 이용할 수 있는 서비스입니다.", "UTF-8");
                response.sendRedirect(request.getContextPath() + "/commuMain.do?page=1&message=" + message1);

                return false;
            }

            //멤버의 요청이라면 컨트롤러로 넘김
            return super.preHandle(request, response, handler);
        } catch (Exception e) {
            e.printStackTrace();
            String message2 = URLEncoder.encode("회원정보가 없는 커뮤니티입니다. 관리자에게 문의하세요.", "UTF-8");
            response.sendRedirect(request.getContextPath() + "/commuMain.do?page=1&message=" + message2);

            return false;
        }
    } //end preHandle
} //end class
