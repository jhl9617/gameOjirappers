package org.team404.gameOjirap;

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
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml"
                                , "classpath:root-context.xml"})
public class TestCGroupController {
    private static final Logger logger = LoggerFactory.getLogger(TestCGroupController.class);

    //테스트용 클래스에서 사용될 필드 선언
    @Autowired
    private WebApplicationContext wac;      //현재 실행중인 어플리케이션 구성을 제공하는 인터페이스

    private MockMvc mockMvc;    //클라이언트 요청 내용을 controller에서 받아 처리하는 것과 같은 테스트를 진행 할 수 있는 클래스임

    //JUnit 테스트 진행 전에 먼저 실행 한다는 의미의 어노테이션
    @Before
    public void setup() {
        //MockMvc에 대한 객체 생성함
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
        logger.info("setup() : MockMvc 객체 생성 확인 " + mockMvc);
    }

    //커뮤니티 생성하는 테스트(커뮤 이름 중복 될 수 없으므로 다시 테스트 하면 communityname 이름 바꿔야함)
    @Test
    public void testCommuCreate() {
        logger.info("--커뮤 생성 테스트 시작--");

        try {
            mockMvc.perform(post("/CommuCreateSubmit.do").param("communityname", "테스트 커뮤이름")
                                                                .param("user_id", "admin")
                                                                .param("communitydesc", "커뮤 설명 테스트입니다."))
                    .andDo(print())
                    .andExpect(redirectedUrl("commuMain.do"));  
                    //CommuCreateSubmit.do를 실행하여 잘 동작 하면 commuMain으로 이동하기 때문에 위 코드 작성


            logger.info("커뮤 생성 테스트 종료");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
