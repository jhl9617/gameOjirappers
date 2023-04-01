package org.team404.gameOjirap.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.team404.gameOjirap.user.model.vo.User;

import java.text.SimpleDateFormat;
import java.util.Date;

@Repository //dao 에 적용하는
@Aspect     //aop로 등록
public class AfterReturningAdvice {
    //목적 : 로그인 메소드에 대한 로그 출력을 목적으로 하는 어드바이스

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    //포인트컷 설정을 위한 메소드 작성
    @Pointcut("execution(* org.team404.gameOjirap.user.model.dao.InoutDao.loginMethod(..))")
    public void loginPointcut() {}

    //타겟 오브젝트의 메소드가 실행 후 리턴될 때 작동되는 어드바이스
    //returning 속성에 리턴값 가진 매개변수명을 임의대로 지정함
    @AfterReturning(pointcut = "loginPointcut()", returning = "returnObj")
    public void loginLog(JoinPoint jp, Object returnObj) {
        //비즈니스 로직용 메소드가 리턴한 결과데이터를 다른 용도로 처리할 때 사용할 수 있음
        if(returnObj instanceof User) {
            User user = (User) returnObj;
            String dataFormat = new SimpleDateFormat("yyyy-MM-dd (E) hh24mm").format(new Date());
            logger.info(dataFormat + "$" + user.getUser_id() + "님이 접속하였습니다.");
        }
    }
}
