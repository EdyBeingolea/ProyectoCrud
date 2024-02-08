<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">



<title>Sistema de Snack</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="#">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-cookie"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					SNACKER <sup>2</sup>
				</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item "><a class="nav-link"
				href="#"> <i class="fas fa-home"></i> <span>Inicio</span></a>
			</li>

			<!-- Heading -->
			<div class="sidebar-heading">PRODUCTOS</div>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<li class="nav-item "><a class="nav-link"
				href=#> <i class="fas fa-box"></i> <span>Producto</span></a>
			</li>

			<li class="nav-item "><a class="nav-link"
				href="#"> <i class="fas fa-fw fa-table"></i> <span>Inventario</span></a>
			</li>

			<!-- Heading -->
			<div class="sidebar-heading">ACCIONES</div>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<li class="nav-item "><a class="nav-link"
				href="#"> <i class="fas fa-shopping-cart"></i> <span>Compra</span></a>
			</li>

			<li class="nav-item "><a class="nav-link"
				href="#"> <i class="fas fa-shopping-bag"></i> <span>Venta</span></a>
			</li>
			<li class="nav-item "><a class="nav-link"
				href="#"> <i class="fas fa-book-reader"></i> <span>Historial</span></a>
			</li>

			<!-- Heading -->
			<div class="sidebar-heading">PERSONAS</div>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">


			<li class="nav-item "><a class="nav-link"
				href="<%=request.getContextPath()%>/listarTodos"> <i class="fas fa-person-booth"></i> <span>Cliente</span></a>
			</li>
			<li class="nav-item "><a class="nav-link"
				href="<%=request.getContextPath()%>/listarTodosEmpleados"> <i class="fas fa-user"></i><span>Empleados</span></a>
			</li>

			<!-- Heading -->
			<div class="sidebar-heading">SALIR</div>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">


			<li class="nav-item "><a class="nav-link"
				href="#"> <i class="fas fa-door-open"></i> <span>Salir</span></a>
			</li>


			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>
		</ul>

		
	

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>
</body>


</html>