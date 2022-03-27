package com.kh.spring.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.Member;
// @Component는 단순히 빈으로 등록하기 위한 어노테이션이라면
// @Service는 보다 구체화 된 즉, Service의 의미를 가지는 클래스라는 걸 보여주기 위한
// 어노테이션으로 ("")를 통해 빈으로 등록할 때의 이름을 지정해 줄 수 있다.
@Service("mService")
public class MemberServiceImpl implements MemberService{
	// 암호화 처리 후 작성
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberDao mDao;
	
	@Override
	public Member loginMember(Member m) {
		// 스프링 적용 이후 service 단에서 sqlSession을 생성하지 않는다.
		// dao에서 DI를 통해 sqlSession을 생성한다.
		
		// 암호화 이후 로그인 처리
		// 기존 JSP/Servlet에서 사용했던 방식대로 한다면
		// 내가 입력한 비밀번호를 다시 암호화 해서 암호화 한 값과
		// DB의 비번값을 비교해서 일치하면 로그인 성공
		
		/*String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);*/
		
		// 매번 랜덤한 솔트값을 가지고 암호화를 하므로 encode() 호출 시마다 다이제스트 값은 변경 됨
		// 스프링 시큐리티에서 제공하는 matches() 메소드를 통해 원문과 평문이 일치하는지 비교 가능
		
		// ==> 사용자가 입력한 id만으로 DB에서 조회해온 뒤
		// 조회 된 pwd와 사용자가 입력한 pwd가 matches() 메소드를 통과하는지 확인하여
		// 로그인 처리를 완료함
		Member loginUser = mDao.selectMember(m);
		
		// select 된 아이디 값은 있으나 비밀번호가 매칭되지 않은 경우
		// 앞의 조건이 빠지면 우리가 원하는 MemberException이 아닌
		// nullPointerException이 발생함
		if(loginUser != null && !bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			loginUser = null;
		}
		return loginUser;
	}

	@Override
	public int insertMember(Member m) {
		// 비밀번호가 현재는 평문으로 되어 있다
		// ==> 스프링 시큐리티 모듈에서 제공하는 bcrypt 암호화 방식
		
		// 단방향 해쉬함수
		// 1. 많은 다이제스트가 확보되면 평문을 찾아낼 수 있음
		// 2. 해쉬함수의 빠른 처리 속도로 인해 1초당 56억개의 다이제스트를 대입할 수 있으므로
		//    비교를 통해 평문을 알아낼 수 있음
		
		// ==> 이를 극복하기 위해 salting 이라는 기법이 추가되었음
		// 원본 메세지 + salt 를 추가하여 동일한 길이의 다이제스트를 생성하는 방법
		// salt 값을 랜덤하게 생성하여 암호화하는 방식
		
		// 1. pom.xml 스프링 시큐리티 모듈 추가
		
		// 2. 사용할 객체를 bean으로 등록한다
		// resources/spring/spring-security.xml 파일 만들기
		
		// 3. 암호화에 필요한 객체를 의존성 주입을 통해 받아오기 -> 필드부 선언
		
		// 암호화된 비밀번호를 저장할 변수
		String encPwd= bcryptPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
		
		return mDao.insertMember(m);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}

	@Override
	public int deleteMember(String id) {
		return mDao.deleteMember(id);
	}

	@Override
	public int checkIdDup(String id) {
		return mDao.checkIdDup(id);
	}

}
