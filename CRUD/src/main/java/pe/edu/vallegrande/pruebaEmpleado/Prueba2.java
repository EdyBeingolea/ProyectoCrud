
package pe.edu.vallegrande.pruebaEmpleado;

import java.util.List;

import pe.edu.vallegrande.model.EmpleadoModel;
import pe.edu.vallegrande.service.impl.EmpleadoService;

public class Prueba2 {

	public static void main(String[] args) {

		try {
			EmpleadoService service = new EmpleadoService();
			List<EmpleadoModel> lista = service.getAll();
			
			System.out.println("Filas: " + lista.size());
			for (EmpleadoModel rec : lista) {
				System.out.println(rec.getId() + " - " + rec.getName());
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
