package com.tm.kr.admin.vote.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tm.kr.admin.notice.controller.AdminNoticeController;

@Controller
public class AdminVoteController {
	
	Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
	@RequestMapping("votelist")
	public String voteList(Model model) {
		
		logger.info("admin vote page에 들어왔다.");
		
		model.addAttribute("pageName", "votePage");
		
		return "admin/vote_list";
	}
}
