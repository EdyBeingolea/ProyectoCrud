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
			documentNumberInput.title = "Ingrese 8 n�meros para DNI";
		} else if (documentType === "CE") {
			documentNumberInput.pattern = "[0-9]{12}";
			documentNumberInput.title = "Ingrese 12 n�meros para CE";
		} else {
			documentNumberInput.pattern = "[0-9]{8}";
			documentNumberInput.title = "Elija DNI o CE antes de ingresar el n�mero";
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
					pattern="[A-Za-z������������'. ]+" title="Solo letras permitidas"
					required>
			</div>


			<div class="mb-3">
				<label class="form-label">Direccion</label> <select id="direccion"
					name="address" class="form-control" onchange="updatePattern()">
					<option>Seleccione su direccion</option>
					<option>LIMA, CA�ETE, SAN VICENTE DE CA�ETE</option>
					<option>LIMA, CA�ETE, CALANGO</option>
					<option>LIMA, CA�ETE, CERRO AZUL</option>
					<option>LIMA, CA�ETE, COAYLLO</option>
					<option>LIMA, CA�ETE, CHILCA</option>
					<option>LIMA, CA�ETE, IMPERIAL</option>
					<option>LIMA, CA�ETE, LUNAHUANA</option>
					<option>LIMA, CA�ETE, MALA</option>
					<option>LIMA. CA�ETE, NUEVO IMPERIAL</option>
					<option>LIMA, CA�ETE, PACARAN</option>
					<option>LIMA, CA�ETE, QUILMANA</option>
					<option>LIMA, CA�ETE, SAN ANTONIO</option>
					<option>LIMA, CA�ETE, SAN LUIS</option>
					<option>LIMA, CA�ETE, SANTA CRUZ DE FLORES</option>
					<option>LIMA, CA�ETE, ZU�IGA</option>
					<option>LIMA, CA�ETE, ASIA</option>
				</select>
			</div>

		
			<div class="mb-3">
				<label class="form-label">Celular</label> <input type="text"
					placeholder="933655658" name="phone" class="form-control"
					pattern="9[0-9]{8}" title="Solo se permite 9 numeros" required>
			</div>
			
			<div class="mb-3">
				<label class="form-label">Fecha de cumplea�os</label> <input
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
				<label class="form-label">N�mero de Documento</label> <input
					type="text" placeholder="" id="documentNumber"
					name="documentNumber" class="form-control"
					title="Elija DNI o CE antes de ingresar el n�mero" required>
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
<!-- 					title="Elija DNI o CE antes de ingresar el n�mero" required> -->
<!-- 			</div> -->

