package pe.edu.vallegrande.prueba;

import java.util.List;

import pe.edu.vallegrande.model.ClienteModel;
import pe.edu.vallegrande.service.impl.ClienteService;

public class Prueba3 {

	public static void main(String[] args) {
		try {
			ClienteModel model = new ClienteModel();
			model.setName("ju");
			model.setPhone("");
			model.setAddress("");
			
			ClienteService service = new ClienteService();
			List<ClienteModel> lista = service.get(model);
			
			System.out.println("listado");
			System.out.println("Registros: " + lista.size());
			for (ClienteModel rec : lista) {
				System.out.println(rec.getId() + " - " + rec.getName()  + " - " + rec.getPhone());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

}
