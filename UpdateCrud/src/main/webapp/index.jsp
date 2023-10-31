<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="index.jsp" class="navbar-brand"> User Management App </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/Listar"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>


	<table class="table">
		<thead>
			<tr>
				<th scope="col">id</th>
				<th scope="col">name</th>
				<th scope="col">address</th>
				<th scope="col">phone</th>
				<th scope="col">status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cli" items="${listado}">
				<tr>
					<th><c:out value="${cli.id}"></c:out></th>
					<td><c:out value="${cli.name}"></c:out></td>
					<td><c:out value="${cli.address}"></c:out></td>
					<td><c:out value="${cli.phone}"></c:out></td>
					<td><c:out value="${cli.status}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>

</body>
</html>