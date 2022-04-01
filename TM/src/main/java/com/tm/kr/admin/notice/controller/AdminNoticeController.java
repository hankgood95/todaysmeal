package com.tm.kr.admin.notice.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
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
	public String insertNotice(@RequestParam("title") String title,@RequestParam("content") String content) {
		
		logger.info("Notice Title : "+ title);
		logger.info("Notice Content : "+ content);
		
		logger.info("New Notice is ready to save");
		
		return "redirect:notices"; //notices로 다시 리디렉트 시켜준다.
	}
	
	//Notice  수정하게 될떄 진입하게 되는 부분
	//지금 여기로 들어오고 있지 않음 어째서 일까 안되는 이유를 찾았음 jsp에서 무조건 method를 post로 하고 제출을 해줘야 함
	@PutMapping(value="notice")
	public String updateNotice(@RequestParam("title") String title, @RequestParam("content") String content) {
		
		logger.info("Notice Title : "+ title);
		logger.info("Notice Content : "+ content);
		
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
	
	//@ResponseBody를 사용하는 이유는 Json 객체를 body에다가 실어서 보낼것이기 때문
	@RequestMapping(value="uploadSummernoteImageFile", method=RequestMethod.POST)
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		
		//여기서 MultipartFile 이란 웹 클라이언트가 요청을 보낼때 http 프로토콜 body 부분에 데이터를 여러부분으로 나누어서 보내는 것이다.
		//이렇게해서 파일을 받아오는 이유는 일단 HttpServletRequest에는 파일을 받지 않기 때문이다. 따라서 파일을 받기 위햇 MultipartFile을 사용하는것이다.
		
		//JsonObject는 json 형태의 데이터를 구성되게 해주는 클래스이다.
		JsonObject jsonObject = new JsonObject();
		
		//프로젝트 내부에 저장을 하기 위해서 contextRoot 값을 가져옴. 하지만 이건 지금만 이렇게 할거고 실제 배포시엔 외부경로에다가 저장을 할거임
		//web application 상의 경로를 가져온다. 어쩌면 이건 상대경로임. 절대경로라면 보안상의 이유로 절대경로로 접근을 못하게함
		String contextRoot= request.getSession().getServletContext().getRealPath("resources"); 
		String fileRoot = contextRoot+"\\admin\\img\\";
		
		logger.info("fileRoot : "+fileRoot);
		
		File targetDir = new File(fileRoot);
		
		//해당 디렉토리가 있는지 확인
		if(!targetDir.exists()) {
			targetDir.mkdir();
			if(targetDir.exists()) {
				logger.info(fileRoot+" directory successfully made");
			}
		}
		
		String originalFileName = multipartFile.getOriginalFilename(); //파일의 오리지널 파일 이름을 가져왔음
		//lastIndexOf()는 특정 문자를 뒤에서부터 .을 찾아서 오는것이다. 따라서 . 즉 확장자 전까지의 index를 return 한다.
		//그럼 해당 index 부터 마지막 index까지를 extension에 집어 넣게 되는것이다.
		//ex) aws.js를 하게 되면 lastIndex는 4가 되는것이고 subString으로 부터 받아오는 값은 js가 되는것이다.
		//그래서 변수명을 extension이라고 적었다. 왜냐면 확장자명이니까
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); 
		
		//UUID라는 클래스를 사용해서 고유의 파일 이름을 가질수 있게 했고 extension을 붙여서 확장자명을 붙여주었다.
		String savedFileName = UUID.randomUUID()+ extension;
		
		logger.info("savedFileName : "+savedFileName);
		
		//그럼 이제 파일명을 만들었으니 새로 파일을 만들일만 남았다.
		
		//contextRoot/resources/admin/img/새로지은파일명.확장자 이렇게 되어 있는 File 인스턴스를 생성했다.
		File targetFile = new File(fileRoot+savedFileName); 
		
		//file 인스턴스를 생성했으니 일단 해당 파일이 실제로 존재하는지를 먼저 체크해보자.
		
		try {
			//여기서 InputStream을 설명하기 전에 일단 Stream부터 설명을 하겠다.
			//Stream 이란 데이터가 이동하는 통로를 의미 한다.
			//그러면 InputStream을 특정 파일 데이터를 읽거나 소켓을 통해 데이터를 읽거나 키보드를 통해서 입력한 데이터를 읽을때 사용한다.
			//여기서 InputStream은 multipartFile을 즉 파일을 .getInputStream()으로 받아와서 fileStream에다가 저장한것이다.
			InputStream fileStream = multipartFile.getInputStream();
			
			//그럼이제 InputStream에는 받아온 File 데이터가 있는것이다. 이제 이 File 데이터를 어디가에다가 실제로 저장을 하면 되는데
			//그역할을 해주는 부분이 아래 소스이다.
			//받아온 fileStream을 targetFile의 경로에다가 복사를 해줘서 파일을 저장하는것이다.
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			
			//위 파일을 저장하는 과정에서 아무런 문제가 발생하지 않는다면 이제 실제 파일이 담겨져있는 파일경로를 json을 통해서 보내준다.
			//파일경로를 보낼땐 절대 경로가 되어서는 안된다 왜냐 보안상의 이유로 안된다 따라서 상대경로를 보내줘야 한다.
			//상대경로로는 프로젝트 path/resources/admin/img/파일이름 이렇게 보내줘야지만 해당 파일에 접근을 할수가 있다.
			jsonObject.addProperty("url",request.getContextPath()+"/resources/admin/img/"+savedFileName);
			logger.info("url : "+jsonObject.get("url").toString());
			//그리고 responseCode로 success를 준다.
			jsonObject.addProperty("responseCode", "success");
		} catch (IOException e) { //저장하는데 문제가 있다면 여기로 진입을 하게 되는데
			FileUtils.deleteQuietly(targetFile); //저장된 파일을 삭제한다.
			jsonObject.addProperty("responseCode", "error"); //그리고 jsonObject에 reponseCode를 error로 준다.
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//그리고 마지막으로 jsonObject를 String으로 변환해서 돌려준다.
		return jsonObject; //여기서 따로 페이지를 명시해주지 않아도 되는 이유는 애초에 Ajax는 비동기이기 때문이다. 따라서 페이지의 전환이 없고 필요한 데이터만 보내게 된다.
		
	}
}
