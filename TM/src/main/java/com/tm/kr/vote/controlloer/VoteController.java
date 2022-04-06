package com.tm.kr.vote.controlloer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
//@RequestMapping("/vote/*")
public class VoteController {

Logger logger = LoggerFactory.getLogger(VoteController.class);
	
	@RequestMapping(value = "votePost")
	public String votePostController() {
		
		logger.info("votePost page에 들어왔다.");
		
		// 아래의 return 값은 /WEB-INF/views/vote/votePost.jsp 로 변환 되어 해당 파일로 mapping 시켜주는데
		return "vote/votePost"; //어떻게 이 return 값이 어떻게 WEB-INF/views/vote/votePost.jsp 로 변환 될까?
		//이 역시 Controller에 대한 Configuration이 담긴 servlet-context.xml 로 가보면 알수 있다.
	}

	@RequestMapping(value = "recordVote")
	@ResponseBody
	public String recordVote() {

		System.out.println("A!!!!!!!!!!!!!!!!!!!!!");
		System.out.println("B!!!!!!!!!!!!!!!!!!!!");

		return null;
	}
}



// 1. db 연동 이후 투표 수 증가시키고
// 2. 성공했으면 voteBoard.jsp 데이터 갱신 후 사용자에게 투표 됐는지 안됐는지 알려주기
// 3. 실패할 경우 alert 띄우기