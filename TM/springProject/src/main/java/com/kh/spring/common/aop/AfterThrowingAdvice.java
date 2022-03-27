package com.kh.spring.common.aop;

import java.sql.SQLException;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AfterThrowingAdvice {
	@AfterThrowing(pointcut="CommonPointcut.allPointcut()", throwing="exceptionObj")
	public void exceptionLog(JoinPoint jp, Exception exceptionObj) {
		//비즈니스 로직에 예외가 발생한경우, 공통적인 예외 처리 로직 제공 advice
		String methodName = jp.getSignature().getName();
		String msg = methodName+"() 메소드 수행중 예외발생 ==>";
		
		if(exceptionObj instanceof IllegalArgumentException) {
			msg+="부적합한 값 입력 ";
		}else if(exceptionObj instanceof SQLException) {
			msg+="DB 관련 예외 발생";
		}else if(exceptionObj instanceof NumberFormatException) {
			msg+="숫자 형식 아닌 값 입력";
		}else if(exceptionObj instanceof NullPointerException) {
			msg+="Null인 객체 참조";
		}else{
			msg+="예외 발생";
		}
		
		System.out.println(msg);
	}
}
