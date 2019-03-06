<%@page import="br.com.garten.calmedumi.Amostra"%>
<%@page import="br.com.garten.calmedumi.ListaAmostras"%>
<%@page import="javax.servlet.RequestDispatcher" %>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  
<c:url value="/recParam" var="urlForm"/>
<c:url value="/Removedor" var="urlRemove"/>
<c:url value="/Editor" var="urlEdita"/>
	
<!DOCTYPE html>
<html>
<head>
	<title>WebCal MedUmi</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/style.css">



	<%--<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>--%>
	<%--<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.min.js"></script>--%>
	<%--<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.css" media="screen">--%>
	<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>

	<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.css" media="screen">
	<link rel="stylesheet" href="https://bootswatch.com/_assets/css/custom.min.css">
	<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
	<script src="https://bootswatch.com/_vendor/popper.js/dist/umd/popper.min.js"></script>
	<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="https://bootswatch.com/_assets/js/custom.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>


</head>

<body>

 	<ul class="nav nav-tabs"> 
 	 <li class="nav-item" style="padding-left:35%;padding-bottom:5%">
         <h1>Garten</h1>
	  </li> 
  	</ul> 
  	
	<div class="container">

		<div class="row">

			<div class="col-8">
				<canvas id="myChart" ></canvas>
			</div>

			<div class="col-4">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#Adicionar">Adicionar</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#Editar">Editar</a>
					</li>

				</ul>
				<div id="myTabContent" class="tab-content" style="padding-bottom: 2rem";>
					<div class="tab-pane fade show active" id="Adicionar">

						<%--adicionar--%>
						<p>
						<div class="card border-primary mb-4" style="max-width: 20rem;">
							<div class="card-header">Adicionar amostra
							</div>
							<div class="card-body">
								<form id="formAmostra" action="${urlForm}" method="post">
									<div class="form-group">
										<label for="lab">
											Laborat贸rio:
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
						</p>
					</div>

					<div class="tab-pane fade" id="Editar">
						<%--editar--%>
						<p>
						<div class="card border-primary mb-4" style="max-width: 20rem;">
							<div class="card-header">Editar amostra
							</div>
							<div class="card-body">
								<form id="formAmostra" action="${urlForm}" method="post">
									<div class="form-group">
										<label for="lab">
											Laborat贸rio:
										</label>
										<input class="form-control" id="lab" type="number" step="any" name="lab" autocomplete="off"/>
										<label for="grt">
											Garten:
										</label>
										<input class="form-control" id="grt" type="number" step="any" name="grt" autocomplete="off"/>
									</div>
									<button  value="Update" class="btn btn-outline-primary" type="submit">Editar</button>
								</form>
							</div>
						</div>
					</div>
					</p>
				</div>
			</div>

		</div>

		<h1  class="btn btn-primary disabled" >
			F(n): <c:out value=" ${amostras ne null and amostras.size() gt 1  ? amostras.getLinearRegression():'' }" />
		</h1>

				
		<div style="overflow-x: auto;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Garten</th>
						<th>Laborat贸rio</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${amostras}" var="amostra" varStatus="loop">
					<tr>

							<td> ${amostra.amostraGarten }</td>
							<td >${amostra.amostraLaboratorio}</td>
							<td>
							<a class="btn btn-outline-danger" href="${urlRemove}?Id=${loop.index}" onclick="exclusaoMsg(event);">Remover </a>
							</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>

			<script>
					var ctx = document.getElementById('myChart').getContext('2d');
					var chart = new Chart(ctx, {
						// The type of chart we want to create
						type: 'bubble',

						// The data for our dataset
						data: {

							datasets: [{
								label: "Gr谩fico de amostras",
								backgroundColor: 'rgb(255, 99, 132)',
								borderColor: 'rgb(255, 99, 132)',
								data: [
										<%
										ListaAmostras amostras = (ListaAmostras)session.getAttribute("amostras");
										if(amostras != null)
										for(Amostra amostra : amostras){
											out.println(amostra);
										}
										%>
									]
								},{
									type:"line",
									label: "Linha de tend锚ncia",
									borderColor: 'rgb(132, 99, 255)',
									backgroundColor: 'rgba(0,0,0,0)',
									data: [

									<%
										if(amostras != null && !amostras.isEmpty() ){
										double menorX, maiorX;
										menorX = amostras.get(0).getAmostraGarten();
										maiorX = amostras.get(0).getAmostraGarten();
										for ( Amostra am: amostras ) {
											if(am.getAmostraGarten() < menorX){
												menorX = am.getAmostraGarten();
											}
											if(am.getAmostraGarten() > maiorX){
												maiorX = am.getAmostraGarten();
											}
										}
										double menorY, maiorY;
										menorY = amostras.getLinearRegression().predict(menorX);
										maiorY = amostras.getLinearRegression().predict(maiorX);

										if(amostras != null && !amostras.isEmpty()){
											out.println("{x:"+menorX+", y:"+menorY+"},{x:"+maiorX+", y:"+maiorY+"}");
											}
										}
									%>

									]
								}]
							},
								options:{
									title:{
										display:true,
										text:['X: Garten','Y: Laborat贸rio'],
										position:'bottom'
									},
								}
						});



					function exclusaoMsg(event){
						if(!confirm("Deseja mesmo excluir?")){

							event.preventDefault();
						}
					}

			</script>
		</div>
	</div>
</body>
</html>
