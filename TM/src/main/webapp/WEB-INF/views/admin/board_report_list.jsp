<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<style>
#dataTable tbody .title {
	cursor: pointer;
}

.title:hover {
	text-shadow: -.25px -.25px 0 black, .25px .25px;
	background-color : gray;
}

</style>

<link
	href="${pageContext.servletContext.contextPath}/resources/admin/css/dataTables.css"
	rel="stylesheet">	
</head>
<body id="page-top">
<jsp:include page="common/jQuery.jsp" />
	<jsp:include page="comment_report_modal.jsp" />


	<!-- jQuery를 지웠는데 css가 사라지네 이해가안가노 css도아닌 -->
	<div id="wrapper">
		<jsp:include page="common/side_nav.jsp" />
		<c:if test="${ pageName eq 'reportPage'}">
			<!--노티스페이지가 아니라 내가만든페이지 컨트롤러에서넘겨주는값을 적어야함  -->
			<!-- 왜 빨간색이 뜨는거지?c를 인식못함  -->
			<script>
				$(document).ready(function() { //제이쿼리 시작문 , 동적인 동작들을할수있다. 들어왔을때 지금 페이지가어딘지 강조해주는 걸 해주는거 네비바에서 
							$("#accordionSidebar").children(".nav-item").eq(1).addClass("active");
				
							$(".title").click(function(){
								show();
							});

							$(".close-area").click(function(){
								close();
							});
						
					function show(){
			       	 document.getElementById("modal").style.display ='block';
			    	}
					function close(){
					document.querySelector("#modal").style.display ='none';
					}
				});
			</script>
		</c:if>
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<jsp:include page="common/top_bar.jsp" />
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div class="card shadow mb-4">
						<div class="card-header py-3"
							style="display: flex; justify-content: space-between;">
							<!-- 이걸로 공지사항 칸이 어케생기 -->
							<h4 class="m-0 font-weight-bold text-primary">게시물 신고목록</h4>
						</div>
						<div class="card-body" style="height: auto">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th id="date">날짜</th>
											<th id="title-head">게시물 제목</th>
										</tr>
									</thead>
									<tbody id="tbody">
										<tr>
											<td>2022/03/14</td>
											<td class="title">이욱재 잘생긴죄로 신고합니다.</td>
										</tr>
										<tr>
											<td>2022/03/14</td>
											<td class="title">지은 죄가 많습니다..자수합니다</td>
										</tr>
										<tr>
											<td>2022/03/14</td>
											<td class="title">가즈아</td>
										</tr>
										<tr>
											<td>2022/03/14</td>
											<td class="title">가즈아</td>
										</tr>
										<tr>
											<td>2022/03/14</td>
											<td class="title">가즈아</td>
										</tr>
										<tr>
											<td>2022/03/14</td>
											<td class="title">가즈아</td>
										</tr>
										<tr>
											<td>2022/03/14</td>
											<td class="title">가즈아</td>
										</tr>
										<tr>
											<td>2022/03/14</td>
											<td class="title">가즈아</td>
										</tr>
										<tr>
											<td>2022/03/14</td>
											<td class="title">가즈아</td>
										</tr>
										<tr>
											<td>2022/03/15</td>
											<td class="title">가즈아</td>
										</tr>
										<tr>
											<td>2022/03/15</td>
											<td class="title">가즈아</td>
										</tr>
										<tr>
											<td>2022/03/15</td>
											<td class="title">가즈아</td>
										</tr>
										<tr>
											<td>2022/03/15</td>
											<td class="title">가즈아</td>
										</tr>
										<tr>
											<td>2022/03/15</td>
											<td class="title">가즈아</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="common/logout_scroll.jsp" />

	<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css" rel="stylesheet">

	<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>


	<script
		src="${pageContext.servletContext.contextPath}/resources/admin/js/datatables/datatables_set.js"></script>

</body>
</html>