<%@page import="java.util.Iterator"%>
<%@page import="pe.edu.vallegrande.model.ClienteModel"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.vallegrande.service.impl.ClienteService"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>



<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="index.jsp"></jsp:include>



	<h1 class="text-center">Clientes</h1>

	<div class="container-fluid"></div>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Nombre</th>
				<th scope="col">Dirección</th>
				<th scope="col">Teléfono</th>
				<th scope="col">Acciones</th>
			</tr>
		</thead>
		<tbody>

			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>
					<button class="btn btn-warning">Editar</button>
					<button class="btn btn-danger">Eliminar</button>
				</td>
			</tr>

		</tbody>
	</table>
	</div>

</body>
</html>