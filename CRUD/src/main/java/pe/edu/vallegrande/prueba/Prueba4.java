package pe.edu.vallegrande.prueba;

import pe.edu.vallegrande.model.ClienteModel;
import pe.edu.vallegrande.service.impl.ClienteService;

public class Prueba4 {

	public static void main(String[] args) {
		try {
			ClienteModel model = new ClienteModel();
			model.setName("Carlos Manrique Pera");

			ClienteService service = new ClienteService();
			model = service.insert(model);

			System.out.println("Registro exitoso con el id = " + model.getId());
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
