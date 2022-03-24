package com.tm.kr.admin.notice.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tm.kr.admin.notice.model.Notice;
import com.tm.kr.member.model.Member;

@Controller
public class AdminNoticeController {

	Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
	
	@RequestMapping(value = "adminNoticeList")
	public String adminNoticeList(Model model) {
		logger.info("admin Notice page에 들어왔다.");
		
		//내 생일을 입력하는 부분
		Calendar cal = Calendar.getInstance();
		cal.set(1995, Calendar.NOVEMBER, 8);
		Date birth = cal.getTime();
		
		//이욱재라는 Member 인스턴스를 만들고
		Member wook = new Member(1,"hankgood95","tomeal1234","빌게이","hankgood95@naver.com","이욱재",birth);
		//notice라는 인스턴스에 위에서 만든 이욱재의 회원번호를 추가한다.
		Notice notice = new Notice(1,"가즈아","가즈아아아아아앙",new Date(),wook.getMemberNum());
		
		//그리고 Notice의 정보를 담는 ArrayList를 만들어서 
		ArrayList<Notice> noticeList = new ArrayList<>();
		//noticeList에 이욱재가 쓴 notice 정보를 담는다.
		noticeList.add(notice);
		
		//해당 페이지가 noticePage라는것을 알려주기 위해서 model에 pageName을 보낸다.
		model.addAttribute("pageName", "noticePage");
		//jsp 페이지에서 보여져야할 공지사항 List를 담아서 보낸다.
		model.addAttribute("noticeList", noticeList);
		
		//자 그럼 이제 jsp에서 받아서 해볼까??
		return "admin/notice_list";
	}
	
	@RequestMapping(value="newnotice")
	public String newNotice(Model model) {
		
		//해당 페이지가 noticePage라는것을 알려주기 위해서 model에 pageName을 보낸다.
		model.addAttribute("pageName", "noticePage");
		
		return "admin/new_notice";
	}
}
