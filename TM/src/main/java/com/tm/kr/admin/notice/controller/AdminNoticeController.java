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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tm.kr.admin.notice.model.Notice;
import com.tm.kr.member.model.Member;

@Controller
@RequestMapping("/admin/*") // 이걸 쓰지 않게 되면 관리자 페이지에서 들어오는 모든 uri요청의 모든 @RequestMapping에 /admin을 적어줘야 한다.그래서 그런 번거로움을 없애기 위해서 이와 같은 소스를 넣었다.
public class AdminNoticeController {

	Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	Member wook;
	Notice notice;
	
	//Notice List로 이동하기 위한 부분
	@RequestMapping(value = "notices")
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
		
		//원래는 noticeList를 DB 연동해서 값들울 넣어야 함 하지만 일단 나는 여기다가 임의로 값을 넣음
		
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
	
	//새로운 notice 작성 페이지로 넘어가기 위해서
	@RequestMapping(value="new-notice")
	public String newNoticePage(Model model) {
		
		logger.info("admin Notice 작성 Page에 들어왔다.");
		//해당 페이지가 noticePage라는것을 알려주기 위해서 model에 pageName을 보낸다.
		model.addAttribute("pageName", "noticePage");
		
		return "admin/notice_form";
	}
	
	//notice 상세보기를 보여주기 위해서
	@GetMapping(value="notice")
	public String noticeDetail(HttpServletRequest request,Model model) {
		
		logger.info("admin Notice Detail Page에 들어왔다.");
		model.addAttribute("pageName", "noticePage");
		
		//받아온 noticeNum을 가지고 이제 DB 조회를 해서 notice를 가져오면 됨
		String noticeNum = request.getParameter("noticeNum");
		logger.info("notice number is : "+noticeNum);
		
		//하지만 난 가져올 DB가 없으니 일단은 위에서 만든 notice를 보내줌
		model.addAttribute("noticeNum",noticeNum);
		model.addAttribute("notice", notice);
		return "admin/notice_detail";
	}
	
	//notice update 화면으로 이동시켜주기 위해서
	@RequestMapping(value="up-notice-page")
	public String updateNotice(HttpServletRequest request,Model model) {
		
		logger.info("admin Notice update Page에 들어왔다.");
		model.addAttribute("pageName", "noticePage");
		
		//받아온 noticeNum을 가지고 이제 DB 조회를 해서 notice를 가져오면 됨
		String noticeNum = request.getParameter("noticeNum");
		
		logger.info("notice number is : "+noticeNum);
		
		//하지만 난 가져올 DB가 없으니 일단은 위에서 만든 notice를 보내줌
		model.addAttribute("notice", notice);
		return "admin/notice_form";
	}
	
	//Notice 새로 저장하게 될때 진입하게 되는 부분
	@RequestMapping(value="notice", method=RequestMethod.POST)
	public String insertNotice(@RequestParam("title") String title) {
		
		logger.info("Notice Title : "+ title);
		
		logger.info("New Notice is ready to save");
		
		return "redirect:notices"; //notices로 다시 리디렉트 시켜준다.
	}
	
	//Notice  수정하게 될떄 진입하게 되는 부분
	//지금 여기로 들어오고 있지 않음 어째서 일까 안되는 이유를 찾았음 jsp에서 무조건 method를 post로 하고 제출을 해줘야 함
	@PutMapping(value="notice")
	public String updateNotice(@RequestParam("title") String title) {
		
		logger.info("Notice Title : "+ title);
		
		logger.info("Notice is ready to update");
		
		return "redirect:notices"; //notices로 다시 redirect 시켜준다.
	}
	
	//Notice 삭제하게 될떄 진입하는 부분
	@DeleteMapping(value="notice")
	public String delNotice(HttpServletRequest request,Model model) {
		
		logger.info("Notice is ready to delete");
		
		model.addAttribute("pageName", "noticePage");
		
		//받아온 noticeNum을 가지고 이제 DB 조회를 해서 notice를 가져오면 됨
		String noticeNum = request.getParameter("noticeNum");
		
		logger.info("notice number is : "+noticeNum);
		
		//하지만 난 가져올 DB가 없으니 일단은 위에서 만든 notice를 보내줌
		model.addAttribute("notice", notice);
		return "admin/update_notice";
	}
}
