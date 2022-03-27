package com.kh.spring.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class BeforeAdvice {
	@Before("CommonPointcut.allPointcut()")
	public void beforeLog(JoinPoint jp) {
		// 즉 호출한 메소드를 불러온다는 뜻임
		// getSignature() : 대상 객체 메소드의 설명(메소드명, 리턴 타입 등)을 반환
		String methodName = jp.getSignature().getName();
		// getArgs() : 메소드의 매개변수를 반환
		Object[] args = jp.getArgs();
		
		String printLog = "[전처리] : " + methodName + "()";
		
		if(args != null && args.length != 0) {
			printLog += " / args 정보 : " + args[0].toString();
		}
		
		System.out.println(printLog + " 실행");
		
	}
	
	
	
	
	
	
	
	
	
	
}
