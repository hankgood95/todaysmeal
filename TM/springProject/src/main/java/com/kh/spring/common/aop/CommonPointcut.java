package com.kh.spring.common.aop;

import org.aspectj.lang.annotation.Pointcut;

public class CommonPointcut {
	@Pointcut("execution(* com.kh.spring..*Impl.*(..))")
	public void allPointcut() {}
	
}
