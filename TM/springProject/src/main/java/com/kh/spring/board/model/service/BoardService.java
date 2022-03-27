package com.kh.spring.board.model.service;

import java.util.ArrayList;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.Reply;

public interface BoardService {
	// 1. 게시판 전체 조회
	ArrayList<Board> selectList(int currentPage);
	
	// 2. 게시판 글쓰기
	int insertBoard(Board b);
	
	// 3. 게시글 상세 -> 조회수 증가 방지
	Board selectBoard(int bId, boolean flag);
	
	// 4. 게시판 수정
	int updateBoard(Board b);
	
	// 5. 게시판 삭제
	int deleteBoard(int bId);

	// 6. 조회수 top5
	ArrayList<Board> selectTopList();

	// 7. 댓글 리스트 불러오기
	ArrayList<Reply> selectReplyList(int bId);

	// 8. 댓글 입력
	int insertReply(Reply r);
	
}
