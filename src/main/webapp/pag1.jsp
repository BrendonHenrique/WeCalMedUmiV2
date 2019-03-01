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
<link rel="stylesheet" href="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
<link rel="stylesheet" href="https://bootswatch.com/4/solar/bootstrap.min.css">
<script src="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.js"></script>

</head>
<body >  
<div class="jumbotron">
	<h1>Garten</h1>
	
</div>
<div class="container">
	<div class="row">
	
		<div class="col-8">
			<div class="ct-chart"> </div>
			<h3 class="text-success">
			Y: <c:out value=" ${amostras ne null and amostras.size() gt 1  ? amostras.getLinearRegression():'' }" />
 			</h3>
		
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
		  	<button  class="btn btn-secondary" type="submit">Adicionar</button>
	  	</form>
	  </div>
	</div>			
		
	</div>
	</div>

	

	
	
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
						<a class="btn btn-warning" href="${urlRemove}?Id=${loop.index}">Remover </a>
						</td>
		
						
		
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<script>
 		var data = {
 				  // A labels array that can contain any sort of values
 				  //labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
 				  // Our series array that contains series objects or in this case series data arrays
 				  series: [
 				    [{x: 5,y: 4},{x: 6,y: 5},{x: 7,y: 6}]
 				  ]
 				};

				// Create a new line chart object where as first parameter we pass in a selector
				// that is resolving to our chart container element. The Second parameter
				// is the actual data object.
				new Chartist.Line('.ct-chart', data);
		</script>
	</div>
</div>
	
</body>
</html>