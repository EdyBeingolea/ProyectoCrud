package pe.edu.vallegrande.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class clienteModel {

	private int id;
	private String name;
	private String address;
	private String phone;
	private String birthdayDate;
	private String document;
	private String documentNumber;
	private String status;
}