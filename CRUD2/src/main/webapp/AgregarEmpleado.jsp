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
		<h1>Ingresar nuevos Empleados</h1>
		<form action="agregarEmpleado" method="post">

			<div class="mb-3">
				<label class="form-label">Nombre</label> <input type="text"
					name="name" class="form-control" placeholder="Pepito"
					pattern="[A-Za-zÁáÉéÍíÓóÚúÜü'. ]+" title="Solo letras permitidas" required>
			</div>
			
			<div class="mb-3">
				<label class="form-label">Apellidos</label> <input type="text"
					name="lastName" class="form-control" placeholder="Perez Cavero"
					pattern="[A-Za-zÁáÉéÍíÓóÚúÜü'. ]+" title="Solo letras permitidas" required>
			</div>

			

			<div class="mb-3">
				<label class="form-label">Tipo de Documento</label> <select
					id="document" name="type_document" class="form-control"
					onchange="updatePattern()">
					<option >Seleccione uno</option>
					<option value="DNI">DNI</option>
					<option value="CE">CE</option>
				</select>
			</div>

			<div class="mb-3">
				<label class="form-label">Número de Documento</label> <input
					type="text" placeholder="" id="documentNumber"
					name="number_document" class="form-control"
					title="Elija DNI o CE antes de ingresar el número" required>
			</div>
			<div class="mb-3">
				<label class="form-label">Celular</label> <input type="text"
					placeholder="933655658" name="cell_phone" class="form-control"
					pattern="9[0-9]{8}" title="Solo se permite 9 numeros y el primero empieza " required>
			</div>


			<button type="submit" class="btn btn-primary">Aceptar</button>
			<a href=listarTodosEmpleados style="color: white;"><button type="button"
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

