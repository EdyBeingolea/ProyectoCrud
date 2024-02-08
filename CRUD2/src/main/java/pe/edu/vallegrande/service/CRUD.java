package pe.edu.vallegrande.service;

import java.util.List;

public interface CRUD <T>{

	List<T> getAll();
	List<T> getActive();
	List<T> getInactive();
	
	T getByid(int id);
	
	T insert(T bean);
	T update(T bean);
	void delete(Integer id);
	void restore(Integer id);
}
