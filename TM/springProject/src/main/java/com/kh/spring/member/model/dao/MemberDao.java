package com.kh.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

@Repository("mDao") 
// @Repository라는 어노테이션 또한 DB에 접근하는 클래스에 부여하는 어노테이션으로
// @Component의 구체화 된 개념이다.
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession; // root-context에서 작성한 bean으로 생성 된다.
	
	public Member selectMember(Member m) {
		return sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int updateMember(Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public int deleteMember(String id) {
		return sqlSession.update("memberMapper.deleteMember", id);
	}

	public int checkIdDup(String id) {
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}
}
