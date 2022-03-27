package com.kh.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.spring.member.model.vo.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	protected Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		if(logger.isInfoEnabled()) { //보내지는 logger의 level에 따라서 if문 안의 조건문도 들어가야한다.
			Member user = (Member)request.getSession().getAttribute("loginUser");
			if(user == null) {
				//다시 이동할때 얘가 이제 request와 response를 이용해서 이동시킨다.
				logger.info("로그인 안된 상태에서 접근하려고함");
				request.getSession().setAttribute("msg", "로그인후 이용하세요"); 
				response.sendRedirect("home.do");
				return false; //false를 리턴 시켜줘야한다. 그래야지 컨트롤로의 요청이 끊긴다.
			}
		}
		return super.preHandle(request, response, handler);
	}
	
	
}
