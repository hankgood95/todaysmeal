package com.kh.spring;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		// DispatcherServlet에게 뷰 정보를 전달하는 방법은 두가지가 있음
		// 1) View 타입의 오브젝트를 주는 방법
		// 2) String 타입의 뷰 이름을 주는 방법
		// 이름으로부터 실제로 사용할 뷰 객체를 결정해주는 뷰 리졸버가 필요
		// 특정 뷰 리졸버를 빈으로 등록하지 않는다면,
		// DispatcherServlet은 기본 뷰 리졸버인 InternalResourceViewResolver를 사용
		// servlet-context.xml 참조
		
		return "home";
	}
	
}
