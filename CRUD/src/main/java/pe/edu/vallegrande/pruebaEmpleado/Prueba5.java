package pe.edu.vallegrande.pruebaEmpleado;

import pe.edu.vallegrande.service.impl.EmpleadoService;

public class Prueba5 {

	public static void main(String[] args) {
		try {
			Integer id = 10;
			
			EmpleadoService service = new EmpleadoService();
			service.delete(id);
			System.out.println("Registro eliminado Logicamente");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
