package com.kh.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.member.model.exception.MemberException;
import com.kh.spring.member.model.service.MemberService;/*
import com.kh.spring.member.model.service.MemberServiceImpl;*/
import com.kh.spring.member.model.vo.Member;

@SessionAttributes({"loginUser","msg"})
// Model에 loginUser라는 키 값으로 객체가 추가 되면 자동으로 세션에 추가하라는 어노테이션
// (클래스 위쪽에 추가해야 함)
@Controller // 다음과 같이 Controller 타입의 어노테이션을 붙여주면 빈 스캐닝을 통해 자동으로 등록
public class MemberController {
	
	// 다음과 같이 Autowired 타입의 어노테이션을 붙여주면 직접 객체를 생성할 필요 없이
	// 변수 선언만 해도 빈 스캐닝을 통해 아래의 'mService' 이름을 가지고 있는 빈을 찾아서
	// 자동으로 생성해준다.
	@Autowired
	private MemberService mService;
	
	// 2_3. MemberController용 logger 필드 선언
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	// @RequestMapping(value="login.do", method=RequestMethod.POST)
	// -> @RequestMapping 타입의 어노테이션을 붙여줌으로써 HandlerMapping 등록
	// @RequestMapping의 속성
	// 여러개의 속성을 명시할때는 value= 를 명시해야 하고
	// value만 명시하는 경우는 @RequestMapping("login.do")처럼 생략 가능
	
	// 파라미터를 전송 받는 방법
	/* 1. HttpServletRequest를 통해 전송 받기 (기존 방식)
	 * 메소드의 매개변수로 HttpServletRequest를 작성하면 메소드 실행 시
	 * 스프링 컨테이너가 자동으로 객체를 인자로 주입
	 */
	/*@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		
		return "home";
	}*/
	
	/* 2. @RequestParam 어노테이션 방식
	 * 
	 *  스프링에서는 조금 더 간단하게 파라미터를 받아올 수 있는 방법을 제공
	 *  HttpServlet과 비슷하게 request 객체를 이용하여 데이터를 전송 받는 방법
	 * 
	 * */
	/*@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(@RequestParam(value="id", defaultValue="user") String id,
							@RequestParam(value="pwd", defaultValue="1234") String pwd) {
		
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		return "home";
	}*/
	
	/* 3. @RequestParam 어노테이션 생략
	 * 위의 어노테이션을 생략해도 파라미터 값을 가져와서 변수에 저장할 수 있다.
	 * (단, 매개변수를 name 값과 동일하게 해야 자동으로 값이 주입 된다.)
	 * 
	 * 다만 어노테이션을 생략할 경우 다른 설정 값은 불가
	 */
	/*@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(String id, String pwd) {
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		return "home";
	}*/
	/* 4. @ModelAttribute를 이용한 값 전달 방법
	 * 
	 * 요청 파라미터가 많은 경우 객체 타입으로 넘겨 받게 된다.
	 * --> 기본 생성자와 setter를 이용한 주입 방식이기 때문에 둘 중 하나라도 없으면
	 *     에러가 발생한다.
	 * 
	 * 이를 커맨드 방식이라고 하는데
	 * 스프링 컨테이너가 기본 생성자를 통해 Member 객체를 생성하고 setter 메소드로 
	 * 꺼낸 파라미터들로 값을 변경한 후에 현재 이 메소드를 호출할 때 인자로 전달하며 호출
	 * (주의 : 반드시  name 속성의 값과 필드명 동일해야하며 setter 규칙에 맞추어 작성해야 함)
	 * 
	 * 즉, primitive 타입은 RequestParam으로 받고 객체 타입은 ModelAttribute로 받자!
	 */
	/*@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(@ModelAttribute Member m) {
		System.out.println("id : " + m.getId());
		System.out.println("pwd : " + m.getPwd());
		return "home";
	}*/
	
