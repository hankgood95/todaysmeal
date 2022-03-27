package com.kh.spring.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.dao.BoardDao;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.PageInfo;
import com.kh.spring.board.model.vo.Reply;
import com.kh.spring.common.Pagination;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDao bDao;

	@Override
	public ArrayList<Board> selectList(int currentPage) {
		// 1. 게시글 개수 조회
		int listCount = bDao.getListCount();
		
		// 페이지 정보 저장
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		// 2. 게시글 리스트 조회
		return bDao.selectList(pi);
	}

	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(b);
	}

	@Override
	public Board selectBoard(int bId, boolean flag) {
		// 1. 조회수 증가
		if(!flag) { // 해당 글을 읽지 않았다면(flag가 false)
			bDao.addReadCount(bId);
		}
		
		//insert시 에러 발생 유도 
		//내가 클릭했던 글이 조회수가 증가하지 않았는지 확인해보기
		//bDao.insertBoard(new Board());
		
		// 2. 게시글 조회
		return bDao.selectBoard(bId);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(b);
	}

	@Override
	public int deleteBoard(int bId) {
		return bDao.deleteBoard(bId);
	}

	@Override
	public ArrayList<Board> selectTopList() {
		return bDao.selectTopList();
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bId) {
		return bDao.selectReplyList(bId);
	}

	@Override
	public int insertReply(Reply r) {
		return bDao.insertReply(r);
	}
}
