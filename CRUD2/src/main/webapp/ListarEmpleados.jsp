<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="index.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">


</head>
<body>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->


		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h1 class="m-0 font-weight-bold text-primary"
					style="text-align: center;">Lista de Empleados</h1>

				<!--  Seleccinar listado -->

				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">Estado</button>
					<ul class="dropdown-menu">
						<li><a href="listarTodosEmpleados"><button class="dropdown-item"
									type="submit">Listar Todos</button></a></li>
						<li><a href="listarActivosEmpleados"><button class="dropdown-item"
									type="submit">Activo</button></a></li>
						<li><a href="listarInactivosEmpleados"><button
									class="dropdown-item" type="button">Inactivo</button></a></li>
					</ul>

					<!--  Boton agregar -->
					<a href="AgregarEmpleado.jsp"><button type="submit" class="btn btn-primary">
						 Agregar
					</button></a>
				</div>




			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Id</th>
								<th>Nombre</th>
								<th>Apelido</th>
								<th>Tipo de Documento</th>
								<th>Numero de Documento</th>
								<th>Celular</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Id</th>
								<th>Nombre</th>
								<th>Apelido</th>
								<th>Tipo de Documento</th>
								<th>Numero de Documento</th>
								<th>Celular</th>
							</tr>
						</tfoot>

						<tbody>
							<c:forEach var="empleado" items="${listarTodosEmpleados}">
								<tr>
									<td><c:out value="${empleado.id}" /></td>
									<td><c:out value="${empleado.name}" /></td>
									<td><c:out value="${empleado.lastName}" /></td>
									<td><c:out value="${empleado.type_document}" /></td>
									<td><c:out value="${empleado.number_document}" /></td>
									<td><c:out value="${empleado.cell_phone}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>
	<!-- End of Main Content -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>
</html>