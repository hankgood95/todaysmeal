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
		}
    	function cancel(){
    		if(confirm("작성한 내용을 정말 취소하시겠습니까??")){
    			window.history.back();	
    		}
    	}
    	function updateNotice(){
    		alert("공지사항 수정 할꼬얌!!");
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
	                	lang: "ko-KR",
	                	//콜백함수를 만들어서 이미지를 업로드하는 이벤트가 발생했을때를 체크하는것부터 만들어보자.
	                	callbacks :{
	                		onImageUpload : function(files,editor,welEditable){
	                			//파일 업로드할때 여러 이미지가 있을수 있어서 반복문을 사용해서 올린 이미지 수만큼을 반복
	                			for(var i = files.length -1;i>=0;i--){
	                				uploadSummernoteImageFile(files[i],this);
	                			}
	                		},
	                		onMediaDelete : function(target){ //summernote에 올라간 사진을 delete 하면 호출되는 콜백 메소드
	                			//alert(target[0].src);
	                			deleteFile(target[0].src);
	                		}
	                	}
	                });
	            });
	            
	        	function uploadSummernoteImageFile(file, el){
	        		data = new FormData(); //이미지를 업로드할때는 FormData()를 사용한다고 한다. 이유는? 아무래도 이미지는 데이터가 크니까 한번에 보내지 못하고 여러번 잘라서 보내야 하기때문인가?(내 추측임)
	        		data.append("file",file); //해당 form에 file이라는 걸 append해서 추가한다.
	        		$.ajax({
	        			data:data, //data로는 <form>에서 받은 데이터를 보낸다는 뜻이다.
	        			type:"POST", //type은 POST, HTTP Method : GET, PUT, POST, DELETE
	        			url:"uploadSummernoteImageFile", //url로 이동
	        			contentType: false, //contentType 은 default 값이 "application/x-www-form-urlencoded; charset=UTF-8" 인데, "multipart/form-data" 로 전송이 되게 false 로 넣어준다
	        			enctype:'multipart/form-data', //이걸 써줘야 넘어갈때 파일 경로만 넘어가는것이 아닌 파일 내용도 같이 넘어가게 된다.
	        			processData:false, //기본적으로 json은 key와 value의 형태로 이루어지는데 파일을 넘기는것이기 때문에 key와 value가 없어 key와 value 형태로 해서 보내지 않기 위해 false값을 준것이다.
	        			success: function(data){ //성공시에 들어옴
	        				$(el).summernote('insertImage',data.url); //image src 값에 서버의 경로값을 입력해주는 부분 
	        			},
	        			error:function(XMLHttpRequest, textStatus, errorThrown){
	        				alert("서버와의 통신 실패"); //저장이 실패 됐을때 진입해서 alert 창 띄워줌
	        			}
	        			// https://tysoso.tistory.com/40 이걸 보면 ajax의 옵션들을 볼수가 있다. 이를 보면 어떻게 활용할지가 약간 보일것이다.
	        		})
	        	}
	        	
	        	function deleteFile(src){
	        		$.ajax({
	        			data: {src: src}, //json 형식으로 넘겨줌
	        			type: "DELETE",
	        			url: "delImage",
	        			cache: false, //왜쓸지
	        			success:function(data){
	        				console.log(data);
	        			},
	        			error:function(data){
	        				alert("좆됐어~");
	        			}
	        		})
	        	}
	            
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
									<form id="insertNotice" action="notice" method="post">
										<div class="input-group input-group-lg">
											<div class="input-group-prepend" style="margin-bottom: 10px">
												<span class="input-group-text" id="inputGroup-sizing-lg">제목</span>
											</div>
											<input name="title" type="text" class="form-control"
												aria-label="Large" aria-describedby="inputGroup-sizing-sm">
										</div>
										<textarea id="summernote" name="content"></textarea>
										<button class="btn btn-primary margin-top"
											style="margin-left: 15px" onclick="newNotice();">저장</button>
										<button type="button" class="btn btn-secondary margin-top"
											onclick="cancel();">취소</button>
									</form>
								</c:when>
								<%-- else 즉 수정일 경우에 진입--%>
								<c:otherwise>
									<form id="updateNotice" action="notice" method="post">
										<input type="hidden" name="_method" value="put" />
										<div class="input-group input-group-lg">
											<div class="input-group-prepend" style="margin-bottom: 10px">
												<span class="input-group-text" id="inputGroup-sizing-lg">제목</span>
											</div>
											<input name="title" type="text" class="form-control"
												aria-label="Large" aria-describedby="inputGroup-sizing-sm"
												value="${notice.title }">
										</div>
										<textarea id="summernote" name="content">${ notice.content }</textarea>
										<button class="btn btn-primary margin-top"
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