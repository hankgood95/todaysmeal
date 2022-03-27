package com.kh.spring.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.kh.spring.member.model.vo.Member;

@Component
@Aspect

public class AfterReturningAdvice {
	// loginMember() 메소드가 호출될때 (로그인 프로세스 동작시)
	@AfterReturning(pointcut ="execution(* com.kh.spring..MemberServiceImpl.loginMember(..))",returning="returnObj")
	public void afterLog(JoinPoint jp, Object returnObj) { //returnObj에는 리턴된 값을 받아온다.
		String methodName = jp.getSignature().getName();
		System.out.println("[log] : "+methodName+"() 메소드 실행");
		if(returnObj instanceof Member) { //returnObj가 Member일때
			Member loginUser = (Member)returnObj;
			if(loginUser.getId().equals("admin")) {
				System.out.println("[log] : 관리자님 환영합니다.");
			}else {
				System.out.println("[log] : ID "+loginUser.getId()+"회원 로그인");
			}
		}

		// 관리자가 로그인한 경우
		// [log] : 관리자님 환영합니다.
		// 일반 회원이 로그인 한 경우
		// [log] : ID XXX 회원 로그인
	}
}
