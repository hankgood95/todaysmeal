<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.servletContext.contextPath}/resources/admin/css/admin_comment_modal.css"
	rel="stylesheet">
<style type="text/css">
.tg {
	width: 500px;
	border: none;
	border-collapse: collapse;
	border-color: #93a1a1;
	border-spacing: 0;
	margin-top: 80px;
	margin-left: 35px;
	width: 90%;
}

.tg td {
	background-color: #fdf6e3;
	border-color: #93a1a1;
	border-style: solid;
	border-width: 0px;
	color: #002b36;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 4px 12px;
	word-break: normal;
}

.tg th {
	background-color: #657b83;
	border-color: #93a1a1;
	border-style: solid;
	border-width: 0px;
	color: #fdf6e3;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 4px 12px;
	word-break: normal;
}

.tg .tg-2bhk {
	background-color: #eee8d5;
	border-color: inherit;
	text-align: left;
	vertical-align: top;
	word-break: break-all;
}

.tg .tg-c3ow {
	border-color: inherit;
	text-align: center;
	vertical-align: top;
}

.tg .tg-0pky {
	border-color: inherit;
	text-align: left;
	vertical-align: top
}

.green-card {
	all: unset;
	background-color: green;
	color: white;
	padding: 5px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 20px;
}

.red-card {
	all: unset;
	background-color: red;
	color: white;
	padding: 5px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 20px;
	margin-left: 10px;
}

.wrap-card {
	margin-top: 80px;
	text-align: center;
}

#report-context {
	height: auto;
	max-width: 500px;
	overflow: hidden;
}
</style>
</head>

<body>
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="modal-title">
				<h2>신고합니다</h2>
			</div>
			<div class="close-area">X</div>
			<table class="tg">
				<thead>
					<tr>
						<th class="tg-0pky" colspan="2" id="date" style="">날짜</th>
						<th class="tg-0pky" colspan="3">2020.12.05</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="tg-2bhk" colspan="2">게시물 번호</td>
						<td class="tg-2bhk" colspan="3">232312312</td>
					</tr>
					<tr>
						<td class="tg-c3ow" colspan="5">댓글 내용</td>
					</tr>
					<tr>
						<td class="tg-2bhk" colspan="5" id="report-context">니 줫같이 생겼어
						</td>
					</tr>
					<tr>
						<td class="tg-c3ow" colspan="5">신고사유</td>
					</tr>
					<tr>
						<td class="tg-2bhk" colspan="5" id="report-reason">욕해서 신고함</td>
					</tr>
				</tbody>
			</table>
			<div class="wrap-card">
				<button class="green-card" onclick="deleteReport()">신고 삭제</button>
				<button class="red-card" onclick="deleteComment()">댓글 삭제</button>
			</div>
			<script>
				function deleteReport() {
					if (confirm("신고 삭제하시겠습니까?")) {
						alert("삭제 되었습니다.");
					}
				}
				function deleteComment() {
					if (confirm("댓글 삭제하시겠습니까??")) {
						alert("삭제 되었습니다.");
					}
				}
			</script>
		</div>
	</div>
</body>
</html>