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
			documentNumberInput.pattern = "";
			documentNumberInput.title = "Elija DNI o CE antes de ingresar el n�mero";
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h1>Editar Clientes</h1>

		<form action="Editar" method="post">
			<div class="mb-3">
				<label class="form-label">Nombre</label> <input type="text"
					name="name" class="form-control"
					value="<c:out value="${editar.name}" />"
					pattern="[A-Za-z������������' .]+" title="Solo letras permitidas"
					required>
			</div>
			
			<div class="mb-3">
				<label class="form-label">Tipo de Documento</label> <select
					 name="address" class="form-control"
					onchange="updatePattern()">
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, SAN VICENTE DE CA�ETE</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, CALANGO</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, CERRO AZUL</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, COAYLLO</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, CHILCA</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, IMPERIAL</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, LUNAHUANA</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, MALA</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA.
						CA�ETE, NUEVO IMPERIAL</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, PACARAN</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, QUILMANA</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, SAN ANTONIO</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, SAN LUIS</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, SANTA CRUZ DE FLORES</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, ZU�IGA</option>
					<option <c:if test="${editar.address}">selected</c:if>>LIMA,
						CA�ETE, ASIA</option>
				</select>
			</div>
			


			<div class="mb-3">
				<label class="form-label">Celular</label> <input type="text"
					name="phone" class="form-control"
					value="<c:out value="${editar.phone}" />" pattern="9[0-9]{8}"
					title="Solo se permite 9 numeros" required>
			</div>
			
			<div class="mb-3">
				<label class="form-label">Fecha de cumplea�os</label> <input type="date"
					name="birthdayDate" class="form-control"
					value="<c:out value="${editar.birthdayDate}" />"  required>
			</div>

			<div class="mb-3">
				<label class="form-label">Tipo de Documento</label> <select
					id="document" name="document" class="form-control"
					onchange="updatePattern()">
					<option value="DNI"
						<c:if test="${editar.document eq 'DNI'}">selected</c:if>>DNI</option>
					<option value="CE"
						<c:if test="${editar.document eq 'CE'}">selected</c:if>>CE</option>
				</select>
			</div>

			<div class="mb-3">
				<label class="form-label">N�mero de Documento</label> <input
					type="text" id="documentNumber" name="documentNumber"
					class="form-control"
					title="Elija DNI o CE antes de ingresar el n�mero" required
					value="<c:out value="${editar.documentNumber}" />">
			</div>



			<button type="submit" class="btn btn-primary">Aceptar</button>
			<button type="button" class="btn btn-secondary">
				<a href="listarTodos" style="color: white;">Cancelar</a>
			</button>
		</form>
	</div>
</body>
</html>
