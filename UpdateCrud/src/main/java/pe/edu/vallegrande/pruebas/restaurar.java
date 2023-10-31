package pe.edu.vallegrande.pruebas;

import pe.edu.vallegrande.service.impl.clientesService;

public class restaurar {

	public static void main(String[] args) {
		try {
			Integer id = 23;

			clientesService service = new clientesService();
			service.restore(id);
			System.out.println("Registro Restaurado");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
