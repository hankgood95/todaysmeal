<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<style>
.margin-top {
	margin-top: 20px;
	float: right;
}
</style>
<script>
		function newNotice(){
			alert("새로 공지사함  저장할꼬얌!!");
			window.history.back();
		}
    	function cancel(){
    		if(confirm("작성한 내용을 정말 취소하시겠습니까??")){
    			window.history.back();	
    		}
    	}
    	function updateNotice(){
    		alert("공지사항 수정 할꼬얌!!");
    		window.history.back();
    	}
    </script>
</head>

<body id="page-top">

	<!-- jQuery 사용을 위한 include, 항상 최상단에 위치해 있어야 함 -->
	<jsp:include page="common/jQuery.jsp" />
	<!-- servletPath가 만약 true라면 아래 진입 -->
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- 사이드 네비바 파일을 가져와서 include 시켜줌, 사이드 네비바는 무조건 div id 가 wrapper안에 있어야 함 -->
		<jsp:include page="common/side_nav.jsp" />
		<c:if test="${ pageName eq 'noticePage' }">
			<script>
	            $(document).ready(function() {
	                $("#accordionSidebar").children(".nav-item").eq(2).addClass("active");
	                
	                $('#summernote').summernote({
	                	height: 500,
	                	lang: "ko-KR"
	                });
	            });
    		</script>
		</c:if>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Top bar 부분을 가져와서 사용함, Top bar는 무조건 content안에 있어야 함-->
				<jsp:include page="common/top_bar.jsp" />

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h4 class="m-0 font-weight-bold text-primary">공지사항</h4>
						</div>

						<div class="card-body" style="height: auto">
							<c:choose>
								<%-- if notice가 비어 있다면 진입 --%>
								<c:when test="${ empty notice }">
									<form>
										<div class="input-group input-group-lg">
											<div class="input-group-prepend" style="margin-bottom: 10px">
												<span class="input-group-text" id="inputGroup-sizing-lg">제목</span>
											</div>
											<input type="text" class="form-control" aria-label="Large"
												aria-describedby="inputGroup-sizing-sm">
										</div>
										<div id="summernote"></div>
										<button type="button" class="btn btn-primary margin-top"
											style="margin-left: 15px" onclick="newNotice();">저장</button>
										<button type="button" class="btn btn-secondary margin-top"
											onclick="cancel();">취소</button>
									</form>
								</c:when>
								<%-- else--%>
								<c:otherwise>
									<form>
										<div class="input-group input-group-lg">
											<div class="input-group-prepend" style="margin-bottom: 10px">
												<span class="input-group-text" id="inputGroup-sizing-lg">제목</span>
											</div>
											<input type="text" class="form-control" aria-label="Large"
												aria-describedby="inputGroup-sizing-sm"
												value="${notice.title }">
										</div>
										<div id="summernote">${ notice.content }</div>
										<button type="button" class="btn btn-primary margin-top"
											style="margin-left: 15px" onclick="updateNotice();">저장</button>
										<button type="button" class="btn btn-secondary margin-top"
											onclick="cancel();">취소</button>
									</form>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer 부분 이건   content-wrapper 제일 아래에 위치시키도록 하자-->
			<jsp:include page="common/footer.jsp" />
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- 맨위로 올라가게 해주는 토글 버튼과 우측 상단로그아웃 부분. 이건 항상 body의 제일 아래부분에 있도록 위치시키자 -->
	<jsp:include page="common/logout_scroll.jsp" />
	<!-- summernote cdn 시작-->

	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css"
		rel="stylesheet">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>

	<!-- summernote cdn 끝 -->

</body>

</html>