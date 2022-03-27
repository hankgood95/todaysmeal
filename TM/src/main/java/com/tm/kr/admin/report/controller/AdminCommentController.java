package com.tm.kr.admin.report.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


//커맨드쉬프트 O ==> 자동으로 임포트 시켜줌,  
@Controller

public class AdminCommentController {
	
	Logger logger = LoggerFactory.getLogger(AdminCommentController.class); //나중에 로그를찍게 되는일이있다면 여기가 왜 바뀌었는지 다시물어보자.매개변수 물어보면댐 왜이거인
	
	@RequestMapping(value = "admincommentreport") //uri?
	public String adminCommentreport(Model model) {
		logger.info("admin Comment Report page에 들어왔다.");
		model.addAttribute("pageName", "reportPage"); //왼쪽 => jsp로 보낼값 즉 키값, 페이지네임이라는 변수 에 리포트페이지를넣는다 
		return "admin/comment_report_list";
	}

}
