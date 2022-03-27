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
	#boardTable {
		margin:auto;
		border:solid 1px white;
	}
	#boardTable th, #boardTable td {
		border:solid 1px white;
		text-align:center;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<h1 align="center">${ board.bId }번 게시글 수정하기</h1>
	<br>
	
	<form action="bupdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${ currentPage }">
		<input type="hidden" name="bId" value="${ board.bId }">
		<input type="hidden" name="renameFileName" value="${ board.renameFileName }">
		<table id="boardTable">
			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle" size="50"
				value="${ board.bTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="bWriter" size="50"
				value="${ board.bWriter }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="bContent">${ board.bContent }</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="reloadFile">
					<c:if test="${ !empty board.originalFileName }">
						<br>현재 업로드한 파일 :
						<a href="${ contextPath }/resources/buploadFiles/${ board.renameFileName }"
						download>${ board.originalFileName }</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기"> &nbsp;
					<c:url var="blist" value="blist.do">
						<c:param name="page" value="${ currentPage }"/>
					</c:url>
					<button type="button" onclick="location.href='${blist}'">목록으로</button>
				</td>
			</tr>
		</table>
		
	
	
	</form>













</body>
</html>