
package pe.edu.vallegrande.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class EmpleadoModel {

	private int id ;
	private String name ;
	private String lastName;
	private String dni;
	private String status;

}
