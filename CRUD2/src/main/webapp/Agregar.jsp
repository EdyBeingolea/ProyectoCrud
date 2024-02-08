<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="index.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script>
	function updatePattern() {
		var documentType = document.getElementById("document").value;
		var documentNumberInput = document.getElementById("documentNumber");

		if (documentType === "DNI") {
			documentNumberInput.pattern = "[0-9]{8}";
			documentNumberInput.title = "Ingrese 8 números para DNI";
		} else if (documentType === "CE") {
			documentNumberInput.pattern = "[0-9]{12}";
			documentNumberInput.title = "Ingrese 12 números para CE";
		} else {
			documentNumberInput.pattern = "[0-9]{8}";
			documentNumberInput.title = "Elija DNI o CE antes de ingresar el número";
		}
	}
</script>

</head>
<body>
	<div class="container">
		<h1>Agregar Clientes</h1>
		<form action="Agregar" method="post">

			<div class="mb-3">
				<label class="form-label">Nombre</label> <input type="text"
					name="name" class="form-control" placeholder="Pepito Perez Cavero"
					pattern="[A-Za-zÁáÉéÍíÓóÚúÜü'. ]+" title="Solo letras permitidas"
					required>
			</div>


			<div class="mb-3">
				<label class="form-label">Direccion</label> <select id="direccion"
					name="address" class="form-control" onchange="updatePattern()">
					<option>Seleccione su direccion</option>
					<option>LIMA, CAÑETE, SAN VICENTE DE CAÑETE</option>
					<option>LIMA, CAÑETE, CALANGO</option>
					<option>LIMA, CAÑETE, CERRO AZUL</option>
					<option>LIMA, CAÑETE, COAYLLO</option>
					<option>LIMA, CAÑETE, CHILCA</option>
					<option>LIMA, CAÑETE, IMPERIAL</option>
					<option>LIMA, CAÑETE, LUNAHUANA</option>
					<option>LIMA, CAÑETE, MALA</option>
					<option>LIMA. CAÑETE, NUEVO IMPERIAL</option>
					<option>LIMA, CAÑETE, PACARAN</option>
					<option>LIMA, CAÑETE, QUILMANA</option>
					<option>LIMA, CAÑETE, SAN ANTONIO</option>
					<option>LIMA, CAÑETE, SAN LUIS</option>
					<option>LIMA, CAÑETE, SANTA CRUZ DE FLORES</option>
					<option>LIMA, CAÑETE, ZUÑIGA</option>
					<option>LIMA, CAÑETE, ASIA</option>
				</select>
			</div>

		
			<div class="mb-3">
				<label class="form-label">Celular</label> <input type="text"
					placeholder="933655658" name="phone" class="form-control"
					pattern="9[0-9]{8}" title="Solo se permite 9 numeros" required>
			</div>
			
			<div class="mb-3">
				<label class="form-label">Fecha de cumpleaños</label> <input
					type="date" name="birthdayDate" class="form-control" required>
			</div>

			<div class="mb-3">
				<label class="form-label">Tipo de Documento</label> <select
					id="document" name="document" class="form-control"
					onchange="updatePattern()">
					<option>Seleccione uno</option>
					<option value="DNI">DNI</option>
					<option value="CE">CE</option>
				</select>
			</div>

			<div class="mb-3">
				<label class="form-label">Número de Documento</label> <input
					type="text" placeholder="" id="documentNumber"
					name="documentNumber" class="form-control"
					title="Elija DNI o CE antes de ingresar el número" required>
			</div>


			<button type="submit" class="btn btn-primary">Aceptar</button>
			<a href=listarTodos style="color: white;"><button type="button"
					class="btn btn-secondary">Cancelar</button></a>
		</form>
	</div>
</body>
</html>



















<!-- 			<div class="mb-3"> -->
<!-- 				<label class="form-label">Tipo de Documento</label> <input -->
<!-- 					type="text" placeholder="DNI o CE" name="document" -->
<!-- 					class="form-control" pattern="(DNI|CE)" title="Ingrese DNI o CE" -->
<!-- 					required> -->
<!-- 			</div> -->

<!-- 			<div class="mb-3"> -->
<!-- 				<label class="form-label">Numeros del Documento</label> <input -->
<!-- 					type="text" placeholder="" name="documentNumber" -->
<!-- 					class="form-control" pattern="[0-9]+" -->
<!-- 					title="Elija DNI o CE antes de ingresar el número" required> -->
<!-- 			</div> -->

