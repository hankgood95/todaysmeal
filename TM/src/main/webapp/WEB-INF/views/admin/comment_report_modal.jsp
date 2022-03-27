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
 	width : 500px;
	border: none;
	border-collapse: collapse;
	border-color: #93a1a1;
	border-spacing: 0;
	margin-top: 40px;
	width: 100%;
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
	margin-top: 50px;
	text-align: center;
}



#report-context {
	height : auto;
	max-width : 500px;
	overflow:hidden;
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
						<th class="tg-0pky" colspan="2">날짜</th>
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
						<td class="tg-2bhk" colspan="5" id= "report-context">12342131231231321312312321311111111111111111111111111111111111111222222222222222222222222233333333333333</td>
					</tr>
					<tr>
						<td class="tg-c3ow" colspan="5">신고사유</td>
					</tr>
					<tr>
						<td class="tg-2bhk" colspan="5" id="report-reason">ㅇㄴㅁ읜ㅁwqefqwefqㄴㅇㅁㄹㄴㅁㅇ54ㄹ6ㄴㅁㅇ4ㄹ56ㄴㅁㅇ4ㄹ56ㄴㅁ4ㅇㄹ56ㄴㅁㅇ4ㄹ56ㅁ4ㄴㅇ56ㄹ4ㄴㅁ56ㅇㄹ456wefqwefwqefqwfqweffeeeeeeesdfsdfdsfsdfsdfsdfsdfqweklfjwefㄴ아ㅓ리나어라ㅣㄴ어리ㅏㅇ나ㅓeee읜ㅁ아ㅣㄴ무아ㅣㄴㅁ아ㅣㅜㄴ마우남우ㅏㅣㄴㅁ우마</td>
					</tr>
				</tbody>
			</table>
			<div class= "wrap-card">
				<button class="green-card">경고</button>
				<button class="red-card">블랙</button>
			</div>
		</div>
	</div>
</body>
</html>