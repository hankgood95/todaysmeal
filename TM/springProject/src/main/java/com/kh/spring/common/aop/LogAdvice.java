package com.kh.spring.common.aop;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect //Pointcut + Advice 언제 자를지와 어떤걸 실행할지가 합쳐진게 Aspect임
public class LogAdvice {
	//PointCut 지정 : advice를 적용할 부분을 지정한다.
	
	//포인트컷 표현식
	// execution 명시자 : Advice를 적용할 메소드를 명시랗때 사용
	// execution(리턴 타입 패턴 클래스 이름 패턴 메소드이름 패턴 (파라미터 패턴))
	// * : 모든, .. : 0개 이상
	//@Pointcut("execution(* com.kh.spring..*Impl.*(..))")
	//				리턴타입 모두 클래스이름.어떤거든 Impl붙은것 메소드명 어떤거든 (매개변수 0개이상)
//	public void allPointcut() {}
	
	//@Before("CommonPointcut.allPointcut()") //이렇게 외부에서도 가져올수도 있음
	public void printLog() {
		System.out.println("[공통] : 비즈니스 로직 수행전 동작");
	}
	
	//@After("CommonPointcut.allPointcut()")
	public void finallyLog() {
		System.out.println("[공통] : 비즈니스 로직 종료");
	}
}
