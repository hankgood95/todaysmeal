<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote Board</title>

<!-- Bootstrap CSS -->
<link
	href="${pageContext.servletContext.contextPath}/resources/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
</head>

<body>
<!-- Header Include -->
<%@include file ="/WEB-INF/views/common/header.jsp"%>
    
<!-- Card Section -->
<div class="card mb-3" style="width: 800px; margin: auto;">
	<p class="btn btn-dark d-md-flex justify-content-md-center" style="font-size: 30px; text-align: center; font-style: italic;"> 깻잎 논쟁  </p>
	<img src="${pageContext.servletContext.contextPath}/resources/vote/img/a.jpeg" class="card-img-top" alt="...">
	<div class="card-body">
		<p class="card-text" style="text-align: center; font-size: 25px">깻잎절임을 못 떼는 내 친구를 위해 깻잎지를 눌러주는 나의 연인. 당신은 이러한 행동을 이해할 수 있나요?</p>
		<div id="barchart_values" style="margin: auto; height: 100px; "></div>
		<div class="text-center">
			<input class="btn btn-outline-dark mt-auto" type="button" value="찬성" onclick="agree();">
			<input class="btn btn-outline-dark mt-auto" type="button" value="반대" onclick="disagree();"></input>
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
	
<!-- Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
 </body>
</html>