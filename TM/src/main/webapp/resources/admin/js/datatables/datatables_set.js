$(document).ready(function() {
	$('#dataTable').DataTable({
		searching : false,
		language : {
			"decimal" : "",
			"emptyTable" : "데이터가 없습니다.",
			"info" : "_START_ - _END_ (총 _TOTAL_ 개)",
			"infoEmpty" : "0개",
			"infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
			"infoPostFix" : "",
			"thousands" : ",",
			"lengthMenu" : "_MENU_ 개씩 보기",
			"loadingRecords" : "로딩중...",
			"processing" : "처리중...",
			"search" : "검색 : ",
			"zeroRecords" : "검색된 데이터가 없습니다.",
			"paginate" : {
				"first" : "첫 페이지",
				"last" : "마지막 페이지",
				"next" : "다음",
				"previous" : "이전"
			},
			"aria" : {
				"sortAscending" : " :  오름차순 정렬",
				"sortDescending" : " :  내림차순 정렬"
			}
		}
	});
	
	//제목이 길어지면 생기는 말줄임표를 읽을수 있게 해주는 jQuery
	$(".title").each(function(){
		if(this.offsetWidth < this.scrollWidth){ //구역의 크기보다 실제 컨텐츠의 크기가 크다면 진입
			$(this).attr('title',$(this).text()); //툴팁 처럼 정보를 보여주는 부분 'title'이 툴팁의 역할을 할수 있게 해줌
		}
	});
});