<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
</head>

<body id="page-top">
	
	<!-- jQuery 사용을 위한 include, 항상 최상단에 위치해 있어야 함 -->
	<jsp:include page="common/jQuery.jsp"/>
	<!-- servletPath가 만약 true라면 아래 진입 -->
    <!-- Page Wrapper -->
    <div id="wrapper">
		
    	<!-- 사이드 네비바 파일을 가져와서 include 시켜줌, 사이드 네비바는 무조건 div id 가 wrapper안에 있어야 함 -->
    	<jsp:include page="common/side_nav.jsp"/>
    	<c:if test="${ pageName eq 'noticePage' }">
    		<script>
	            $(document).ready(function() {
	                $("#accordionSidebar").children(".nav-item").eq(2).addClass("active");
	            });
    		</script>
		</c:if>	 
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            
                <!-- Top bar 부분을 가져와서 사용함, Top bar는 무조건 content안에 있어야 함-->
				<jsp:include page="common/top_bar.jsp"/>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h4 class="m-0 font-weight-bold text-primary">공지사항</h4>
                        </div>
                        
                        <div class="card-body" style="height:auto; padding-top:0;">
                        	<table style="width:100%;">
                        		<colgroup>
							  		<col style="width:10%"/>
							  		<col style="width:90%" />
							    </colgroup>
                        		<tbody>
	                        		<tr>
	                        			<td colspan="2" style="padding:10px;background-color:#E6E6E6;">
	                        				<b>안녕하세요 투밀 운영진입니다.</b>
	                        			</td>
	                        		</tr>
	                        		<tr>
	                        			<br>
	                        			<td colspan="2" style="padding:10px;">
	                        				<span>이욱재</span>
	                        				<span style="margin-right:15px;margin-left:15px">|</span>
	                        				<span>2022.03.27 20:01</span>
	                        				<hr>
	                        			</td>
	                        		</tr>	                        			                        		
	                        		<tr>
	                        			<td colspan="2">
	                        				<div style="height:50vh;">
	                        				암ㄴ암ㄴ암ㄴ안아아아아아아아아아아아아아아아아아아아아아아아아ㅏㅇ아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아앙아아
	                        				</div>
	                        			</td>
	                        		</tr>                 			
                        		</tbody>

                        	</table>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer 부분 이건   content-wrapper 제일 아래에 위치시키도록 하자-->
			<jsp:include page="common/footer.jsp"/>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
	
	<!-- 맨위로 올라가게 해주는 토글 버튼과 우측 상단로그아웃 부분. 이건 항상 body의 제일 아래부분에 있도록 위치시키자 -->
	<jsp:include page="common/logout_scroll.jsp"/>

</body>

</html>