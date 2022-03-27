package com.tm.kr.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexHeaderController {
	
	Logger logger = LoggerFactory.getLogger(IndexHeaderController.class);
	
	@RequestMapping(value = "header")
	public String header() {
		
		logger.info("header page에 들어왔다.");
		
		return "common/header";
	}
}
