<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html lang="ko">
<head>
<title>TastyMap Admin Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- styles -->
<link href="${pageContext.request.contextPath}/resources/resource/css/styles.css" rel="stylesheet">
<!-- chart.js -->
<script src="../../../dist/2.9.3/Chart.min.js"></script>
<script src="../utils.js"></script>
	
	<c:import url="/views/admin/adminHeader.jsp"/>

	<div class="page-content">
		<div class="row">
			<c:import url="/views/admin/adminMenu.jsp"/>





			<div class="col-md-10">
				<div class="row">
					<div class="col-md-6">
						<div class="content-box-large">
							<div class="panel-heading">
								<div class="panel-title">ADMIN PAGE</div>

							</div>
							<div class="panel-body">안녕하세요</div>
						</div>
					</div>


					<div class="row"></div>
					<div class="content-box-large box-with-header">뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지뭐가들어가지
						<div id="canvas-holder" style="width:40%">
		<canvas id="chart-area"></canvas>
	</div>
	<button id="randomizeData">Randomize Data</button>
	<button id="addDataset">Add Dataset</button>
	<button id="removeDataset">Remove Dataset</button>
	<script>
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100);
		};

		var config = {
			type: 'pie',
			data: {
				datasets: [{
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
					],
					backgroundColor: [
						window.chartColors.red,
						window.chartColors.orange,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue,
					],
					label: 'Dataset 1'
				}],
				labels: [
					'Red',
					'Orange',
					'Yellow',
					'Green',
					'Blue'
				]
			},
			options: {
				responsive: true
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myPie = new Chart(ctx, config);
		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			config.data.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return randomScalingFactor();
				});
			});

			window.myPie.update();
		});

		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addDataset').addEventListener('click', function() {
			var newDataset = {
				backgroundColor: [],
				data: [],
				label: 'New dataset ' + config.data.datasets.length,
			};

			for (var index = 0; index < config.data.labels.length; ++index) {
				newDataset.data.push(randomScalingFactor());

				var colorName = colorNames[index % colorNames.length];
				var newColor = window.chartColors[colorName];
				newDataset.backgroundColor.push(newColor);
			}

			config.data.datasets.push(newDataset);
			window.myPie.update();
		});

		document.getElementById('removeDataset').addEventListener('click', function() {
			config.data.datasets.splice(0, 1);
			window.myPie.update();
		});
	</script>


					</div>

				</div>




			</div>
		</div>
	</div>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/resources/resource/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/resource/js/custom.js"></script>
</body>
</html>