	/* 5. @ModelAttribute 어노테이션 생략하고 객체로 바로 전달 받는 방법
	 * 
	 *  어노테이션을 생략해도 자동으로 커맨드 객체로 매핑이 된다.
	 *  
	 *  스프링에서 파라미터를 전달 하는 방법은 상당히 다양하다.
	 *  이 외에도 @RequestBody라는 어노테이션으로 요청하는 데이터가
	 *  XML, JSON일 때 사용하기도 함(ajax 수업에서 배울 예정)
	 * */
	/*
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(Member m, HttpSession session) {
		// 이제 로그인 처리를 마무리 해보자
		// 기존의 방식과 유사하게 로그인 처리용 메소드를 service로 호출해보자
		
		//MemberService mService = new MemberServiceImpl();
		// System.out.println(mService.hashCode());
	*/
		/* 확인해볼 사항
		 * 1. MemberServiceImpl 클래스명 변경하기
		 * 	--> 에러 발생
		 * 2. 해쉬코드 출력하기
		 *  --> 매 요청시마다 서비스 객체의 해쉬코드가 달라지는 것을 확인할 수 있음
		 *  
		 *  의존성 주입(DI)을 이용해보자!!!
		 *  필드로 MemberService 인터페이스 타입 레퍼런스를 선언하여 의존성 주입을 하고 오자
		 *  
		 *  1번 --> 클래스명을 변경해도 코드를 변경할 필요가 없다.
		 *  	의존성 주입을 통해 결합 관계에 있는 두 클래스의 의존 관계를 해결하게 만들어준다.
		 *  
		 *  2번 --> 매 요청마다 같은 해쉬코드 값을 확인할 수 있다.
		 *         즉, 한개의 객체만 생성해 놓고 계속 사용하는 것이다.
		 *         싱글톤 개념 --> 메모리의 효율이 올라간다.
		 *         요청 10000건을 처리할 때 mService 10000개의 객체를 필요로 하는 것이
		 *         아니라 1개의 객체만 관리하면 된다. 
		 * */
		/*
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) {
			// 로그인 성공 시 세션에 정보를 담아야 하기 때문에 세션이 필요
			// 매개변수로 HttpSession을 추가
			session.setAttribute("loginUser", loginUser);
		}
		
		return "home";
	}
	*/
	// 이제는 전달 받는 것에 대한 것이 아니라 요청 후 전달하고자 하는 데이터가 있을 경우의 처리
	// 1. Model 객체를 사용하는 방법
	// 커맨드 객체로 Model을 사용하게 되면 뷰로 전달하고자 하는 데이터를 맵 형식(key, value)
	// 로 담을 수 있다. scope는 request이다. (서블릿에서 사용하던 requestScope와 동일)
	/*@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model, HttpSession session) {
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "home";
		}else {
			model.addAttribute("msg", "로그인 실패!!");
			return "common/errorPage";
		}
		
	}*/
	
	// 2. ModelAndView 객체를 사용하는 방법
	/* Model : 응답 페이지에 값을 전달할 때 맵 형식으로 저장하여 전달하는 객체
	 * View : requestDispatcher의 forward 시 이동할 페이지의 정보(url)을 담는 객체
	 * 
	 * Model은 따로 사용 가능하지만 View는 단독 사용 불가능
	 *    -> 대신 String 반환형으로 url 입력 시 forward 동작을 함.
	 */
	/*@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(Member m, ModelAndView mv, HttpSession session) {
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("home");
		}else {
			mv.addObject("msg", "로그인 실패!!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}*/
	
	// 로그아웃용 컨트롤러
	/*@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}*/
	
