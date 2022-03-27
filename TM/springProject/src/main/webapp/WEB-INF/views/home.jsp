<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<style>
	.wrap {
		width:50%;
		margin:auto;
	}
	#boardTable {
		width:100%;
		border:solid 1px white;
	}
	#boardTable th, #boardTable td {
		border:solid 1px white;
		text-align:center;
	}
</style>
</head>
<body>
	<jsp:include page="common/menubar.jsp"/>
	
	<h1 align="center">게시글 TOP5 목록</h1>
	<div class="wrap">
		<table id="boardTable">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
					<th>첨부파일</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	
	<script>
	
	$(function(){
		topList();
		
		// 5초에 한번씩 재호출
		setInterval(function(){
			topList();
		}, 5000);
	});
	
	
	function topList(){
		$.ajax({
			url:"topList.do",
			dataType:"json",
			success:function(data){
				console.log(data);
				
				$tableBody = $("#boardTable tbody");
				$tableBody.html("");
				
				for(var i in data){
					var $tr = $("<tr>");
					var $bId = $("<td>").text(data[i].bId);
					var $bTitle = $("<td>").text(data[i].bTitle);
					var $bWriter = $("<td>").text(data[i].bWriter);
					var $bCreateDate = $("<td>").text(data[i].bCreateDate);
					var $bCount = $("<td>").text(data[i].bCount);
					var $bFile = $("<td>").text(" ");
					
					if(data[i].originalFileName != null){
						$bFile = $("<td>").text("◎");
					}
					
					$tr.append($bId);
					$tr.append($bTitle);
					$tr.append($bWriter);
					$tr.append($bCreateDate);
					$tr.append($bCount);
					$tr.append($bFile);
					
					$tableBody.append($tr);
				}
			},
			error:function(e){
				console.log(e);
			}
		});
		
	}
	</script>
</body>
</html>
