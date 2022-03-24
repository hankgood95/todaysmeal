<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

	<!-- 옆에 사이드바  -->
	<ul
		class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
		id="accordionSidebar">

		<!-- 사이드바 제일 위에 있는 브랜드 부분 -->
		<a
			class="sidebar-brand d-flex align-items-center justify-content-center"
			href="index.html">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-laugh-wink"></i>
			</div>
			<div class="sidebar-brand-text mx-3">Today Meals</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item active"><a class="nav-link" href="admin">
				<i class="fas fa-fw fa-tachometer-alt"></i> <span>대쉬보드</span>
		</a></li>

		<!-- 네비 아이템 구분선 -->
		<hr class="sidebar-divider">

		<!-- 네비 아이템 헤더 부분 -->
		<!--             <div class="sidebar-heading">
                Interface
            </div> -->

		<!-- 네비 아이템  드롭다운 형식 -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseTwo"
			aria-expanded="true" aria-controls="collapseTwo"> <!-- font awesome에서 아이콘을 가져옴 -->
				<i class="fas fa-fw fa-flag"></i> <span>신고관리</span>
		</a>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">신고 내용</h6>
					<a class="collapse-item" href="admincommentreport">댓글</a> <a
						class="collapse-item" href="cards.html">게시판 글</a>
				</div>
			</div></li>

		<!-- Nav Item - Charts -->
		<li class="nav-item"><a class="nav-link" href="adminNoticeList">
				<i class="fas fa-fw fa-bullhorn"></i> <span>공지사항 관리</span>
		</a></li>

		<!-- Nav Item - Tables -->
		<li class="nav-item"><a class="nav-link" href="tables.html">
				<i class="fas fa-fw fa-vote-yea"></i> <span>투표 관리</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>
	</ul>
	<!-- 사이드 네비바 종료 -->

</body>
</html>