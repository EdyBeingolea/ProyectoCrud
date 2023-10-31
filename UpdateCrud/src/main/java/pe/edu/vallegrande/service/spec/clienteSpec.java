package pe.edu.vallegrande.service.spec;

import java.util.List;

public interface clienteSpec <T> {

	List<T> ListarTodos();
	List<T> ListarActivos();
	List<T> ListarInactivos();
	T FiltroID(Integer id);
	List<T> Busqueda(T bean);
	T insert (T bean);
	T update (T bean);
	void delete (Integer id);
	void restore (Integer id);
	
}
