package com.kh.spring.log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Log4jTest {
	// 로거 객체를 이용해서 코드의 원하는 부분에 로그를 찍으면 된다.
	// 매개변수로 전달 된 클래스에 해당하는 로거를 반환한다.
	private Logger logger = LoggerFactory.getLogger(Log4jTest.class);
	
	public static void main(String[] args) {
		new Log4jTest().test();
	}
	
	public void test() {
		// Log4j의 로그 레벨
		// logger.fatal("fatal 로그!!"); // 아주 심각한 에러 발생
		// -> slf4j의 logger는 fatal 레벨을 지원하지 않음
		logger.error("error 로그!!"); // 어떤 요청 처리 중 문제 발생
		logger.warn("warn 로그!!"); // 실행에는 문제 없지만 향후 시스템 에러의 원인이 될 수 있는 경고성 메세지
		logger.info("info 로그!!"); // 상태 변경과 같은 정보성 메세지
		logger.debug("debug 로그!!"); // 개발 시 디버그 용도로 사용하는 메세지
		logger.trace("trace 로그!!"); // 좀 더 상세한 이벤트를 나타냄(경로 추적)
	}
	
	
	
	
	
	
	
	
	
	
	

}
