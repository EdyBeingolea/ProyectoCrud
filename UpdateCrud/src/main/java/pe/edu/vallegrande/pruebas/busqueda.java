package pe.edu.vallegrande.pruebas;

import java.util.List;

import pe.edu.vallegrande.model.clienteModel;
import pe.edu.vallegrande.service.impl.clientesService;


public class busqueda {

	public static void main(String[] args) {
		try {
			clienteModel model = new clienteModel();
			model.setName("ju");
			model.setPhone("");
			model.setAddress("");

			clientesService service = new clientesService();
			List<clienteModel> lista = service.Busqueda(model);

			System.out.println("listado");
			System.out.println("Registros: " + lista.size());
			for (clienteModel rec : lista) {
				System.out.println(rec.getId() + " - " + rec.getName() + " - " + rec.getPhone());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

}
