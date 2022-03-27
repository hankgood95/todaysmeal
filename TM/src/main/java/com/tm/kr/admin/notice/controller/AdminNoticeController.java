package com.tm.kr.admin.notice.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

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
	Member wook;
	Notice notice;
	
	@RequestMapping(value = "adminNoticeList")
	public String adminNoticeList(Model model) {
		logger.info("admin Notice page에 들어왔다.");
		
		//해당 페이지가 noticePage라는것을 알려주기 위해서 model에 pageName을 보낸다.
		model.addAttribute("pageName", "noticePage");
		
		//내 생일을 입력하는 부분
		Calendar cal = Calendar.getInstance();
		cal.set(1995, Calendar.NOVEMBER, 8);
		Date birth = cal.getTime();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//이욱재라는 Member 인스턴스를 만들고
		wook = new Member(1,"hankgood95","tomeal1234","빌게이","hankgood95@naver.com","이욱재",birth);
		//notice라는 인스턴스에 위에서 만든 이욱재의 회원번호를 추가한다.
		notice = new Notice(1,"가즈아","가즈아아아아아앙",new Date(),wook.getMemberNum(),wook.getName());
		
		//그리고 Notice의 정보를 담는 ArrayList를 만들어서 
		ArrayList<Notice> noticeList = new ArrayList<>();
		//noticeList에 이욱재가 쓴 notice 정보를 담는다.
		noticeList.add(notice);
		
		//사실 위 과정은 DB와 연동하면 할필요가 없는 부분이지만 일단은 이렇게만 해보자
		
		//만약 noticeList가 비어있다면 진입
		if(noticeList.isEmpty()) {
			model.addAttribute("noticeList", "emptyList");
		}else {
			model.addAttribute("noticeList", noticeList);
		}
		
		return "admin/notice_list";
	}
	
	@RequestMapping(value="newnotice")
	public String newNotice(Model model) {
		
		//해당 페이지가 noticePage라는것을 알려주기 위해서 model에 pageName을 보낸다.
		model.addAttribute("pageName", "noticePage");
		
		return "admin/new_notice";
	}
	
	@RequestMapping(value="noticedetail")
	public String noticeDetail(HttpServletRequest request,Model model) {
		
		logger.info("admin Notice Detail Page에 들어왔다.");
		model.addAttribute("pageName", "noticePage");
		String noticeNum = request.getParameter("noticeNum");
		
		//받아온 noticeNum을 가지고 이제 DB 조회를 해서 notice를 가져오면 됨
		
		logger.info("notice number is : "+noticeNum);
		
		return "admin/notice_detail";
	}
}
