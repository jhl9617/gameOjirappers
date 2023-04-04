package org.team404.gameOjirap.game.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml"
        , "classpath:root-context.xml"})
public class GameControllerTest {

    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private WebApplicationContext wac;
    private MockMvc mockMvc;

    @Before
    public void setup() {
        //MockMvc 에 대한 객체 생성함
        mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
        logger.info("setup() : MockMvc 객체 생성 확인" + mockMvc);
    }

    @Test
    public void moveGameInfoView() {
        logger.info("insertGame 테스트 시작");
        try {
            // mockMvc 가 가상의 클라이언트임
            // 기능에 대하 매핑 url 요청과 컨트롤러로 전송할 값(parameter)
            // 을 가진 가상의 요청 작성
            mockMvc.perform(post("/moveGameDetail.do").param("appid", "1262240"))
                    .andDo(print())	// 처리된 내용 출력, MocMvcBuilders 의 alwaysDo(print())
                    .andExpect(status().isOk());
            // 응답 상태값이 에러가 없는 정상상태인지 확인

            logger.info("테스트 종료")
            ;		} catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void moveGameAchievement() {
        logger.info("insertGame 테스트 시작");
        try {
            // mockMvc 가 가상의 클라이언트임
            // 기능에 대하 매핑 url 요청과 컨트롤러로 전송할 값(parameter)
            // 을 가진 가상의 요청 작성
            mockMvc.perform(post("/goChallenge.do").param("appid", "1262240"))
                    .andDo(print())	// 처리된 내용 출력, MocMvcBuilders 의 alwaysDo(print())
                    .andExpect(status().isOk());
            // 응답 상태값이 에러가 없는 정상상태인지 확인

            logger.info("테스트 종료")
            ;		} catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void deleteGameInfo() {
        logger.info("insertGame 테스트 시작");
        try {
            // mockMvc 가 가상의 클라이언트임
            // 기능에 대하 매핑 url 요청과 컨트롤러로 전송할 값(parameter)
            // 을 가진 가상의 요청 작성
            mockMvc.perform(post("/gdeleteData.do").param("appid", "1262240"))
                    .andDo(print())	// 처리된 내용 출력, MocMvcBuilders 의 alwaysDo(print())
                    .andExpect(status().isOk());
            // 응답 상태값이 에러가 없는 정상상태인지 확인

            logger.info("테스트 종료")
            ;		} catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void gameTop6Method() {
        logger.info("insertGame 테스트 시작");
        try {
            // mockMvc 가 가상의 클라이언트임
            // 기능에 대하 매핑 url 요청과 컨트롤러로 전송할 값(parameter)
            // 을 가진 가상의 요청 작성
            mockMvc.perform(post("/gametop6.do"))
                    .andDo(print())	// 처리된 내용 출력, MocMvcBuilders 의 alwaysDo(print())
                    .andExpect(status().isOk());
            // 응답 상태값이 에러가 없는 정상상태인지 확인

            logger.info("테스트 종료")
            ;		} catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void gameNew6Method() {
        logger.info("insertGame 테스트 시작");
        try {
            // mockMvc 가 가상의 클라이언트임
            // 기능에 대하 매핑 url 요청과 컨트롤러로 전송할 값(parameter)
            // 을 가진 가상의 요청 작성
            mockMvc.perform(post("/gamenew6.do"))
                    .andDo(print())	// 처리된 내용 출력, MocMvcBuilders 의 alwaysDo(print())
                    .andExpect(status().isOk());
            // 응답 상태값이 에러가 없는 정상상태인지 확인

            logger.info("테스트 종료")
            ;		} catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void gameDiscTopMethod() {
        logger.info("insertGame 테스트 시작");
        try {
            // mockMvc 가 가상의 클라이언트임
            // 기능에 대하 매핑 url 요청과 컨트롤러로 전송할 값(parameter)
            // 을 가진 가상의 요청 작성
            mockMvc.perform(post("/gameDiscTop.do"))
                    .andDo(print())	// 처리된 내용 출력, MocMvcBuilders 의 alwaysDo(print())
                    .andExpect(status().isOk());
            // 응답 상태값이 에러가 없는 정상상태인지 확인

            logger.info("테스트 종료")
            ;		} catch (Exception e) {
            e.printStackTrace();
        }
    }
}