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
		/* width:100%; */
		margin:auto;
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
	
	<h1 align="center">${ notice.nId }번글 수정 페이지</h1>
	<br><br>
	
	<div class="wrap">
		<!-- 첨부파일 등록을 위해서 반드시 enctype 작성 -->
		<form action="nupdate.do" method="post" enctype="Multipart/form-data">
			<input type="hidden" name="nId" value="${ notice.nId }"/>
			<input type="hidden" name="filePath" value="${ notice.filePath }"/>
			<table id="noticeTable">
				<tr>
					<td>제목</td>
					<td>
						<input type="text" size="50" name="nTitle" value="${ notice.nTitle }">
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<input type="text" name="nWriter" value="${ loginUser.id }"
						size="50" readonly>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="7" cols="50" name="nContent">${ notice.nContent }</textarea>
 					</td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="reloadFile">
					<c:if test="${ !empty notice.filePath }">
						<br>현재 업로드한 파일 :
						<a href="${ contextPath }/resources/nuploadFiles/${ notice.filePath}"
						download>${ notice.filePath }</a>
					</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>