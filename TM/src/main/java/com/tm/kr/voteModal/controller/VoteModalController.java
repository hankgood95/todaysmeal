package com.tm.kr.voteModal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VoteModalController {

Logger logger = LoggerFactory.getLogger(VoteModalController.class);
	
	@RequestMapping(value = "voteModal")
	public String voteModalController() {
		
		logger.info("voteModal page에 들어왔다.");
		
		return "vote/voteModal";
	}
}
