package com.tm.kr.admin.vote.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminVoteController {
	
	@RequestMapping("votelist")
	public String voteList() {
		return "admin/vote_list";
	}
}
