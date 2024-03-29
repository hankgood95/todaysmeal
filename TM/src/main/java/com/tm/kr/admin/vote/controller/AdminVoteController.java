package com.tm.kr.admin.vote.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tm.kr.admin.notice.controller.AdminNoticeController;

@Controller
@RequestMapping("/admin/*")
public class AdminVoteController {
	
	Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
	@RequestMapping("votelist")
	public String voteList(Model model) {
		
		logger.info("admin vote list page에 들어왔다.");
		
		model.addAttribute("pageName", "votePage");
		
		return "admin/vote_list";
	}
	@RequestMapping("voteDetail")
	public String voteDetail(Model model) {
		
		logger.info("admin vote detail page에 들어왔다.");
		
		model.addAttribute("pageName", "votePage");
		
		return "admin/vote_detail";
	}
}
