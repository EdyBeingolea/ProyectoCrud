package pe.edu.vallegrande.pruebas;

import pe.edu.vallegrande.model.clienteModel;
import pe.edu.vallegrande.service.impl.clientesService;

public class editar {
	public static void main(String[] args) {

		try {

			clienteModel model = new clienteModel();
			model.setId(23);
			model.setName("Benito Peres Criss");
			model.setAddress("Calle 13");
			model.setPhone("928502303");

			// Crear un objeto de servicio de cliente
			clientesService service = new clientesService();

			// Llamar al método de actualización
			model = service.update(model);

			System.out.println("Modificación exitosa para el cliente con ID: " + model.getId());

		} catch (Exception e) {
			System.err.println("Error: " + e.getMessage());
		}
	}
}
