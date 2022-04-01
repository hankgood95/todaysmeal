<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote Board</title>
	
<!-- voteBoard CSS -->
<style>

.container {
	text-align: center;
	width: 100%;
}

.container .card-contents {
	border: 10px solid black;
	border-radius: 5px;
	margin-left: 400px;
	margin-right:400px;
}

.container .card-contents .title p {
	font-size: 40px;
	font-style: italic;
}

.container .card-contents .image img {
	border-radius: 5px;
}

.container .card-contents .content p {
	font-size: 25px;
}

.container .card-contents .chart div {
	border-radius: 5px;
	height: 100px;
}

.container .card-contents .button-box {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(50%, auto));
}

.container .card-contents .button-box .button input {
	all: unset;
	width: 100%;
	height: 100%;
	background-color: black;
	color: white;
	cursor: pointer;
	font-size: 50px;
	vertical-align: middle;
}

</style>
</head>

<body>
<!-- Header Include -->
<%@include file ="/WEB-INF/views/common/header.jsp"%>
    
<!-- Card Section -->
<div class="container">
	<div class="card-contents">
		<div class="title">
			<p>깻잎 논쟁</p>
		</div>
		<div class="image">
			<img src="${pageContext.servletContext.contextPath}/resources/vote/img/a.jpeg" alt="...">
		</div>
		<div class="content">
			<p>깻잎절임을 못 떼는 내 친구를 위해 깻잎지를 눌러주는 나의 연인. 당신은 이러한 행동을 이해할 수 있나요?</p>
		</div>
		<div class="button-box">
			<div class="button">
				<input type="button" value="찬성" onclick="agree();"></input>
			</div>
			<div class="button">
				<input type="button" value="반대" onclick="disagree();"></input>
			</div>
		</div>
	</div>
</div>
    
<!-- Footer Include -->
<%@include file ="/WEB-INF/views/common/footer.jsp"%>

<!-- Char JS -->
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ['Genre', '찬성', '반대', { role: 'annotation' } ],
        ['', 10, 24, ''],

      ]);

	var view = new google.visualization.DataView(data);
	view.setColumns([0, 1,
	                 { calc: "stringify",
	                   sourceColumn: 1,
	                   type: "string",
	                   role: "annotation" },
	                 2]);
	var options = {
	  width: '80%',
	  height: 70,
	  legend: 'none',
	  bar: { groupWidth: '75%' },
	  isStacked: 'percent'
	};
	var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
	chart.draw(view, options);
}
  
</script>

<!-- Vote agree or disagree JS -->
<script>
	function agree() {
		if (confirm("찬성하시겠습니까?"))
			alert("확인 눌렀다~~~~");
		else
			alert("취소 눌렀다~~~~");
		return ;
	}
	function disagree() {
		if (confirm("반대하시겠습니까?"))
			alert("확인 눌렀다~~~~");
		else
			alert("취소 눌렀다~~~~");
		return ;
	}
</script>
</html>