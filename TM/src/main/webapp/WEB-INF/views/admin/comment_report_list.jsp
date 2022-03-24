<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  JSTL사용할때필요함 여기서는 c로 사용할것이다 prefix -->
<!--  줄정렬 컨트롤 쉬프트 에 -->
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport"content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	
	<link href="${pageContext.servletContext.contextPath}/resources/admin/css/dataTables.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="common/jQuery.jsp" />
	<!-- jQuery를 지웠는데 css가 사라지네 이해가안가노 css도아닌 -->
	<div id="wrapper">
		<jsp:include page="common/side_nav.jsp" />
		<c:if test="${ pageName eq 'reportPage' }"> <!--노티스페이지가 아니라 내가만든페이지 컨트롤러에서넘겨주는값을 적어야함  -->
			<!-- 왜 빨간색이 뜨는거지?c를 인식못함  -->
			<script>
	            $(document).ready(function() { //제이쿼리 시작문 , 동적인 동작들을할수있다. 들어왔을때 지금 페이지가어딘지 강조해주는 걸 해주는거 네비바에서 
	            	$("#accordionSidebar").children(".nav-item").eq(0).removeClass("active");
	                $("#accordionSidebar").children(".nav-item").eq(1).addClass("active");
	            });
    	</script>
		</c:if>


	</div>
	>
</body>
</html>