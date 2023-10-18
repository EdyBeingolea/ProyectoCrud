package pe.edu.vallegrande.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class ClienteModel {

	private int id ;
	private String name ;
	private String address;
	private String phone;
	private String status;

}
