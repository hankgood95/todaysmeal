package com.tm.kr.admin.home.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminHomeController {

	Logger logger = LoggerFactory.getLogger(AdminHomeController.class);
	
	@RequestMapping(value = "home")
	public String adminHome() {
		
		logger.info("admin page에 들어왔다.");
		
		// 아래의 return 값은 /WEB-INF/views/admin/admin_home.jsp 로 변환 되어 해당 파일로 mapping 시켜주는데
		return "admin/admin_home"; //어떻게 이 return 값이 어떻게 WEB-INF/views/admin/admin_home.jsp 로 변환 될까?
		//이 역시 Controller에 대한 Configuration이 담긴 servlet-context.xml 로 가보면 알수 있다.
	}
}
