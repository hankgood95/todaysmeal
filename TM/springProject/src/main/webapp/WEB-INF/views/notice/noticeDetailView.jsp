<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap {
		width:50%;
		margin:auto;
	}
	#noticeTable {
		width:100%;
		border:solid 1px white;
	}
	#noticeTable th, #noticeTable td {
		border:solid 1px white;
		text-align:center;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<br>
	
	<h1 align="center">${ notice.nId }번글 상세보기</h1>
	<br><br>
	
	<div class="wrap">
			<table id="noticeTable">
				<tr>
					<td>번호</td>
					<td>${ notice.nId }</td>
					<td>제목</td>
					<td>${ notice.nTitle }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${ notice.nWriter }</td>
					<td>작성일</td>
					<td>${ notice.nCreateDate }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">${ notice.nContent }</td>
				</tr>
				<c:if test="${ !empty notice.filePath }">
				<tr>
					<td>첨부파일</td>
					<td colspan="3">
						<a href="${ contextPath }/resources/nuploadFiles/${notice.filePath}"
						download>${ notice.filePath }</a>
					</td>
				</tr>
				</c:if>
			</table>
	</div>
	<br>
	<br>
	
	<c:url var="nupView" value="nupView.do">
		<c:param name="nId" value="${ notice.nId }"/>
	</c:url>
	<c:url var="ndelete" value="ndelete.do">
		<c:param name="nId" value="${ notice.nId }"/>
	</c:url>
	<c:if test="${ loginUser.id eq 'admin' }">
		<p align="center">
			<button onclick="location.href='${ nupView }'">수정하기</button>
			&nbsp;&nbsp;
			<button onclick="location.href='${ ndelete }'">삭제하기</button>
		</p>
	</c:if>






</body>
</html>