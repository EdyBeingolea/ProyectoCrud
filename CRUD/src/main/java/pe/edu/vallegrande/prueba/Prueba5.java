package pe.edu.vallegrande.prueba;

import pe.edu.vallegrande.service.impl.ClienteService;

public class Prueba5 {

	public static void main(String[] args) {
		try {
			Integer id = 7;
			
			ClienteService service = new ClienteService();
			service.delete(id);
			System.out.println("Registro eliminado");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
