<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메뉴바는 어느 페이지든 포함하고 있을 테니 여기에서 contextPath 변수 선언 -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"
scope="application"/>
<link rel="stylesheet" href="${ contextPath }/resources/css/menubar-style.css"
type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>
			alert('${msg}');
		</script>
		<c:remove var="msg"/>
	</c:if>

	<h1 align="center">Finally Spring!!!</h1>
	<br>
	<!-- 로그인 유저가 있는 경우 / 없는 경우 동시에 작업 -->
	<div class="loginArea" align="right">
		<c:if test="${ empty sessionScope.loginUser }">
			<form action="login.do" method="post">
				<table id="loginTable" style="text-align:center;">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id"></td>
						<td rowspan="2">
							<button id="loginBtn">로그인</button>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<td colspan="3">
							<a href="enrollView.do">회원가입</a>
							<a href="#">아이디/비밀번호 찾기</a>
						</td>
					</tr>
				</table>
			</form>
		</c:if>
		<c:if test="${ !empty sessionScope.loginUser }">
			<h3 align="right">
				<c:out value="${ loginUser.name }님 환영합니다!!"/>
				<c:url var="myinfo" value="myinfo.do"/>
				<c:url var="logout" value="logout.do"/>
				<button onclick="location.href='${ myinfo }'">정보수정</button>
				<button onclick="location.href='${ logout }'">로그아웃</button>
			</h3>
		</c:if>
	</div>
	<!-- 가장 먼저 로그인, 로그아웃 기능을 구현한다.
		우선 기존의 xml 방식을 확인해보기 위해 servlet-context.xml로 이동!!! -->
	
	<!-- 회원 관련 서비스 구현 이후 구현할 메뉴바 -->
	<c:url var="nlist" value="nlist.do"/>
	<c:url var="blist" value="blist.do"/>
	<div class="menubar">
		<div class="nav">
			<div class="menu"><a href="home.do">HOME</a></div>
			<div class="menu"><a href="${ nlist }">공지사항</a></div>
			<div class="menu"><a href="${ blist }">게시판</a></div>
			<div class="menu"><a href="#">etc</a></div>
		</div>
	</div>





</body>
</html>