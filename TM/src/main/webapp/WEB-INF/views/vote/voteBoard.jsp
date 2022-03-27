<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote Board</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<script src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ['Genre', '짜장면', '짬뽕', { role: 'annotation' } ],
        ['음식', 10, 24, ''],

      ]);

	var view = new google.visualization.DataView(data);
	view.setColumns([0, 1,
	                 { calc: "stringify",
	                   sourceColumn: 1,
	                   type: "string",
	                   role: "annotation" },
	                 2]);



	var options = {
	  width: 400,
	  height: 70,
	  legend: { position: 'top', maxLines: 3 },
	  bar: { groupWidth: '75%' },
	  isStacked: 'percent'
	};
	
   
    
	var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
	chart.draw(view, options);
}
  
</script>

<style>

.td {
	vertical-align: middle;
}

.num {
	width: 30px;
}

.name {
	width: 30px;
}

.subject {
	width: 120px;
}

.regdate {
	width: 50px;
}

.hitcount {
	width: 50px;
}

.thumb {
 	width: 10px;
}

.titlediv {
	left: 50%;
	top: 50%;
	width: 50%;
}

.itemdiv {
	left: 50%;
	top: 50%;
	width: 50%;
	
}

.navbar {
	justify-content: center;
	width: 50%;
}


.paging {
	float: left;
	width: 50%;
	text-align: center;
}

.paging-body {
	display:inline-block;
	position: absolute;
}

.pagination > li > a
{
    background-color: white;
    color: #df4759;
    border-color: #df4759;
}

.pagination > li > a:focus,
.pagination > li > a:hover,
.pagination > li > span:focus,
.pagination > li > span:hover
{
    color: #df4759;
    background-color: #eee;
    border-color: #df4759;
}

.pagination > .active > a
{
    color: #df4759;
    background-color: #df4759 !Important;
    border: solid 1px #df4759 !Important;
}

.pagination > .active > a:hover
{
    background-color: #df4759 !Important;
    border: solid 1px #df4759;
}



</style>

<body>

<div id="barchart_values" style="width: 900px; height: 300px;"></div>


<div class="titlediv">
	<p style="text-align: left; font-size: 25px;"> 오늘의 식사</p>
	<hr size="5" width="100%" align="center" style="color: red;">
</div>
		
<div class="itemdiv">
	<table class="table">
		<tr>
			<th class="num">번호</th>
			<th class="thumb"> 썸네일 </th>
			<th class="name">말머리</th>
			<th class="subject">제목</th>
			<th class="regdate">투표기간</th>
		</tr>
		<tr>
			<td> 1 </td>
			<td> <img class="img-thumbnail" alt="..." src="${pageContext.servletContext.contextPath}/resources/board/img/food1.jpg" width="100" height="100"> </td>
			<td> 식사 </td>
			<td> 오늘의 식사 짜장면 </td>
			<td> #월 #째주 </td>

		</tr>
		<tr>
			<td> 2 </td>
			<td> <img class="img-thumbnail" alt="..." src="${pageContext.servletContext.contextPath}/resources/board/img/food2.jpg" width="100" height="100"> </td>
			<td> 식사 </td>
			<td> 오늘의 괴식 김가루 말아먹는 콘프레이크 시리얼 </td>
			<td> #월 #째주 </td>

		</tr>			

	</table>
</div>

<div class="paging">
	<div class="paging-body">
		<nav aria-label="Page navigation example" style="position: absolute; left: 50%;">
			<ul class="pagination" style="width: 900px;">
			    <li class="page-item"><a class="page-link" href="#">이전</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
		</nav>
	</div>
	<div style="width: 50%; position: absolute;">
	<div style="text-align: left; position: absolute; left: 00%;">
		<button type="button" class="btn btn-outline-danger">새로고침 </button>
	</div>
	<div style="text-align: right; position: absolute; right: 0%;">
		<button type="button" class="btn btn-outline-danger" onclick="location.href='${pageContext.request.contextPath}/board/write';">글쓰기</button>
	</div>
	</div>
</div>
	

</body>
</html>