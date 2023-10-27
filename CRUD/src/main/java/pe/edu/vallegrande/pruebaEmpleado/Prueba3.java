
package pe.edu.vallegrande.pruebaEmpleado;

import java.util.List;

import pe.edu.vallegrande.model.EmpleadoModel;
import pe.edu.vallegrande.service.impl.EmpleadoService;

public class Prueba3 {

	public static void main(String[] args) {
		try {
			EmpleadoModel model = new EmpleadoModel();
			model.setName("lu");
			model.setDni("");
			model.setLastName("");;
			
			EmpleadoService service = new EmpleadoService();
			List<EmpleadoModel> lista = service.get(model);
			
			System.out.println("listado");
			System.out.println("Registros: " + lista.size());
			for (EmpleadoModel rec : lista) {
				System.out.println(rec.getId() + " - " + rec.getName()  + " - " + rec.getDni());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

}