package pe.edu.vallegrande.prueba;

import pe.edu.vallegrande.model.ClienteModel;
import pe.edu.vallegrande.service.impl.ClienteService;

public class prueba6 {
	public static void main(String[] args) {

		try {

			ClienteModel model = new ClienteModel();
			model.setId(15);
			model.setName("Benito Peres Criss");
			model.setAddress("Calle 13");
			model.setPhone("928502303");

			// Crear un objeto de servicio de cliente
			ClienteService service = new ClienteService();

			// Llamar al método de actualización
			model = service.update(model);

			System.out.println("Modificación exitosa para el cliente con ID: " + model.getId());

		} catch (Exception e) {
			System.err.println("Error: " + e.getMessage());
		}
	}
}
