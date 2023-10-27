package pe.edu.vallegrande.pruebaEmpleado;

import pe.edu.vallegrande.model.EmpleadoModel;
import pe.edu.vallegrande.service.impl.EmpleadoService;

public class Prueba4 {

	public static void main(String[] args) {
		try {
			EmpleadoModel model = new EmpleadoModel();
			model.setName("Carlos ");
			model.setLastName("Pera");
			model.setDni("99999991");

			EmpleadoService service = new EmpleadoService();
			EmpleadoModel resultado = service.insert(model);

			System.out.println("Registro exitoso con el id = " + resultado.getId());
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}