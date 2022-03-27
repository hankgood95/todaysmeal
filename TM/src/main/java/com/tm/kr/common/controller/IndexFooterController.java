package com.tm.kr.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexFooterController {
	
	Logger logger = LoggerFactory.getLogger(IndexFooterController.class);
	
	@RequestMapping(value = "footer")
	public String footer() {
		
		logger.info("footer page에 들어왔다.");
		
		return "common/footer";
	}
}
