package pe.edu.vallegrande.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class empleadoModel {
private int id;
private String name;
private String lastName;
private String type_document;
private String number_document;
private String cell_phone;
private String status;
}
