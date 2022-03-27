<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<h1 align="center">공지글 등록 페이지</h1>
	<br><br>
	
	<div class="wrap">
		<!-- 첨부파일 등록을 위해서 반드시 enctype 작성 -->
		<form action="ninsert.do" method="post" enctype="Multipart/form-data">
			<table id="noticeTable">
				<tr>
					<td>제목</td>
					<td>
						<input type="text" size="50" name="nTitle">
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
						<textarea rows="7" cols="50" name="nContent"></textarea>
 					</td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="uploadFile"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="등록하기">&nbsp;
						<input type="reset" value="등록취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	
	
	
	
	
	
</body>
</html>