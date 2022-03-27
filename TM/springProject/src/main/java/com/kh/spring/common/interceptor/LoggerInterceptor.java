package com.kh.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/*   Interceptor
 * 
 * 특정 URI로 요청시 Controller로 가는 요청을 가로채는 역할
 * - 정확히 얘기하면 HandlerInterceptor(HandlerInterceptorAdapter를 상속해서 구현)
 * 즉 어떤 특정 uri를 요청할때마다 그것을 가로채서 디버깅하고 그러는거임 그리고 나서는 뷰로 보내거나 컨트롤러로 이동하는것임
 * 작성 순서
 * 1. 사용할 logger 등록
 * 2. DispatcherServlet이 Controller를 호출하는 중간에
 * 	  interceptor를 동작 시키기 위해 servlet-context.xml에 작성
 * 
 * 
 * */
public class LoggerInterceptor extends HandlerInterceptorAdapter{
	//HandlerInterceptor 인터페이스를 사용하기 쉽게 구현해놓은 추상 클래스를 지원
	protected Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);
	
	// 1. preHandle(전처리) : DispatcherServlet이 컨트롤러를 호출하기 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		if(logger.isDebugEnabled()) {
			logger.debug("======start=======");
			logger.debug(request.getRequestURI());
			logger.debug(handler.toString());
		}
		
		return super.preHandle(request, response, handler);
		//항상 true를 리턴한다.
		// true를 리턴하지 않으면 컨트롤러로 이어주지 않음
	}
	
	// 2. postHandle(후처리) : 컨트롤러에서 DispatcherServlet으로 리턴되는 순간
	// (ModelAndView를 통해 작업 결과 참조 가능)
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
		if(logger.isDebugEnabled()) {
			logger.debug("------View-----");
			logger.debug(handler.toString());
		}
		
		super.postHandle(request, response, handler, modelAndView);
	}

	// 3. afterCompletion(뷰 단 처리후) : 모든 뷰에서 최종 결과를 생성하는 일을 포함한 
	// 모든 작업이 완료 된후
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
		if(logger.isDebugEnabled()) {
			logger.debug("=====END=====");
			logger.debug(handler.toString());
		}
		super.afterCompletion(request, response, handler, ex);
	}
	/* Filter와 Interceptor 둘다 Controller로 들어가는 요청을 가로채서
	 * 특정 작업을 하기 위한 용도로 사용함
	 * - 차이점 : 케어할수 있는 영역이 다르다.
	 * Filter는 같은 웹 어플리케이션 내에서만 접근이 가능하며
	 * Interceptor의 경우 스프링에서 관리되기 때문에 스프링 내의 모든 객체에 접근이 가능
	 * 
	 * 필터를 먼저 들어가고 그다음에 interceptor 그리고 controller 를 들어간다.
	 * 나올대는 interceptor 그리고 filter를 들어간다.
	 * 
	 * -> JSP Filter의 경우 주로 한글 처리에 이용
	 * -> Interceptor의 경우 주로 로그인 처리에 이용
	 * 
	 * Interceptor 사용 예
	 * 	사용자가 어떤 페이지를 접속하려고 할때 로그인된 사용자만 보여주고
	 * 	로그인 되지 않은 경우 메인 화면으로 이동시키는 기능
	 * [실습] : LoginInterceptor 만들기(클래스와  logger 생성, interceptor 등록)
	 *  로그인 하지 않은 상태로 공지사항/게시판 보기를 요청하면 "로그인후 이용하세요" 라는
	 * alert 메세지를 보여주고 메인 화면으로 redirect
	 * 
	 * 
	 * */
	
}
