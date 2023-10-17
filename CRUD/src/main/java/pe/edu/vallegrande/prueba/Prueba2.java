package pe.edu.vallegrande.prueba;

import java.util.List;

import pe.edu.vallegrande.model.ClienteModel;
import pe.edu.vallegrande.service.impl.ClienteService;

public class Prueba2 {

	public static void main(String[] args) {

		try {
			ClienteModel model = new ClienteModel();
			model.setName(null);
			
			
			ClienteService service = new ClienteService();
			List<ClienteModel> lista = service.get(model);
			
			System.out.println("listado");
			System.out.println("Registro" + lista.size());
			for (ClienteModel rec : lista) {
				System.out.println(rec.getId() + " - " + rec.getName());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
