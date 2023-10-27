package pe.edu.vallegrande.pruebaEmpleado;

import pe.edu.vallegrande.model.EmpleadoModel;
import pe.edu.vallegrande.service.impl.EmpleadoService;

public class prueba6 {
	public static void main(String[] args) {

		try {

			EmpleadoModel model = new EmpleadoModel();
			model.setId(9);
			model.setName("juan");
			model.setLastName("Gonzáles");;
			model.setDni("13914680");

			// Crear un objeto de servicio de empleado
			EmpleadoService service = new EmpleadoService();

			// Llamar al método de actualización
			model = service.update(model);

			System.out.println("Modificación exitosa para el empleado con ID: " + model.getId());

		} catch (Exception e) {
			System.err.println("Error: " + e.getMessage());
		}
	}
}
