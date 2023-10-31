package pe.edu.vallegrande.pruebas;

import pe.edu.vallegrande.service.impl.clientesService;

public class eliminadoLogico {

	public static void main(String[] args) {
		try {
			Integer id = 23;

			clientesService service = new clientesService();
			service.delete(id);
			System.out.println("Registro eliminado Logicamente");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
