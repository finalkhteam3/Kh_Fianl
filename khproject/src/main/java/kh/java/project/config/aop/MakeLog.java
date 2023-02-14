package kh.java.project.config.aop;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Slf4j
@Aspect
@Service
@AllArgsConstructor
public class MakeLog {
    @Around("execution(* kh.java.project..*Controller.*(..))")
    public Object execute(ProceedingJoinPoint joinPoint) throws Throwable {
        try {
            Object[] args = joinPoint.getArgs();
//            System.out.println("args1 = " + args.length);
            System.out.println("[" + joinPoint.getSignature().getName() + "Controller Parameter Info] ");
            if(args.length != 0 && args[0] != null) {
                for (Object obj : args) {
                    if(obj != null)
                        System.out.println(
                            "\t>> type: " + obj.getClass().getSimpleName() + ", value: " + obj);
                }
            } else {
                System.out.println("\t>> null");
            }
            Object ro = joinPoint.proceed();
            System.out.println("[" + joinPoint.getSignature().getName() + "Controller Return Info] ");
            System.out.println("\t>> type: " + ro.getClass().getSimpleName() + ", value: " + ro);
            return ro;
        } finally {
//            System.out.println("\tend = " + joinPoint.getSignature());
//            for (Object in : joinPoint.getArgs()){
//                System.out.println("\t\tend = " + in);
//            }
        }
    }
}
