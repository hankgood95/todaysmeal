package com.tm.kr.board;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("board.BoardController") //객체생성&클라이언트 요청 받음 
@RequestMapping("/board/*") // 한개의 컨트롤러에서 다수 요청처리. requestmapping의 value 형태 url 들어오면 해당 method 호출
public class BoardController {
	/*
	@Autowired
	private BoardService service;
	*/
	 @RequestMapping(value="list")
	 public String list(
			 @RequestParam(value="page", defaultValue="1") int current_page,
			 @RequestParam(defaultValue="all") String condition,
			 @RequestParam(defaultValue="") String keyword,
			 HttpServletRequest req,
			 Model model) throws Exception {
	 
	String cp = req.getContextPath();

	int rows = 10; // 한 화면에 보여주는 게시물 수
	int total_page = 0;
	int dataCount = 0;
	

	return "board/list";
	}
	 
}


//요청을 받아 view로 결과 리턴
