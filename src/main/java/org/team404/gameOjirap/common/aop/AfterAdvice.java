package org.team404.gameOjirap.common.aop;

import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterAdvice {
    //목적 : 클래스 이름이 Impl로 끝나는 클래스들의 모든 메소드가 실행이 완료된 다음에 작동되는 어드바이스 테스트용
    //타겟 오브젝트의 메소드가 실행이 끝나면 로그가 출력되게 함

    private Logger logger = LoggerFactory.getLogger(getClass());
    //private Logger logger = LoggerFactory.getLogger(AfterAdvice.class);

    //포인트컷 설정에 사용되는 메소드 작성 : 내용없이 작성 해야 함

    //    @Pointcut("execution(* org.ict.first..*Impl.*(..))")
    public void implPointcut() {}

    //    @After("implPointcut()")
    public void finallyLog() {
        //예외발생 상관 없이 무조건 실행되는 어드바이스임
        logger.info("Impl 클래스 메소드 실행 후 작동 : " + "서비스 로직 수행이 완료된 후 무조건 작동");
    }
}
