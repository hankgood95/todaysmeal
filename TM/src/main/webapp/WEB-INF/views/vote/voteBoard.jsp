<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote Board</title>
<link href="${pageContext.request.contextPath}/resources/main/css/index.css" rel="stylesheet" type="text/css">

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
	width: 800px;
	margin: auto;
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

img {
    width: 100%;
    height: 200px;
}

rect {
	margin: auto;
}
</style>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>

<body>
	<!-- Header Include -->
	<%@include file ="/WEB-INF/views/common/header.jsp"%>
    
    <!-- Card Section -->
<section class="py-0">
    <div class="container px-4 px-lg-5 mt-5">
    
        <div>
			<p class="btn btn-dark d-md-flex justify-content-md-center" style="width:53%; margin: auto; font-size: 20px; text-align: center; font-weight: 100px; font-style: italic;"> 3월 셋째주 투표  </p>
		</div>
		
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        
            <div class="col mb-5">
                <div class="card h-60">
                    <!-- Product image-->
                    <img class="img" src="${pageContext.servletContext.contextPath}/resources/vote/img/a.jpeg" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">짜장면</h5>
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#"> 투표 </a></div>
                    </div>
                </div>
            </div>
            <div style="line-height: 465px; width: 60px;">
           		<p style="font-size: 30px; font-weight: 100px; text-align: center;">VS</p> 
           	</div>
            <div class="col mb-5">
                <div class="card h-60">
                    <!-- Product image-->
                    <img class="img" src="${pageContext.servletContext.contextPath}/resources/vote/img/b.jpeg" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">짬뽕</h5>
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#"> 투표 </a></div>
                    </div>
                </div>
            </div>
            <br>
            <div id="barchart_values" style="width: 650px; height: 100px; "></div>
  	     </div>
    </div>
</section>
    
<!-- Footer Include -->
<%@include file ="/WEB-INF/views/common/footer.jsp"%>

<!-- Char JS -->
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ['Genre', '짜장면', '짬뽕', { role: 'annotation' } ],
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
	  width: '100%',
	  height: 70,
	  legend: { position: 'top', maxLines: 3 },
	  bar: { groupWidth: '75%' },
	  isStacked: 'percent'
	};
	var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
	chart.draw(view, options);
}
</script>
	

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>