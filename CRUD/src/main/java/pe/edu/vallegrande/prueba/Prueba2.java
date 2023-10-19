package pe.edu.vallegrande.prueba;

import java.util.List;

import pe.edu.vallegrande.model.ClienteModel;
import pe.edu.vallegrande.service.impl.ClienteService;

public class Prueba2 {

	public static void main(String[] args) {

		try {
			ClienteService service = new ClienteService();
			List<ClienteModel> lista = service.getAll();
			
			System.out.println("Filas: " + lista.size());
			for (ClienteModel rec : lista) {
				System.out.println(rec.getId() + " - " + rec.getName());
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
