package pe.edu.vallegrande.pruebas;

import java.util.List;

import pe.edu.vallegrande.model.clienteModel;
import pe.edu.vallegrande.service.impl.clientesService;

public class listadoActivos {

	public static void main(String[] args) {
		try {
			clientesService service = new clientesService();
			List<clienteModel> lista = service.ListarActivos();
			System.out.println("Filas :" + lista.size());
			for (clienteModel model : lista) {
				System.out.println(model.getId() + " - " + model.getName());
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
