package pe.edu.vallegrande.pruebas;

import pe.edu.vallegrande.model.clienteModel;
import pe.edu.vallegrande.service.impl.clientesService;

public class agregar {

	public static void main(String[] args) {
		try {
			clienteModel model = new clienteModel();
			model.setName("Carlos Manrique Pera");

			clientesService service = new clientesService();
			model = service.insert(model);

			System.out.println("Registro exitoso con el id = " + model.getId());
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
