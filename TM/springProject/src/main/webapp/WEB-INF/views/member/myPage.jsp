<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<h1 align="center">${ loginUser.name }님의 정보 보기</h1>
	<div align="center">
		<form action="mupdate.do" method="post">
			<table width="500" cellspacing="5">
				<tr>
					<td width="150">* 아이디</td>
					<td width="450">
						<input type="text" name="id" id="userId"
						value="${ loginUser.id }" readonly>
					</td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="name"
					 value="${ loginUser.name }" required></td>
				</tr>
				<tr>
					<td>성별</td>
					<c:if test="${loginUser.gender eq 'M' }">
						<td>
							<input type="radio" name="gender" value="M" checked>남
							<input type="radio" name="gender" value="F">여
						</td>
					</c:if>
					<c:if test="${loginUser.gender eq 'F' }">
						<td>
							<input type="radio" name="gender" value="M">남
							<input type="radio" name="gender" value="F" checked>여
						</td>
					</c:if>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" min="20" max="100"
					value="${ loginUser.age }"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"
					value="${ loginUser.email }"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="tel" name="phone"
					value="${ loginUser.phone }"></td>
				</tr>
				<c:forTokens var="addr" items="${ loginUser.address }" delims=","
				varStatus="status">
					<c:if test="${ status.index eq 0 }">
						<c:set var="addr1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 1 }">
						<c:set var="addr2" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 2 }">
						<c:set var="addr3" value="${ addr }"/>
					</c:if>
				</c:forTokens>
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" name="post" class="postcodify_postcode5" 
						value="${ addr1 }" size="6" />
						<button type="button" id="postcodify_search_button">검색</button>
					</td>
				</tr>
				<tr>
					<td>도로명 주소</td>
					<td><input type="text" name="address1" class="postcodify_address" value="${ addr2 }" /></td>
				</tr>
				<tr>
					<td>상세 주소</td>
					<td><input type="text" name="address2" class="postcodify_extra_info" value="${ addr3 }" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정하기">&nbsp;
						<c:url var="mdelete" value="mdelete.do">
							<c:param name="id" value="${ loginUser.id }"/>
						</c:url>
						<button type="button" onclick="location.href='${mdelete}'">탈퇴하기</button>
					</td>
				</tr>
			</table>
		</form>
		<br>
		<br>
		<div align="center">
			<a href="home.do">시작 페이지로 이동</a>
		</div>
	</div>


	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>

</body>
</html>