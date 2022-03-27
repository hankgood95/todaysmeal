<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		spring 프로젝트에서는 member, notice, board 관련 내용을 다룰 예정이므로
		미리 틀을 잡고 시작하겠다.
		
		1. views 폴더 안에 (common, member, notice, board) 폴더 세팅
		2. webapp/resources 폴더 안에 (buploadFiles, images, js, css, nuploadFiles) 폴더 세팅
		3. 해당 패키지들(common, controller, model-vo, service, dao, exception) 세팅
		4. VO 클래스 내용 채워서 만들기
		
		5_1. src/resources/ 안에  mybatis-config.xml config 설정 파일 만들기
		5_2. src/resources/ 안에 mappers 폴더 만들어 주고 member, notice, board 매퍼 파일 만들기
		5_3. mybatis-config.xml에 VO 클래스 별칭 지정(typeAliases) 매퍼 등록(mappers)
		
		기존에는 DB 연결 설정에 대한 정보를 mybatis-config.xml에 작성했지만
		스프링에서는 root-context.xml에 작성할 예정이다.
		(DataSource 등록은 서버 연동과 같이 이루어져야 하기 때문에)
		root-context.xml 에서는 DB관련 부분, 트랜잭션 처리, AOP 등 스프링에서 제공하는
		서비스들에 대한 설정을 관리한다.
		
		6. root-context.xml로 가서 DB 연결 설정에 필요한 dataSource,
		sqlSession 등을 bean으로 등록하는 부분을 명시적으로 작성하자.
		
		여기까지 작성 후 에러 발생하지 않는지 서버 돌려서 확인하자.
		
	 -->
	<h1 align="center">SpringFramework 시작해볼까?</h1>
	<div align="center">
		<button onclick="javascript:location.href='home.do';">Click me!</button>
	</div>

	<!-- 버튼을 클릭했을 때 메인 페이지(home)로 넘어가도록 해야 한다.
		앞으로는 urlpattern 뒤에 .do가 붙으면 DispatcherServlet이 실행 되도록 할 것이다.
		그러면 web.xml로 가서 url-pattern 부분을 *.do로 수정하고
		home.do 요청을 수행하는 HomeController로 가서 home.jsp로 바로 가도록 수정하자. -->

</body>
</html>