	// 3. session에 저장할 때 @SessionAttributes 사용하기
	// -> Model에 Attribute가 추가될 때 자동으로 키 값을 찾아 세션에 등록하는 기능을
	//    제공하는 어노테이션
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model) { 
		// HttpSession 커맨드 객체 생략
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) {
			// 로깅 수업 시 작성 2_3.
			if(logger.isDebugEnabled())
				// logger의 레벨이 DEBUG인지 확인하는 조건 문
				// logginEvent로 발생되는 시간을 절약
				logger.info(loginUser.getId() + " 로그인");
			
			// 조회 성공 시 Model에 loginUser 정보를 담는다.
			model.addAttribute("loginUser", loginUser);
			// -> 이렇게만 작성하면 requestScope에만 담김
			// 가장 위로 올라가서 @SessionAttributes라는 어노테이션을 추가한다. 
			return "home";
		} else {
			// Exception을 이용하여 errorPage 연결
			throw new MemberException("로그인 실패!!");
			// RuntimeException으로 상속 받았을 때의 차이점
			// -> throws를 넘길 필요 없으며 try-catch로 잡을 필요도 없음
			
			// 에러페이지로 연결하는 방법 -> web.xml에 공용 에러 페이지를 등록하여
			// 모든 예외가 발생 시 그 페이지가 뜨게끔 설정
		}
		
	}
	
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		// 로그아웃 처리를 위해 커맨드 객체로 세션의 상태를 관리할 수 있는 SessionStatus 객체가 필요
		
		status.setComplete();
		// 세션의 상태를 확정 지어주는 메소드 호출이 필요함.
		
		// return "home"; : forward 방식
		return "redirect:home.do"; // redirect 방식
	}
	/* forward와 redirect의 차이
	 * 
	 * forward
	 * 요청을 한 페이지의 request, response 정보를 그대로 클라이언트로 전달하고
	 * 주소 값이 변하지 않음.
	 * 
	 * redirect
	 * 기존 request, response 객체가 삭제되고 지정한 주소(url)로
	 * 새로 요청을 보내어 새로운 request, response 객체를 생성하고 주소 값이 바뀜.
	 */
	
	// ----------------------- 회원 가입 처리 ---------------------------------
	// 뷰 페이지를 이동시키는 컨트롤러 추가
	@RequestMapping("enrollView.do")
	public String enrollView() {
		return "member/memberJoin";
	}
	
	// 회원 가입 폼 작성 이후 요청을 받아줄 컨트롤러
	@RequestMapping("minsert.do")
	public String memberInsert(Member m, 
			@RequestParam("post") String post,
			@RequestParam("address1") String address1,
			@RequestParam("address2") String address2,
			Model model,
			RedirectAttributes rd
			) {
		
		//System.out.println("member = " + m);
		//System.out.println(post + "," + address1 + "," + address2);
		
		// 한글 인코딩은 스프링에서 제공하는 필터를 이용해서 간단히 처리 할수 있음
		// web.xml로 이동 !! 
		
		// 주소값은 , 구분자를 두고 저장
		m.setAddress(post + "," + address1 + "," + address2);
		
		int result = mService.insertMember(m);
		
		// RedirectAttributes : Redirect시 데이터를 전달할 수 있는 객체
		// RedirectAttributes.addFlashAttribute()
		// : Redirect로 데이터 전달 시 URL에 데이터가 노출되지 않게 하는 메소드
		
		if(result > 0) {
			//model.addAttribute("msg", "회원가입이 완료 되었습니다. 로그인 해주세요.");
			rd.addFlashAttribute("msg", "회원가입이 완료 되었습니다. 로그인 해주세요.");
			return "redirect:home.do";
		}else {
			model.addAttribute("msg", "회원 가입 실패!!");
			return "common/errorPage";
		}
		
	}
	
	// --------------------- 회원 수정 / 회원 탈퇴 ----------------------------
	// 뷰페이지를 이동시키는 컨트롤러 추가
	@RequestMapping("myinfo.do")
	public String myInfoView() {
		return "member/myPage";
	}
	// 수정하기(memberUpdate)
	// 성공 시 msg 회원정보가 수정 되었습니다 -> home으로 이동
	// 실패시 msg 회원 가입 실패 -> errorPage로 이동
	@RequestMapping("mupdate.do")
	public String memberUpdate(Member m, Model model,
							   @RequestParam("post") String post,
							   @RequestParam("address1") String addr1,
							   @RequestParam("address2") String addr2,
							   RedirectAttributes rd) {
		
		m.setAddress(post+","+addr1+","+addr2);
		
		int result = mService.updateMember(m); 
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "회원정보가 수정 되었습니다.");
			model.addAttribute("loginUser", m);
			return "redirect:home.do";
		}else {
			model.addAttribute("msg", "회원 가입 실패");
			return "common/errorPage";
		}
	}
	
	// 삭제하기(memberDelete)
	// 성공 시 msg 회원정보가 삭제 되었습니다 -> home으로 이동 (+로그아웃 처리)
	// 실패시 msg 회원 삭제 실패 -> errorPage로 이동
	@RequestMapping("mdelete.do")
	public String memberDelete(String id, Model model, SessionStatus status, RedirectAttributes rd) {
		
		int result = mService.deleteMember(id); 
		
		if(result>0) {
			rd.addFlashAttribute("msg", "회원 탈퇴가 완료 되었습니다.");
			status.setComplete();
			return "redirect:home.do";
		}else {
			model.addAttribute("msg", "회원 탈퇴 실패");
			return "common/errorPage";
		}
	}
	
	// 아이디 중복 검사
	// 1. stream 이용
	/*@RequestMapping("dupid.do")
	public void idDuplicateCheck(HttpServletResponse response,
			String id) throws IOException {
		boolean isUsable = mService.checkIdDup(id) == 0 ? true : false;
		
		response.getWriter().print(isUsable);
	}*/
	
	// 2. ResponseBody 이용한 방법
	/*@RequestMapping("dupid.do")
	@ResponseBody
	public String idDuplicateCheck(String id) {
		boolean isUsable = mService.checkIdDup(id) == 0 ? true : false;
		return isUsable + "";
	}*/
	
	// 3. JsonView를 이용한 방식(실습)
	// dependency 추가, jsonView, BeanNameViewResolver 빈 등록
	@RequestMapping("dupid.do")
	public ModelAndView idDuplicateCheck(ModelAndView mv, String id) {
		
		boolean isUsable = mService.checkIdDup(id) == 0 ? true : false;
		
		Map map = new HashMap();
		map.put("isUsable", isUsable);
		
		mv.addAllObjects(map);
		
		mv.setViewName("jsonView");
		
		return mv; // json객체로 넘어감
	}
	
	
	
	
	
	
	
	
}
