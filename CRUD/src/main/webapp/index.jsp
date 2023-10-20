<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

</head>
<body>

	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
				<div
					class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
					<a href="/"
						class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
						<span class="fs-1 d-none d-sm-inline">Snacker</span>
					</a>
					<ul
						class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start "
						id="menu">
						<li class="nav-item"><a href="#"
							class="nav-link align-middle px-0"> <i class="fs-4 bi-house"></i>

								<span class="ms-1 d-none d-sm-inline text-white">Inicio</span>
						</a></li>
						<li><a href="#submenu1" data-bs-toggle="collapse"
							class="nav-link px-0 align-middle"> <i
								class="fs-4 bi-archive-fill"></i> <span
								class="ms-1 d-none d-sm-inline text-white">Inventario</span>
						</a>
						<li><a href="#submenu2" data-bs-toggle="collapse"
							class="nav-link px-0 align-middle "> <i class="fs-4 bi-boxes"></i>
								<span class="ms-1 d-none d-sm-inline text-light">Producto</span></a></li>
						<li><a href="#" class="nav-link px-0 align-middle"> <i
								class="fs-4 bi-table"></i> <span
								class="ms-1 d-none d-sm-inline text-light">Historial</span></a></li>
						<li><a href="#submenu2" data-bs-toggle="collapse"
							class="nav-link px-0 align-middle "> <i class="fs-4 bi-bag"></i>
								<span class="ms-1 d-none d-sm-inline text-light">Compra</span></a></li>
						<li><a href="#submenu3" data-bs-toggle="collapse"
							class="nav-link px-0 align-middle"> <i
								class="fs-4 bi-pci-card"></i> <span
								class="ms-1 d-none d-sm-inline text-light">Venta</span>
						</a>
						<li><a href="#" class="nav-link px-0 align-middle"> <i
								class="fs-4 bi-people"></i> <span
								class="ms-1 d-none d-sm-inline text-light ">Clientes</span>
						</a></li>
						<li><a href="#" class="nav-link px-0 align-middle"> <i
								class="fs-4 bi-people"></i> <span
								class="ms-1 d-none d-sm-inline text-light ">Empleados</span>
						</a></li>
						<li><a href="#" class="nav-link px-0 align-middle"> <i
								class="fs-4 bi-people"></i> <span
								class="ms-1 d-none d-sm-inline text-light ">Perfil</span>
						</a></li>
					</ul>
					<hr>



					<div class="dropdown pb-4">
						<li><a href="#" class="nav-link px-0 align-middle"> <i
								class="fs-4 bi-box-arrow-in-left"></i> <span
								class="ms-1 d-none d-sm-inline text-light ">Salir</span>
						</a></li>
					</div>
				</div>
			</div>
			
			<div class="col py-3 text-center">Content area...</div>
			
			
			
			
			
			
			
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>
</body>
</html>