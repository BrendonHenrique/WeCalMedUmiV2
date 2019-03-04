<%@page import="br.com.garten.calmedumi.Amostra"%>
<%@page import="br.com.garten.calmedumi.ListaAmostras"%>
<%@page import="javax.servlet.RequestDispatcher" %>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:url value="/recParam" var="urlForm"/>
<c:url value="/Removedor" var="urlRemove"/>
	
<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
	<title>WebCal MedUmi</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/style.css"> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>  
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">  
</head>

<body>   
 
 
 	
 	<ul class="nav nav-tabs"> 
 	 <li class="nav-item" style="padding-left:35%;padding-bottom:5%" > 
	    <button type="button" class="btn btn-outline-secondary">	  
			<h1 class="display-5">Garten</h1>   
		</button>  
	  </li> 
  	</ul> 
  	
		<div class="container">
			<div class="row">    
				<div class="col-8">
					<canvas id="myChart" ></canvas>
				</div> 
 
				<div class="col-4">  
					<div class="card border-primary mb-3" style="max-width: 20rem;">
					<div class="card-header">Adicionar amostra</div>
						<div class="card-body"> 
							<form id="formAmostra" action="${urlForm}" method="post">
									<div class="form-group">
										<label for="lab">
										Laboratorio:
										</label>
										<input class="form-control" id="lab" type="number" step="any" name="lab" autocomplete="off"/> 
										<label for="grt">
										Garten:
										</label>
										<input class="form-control" id="grt" type="number" step="any" name="grt" autocomplete="off"/> 
									</div>
								<button  value="Update" class="btn btn-outline-primary" type="submit">Adicionar</button>
							</form>
						</div>
					</div>	
				 </div> 
			</div>  
					
			<h1  class="btn btn-primary disabled" >
				F(x): <c:out value=" ${amostras ne null and amostras.size() gt 1  ? amostras.getLinearRegression():'' }" />
			</h1> 
				
				
			<div style="overflow-x: auto;"> 
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Laboratorio</th>
							<th>Garten</th>
							<th></th>
						</tr>	
					</thead>
					<tbody>
					<c:forEach items="${amostras}" var="amostra" varStatus="loop">
						<tr>
								<td >${amostra.amostraLaboratorio}</td>
								<td > ${amostra.amostraGarten }</td>
								<td>
								<a class="btn btn-outline-danger" href="${urlRemove}?Id=${loop.index}" onclick="exclusaoMsg();">Remover </a>
								</td> 
						</tr>
					</c:forEach>
					</tbody>
				</table> 
			   
				<script> 
						var ctx = document.getElementById('myChart').getContext('2d');
						var chart = new Chart(ctx, {
						    // The type of chart we want to create
						    type: 'line',
		
						    // The data for our dataset
						    data: {
						        labels: [ ],
						        datasets: [{
						            label: "My First dataset",
						            backgroundColor: 'rgb(255, 99, 132)',
						            borderColor: 'rgb(255, 99, 132)',
						            data: [],
						        }]
						    },
		
						    // Configuration options go here
						    options: {}
						});
				</script> 
				
				<script>
					
					function addData(chart, label, data) {
					    chart.data.labels.push(label);
					    chart.data.datasets.forEach((dataset),function(){ 
					        dataset.data.push(data);
					    });
					    chart.update();
					}
					
				</script>
				     

			</div> 
		</div>  
	</body>
</html>
