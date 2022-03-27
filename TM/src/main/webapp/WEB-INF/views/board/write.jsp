<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.ckeditor.com/ckeditor5/33.0.0/classic/ckeditor.js"></script>


<!--  
1. input type 설명 (password, file 등)
2. ckediot 설명 ( 적용 방법 [1. body안에 스크립트, 2. 헤더, 3.class 적용])
 -->


<style type="text/css">
.ck-editor__editable{
	min-height: 600px;
}
#subjectinput {
	width: 100%;
}

.passinput {
	width: 30%;
}

.board {
	width: 50%;
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}


</style>

</head>


<body>


	
	
<div class="board">
	<div class="title">
		<p style="text-align: left; font-size: 25px;"> 글 작성</p>
		<hr size="5" width="100%" align="center" style="color: red;">
	</div>

	<form name="boardForm" method="post" enctype="multipart/form-data"> 
		<div class="form-check" >
			<input class="btn-check" type="radio" name="options-outlined" value="아침" id="danger-outlined" >
				<label class="btn btn-outline-danger" for="danger-outlined">
					아침 
				</label> 

			<input class="btn-check" type="radio" name="options-outlined" value="점심" id="danger-outlined">
				<label class="btn btn-outline-danger" for="danger-outlined">
					점심
				</label>
		
			<input class="btn-check" type="radio" name="options-outlined" value="저녁" id="danger-outlined" checked>
				<label class="btn btn-outline-danger" for="danger-outlined">
					저녁
				</label>
		</div>
	
		


		<table class="table table-border table-form">
				
			<tr> 
				<td class="table-light col-sm-2" scope="row">제목</td>
				<td> 
					<input id="subjectinput" type="text" name="subject" maxlength="100" value="${dto.subject}">
				</td>
			</tr>
			<tr> 
	
				<td class="table-light col-sm-2" scope="row">내용</td>
				<td>
					<div class="editor">${dto.content}</div> <input type="hidden"
					name="content">
				</td>

			</tr>
			<tr>
				<td class="table-light col-sm-2" scope="row">이미지(썸네일)</td>
				<td>
					<input type="file" name="selectFile" accept="image/*" class="form-control">
				</td>
			</tr>
	
			<tr> 
				<td>비밀번호</td>
				<td> 
					<input type="password" name="price" maxlength="12" onkeyup="inputNumberFormat(this)" id="passinput" value="${dto.password}">
				</td>
			</tr>
		</table>
			
		<table class="table">
			<tr> 
				<td align="center">
					<button type="button" class="btn btn-outline-danger" onclick="sendOk();">${mode=="update"?"수정완료":"등록완료"}</button>
					<button type="reset" class="btn btn-outline-danger">다시입력</button>
					<button type="button" class="btn btn-outline-danger" onclick="location.href='${pageContext.request.contextPath}/board/list';">${mode=="update"?"수정취소":"등록취소"}</button>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
						<input type="hidden" name="page" value="${page}">
					</c:if>
				</td>
			</tr>
		</table>

	</form>
	
</div>


<script type="text/javascript">
	ClassicEditor
		.create( document.querySelector( '.editor' ), {
			fontFamily: {
	            options: [
	                'default',
	                '맑은 고딕, Malgun Gothic, 돋움, sans-serif',
	                '나눔고딕, NanumGothic, Arial'
	            ]
	        },
	        fontSize: {
	            options: [
	                9, 11, 13, 'default', 17, 19, 21
	            ]
	        },
			toolbar: {
				items: [
					'heading','|',
					'fontFamily','fontSize','bold','italic','fontColor','|',
					'alignment','bulletedList','numberedList','|',
					'imageUpload','insertTable','sourceEditing','blockQuote','mediaEmbed','|',
					'undo','redo','|',
					'link','outdent','indent','|',
				]
			},
			image: {
	            toolbar: [
	                'imageStyle:full',
	                'imageStyle:side',
	                '|',
	                'imageTextAlternative'
	            ],
	
	            // The default value.
	            styles: [
	                'full',
	                'side'
	            ]
	        },
			language: 'ko',
			ckfinder: {
		        uploadUrl: '${pageContext.request.contextPath}/image/upload' // 업로드 url (post로 요청 감)
		    }
		})
		.then( editor => {
			window.editor = editor;
		})
		.catch( err => {
			console.error( err.stack );
		});
</script>

</body>
</html>