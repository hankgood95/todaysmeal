package com.kh.spring.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.spring.board.model.exception.BoardException;
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.Reply;
import com.kh.spring.common.Pagination;
import com.kh.spring.member.model.vo.Member;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;
	
	// 로깅 수업 시 작성
	// BoardController 용 logger 선언
	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("blist.do")
	public ModelAndView boardList(ModelAndView mv,
			@RequestParam(value="page", required = false) Integer page) {
		// 커맨드 객체 사용 시 해당 파라미터가 존재하지 않을 경우 null 값을 반환
		// 자료형이 int인 경우 null 값을 저장할 수 없음
		// 이를 해결하기 위해 Integer로 선언
		
		// 페이징 처리를 위해
		// 마이바티스 프로젝트에서 PageInfo vo 클래스, Pagination의 싱글톤 개념 클래스 복사
		int currentPage = page != null ? page : 1;
		
		ArrayList<Board> list = bService.selectList(currentPage);
		
		//System.out.println(list);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", Pagination.getPageInfo());
			mv.setViewName("board/boardListView");
		}else {
			throw new BoardException("게시글 전체 조회 실패!!");
		}
		return mv;
	}
	
	@RequestMapping("binsertView.do")
	public String boardInsertView() {
		return "board/boardInsertForm";
	}
	
	// boardInsert 프로세스 작성하기
	// saveFile 메소드 따로 분리해서 작성하며
	// buploadFiles에 저장하고
	// 파일명을 년월일시분초로 변경하여 originalFilename과
	// renameFilename을 db로 저장
	@RequestMapping("binsert.do")
	public String boardInsert(HttpServletRequest request, Board b,
							  @RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {
				b.setOriginalFileName(file.getOriginalFilename());
				b.setRenameFileName(renameFileName);
			}
		}
		
		b.setbContent(b.getbContent().replace("\n", "<br>"));
		
		int result = bService.insertBoard(b); 
		
		if(result > 0) {
			if(logger.isDebugEnabled()) {
				logger.debug(b.getbTitle() + "이라는 새글 등록!!");
			}
			return "redirect:blist.do";
		}else {
			throw new BoardException("게시글 등록 실패!");
		}	
		
		
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\buploadFiles"; // 파일 경로 수정

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		// 공지사항에서는 파일명 변환없이 바로 저장했지만
		// 게시판같은 경우 많은 회원들이 동시에 올릴수도 있고 겹치는 파일을 올릴수도 있기 때문에
		// 파일명을 rename하는 과정이 필요
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); //년월일시분초
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) 
				+ originFileName.substring(originFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath)); // 전달받은 file이 rename명으로 저장

		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		return renameFileName;

	}
	
	@RequestMapping("bdetail.do")
	public ModelAndView boardDetail(ModelAndView mv, int bId,
			@RequestParam("page") Integer page,
			HttpServletRequest request, HttpServletResponse response) {
		int currentPage = page != null ? page : 1;
		
		Board board = null;
		
		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("bId"+bId)) {
					// 해당 게시글에 대한 쿠키 존재(이미 읽은 게시글)
					flag = true;
				}
			}
			
			if(!flag) {
				// 처음 읽는 게시글일때
				Cookie c = new Cookie("bId"+bId, String.valueOf(bId));
				c.setMaxAge(1 * 24 * 60 * 60); // 하루동안 쿠키 저장
				response.addCookie(c);
			}
			
			board = bService.selectBoard(bId, flag);
		}
		
		
		if(board != null) {
			mv.addObject("board", board)
			.addObject("currentPage", currentPage)
			.setViewName("board/boardDetailView"); // 메소드 체이닝 방식
		}else {
			throw new BoardException("게시글 상세조회 실패!!");
		}
		return mv;
	}
	
	@RequestMapping("bupView.do")
	public ModelAndView boardUpdateView(ModelAndView mv, int bId,
			@RequestParam("page") Integer page) {
		Board board = bService.selectBoard(bId, true); // 조회수증가X
		board.setbContent(board.getbContent().replace("<br>", "\n"));
		
		mv.addObject("board", board)
		.addObject("currentPage", page)
		.setViewName("board/boardUpdateForm");
		return mv;
	}
	
	// 수정하기(*** 필요한 값 미리 jsp에서 담아서 가져오는 처리 ***)
	// 기존 파일 서버에서 지우고 새로운 파일 저장(deleteFile 메소드)
	// 현재 페이지 값 유지하면서 blist.do 재요청
	@RequestMapping("bupdate.do")
	public ModelAndView boardUpdate(ModelAndView mv, Board b,
									HttpServletRequest request, 
									@RequestParam("page") Integer page,
									@RequestParam(value="reloadFile", required=false) MultipartFile file) {
		
		if(file != null && !file.isEmpty()) { // 업로드 된 파일이 있다면
			
			if(b.getRenameFileName() != null) { // 기존 파일이 있다면
				deleteFile(b.getRenameFileName(), request); // 서버에서 파일 삭제
			}
			
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) { // 잘 저장 되었다면
				b.setOriginalFileName(file.getOriginalFilename());
				b.setRenameFileName(renameFileName);
			}
		}
		
		int result = bService.updateBoard(b); 
		
		if(result > 0) {
			mv.addObject("page", page)
			   .setViewName("redirect:blist.do");
		}else {
			throw new BoardException("게시글 수정 실패!!");
		}
		
		return mv;
		
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles"; // 경로 수정
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) 
			f.delete();
	}
	
	
	// 삭제하기
	// 첨부파일 있으면 지우고
	// blist.do 재요청
	@RequestMapping("bdelete.do")
	public String boardDelete(int bId, HttpServletRequest request) {
		Board b = bService.selectBoard(bId, true);
		
		if(b.getOriginalFileName() != null) {
			deleteFile(b.getRenameFileName(), request);
		}
		
		int result = bService.deleteBoard(bId);
		
		if(result > 0) {
			return "redirect:blist.do";
		}else {
			throw new BoardException("게시물 삭제 실패!!");
		}
	}
	
	// topList
	// 1. stream 이용해서 json 배열 보내기
	/*@RequestMapping("topList.do")
	public void boardTopList(HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<Board> list = bService.selectTopList();
		
		// list를 JSONArray로 변경
		JSONArray jArr = new JSONArray();
		
		// 다만 createDate와 같은 Date 형식은 SimpleDateFormat을 이용해서 변경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		for(Board b : list) {
			JSONObject jObj = new JSONObject();
			jObj.put("bId", b.getbId());
			jObj.put("bTitle", b.getbTitle());
			jObj.put("bWriter", b.getbWriter());
			jObj.put("originalFileName", b.getOriginalFileName());
			jObj.put("bCount", b.getbCount());
			jObj.put("bCreateDate", sdf.format(b.getbCreateDate()));
			
			jArr.add(jObj);
		}
		
		response.getWriter().print(jArr);
		
	}*/
	// 2. Gson 이용하는 방법
	// 컬렉션을 아주 쉽게 json 객체로 전송하는 방법
	// gson을 이용하면 어떠한 처리 없이 바로 컬렉션을 보낼 수 있다.
	@RequestMapping(value="topList.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public String boardTopList() {
		ArrayList<Board> list = bService.selectTopList();
		// 보통은 Gson을 그냥 생성해서 보내지만 어떠한 세팅이 필요하다면
		// GsonBuilder를 이용해서 Gson을 생성한다.
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(list);
	}
	
	// 댓글 리스트 불러오기
	@RequestMapping(value="rList.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getReplyList(int bId) {
		ArrayList<Reply> rList = bService.selectReplyList(bId);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		// 시분초 다루고 싶다면 java.util.Date 사용
		return gson.toJson(rList);
	}
	
	
	@RequestMapping("addReply.do")
	@ResponseBody
	public String addReply(Reply r, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String rWriter = loginUser.getId();
		
		r.setrWriter(rWriter);
		
		int result = bService.insertReply(r);
		
		if(result > 0) {
			return "success";
		}else {
			throw new BoardException("댓글 등록 실패!!");
		}
	}
	
	
	
	
	
	
}
