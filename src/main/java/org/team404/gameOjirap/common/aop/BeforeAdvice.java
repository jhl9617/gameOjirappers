package org.team404.gameOjirap.common.aop;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class BeforeAdvice {

    @Pointcut("execution(* org.team404.gameOjirap..*.*(..))")
    public void allPointcut() {}




    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Before("allPointcut()")
    public void beforeLog(JoinPoint jp){
        String methodName = jp.getSignature().getName();

        Object[] args = jp.getArgs();

        logger.info("[메소드 실행 전 확인] : " + methodName + "() 메소드 매개변수 갯수 : " + args.length);
        for (int i = 0; i < args.length;i++){
            if(args[i] != null) {
                logger.info(i + "번째 전달인자 정보 :" + args[i].toString());
            }
        }
    }
}
