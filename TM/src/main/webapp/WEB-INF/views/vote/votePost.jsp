<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Vote Post</title>
	<!-- button JS -->
	<script src="${pageContext.servletContext.contextPath}/resources/vote/js/button.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
	<!-- voteBoard CSS -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/vote/css/vote-post.css">
</head>
<body>
<!-- Header Include -->
<%@include file ="/WEB-INF/views/common/header.jsp"%>
<!-- container -->
<div class="container">
	<!-- 게시글 섹션 -->
	<div class="post">
		<!-- 제목 -->
		<div class="title">
			<p>깻잎 논쟁</p>
		</div>
		<!-- 사진 -->
		<div class="image">
			<img src="${pageContext.servletContext.contextPath}/resources/vote/img/a.jpeg" alt="...">
		</div>
		<!-- 본문 -->
		<div class="content">
			<p>깻잎절임을 못 떼는 내 친구를 위해 깻잎지를 눌러주는 나의 연인. 당신은 이러한 행동을 이해할 수 있나요?</p>
		</div>
		<!-- 버튼 -->
		<div class="button-box">
			<div class="button">
				<input type="button" value="찬성" onclick="agree();"></input>
			</div>
			<div class="button">
				<input type="button" value="반대" onclick="disagree();"></input>
			</div>
		</div>
	</div>
	<!-- 댓글 섹션 -->
		<!-- 의견 등록 -->
		<!-- 베스트 댓글 -->
			<!-- 찬성측 베스트 댓글 -->
			<!-- 반대측 베스트 댓글 -->
		<!-- 댓글 -->
</div>
<!-- Footer Include -->
<%@include file ="/WEB-INF/views/common/footer.jsp"%>
</html>